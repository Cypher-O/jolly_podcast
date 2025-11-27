import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_assets.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';

/// {@template podcast_player_header}
/// Header widget for the podcast player screen.
///
/// Displays the app logo and action icons (notification, user, search).
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment - SRP Compliance
class PodcastPlayerHeader extends StatelessWidget {
  const PodcastPlayerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.spacing16),
      child: Row(
        children: [
          Image.asset(
            AppAssets.jollyLogoLogin,
            height: AppDimensions.iconLarge,
            fit: BoxFit.contain,
          ),
          const Spacer(),
          // Icons Container - notification, user, search
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacing8,
              vertical: AppDimensions.buttonPaddingVertical6,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusButton),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Bell/Notification Icon
                Image.asset(
                  AppAssets.notificationIcon,
                  width: AppDimensions.iconMedium,
                  height: AppDimensions.iconMedium,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: AppDimensions.spacing12),
                // User Avatar
                Image.asset(
                  AppAssets.userIcon,
                  width: AppDimensions.iconMedium,
                  height: AppDimensions.iconMedium,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: AppDimensions.spacing12),
                // Search Icon
                Image.asset(
                  AppAssets.searchIcon,
                  width: AppDimensions.iconMedium,
                  height: AppDimensions.iconMedium,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
