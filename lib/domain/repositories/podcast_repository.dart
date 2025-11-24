import 'package:jolly_podcast/domain/entities/episode.dart';
import 'package:jolly_podcast/domain/entities/podcast.dart';

/// {@template podcast_repository}
/// Repository interface for podcast and episode operations.
///
/// Defines the contract for podcast-related data operations.
/// Implementations should handle the actual data fetching and caching.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
abstract class PodcastRepository {
  /// Fetches the list of top Jolly podcasts
  ///
  /// Returns a list of podcasts.
  /// Throws [NetworkException] on failure.
  Future<List<Podcast>> getTopJollyPodcasts();

  /// Fetches details of a specific podcast
  ///
  /// Returns the podcast with the given [podcastId].
  /// Throws [NetworkException] on failure.
  Future<Podcast> getPodcastDetails(String podcastId);

  /// Fetches episodes for a specific podcast
  ///
  /// Returns a list of episodes for the podcast with the given [podcastId].
  /// Throws [NetworkException] on failure.
  Future<List<Episode>> getPodcastEpisodes(String podcastId);

  /// Fetches details of a specific episode
  ///
  /// Returns the episode with the given [episodeId].
  /// Throws [NetworkException] on failure.
  Future<Episode> getEpisodeDetails(String episodeId);

  /// Fetches the latest episodes across all podcasts
  ///
  /// Returns a list of the latest episodes.
  /// Throws [NetworkException] on failure.
  Future<List<Episode>> getLatestEpisodes();

  /// Fetches trending episodes across all podcasts
  ///
  /// Returns a list of trending episodes.
  /// Throws [NetworkException] on failure.
  Future<List<Episode>> getTrendingEpisodes();

  /// Marks an episode as played
  ///
  /// Records a play event for the episode with the given [episodeId].
  /// Throws [NetworkException] on failure.
  Future<void> markEpisodePlayed(String episodeId);
}
