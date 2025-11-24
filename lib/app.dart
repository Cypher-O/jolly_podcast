import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/core/config/app_config.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/presentation/viewmodels/login_viewmodel.dart';
import 'package:jolly_podcast/presentation/views/login/login_view.dart';
import 'package:jolly_podcast/presentation/views/podcast_list/podcast_list_view.dart';

/// {@template jolly_podcast_app}
/// Main application widget for Jolly Podcast.
///
/// Configures the MaterialApp with theming, routing, and flavor-specific settings.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class JollyPodcastApp extends ConsumerWidget {
  const JollyPodcastApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appConfig = AppConfig.instance;

    return MaterialApp(
      title: appConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.primaryLight,
          background: AppColors.background,
          surface: AppColors.surface,
          error: AppColors.error,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          centerTitle: false,
        ),
        cardTheme: CardTheme(
          color: AppColors.surface,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        useMaterial3: true,
        fontFamily: 'System',
      ),
      home: const AuthenticationWrapper(),
    );
  }
}

/// {@template authentication_wrapper}
/// Widget that determines initial screen based on authentication state.
///
/// Checks if user has a valid authentication token and routes accordingly.
/// {@endtemplate}
class AuthenticationWrapper extends ConsumerWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticatedAsync = ref.watch(isAuthenticatedProvider);

    return isAuthenticatedAsync.when(
      data: (isAuthenticated) {
        if (isAuthenticated) {
          return const PodcastListView();
        } else {
          return const LoginView();
        }
      },
      loading: () => const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
      ),
      error: (error, stack) => const LoginView(),
    );
  }
}
