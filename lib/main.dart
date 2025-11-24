import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/app.dart';
import 'package:jolly_podcast/core/config/app_config.dart';
import 'package:jolly_podcast/core/config/app_flavor.dart';

/// {@template main}
/// Entry point for the Jolly Podcast application.
///
/// Initializes the app with error handling, flavor configuration,
/// and Riverpod provider scope.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment

void main() {
  _runApp(AppFlavor.production);
}

/// Run app with specific flavor configuration
void _runApp(AppFlavor flavor) {
  runZonedGuarded<Future<void>>(
    () async {
      // Ensure Flutter bindings are initialized
      WidgetsFlutterBinding.ensureInitialized();

      // Initialize app configuration with flavor
      AppConfig.initialize(flavor);

      // Run the app with error boundary
      runApp(
        const ProviderScope(
          child: JollyPodcastApp(),
        ),
      );
    },
    (error, stack) {
      // Global error handler
      _handleError(error, stack);
    },
  );

  // Handle Flutter framework errors
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    _handleError(details.exception, details.stack);
  };

  // Handle errors from the platform side
  PlatformDispatcher.instance.onError = (error, stack) {
    _handleError(error, stack);
    return true;
  };
}

/// Centralized error handler for the application
void _handleError(Object error, StackTrace? stack) {
  final appConfig = AppConfig.instance;

  if (appConfig.enableLogging) {
    debugPrint('=== Error Caught ===');
    debugPrint('Error: $error');
    debugPrint('Stack trace: $stack');
    debugPrint('===================');
  }

  // In production, you would send this to a crash reporting service
  // like Sentry, Firebase Crashlytics, etc.
  // Example: Sentry.captureException(error, stackTrace: stack);
}
