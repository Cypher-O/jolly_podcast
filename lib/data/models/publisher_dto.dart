import 'package:freezed_annotation/freezed_annotation.dart';

part 'publisher_dto.freezed.dart';
part 'publisher_dto.g.dart';

/// {@template publisher_dto}
/// Data Transfer Object for publisher information.
///
/// Contains publisher details returned from the API.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
@freezed
class PublisherDto with _$PublisherDto {
  const factory PublisherDto({
    required int id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'company_name') String? companyName,
    String? email,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PublisherDto;

  factory PublisherDto.fromJson(Map<String, dynamic> json) =>
      _$PublisherDtoFromJson(json);
}
