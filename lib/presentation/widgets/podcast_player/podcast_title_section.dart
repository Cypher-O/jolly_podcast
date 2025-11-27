import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_strings.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/viewmodels/podcast_player_viewmodel.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';
import 'package:jolly_podcast/presentation/widgets/podcast_player/category_chip.dart';

/// {@template podcast_title_section}
/// Title section widget for the podcast player screen.
///
/// Displays the back button, podcast title, and category tags.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment - SRP Compliance
class PodcastTitleSection extends StatelessWidget {
  const PodcastTitleSection({
    required this.viewModel,
    super.key,
  });

  final PodcastPlayerViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // GO BACK Button
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: AppColors.transparent,
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusXLarge - 2,
                ),
                border: Border.all(
                  color: AppColors.textPrimary,
                  width: AppDimensions.borderThin,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    size: AppDimensions.iconSmall,
                    color: AppColors.textPrimary,
                  ),
                  const SizedBox(width: AppDimensions.spacing4),
                  AppText(
                    AppStrings.goBack,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: AppTypography.fontSize16 - 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacing16),
          // Title
          AppText(
            viewModel.podcast?.title ?? AppStrings.podcast,
            style: AppTypography.h2.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w800,
                fontSize: AppDimensions.fontXXLarge),
          ),
          const SizedBox(height: AppDimensions.spacing8),
          // Category Tags
          Wrap(
            spacing: AppDimensions.spacing8,
            children: [
              if (viewModel.podcast?.categoryName != null)
                CategoryChip(label: viewModel.podcast!.categoryName),
              if (viewModel.podcast?.categoryType != null)
                CategoryChip(label: viewModel.podcast!.categoryType),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing24),
        ],
      ),
    );
  }
}
