import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/app.dart';
import 'package:jolly_podcast/core/config/app_config.dart';
import 'package:jolly_podcast/core/config/app_flavor.dart';

/// {@template main_staging}
/// Staging flavor entry point for Jolly Podcast application.
///
/// Runs the app with staging configuration:
/// - Staging API endpoint
/// - Debug logging enabled
/// - App name includes (Staging) suffix
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment

void main() {
  _runApp(AppFlavor.staging);
}

void _runApp(AppFlavor flavor) {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      AppConfig.initialize(flavor);

      runApp(
        const ProviderScope(
          child: JollyPodcastApp(),
        ),
      );
    },
    (error, stack) {
      _handleError(error, stack);
    },
  );

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    _handleError(details.exception, details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    _handleError(error, stack);
    return true;
  };
}

void _handleError(Object error, StackTrace? stack) {
  final appConfig = AppConfig.instance;

  if (appConfig.enableLogging) {
    debugPrint('=== [STAGING] Error Caught ===');
    debugPrint('Error: $error');
    debugPrint('Stack trace: $stack');
    debugPrint('=============================');
  }
}
