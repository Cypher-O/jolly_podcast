import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jolly_podcast/app.dart';
import 'package:jolly_podcast/core/security/secure_storage_service.dart';
import 'package:jolly_podcast/core/utils/logger_service.dart';
import 'package:jolly_podcast/presentation/views/login/login_view.dart';

/// {@template authentication_service}
/// Service responsible for handling authentication state changes.
///
/// Single Responsibility: Manages authentication lifecycle events
/// such as session expiration and forced logout.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment
class AuthenticationService {
  AuthenticationService(this._secureStorage, this._logger);

  final SecureStorageService _secureStorage;
  final LoggerService _logger;

  /// Handle session expiration (401 Unauthorized)
  /// Clears the stored token and navigates to login
  Future<void> handleSessionExpired() async {
    _logger.info('Session expired - Clearing token and navigating to login', 'AUTH_SERVICE');

    // Clear the stored token
    await _secureStorage.deleteToken();

    // Schedule navigation on next frame to avoid navigation during build
    scheduleMicrotask(() {
      final navigator = navigatorKey.currentState;
      if (navigator != null) {
        _logger.info('Navigating to login page', 'AUTH_SERVICE');
        // Navigate to login and clear the navigation stack
        navigator.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
          (route) => false,
        );
      } else {
        _logger.warning('Navigator is null - cannot navigate to login', 'AUTH_SERVICE');
      }
    });
  }

  /// Explicit logout initiated by user
  Future<void> logout() async {
    _logger.info('User logout', 'AUTH_SERVICE');
    await _secureStorage.deleteToken();
  }
}
