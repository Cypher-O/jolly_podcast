import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jolly_podcast/data/models/publisher_dto.dart';

part 'podcast_dto.freezed.dart';
part 'podcast_dto.g.dart';

/// {@template podcast_dto}
/// Data Transfer Object for podcast information.
///
/// Contains all podcast details returned from the API.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
@freezed
class PodcastDto with _$PodcastDto {
  const factory PodcastDto({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    required String title,
    required String author,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'category_type') required String categoryType,
    @JsonKey(name: 'picture_url') String? pictureUrl,
    @JsonKey(name: 'cover_picture_url') String? coverPictureUrl,
    String? description,
    @JsonKey(name: 'embeddable_player_settings')
    Map<String, dynamic>? embeddablePlayerSettings,
    @JsonKey(name: 'subscriber_count') int? subscriberCount,
    PublisherDto? publisher,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PodcastDto;

  factory PodcastDto.fromJson(Map<String, dynamic> json) =>
      _$PodcastDtoFromJson(json);
}
