import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_assets.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';

/// {@template now_playing_top_bar}
/// Top bar widget for the Now Playing screen.
///
/// Displays a chevron down button to dismiss the screen.
/// Single Responsibility: Handle the top bar UI only.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment - Widget Extraction
class NowPlayingTopBar extends StatelessWidget {
  const NowPlayingTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.spacing16),
      child: Stack(
        children: [
          Center(
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Image.asset(
                AppAssets.chevronDownCircular,
                width: AppDimensions.iconLarge,
                height: AppDimensions.iconLarge,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
