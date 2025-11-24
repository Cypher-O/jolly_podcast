import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_dto.freezed.dart';
part 'login_request_dto.g.dart';

/// {@template login_request_dto}
/// Data Transfer Object for login request payload.
///
/// Contains the phone number and password required for authentication.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
@freezed
class LoginRequestDto with _$LoginRequestDto {
  const factory LoginRequestDto({
    @JsonKey(name: 'phone_number') required String phoneNumber,
    required String password,
  }) = _LoginRequestDto;

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);
}
