import 'package:jolly_podcast/core/constants/api_constants.dart';
import 'package:jolly_podcast/core/constants/app_strings.dart';
import 'package:jolly_podcast/core/network/dio_client.dart';
import 'package:jolly_podcast/core/utils/logger_service.dart';
import 'package:jolly_podcast/data/models/login_request_dto.dart';
import 'package:jolly_podcast/data/models/login_response_dto.dart';

/// {@template auth_remote_datasource}
/// Remote data source for authentication operations.
///
/// Single Responsibility: Handles authentication API calls.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class AuthRemoteDatasource {
  AuthRemoteDatasource(this._dioClient, this._logger);

  final DioClient _dioClient;
  final LoggerService _logger;

  /// Authenticates a user with phone number and password
  ///
  /// Makes a POST request to the login endpoint with credentials.
  /// Returns [LoginResponseDto] containing token and user information.
  /// Throws [NetworkException] on failure.
  Future<LoginResponseDto> login({
    required String phone,
    required String password,
  }) async {
    _logger.debug('Login attempt with phone: $phone', 'AUTH');

    final request = LoginRequestDto(phoneNumber: phone, password: password);
    final requestData = request.toJson();
    _logger.debug('Request data: $requestData', 'AUTH');

    final response = await _dioClient.post<Map<String, dynamic>>(
      ApiConstants.login,
      data: requestData,
    );

    if (response.data == null) {
      _logger.error('Login response is null');
      throw Exception('Login response is null');
    }

    _logger.debug('Response data: ${response.data}', 'AUTH');
    _logger.info(AppStrings.loginSuccess, 'AUTH');
    return LoginResponseDto.fromJson(response.data!);
  }
}
