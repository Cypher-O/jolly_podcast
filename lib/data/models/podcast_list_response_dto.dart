import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jolly_podcast/data/models/podcast_data_wrapper_dto.dart';

part 'podcast_list_response_dto.freezed.dart';
part 'podcast_list_response_dto.g.dart';

/// {@template podcast_list_response_dto}
/// Data Transfer Object for podcast list response.
///
/// Contains the top-level response structure from the podcasts API.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
@freezed
class PodcastListResponseDto with _$PodcastListResponseDto {
  const factory PodcastListResponseDto({
    required String message,
    required PodcastDataWrapperDto data,
  }) = _PodcastListResponseDto;

  factory PodcastListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PodcastListResponseDtoFromJson(json);
}
