import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';

/// {@template now_playing_progress_bar}
/// Progress bar widget for the Now Playing screen.
///
/// Displays a draggable slider and time labels for audio playback.
/// Single Responsibility: Handle audio progress display and seeking.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment - Widget Extraction
class NowPlayingProgressBar extends StatelessWidget {
  const NowPlayingProgressBar({
    required this.progress,
    required this.currentPosition,
    required this.totalDuration,
    required this.onSeek,
    super.key,
  });

  final double progress;
  final String currentPosition;
  final String totalDuration;
  final ValueChanged<double> onSeek;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing24),
      child: Column(
        children: [
          // Draggable progress slider
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 6.0,
              trackShape: const RoundedRectSliderTrackShape(),
              thumbShape: SliderComponentShape.noThumb,
              overlayShape: SliderComponentShape.noOverlay,
              activeTrackColor: AppColors.textPrimary,
              inactiveTrackColor: AppColors.borderDark.withOpacity(0.3),
            ),
            child: Slider(
              value: progress.clamp(0.0, 1.0),
              onChanged: onSeek,
            ),
          ),
          // Time labels
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  currentPosition,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: AppDimensions.fontMedium13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                AppText(
                  totalDuration,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: AppDimensions.fontMedium13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
