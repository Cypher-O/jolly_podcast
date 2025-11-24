import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jolly_podcast/data/models/login_data_dto.dart';

part 'login_response_dto.freezed.dart';
part 'login_response_dto.g.dart';

/// {@template login_response_dto}
/// Data Transfer Object for login response.
///
/// Contains the authentication token and user information
/// received after successful login.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
@freezed
class LoginResponseDto with _$LoginResponseDto {
  const factory LoginResponseDto({
    required String message,
    required LoginDataDto data,
  }) = _LoginResponseDto;

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);
}
