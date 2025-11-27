import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';

/// {@template now_playing_episode_info}
/// Episode information widget for the Now Playing screen.
///
/// Displays episode title and description.
/// Single Responsibility: Display episode metadata only.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment - Widget Extraction
class NowPlayingEpisodeInfo extends StatelessWidget {
  const NowPlayingEpisodeInfo({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title,
            style: AppTypography.bodyLarge.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
              fontSize: AppDimensions.fontXLarge,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppDimensions.spacing8),
          AppText(
            description,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textPrimary.withOpacity(0.9),
              fontSize: AppTypography.fontSize16 - 1,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
