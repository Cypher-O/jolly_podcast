import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/domain/entities/podcast.dart';

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
    return Card(
      elevation: AppDimensions.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppDimensions.radiusLarge),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: podcast.imageUrl.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: podcast.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: AppColors.border,
                          child: const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: AppDimensions.borderThick,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: AppColors.border,
                          child: const Icon(
                            Icons.podcasts,
                            size: AppDimensions.iconXLarge,
                            color: AppColors.textTertiary,
                          ),
                        ),
                      )
                    : Container(
                        color: AppColors.border,
                        child: const Icon(
                          Icons.podcasts,
                          size: AppDimensions.iconXLarge,
                          color: AppColors.textTertiary,
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimensions.spacing12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    podcast.title,
                    style: AppTypography.bodyLarge.copyWith(
                      fontWeight: AppTypography.weightSemiBold,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppDimensions.spacing4),
                  Text(
                    podcast.author,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (podcast.subscriberCount != null) ...[
                    const SizedBox(height: AppDimensions.spacing8),
                    Row(
                      children: [
                        const Icon(
                          Icons.people_outline,
                          size: AppDimensions.iconSmall,
                          color: AppColors.textTertiary,
                        ),
                        const SizedBox(width: AppDimensions.spacing4),
                        Text(
                          '${podcast.subscriberCount} subscribers',
                          style: AppTypography.caption.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
