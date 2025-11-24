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
  String? _errorMessage;

  // Getters
  List<Podcast> get podcasts => _podcasts;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;
  bool get isEmpty => _podcasts.isEmpty && !_isLoading && !hasError;

  // Methods
  Future<void> loadPodcasts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final podcastRepository = _ref.read(podcastRepositoryProvider);
      _podcasts = await podcastRepository.getTopJollyPodcasts();
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
