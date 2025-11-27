import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_assets.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';

/// {@template now_playing_playback_controls}
/// Playback controls widget for the Now Playing screen.
///
/// Displays play/pause, next, previous, and skip buttons.
/// Single Responsibility: Handle playback control UI only.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment - Widget Extraction
class NowPlayingPlaybackControls extends StatelessWidget {
  const NowPlayingPlaybackControls({
    required this.isPlaying,
    required this.onPlayPause,
    required this.onPrevious,
    required this.onNext,
    required this.onRewind,
    required this.onForward,
    super.key,
  });

  final bool isPlaying;
  final VoidCallback onPlayPause;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onRewind;
  final VoidCallback onForward;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Rewind 10s
          IconButton(
            onPressed: onRewind,
            icon: Image.asset(
              AppAssets.prev10Icon,
              width: AppDimensions.iconMedium28,
              height: AppDimensions.iconMedium28,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(width: AppDimensions.spacing8),
          // Previous Episode
          IconButton(
            onPressed: onPrevious,
            icon: Image.asset(
              AppAssets.previousIcon,
              width: AppDimensions.iconLarge,
              height: AppDimensions.iconLarge,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(width: AppDimensions.spacing16),
          // Play/Pause
          GestureDetector(
            onTap: onPlayPause,
            child: Image.asset(
              isPlaying ? AppAssets.pauseIcon : AppAssets.playIcon,
              width: AppDimensions.iconXXLarge56,
              height: AppDimensions.iconXXLarge56,
            ),
          ),
          const SizedBox(width: AppDimensions.spacing16),
          // Next Episode
          IconButton(
            onPressed: onNext,
            icon: Image.asset(
              AppAssets.nextIcon,
              width: AppDimensions.iconLarge,
              height: AppDimensions.iconLarge,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(width: AppDimensions.spacing8),
          // Forward 10s
          IconButton(
            onPressed: onForward,
            icon: Image.asset(
              AppAssets.next10Icon,
              width: AppDimensions.iconMedium28,
              height: AppDimensions.iconMedium28,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
