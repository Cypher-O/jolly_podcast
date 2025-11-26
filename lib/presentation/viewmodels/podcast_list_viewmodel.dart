import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/core/network/network_exceptions.dart';
import 'package:jolly_podcast/core/providers/providers.dart';
import 'package:jolly_podcast/domain/entities/podcast.dart';

/// {@template podcast_list_viewmodel}
/// ViewModel for the podcast list screen.
///
/// Manages the list of podcasts, loading states, and refresh logic.
/// Uses Riverpod for state management and dependency injection.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class PodcastListViewModel extends ChangeNotifier {
  PodcastListViewModel(this._ref) {
    loadPodcasts();
  }

  final Ref _ref;

  // State
  List<Podcast> _podcasts = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  String? _errorMessage;
  String? _nextPageUrl;
  int _currentPage = 1;

  // Getters
  List<Podcast> get podcasts => _podcasts;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;
  bool get isEmpty => _podcasts.isEmpty && !_isLoading && !hasError;
  bool get hasMore => _nextPageUrl != null;

  // Methods
  Future<void> loadPodcasts() async {
    _isLoading = true;
    _errorMessage = null;
    _currentPage = 1;
    notifyListeners();

    try {
      final podcastRepository = _ref.read(podcastRepositoryProvider);
      final result = await podcastRepository.getTopJollyPodcastsPaginated(page: 1);
      _podcasts = result['podcasts'] as List<Podcast>;
      _nextPageUrl = result['nextPageUrl'] as String?;
      _isLoading = false;
      notifyListeners();
    } on NetworkException catch (e) {
      _isLoading = false;
      _errorMessage = e.message;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'An unexpected error occurred. Please try again.';
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await loadPodcasts();
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !hasMore) return;

    _isLoadingMore = true;
    notifyListeners();

    try {
      final podcastRepository = _ref.read(podcastRepositoryProvider);
      _currentPage++;
      final result = await podcastRepository.getTopJollyPodcastsPaginated(
        page: _currentPage,
      );

      final newPodcasts = result['podcasts'] as List<Podcast>;
      _podcasts.addAll(newPodcasts);
      _nextPageUrl = result['nextPageUrl'] as String?;

      _isLoadingMore = false;
      notifyListeners();
    } on NetworkException catch (e) {
      _isLoadingMore = false;
      _errorMessage = e.message;
      notifyListeners();
    } catch (e) {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      final authRepository = _ref.read(authRepositoryProvider);
      await authRepository.logout();
    } catch (e) {
      // Handle logout error if needed
    }
  }
}

/// Provider for PodcastListViewModel
final podcastListViewModelProvider =
    ChangeNotifierProvider.autoDispose<PodcastListViewModel>(
  (ref) => PodcastListViewModel(ref),
);
