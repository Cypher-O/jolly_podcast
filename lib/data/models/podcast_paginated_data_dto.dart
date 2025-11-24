import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jolly_podcast/data/models/podcast_dto.dart';

part 'podcast_paginated_data_dto.freezed.dart';
part 'podcast_paginated_data_dto.g.dart';

/// {@template podcast_paginated_data_dto}
/// Data Transfer Object for paginated podcast data.
///
/// Contains the podcast list with pagination metadata.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
@freezed
class PodcastPaginatedDataDto with _$PodcastPaginatedDataDto {
  const factory PodcastPaginatedDataDto({
    required List<PodcastDto> data,
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'first_page_url') String? firstPageUrl,
    int? from,
    @JsonKey(name: 'last_page') int? lastPage,
    @JsonKey(name: 'last_page_url') String? lastPageUrl,
    List<Map<String, dynamic>>? links,
    @JsonKey(name: 'next_page_url') String? nextPageUrl,
    String? path,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'prev_page_url') String? prevPageUrl,
    int? to,
    int? total,
  }) = _PodcastPaginatedDataDto;

  factory PodcastPaginatedDataDto.fromJson(Map<String, dynamic> json) =>
      _$PodcastPaginatedDataDtoFromJson(json);
}
