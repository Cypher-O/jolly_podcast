import 'package:jolly_podcast/data/datasources/podcast_remote_datasource.dart';
import 'package:jolly_podcast/domain/entities/episode.dart';
import 'package:jolly_podcast/domain/entities/podcast.dart';
import 'package:jolly_podcast/domain/repositories/podcast_repository.dart';

/// {@template podcast_repository_impl}
/// Implementation of [PodcastRepository] using remote data source.
///
/// Handles podcast and episode operations by coordinating with
/// the remote data source and converting DTOs to domain entities.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class PodcastRepositoryImpl implements PodcastRepository {
  PodcastRepositoryImpl({
    required PodcastRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  final PodcastRemoteDatasource _remoteDatasource;

  @override
  Future<List<Podcast>> getTopJollyPodcasts() async {
    final dtos = await _remoteDatasource.getTopJollyPodcasts();
    return dtos.map((dto) => Podcast.fromDto(dto)).toList();
  }

  @override
  Future<Podcast> getPodcastDetails(String podcastId) async {
    final dto = await _remoteDatasource.getPodcastDetails(podcastId);
    return Podcast.fromDto(dto);
  }

  @override
  Future<List<Episode>> getPodcastEpisodes(String podcastId) async {
    final dtos = await _remoteDatasource.getPodcastEpisodes(podcastId);
    return dtos.map((dto) => Episode.fromDto(dto)).toList();
  }

  @override
  Future<Episode> getEpisodeDetails(String episodeId) async {
    final dto = await _remoteDatasource.getEpisodeDetails(episodeId);
    return Episode.fromDto(dto);
  }

  @override
  Future<List<Episode>> getLatestEpisodes() async {
    final dtos = await _remoteDatasource.getLatestEpisodes();
    return dtos.map((dto) => Episode.fromDto(dto)).toList();
  }

  @override
  Future<List<Episode>> getTrendingEpisodes() async {
    final dtos = await _remoteDatasource.getTrendingEpisodes();
    return dtos.map((dto) => Episode.fromDto(dto)).toList();
  }

  @override
  Future<void> markEpisodePlayed(String episodeId) async {
    await _remoteDatasource.markEpisodePlayed(episodeId);
  }
}
