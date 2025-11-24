import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jolly_podcast/data/models/podcast_paginated_data_dto.dart';

part 'podcast_data_wrapper_dto.freezed.dart';
part 'podcast_data_wrapper_dto.g.dart';

/// {@template podcast_data_wrapper_dto}
/// Data Transfer Object for the nested data wrapper in podcast response.
///
/// Single Responsibility: Represents the nested data object with pagination.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
@freezed
class PodcastDataWrapperDto with _$PodcastDataWrapperDto {
  const factory PodcastDataWrapperDto({
    required String message,
    required PodcastPaginatedDataDto data,
  }) = _PodcastDataWrapperDto;

  factory PodcastDataWrapperDto.fromJson(Map<String, dynamic> json) =>
      _$PodcastDataWrapperDtoFromJson(json);
}
