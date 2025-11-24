import 'package:jolly_podcast/core/config/app_flavor.dart';

/// {@template app_config}
/// Application configuration for different build flavors.
///
/// Single Responsibility: Manages environment-specific configuration.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class AppConfig {
  AppConfig._({
    required this.appName,
    required this.baseUrl,
    required this.flavor,
    required this.enableLogging,
  });

  final String appName;
  final String baseUrl;
  final AppFlavor flavor;
  final bool enableLogging;

  static AppConfig? _instance;

  static AppConfig get instance {
    if (_instance == null) {
      throw Exception(
        'AppConfig not initialized. Call AppConfig.initialize() first.',
      );
    }
    return _instance!;
  }

  static void initialize(AppFlavor flavor) {
    switch (flavor) {
      case AppFlavor.dev:
        _instance = AppConfig._(
          appName: 'Jolly Podcast (Dev)',
          baseUrl: 'https://api.jollypodcast.net',
          flavor: AppFlavor.dev,
          enableLogging: true,
        );
        break;
      case AppFlavor.staging:
        _instance = AppConfig._(
          appName: 'Jolly Podcast (Staging)',
          baseUrl: 'https://api.jollypodcast.net',
          flavor: AppFlavor.staging,
          enableLogging: true,
        );
        break;
      case AppFlavor.production:
        _instance = AppConfig._(
          appName: 'Jolly Podcast',
          baseUrl: 'https://api.jollypodcast.net',
          flavor: AppFlavor.production,
          enableLogging: false,
        );
        break;
    }
  }

  bool get isDevelopment => flavor == AppFlavor.dev;
  bool get isStaging => flavor == AppFlavor.staging;
  bool get isProduction => flavor == AppFlavor.production;
}
