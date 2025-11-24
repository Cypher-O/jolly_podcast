import 'package:jolly_podcast/core/config/app_config.dart';

/// {@template api_constants}
/// Contains all API endpoint constants and configuration values.
///
/// This class centralizes all API-related constants to ensure consistency
/// across the application and make endpoint management easier.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class ApiConstants {
  ApiConstants._();

  /// Base URL for all API requests (flavor-aware)
  static String get baseUrl => AppConfig.instance.baseUrl;

  /// Connection timeout in milliseconds
  static const int connectTimeout = 30000;

  /// Receive timeout in milliseconds
  static const int receiveTimeout = 30000;

  // Authentication endpoints
  static const String login = '/api/auth/login';

  // Podcast endpoints
  static const String topJollyPodcasts = '/api/podcasts/top-jolly';
  static String podcastDetails(String podcastId) => '/api/podcasts/$podcastId';
  static String podcastEpisodes(String podcastId) =>
      '/api/podcasts/$podcastId/episodes';
  static String podcastStatus(String podcastId) =>
      '/api/podcasts/$podcastId/status';

  // Episode endpoints
  static String episodeDetails(String episodeId) => '/api/episodes/$episodeId';
  static const String latestEpisodes = '/api/episodes/latest';
  static const String trendingEpisodes = '/api/episodes/trending';
  static const String markEpisodePlayed = '/api/episodes/plays';
}
