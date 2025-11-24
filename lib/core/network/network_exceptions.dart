import 'package:dio/dio.dart';

/// {@template network_exception}
/// Base class for all network-related exceptions.
///
/// This provides a consistent way to handle different types of network errors
/// throughout the application and map them to user-friendly messages.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
sealed class NetworkException implements Exception {
  const NetworkException(this.message);

  final String message;

  /// Factory method to create appropriate exception from Dio error
  factory NetworkException.fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutException(
          'Request timeout. Please check your connection and try again.',
        );

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        if (statusCode == 401 || statusCode == 403) {
          return const UnauthorizedException(
            'Authentication failed. Please login again.',
          );
        } else if (statusCode == 404) {
          return const NotFoundException('Resource not found.');
        } else if (statusCode != null && statusCode >= 500) {
          return const ServerException(
            'Server error. Please try again later.',
          );
        }
        return BadRequestException(
          error.response?.data?['message'] as String? ??
              'Invalid request. Please try again.',
        );

      case DioExceptionType.cancel:
        return const RequestCancelledException('Request was cancelled.');

      case DioExceptionType.connectionError:
        return const NoInternetException(
          'No internet connection. Please check your connection and try again.',
        );

      case DioExceptionType.badCertificate:
        return const ServerException('SSL certificate verification failed.');

      case DioExceptionType.unknown:
        return const NoInternetException(
          'Network error. Please check your connection and try again.',
        );
    }
  }

  @override
  String toString() => message;
}

/// {@template unauthorized_exception}
/// Exception thrown when the user is not authorized to access a resource.
/// Typically occurs with 401 or 403 status codes.
/// {@endtemplate}
final class UnauthorizedException extends NetworkException {
  const UnauthorizedException(super.message);
}

/// {@template not_found_exception}
/// Exception thrown when a requested resource is not found.
/// Typically occurs with 404 status code.
/// {@endtemplate}
final class NotFoundException extends NetworkException {
  const NotFoundException(super.message);
}

/// {@template server_exception}
/// Exception thrown when the server encounters an error.
/// Typically occurs with 5xx status codes.
/// {@endtemplate}
final class ServerException extends NetworkException {
  const ServerException(super.message);
}

/// {@template timeout_exception}
/// Exception thrown when a request times out.
/// {@endtemplate}
final class TimeoutException extends NetworkException {
  const TimeoutException(super.message);
}

/// {@template no_internet_exception}
/// Exception thrown when there is no internet connection.
/// {@endtemplate}
final class NoInternetException extends NetworkException {
  const NoInternetException(super.message);
}

/// {@template bad_request_exception}
/// Exception thrown when the request is malformed or invalid.
/// Typically occurs with 400 status code.
/// {@endtemplate}
final class BadRequestException extends NetworkException {
  const BadRequestException(super.message);
}

/// {@template request_cancelled_exception}
/// Exception thrown when a request is cancelled.
/// {@endtemplate}
final class RequestCancelledException extends NetworkException {
  const RequestCancelledException(super.message);
}
