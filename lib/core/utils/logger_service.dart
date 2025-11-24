import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:jolly_podcast/core/config/app_config.dart';

/// {@template logger_service}
/// Centralized logging service for the application.
///
/// Single Responsibility: Handles all application logging
/// with environment-aware behavior.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class LoggerService {
  LoggerService._();

  static final LoggerService instance = LoggerService._();

  bool get _shouldLog {
    try {
      return AppConfig.instance.enableLogging;
    } catch (e) {
      // If AppConfig not initialized, default to debug mode check
      return kDebugMode;
    }
  }

  /// Log general information
  void info(String message, [String? tag]) {
    if (_shouldLog) {
      final prefix = tag != null ? '[$tag]' : '[INFO]';
      log('$prefix $message');
    }
  }

  /// Log debug information
  void debug(String message, [String? tag]) {
    if (_shouldLog && kDebugMode) {
      final prefix = tag != null ? '[$tag]' : '[DEBUG]';
      log('$prefix $message');
    }
  }

  /// Log warnings
  void warning(String message, [String? tag]) {
    if (_shouldLog) {
      final prefix = tag != null ? '[$tag]' : '[WARNING]';
      log('$prefix $message');
    }
  }

  /// Log errors
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    if (_shouldLog) {
      log('[ERROR] $message');
      if (error != null) {
        log('Error details: $error');
      }
      if (stackTrace != null) {
        log('Stack trace:\n$stackTrace');
      }
    }
  }

  /// Log network requests
  void logRequest(String method, String path) {
    if (_shouldLog) {
      log('[REQUEST] $method => $path');
    }
  }

  /// Log network responses
  void logResponse(int? statusCode, String path) {
    if (_shouldLog) {
      final statusPrefix = _getStatusPrefix(statusCode);
      log('$statusPrefix [RESPONSE] [$statusCode] => $path');
    }
  }

  /// Log network errors
  void logNetworkError(String path, Object error) {
    if (_shouldLog) {
      log('[NETWORK ERROR] $path');
      log('Error: $error');
    }
  }

  String _getStatusPrefix(int? statusCode) {
    if (statusCode == null) return '[UNKNOWN]';
    if (statusCode >= 200 && statusCode < 300) return '[SUCCESS]';
    if (statusCode >= 300 && statusCode < 400) return '[REDIRECT]';
    if (statusCode >= 400 && statusCode < 500) return '[CLIENT ERROR]';
    return '[SERVER ERROR]';
  }
}
