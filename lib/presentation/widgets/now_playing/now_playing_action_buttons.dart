import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_assets.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_strings.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';

/// {@template now_playing_action_buttons}
/// Action buttons widget for the Now Playing screen.
///
/// Displays add to queue, save, share, add to playlist, and go to episode buttons.
/// Single Responsibility: Handle action button UI only.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment - Widget Extraction
class NowPlayingActionButtons extends StatelessWidget {
  const NowPlayingActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top row buttons (Add to queue, Save, Share)
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppDimensions.spacing8),
          child: Wrap(
            spacing: 8,
            alignment: WrapAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  AppAssets.queueIcon,
                  width: AppDimensions.iconSmall,
                  height: AppDimensions.iconSmall,
                  color: AppColors.textPrimary,
                ),
                label: AppText(
                  AppStrings.addToQueue,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: AppDimensions.fontLarge - 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: AppColors.textPrimary,
                      width: AppDimensions.borderThin),
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.buttonPaddingHorizontal,
                      vertical: AppDimensions.buttonPaddingVertical),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radiusButton),
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  AppAssets.saveIcon,
                  width: AppDimensions.iconSmall,
                  height: AppDimensions.iconSmall,
                  color: AppColors.textPrimary,
                ),
                label: AppText(
                  AppStrings.save,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: AppDimensions.fontLarge - 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: AppColors.textPrimary,
                      width: AppDimensions.borderThin),
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.buttonPaddingHorizontal,
                      vertical: AppDimensions.buttonPaddingVertical),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radiusButton),
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  AppAssets.shareIcon,
                  width: AppDimensions.iconSmall,
                  height: AppDimensions.iconSmall,
                  color: AppColors.textPrimary,
                ),
                label: AppText(
                  AppStrings.shareEpisode,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: AppDimensions.fontLarge - 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: AppColors.textPrimary,
                      width: AppDimensions.borderThin),
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.buttonPaddingHorizontal,
                      vertical: AppDimensions.buttonPaddingVertical),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radiusButton),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimensions.spacing16),
        // Bottom row buttons (Add to playlist, Go to episode page)
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppDimensions.spacing24),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    AppAssets.addIcon,
                    width: AppDimensions.iconSmall,
                    height: AppDimensions.iconSmall,
                    color: AppColors.textPrimary,
                  ),
                  label: AppText(
                    AppStrings.addToPlaylist,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: AppDimensions.fontLarge - 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: AppColors.textPrimary,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: AppDimensions.buttonPaddingVertical12),
                  ),
                ),
              ),
              const SizedBox(width: AppDimensions.spacing12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.textPrimary),
                    padding: const EdgeInsets.symmetric(
                        vertical: AppDimensions.buttonPaddingVertical12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        AppStrings.goToEpisodePage,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: AppDimensions.fontLarge - 1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: AppDimensions.spacing8),
                      Image.asset(
                        AppAssets.chevronRight,
                        width: AppDimensions.iconSmall,
                        height: AppDimensions.iconSmall,
                        color: AppColors.textPrimary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
