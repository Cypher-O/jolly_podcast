import 'package:dio/dio.dart';
import 'package:jolly_podcast/core/constants/api_constants.dart';
import 'package:jolly_podcast/core/network/api_interceptor.dart';
import 'package:jolly_podcast/core/network/network_exceptions.dart';
import 'package:jolly_podcast/core/security/secure_storage_service.dart';
import 'package:jolly_podcast/core/services/authentication_service.dart';
import 'package:jolly_podcast/core/utils/logger_service.dart';

/// {@template dio_client}
/// Configured Dio HTTP client for the Jolly Podcast application.
///
/// Single Responsibility: Manages HTTP communication configuration
/// and request execution.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class DioClient {
  DioClient(
    SecureStorageService secureStorage,
    LoggerService logger,
    AuthenticationService authenticationService,
  ) {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(
          milliseconds: ApiConstants.connectTimeout,
        ),
        receiveTimeout: const Duration(
          milliseconds: ApiConstants.receiveTimeout,
        ),
        validateStatus: (status) {
          // Consider status codes < 500 as valid to handle them properly
          return status != null && status < 500;
        },
      ),
    );

    // Add interceptors
    _dio.interceptors.add(
      ApiInterceptor(secureStorage, logger, authenticationService),
    );
  }

  late final Dio _dio;

  /// GET request
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// POST request
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// PUT request
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// DELETE request
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// PATCH request
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }
}
