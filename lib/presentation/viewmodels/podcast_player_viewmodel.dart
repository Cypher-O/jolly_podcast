import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/core/network/network_exceptions.dart';
import 'package:jolly_podcast/core/providers/providers.dart';
import 'package:jolly_podcast/domain/entities/episode.dart';
import 'package:jolly_podcast/domain/entities/podcast.dart';

/// {@template podcast_player_viewmodel}
/// ViewModel for the podcast player screen.
///
/// Manages podcast details, episodes, and audio playback.
/// Uses Riverpod for state management and audioplayers for playback.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class PodcastPlayerViewModel extends ChangeNotifier {
  PodcastPlayerViewModel(this._ref, this.podcastId) {
    _audioPlayer = AudioPlayer();
    _setupAudioListeners();
    loadPodcastDetails();
  }

  final Ref _ref;
  final String podcastId;

  late AudioPlayer _audioPlayer;

  // State
  Podcast? _podcast;
  List<Episode> _episodes = [];
  Episode? _currentEpisode;
  bool _isLoadingPodcast = false;
  bool _isLoadingEpisodes = false;
  String? _errorMessage;

  // Audio state
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isLoadingAudio = false;

  // Getters
  Podcast? get podcast => _podcast;
  List<Episode> get episodes => _episodes;
  Episode? get currentEpisode => _currentEpisode;
  bool get isLoadingPodcast => _isLoadingPodcast;
  bool get isLoadingEpisodes => _isLoadingEpisodes;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;

  bool get isPlaying => _isPlaying;
  Duration get currentPosition => _currentPosition;
  Duration get totalDuration => _totalDuration;
  bool get isLoadingAudio => _isLoadingAudio;

  double get progress {
    if (_totalDuration.inMilliseconds == 0) return 0.0;
    return _currentPosition.inMilliseconds / _totalDuration.inMilliseconds;
  }

  String get formattedCurrentPosition => _formatDuration(_currentPosition);
  String get formattedTotalDuration => _formatDuration(_totalDuration);

  // Methods
  void _setupAudioListeners() {
    _audioPlayer.onPlayerStateChanged.listen((state) {
      _isPlaying = state == PlayerState.playing;
      notifyListeners();
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      _totalDuration = duration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((position) {
      _currentPosition = position;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((_) async {
      _isPlaying = false;
      _currentPosition = Duration.zero;
      notifyListeners();

      // Automatically play next episode if available
      await _playNextEpisodeIfAvailable();
    });
  }

  Future<void> loadPodcastDetails() async {
    _isLoadingPodcast = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final podcastRepository = _ref.read(podcastRepositoryProvider);
      _podcast = await podcastRepository.getPodcastDetails(podcastId);
      _isLoadingPodcast = false;
      notifyListeners();

      await loadEpisodes();
    } on NotFoundException catch (_) {
      _isLoadingPodcast = false;
      // If podcast details not found (404), just load episodes
      await loadEpisodes();
    } on NetworkException catch (e) {
      _isLoadingPodcast = false;
      _errorMessage = e.message;
      notifyListeners();
    } catch (e, stackTrace) {
      _isLoadingPodcast = false;
      debugPrint('[PODCAST_PLAYER_ERROR] $e');
      debugPrint('[PODCAST_PLAYER_STACKTRACE] $stackTrace');
      // Try to load episodes anyway
      await loadEpisodes();
    }
  }

  Future<void> loadEpisodes() async {
    _isLoadingEpisodes = true;
    notifyListeners();

    try {
      final podcastRepository = _ref.read(podcastRepositoryProvider);

      // If podcast is null, use the method that extracts podcast data from episodes
      if (_podcast == null) {
        final result = await podcastRepository.getPodcastEpisodesWithPodcastData(podcastId);
        _episodes = result['episodes'] as List<Episode>;
        _podcast = result['podcast'] as Podcast?;
      } else {
        _episodes = await podcastRepository.getPodcastEpisodes(podcastId);
      }

      _isLoadingEpisodes = false;
      notifyListeners();
    } on NetworkException catch (e) {
      _isLoadingEpisodes = false;
      _errorMessage = e.message;
      notifyListeners();
    } catch (e) {
      _isLoadingEpisodes = false;
      _errorMessage = 'Failed to load episodes.';
      notifyListeners();
    }
  }

  Future<void> selectEpisode(Episode episode) async {
    if (_currentEpisode?.id == episode.id) {
      // If same episode, just toggle play/pause
      await togglePlayPause();
      return;
    }

    await pause();
    _currentEpisode = episode;
    _currentPosition = Duration.zero;
    _totalDuration = Duration.zero;
    notifyListeners();

    if (episode.audioUrl != null && episode.audioUrl!.isNotEmpty) {
      await _loadAudio(episode.audioUrl!);
      // Automatically start playing after loading
      await play();
    }
  }

  Future<void> _loadAudio(String url) async {
    _isLoadingAudio = true;
    notifyListeners();

    try {
      await _audioPlayer.setSourceUrl(url);
      _isLoadingAudio = false;
      notifyListeners();
    } catch (e) {
      _isLoadingAudio = false;
      _errorMessage = 'Failed to load audio.';
      notifyListeners();
    }
  }

  Future<void> play() async {
    if (_currentEpisode == null) return;

    try {
      await _audioPlayer.resume();
      await _markEpisodePlayed();
    } catch (e) {
      _errorMessage = 'Failed to play audio.';
      notifyListeners();
    }
  }

  Future<void> pause() async {
    try {
      await _audioPlayer.pause();
    } catch (e) {
      _errorMessage = 'Failed to pause audio.';
      notifyListeners();
    }
  }

  Future<void> togglePlayPause() async {
    if (_isPlaying) {
      await pause();
    } else {
      await play();
    }
  }

  Future<void> seek(Duration position) async {
    try {
      await _audioPlayer.seek(position);
    } catch (e) {
      _errorMessage = 'Failed to seek.';
      notifyListeners();
    }
  }

  Future<void> playNextEpisode() async {
    if (_currentEpisode == null || _episodes.isEmpty) return;

    final currentIndex = _episodes.indexWhere((e) => e.id == _currentEpisode!.id);
    if (currentIndex == -1 || currentIndex >= _episodes.length - 1) {
      // Already at last episode, do nothing or loop to first
      return;
    }

    await selectEpisode(_episodes[currentIndex + 1]);
    await play();
  }

  Future<void> _playNextEpisodeIfAvailable() async {
    if (_currentEpisode == null || _episodes.isEmpty) return;

    final currentIndex = _episodes.indexWhere((e) => e.id == _currentEpisode!.id);
    // Only auto-play next if there's another episode after this one
    if (currentIndex != -1 && currentIndex < _episodes.length - 1) {
      await selectEpisode(_episodes[currentIndex + 1]);
    }
  }

  Future<void> playPreviousEpisode() async {
    if (_currentEpisode == null || _episodes.isEmpty) return;

    final currentIndex = _episodes.indexWhere((e) => e.id == _currentEpisode!.id);
    if (currentIndex <= 0) {
      // Already at first episode, restart current episode
      await seek(Duration.zero);
      return;
    }

    await selectEpisode(_episodes[currentIndex - 1]);
    await play();
  }

  Future<void> _markEpisodePlayed() async {
    if (_currentEpisode == null) return;

    try {
      final podcastRepository = _ref.read(podcastRepositoryProvider);
      await podcastRepository.markEpisodePlayed(_currentEpisode!.id.toString());
    } catch (e) {
      // Silently fail - marking as played is not critical
    }
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}

/// Provider for PodcastPlayerViewModel
final podcastPlayerViewModelProvider = ChangeNotifierProvider.autoDispose
    .family<PodcastPlayerViewModel, String>(
  (ref, podcastId) => PodcastPlayerViewModel(ref, podcastId),
);
