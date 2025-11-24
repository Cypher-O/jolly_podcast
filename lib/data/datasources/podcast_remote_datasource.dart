import 'package:jolly_podcast/core/constants/api_constants.dart';
import 'package:jolly_podcast/core/network/dio_client.dart';
import 'package:jolly_podcast/core/utils/logger_service.dart';
import 'package:jolly_podcast/data/models/episode_dto.dart';
import 'package:jolly_podcast/data/models/podcast_dto.dart';
import 'package:jolly_podcast/data/models/podcast_list_response_dto.dart';

/// {@template podcast_remote_datasource}
/// Remote data source for podcast and episode operations.
///
/// Handles all podcast-related API calls using the Dio HTTP client.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class PodcastRemoteDatasource {
  PodcastRemoteDatasource(this._dioClient, this._logger);

  final DioClient _dioClient;
  final LoggerService _logger;

  /// Fetches the list of top Jolly podcasts
  Future<List<PodcastDto>> getTopJollyPodcasts() async {
    final response = await _dioClient.get<Map<String, dynamic>>(
      ApiConstants.topJollyPodcasts,
    );

    if (response.data == null) {
      return [];
    }

    _logger.debug('Response data: ${response.data}', 'PODCAST');

    final podcastListResponse = PodcastListResponseDto.fromJson(response.data!);
    return podcastListResponse.data.data.data;
  }

  /// Fetches details of a specific podcast
  Future<PodcastDto> getPodcastDetails(String podcastId) async {
    try {
      final response = await _dioClient.get<Map<String, dynamic>>(
        ApiConstants.podcastDetails(podcastId),
      );

      if (response.data == null) {
        throw Exception('Podcast details response is null');
      }

      _logger.debug('Podcast details response: ${response.data}', 'PODCAST');
      return PodcastDto.fromJson(response.data!);
    } catch (e, stackTrace) {
      _logger.debug('Error fetching podcast details: $e', 'PODCAST');
      _logger.debug('Stack trace: $stackTrace', 'PODCAST');
      rethrow;
    }
  }

  /// Fetches episodes for a specific podcast
  Future<List<EpisodeDto>> getPodcastEpisodes(String podcastId) async {
    try {
      final response = await _dioClient.get<Map<String, dynamic>>(
        ApiConstants.podcastEpisodes(podcastId),
      );

      if (response.data == null) {
        return [];
      }

      _logger.debug('Podcast episodes response: ${response.data}', 'PODCAST');

      // Handle triple-nested response structure: {message, data: {message, data: {data: [...]}}}
      if (response.data!.containsKey('data')) {
        final firstDataWrapper = response.data!['data'];
        if (firstDataWrapper is Map && firstDataWrapper.containsKey('data')) {
          final secondDataWrapper = firstDataWrapper['data'];
          if (secondDataWrapper is Map && secondDataWrapper.containsKey('data')) {
            // Triple nested with pagination
            final episodesList = secondDataWrapper['data'];
            if (episodesList is List) {
              return episodesList
                  .map((json) => EpisodeDto.fromJson(json as Map<String, dynamic>))
                  .toList();
            }
          } else if (secondDataWrapper is List) {
            // Double nested
            return secondDataWrapper
                .map((json) => EpisodeDto.fromJson(json as Map<String, dynamic>))
                .toList();
          }
        } else if (firstDataWrapper is List) {
          // Single nested
          return firstDataWrapper
              .map((json) => EpisodeDto.fromJson(json as Map<String, dynamic>))
              .toList();
        }
      }

      return [];
    } catch (e, stackTrace) {
      _logger.debug('Error fetching podcast episodes: $e', 'PODCAST');
      _logger.debug('Stack trace: $stackTrace', 'PODCAST');
      rethrow;
    }
  }

  /// Fetches details of a specific episode
  Future<EpisodeDto> getEpisodeDetails(String episodeId) async {
    final response = await _dioClient.get<Map<String, dynamic>>(
      ApiConstants.episodeDetails(episodeId),
    );

    if (response.data == null) {
      throw Exception('Episode details response is null');
    }

    return EpisodeDto.fromJson(response.data!);
  }

  /// Fetches the latest episodes across all podcasts
  Future<List<EpisodeDto>> getLatestEpisodes() async {
    final response = await _dioClient.get<List<dynamic>>(
      ApiConstants.latestEpisodes,
    );

    if (response.data == null) {
      return [];
    }

    return (response.data as List)
        .map((json) => EpisodeDto.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Fetches trending episodes across all podcasts
  Future<List<EpisodeDto>> getTrendingEpisodes() async {
    final response = await _dioClient.get<List<dynamic>>(
      ApiConstants.trendingEpisodes,
    );

    if (response.data == null) {
      return [];
    }

    return (response.data as List)
        .map((json) => EpisodeDto.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Marks an episode as played
  Future<void> markEpisodePlayed(String episodeId) async {
    await _dioClient.post<void>(
      ApiConstants.markEpisodePlayed,
      data: {'episodeId': episodeId},
    );
  }
}
