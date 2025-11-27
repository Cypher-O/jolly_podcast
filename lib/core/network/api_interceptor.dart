import 'package:dio/dio.dart';
import 'package:jolly_podcast/core/security/secure_storage_service.dart';
import 'package:jolly_podcast/core/services/authentication_service.dart';
import 'package:jolly_podcast/core/utils/logger_service.dart';

/// {@template api_interceptor}
/// Dio interceptor that adds authentication token to requests.
///
/// Single Responsibility: Manages HTTP request/response interception,
/// adds authentication headers, and delegates auth state changes
/// to AuthenticationService.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class ApiInterceptor extends Interceptor {
  ApiInterceptor(
    this._secureStorage,
    this._logger,
    this._authenticationService,
  );

  final SecureStorageService _secureStorage;
  final LoggerService _logger;
  final AuthenticationService _authenticationService;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Get token from secure storage
    final token = await _secureStorage.getToken();

    // Add token to headers if available
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // Add common headers
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    // Log request
    _logger.logRequest(options.method, options.path);

    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    _logger.logResponse(
      response.statusCode,
      response.requestOptions.path,
    );

    // Handle 401 Unauthorized specifically
    final statusCode = response.statusCode;
    if (statusCode == 401) {
      _logger.info('401 Unauthorized detected', 'API_INTERCEPTOR');

      // Delegate session expiration handling to AuthenticationService
      await _authenticationService.handleSessionExpired();

      // Reject the response to trigger error handling in the app
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ),
      );
      return;
    }

    // Check for other error status codes and reject them
    if (statusCode != null && (statusCode < 200 || statusCode >= 300)) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ),
      );
      return;
    }

    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    _logger.logNetworkError(err.requestOptions.path, err);

    // Handle 401 Unauthorized errors (fallback, should be handled in onResponse)
    if (err.response?.statusCode == 401) {
      _logger.info('401 Unauthorized detected in onError', 'API_INTERCEPTOR');
      await _authenticationService.handleSessionExpired();
    }

    handler.next(err);
  }
}
