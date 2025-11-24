import 'package:dio/dio.dart';
import 'package:jolly_podcast/core/security/secure_storage_service.dart';
import 'package:jolly_podcast/core/utils/logger_service.dart';

/// {@template api_interceptor}
/// Dio interceptor that adds authentication token to requests.
///
/// Single Responsibility: Manages request/response interception
/// for authentication and delegates logging to LoggerService.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class ApiInterceptor extends Interceptor {
  ApiInterceptor(this._secureStorage, this._logger);

  final SecureStorageService _secureStorage;
  final LoggerService _logger;

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
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.logResponse(
      response.statusCode,
      response.requestOptions.path,
    );

    // Check for error status codes and reject them
    final statusCode = response.statusCode;
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
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.logNetworkError(err.requestOptions.path, err);
    handler.next(err);
  }
}
