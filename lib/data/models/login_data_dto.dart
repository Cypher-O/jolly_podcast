import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jolly_podcast/data/models/user_dto.dart';

part 'login_data_dto.freezed.dart';
part 'login_data_dto.g.dart';

/// {@template login_data_dto}
/// Data Transfer Object for login response data.
///
/// Single Responsibility: Represents the nested data object in login response.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
@freezed
class LoginDataDto with _$LoginDataDto {
  const factory LoginDataDto({
    required String token,
    required UserDto user,
    Map<String, dynamic>? subscription,
  }) = _LoginDataDto;

  factory LoginDataDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDataDtoFromJson(json);
}
