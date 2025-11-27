import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_assets.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_strings.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/domain/entities/podcast.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';

/// {@template podcast_card}
/// A card widget that displays podcast information.
///
/// Shows the podcast thumbnail, title, and metadata in a visually
/// appealing card format suitable for list or grid displays.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class PodcastCard extends StatelessWidget {
  const PodcastCard({
    required this.podcast,
    required this.onTap,
    super.key,
  });

  final Podcast podcast;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Podcast Thumbnail Image - full width, no padding
            AspectRatio(
              aspectRatio: 1,
              child: podcast.imageUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: podcast.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: AppColors.surfaceDark,
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: AppDimensions.borderThick,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.accent,
                            ),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: AppColors.surfaceDark,
                        child: const Icon(
                          Icons.podcasts,
                          size: AppDimensions.iconXLarge,
                          color: AppColors.textTertiary,
                        ),
                      ),
                    )
                  : Container(
                      color: AppColors.surfaceDark,
                      child: const Icon(
                        Icons.podcasts,
                        size: AppDimensions.iconXLarge,
                        color: AppColors.textTertiary,
                      ),
                    ),
            ),
            // Podcast Info Section
            Padding(
              padding: const EdgeInsets.all(AppDimensions.spacing8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  AppText(
                    podcast.title,
                    style: AppTypography.bodyMedium.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      fontSize: AppDimensions.fontLarge,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppDimensions.borderThick),
                  // Author - Use publisher name
                  AppText(
                    podcast.publisherName ?? podcast.author,
                    style: AppTypography.caption.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                      fontSize: AppDimensions.fontMedium13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppDimensions.spacing12),
                  // Follow button and Share icon row
                  Row(
                    children: [
                      // Follow Button with plus icon - grey background, white content
                      Container(
                        height: AppDimensions.buttonHeightXS30,
                        width: AppDimensions.containerWidth78,
                        decoration: BoxDecoration(
                          color: AppColors.buttonTertiary,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusLarge + 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.addIcon,
                              width: AppDimensions.iconSmall18,
                              height: AppDimensions.iconSmall18,
                              fit: BoxFit.contain,
                              color: AppColors.textPrimary,
                            ),
                            const SizedBox(width: AppDimensions.spacing4),
                            AppText(
                              AppStrings.follow,
                              style: AppTypography.caption.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w700,
                                fontSize: AppDimensions.fontMedium13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                          width: AppDimensions.buttonPaddingVertical6),
                      // Share Icon Button - circular, separate
                      Container(
                        width: AppDimensions.buttonHeightXSmall,
                        height: AppDimensions.buttonHeightXSmall,
                        decoration: BoxDecoration(
                          color: AppColors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.textPrimary,
                            width: AppDimensions.borderThin,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            AppAssets.shareIcon,
                            width: AppDimensions.iconTiny,
                            height: AppDimensions.iconTiny,
                            fit: BoxFit.contain,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
