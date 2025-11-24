import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jolly_podcast/data/models/podcast_dto.dart';

part 'episode_dto.freezed.dart';
part 'episode_dto.g.dart';

/// {@template episode_dto}
/// Data Transfer Object for podcast episode information.
///
/// Contains all episode details including audio URL and metadata.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
@freezed
class EpisodeDto with _$EpisodeDto {
  const factory EpisodeDto({
    required int id,
    @JsonKey(name: 'podcast_id') required int podcastId,
    required String title,
    String? description,
    @JsonKey(name: 'content_url') String? contentUrl,
    @JsonKey(name: 'picture_url') String? pictureUrl,
    int? duration,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
    int? number,
    int? season,
    bool? explicit,
    @JsonKey(name: 'play_count') int? playCount,
    @JsonKey(name: 'like_count') int? likeCount,
    @JsonKey(name: 'average_rating') double? averageRating,
    PodcastDto? podcast,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _EpisodeDto;

  factory EpisodeDto.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDtoFromJson(json);
}
