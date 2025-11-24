import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/domain/entities/episode.dart';

/// {@template episode_card}
/// A card widget that displays episode information.
///
/// Shows the episode thumbnail, title, description, and duration
/// in a list format suitable for episode listings.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class EpisodeCard extends StatelessWidget {
  const EpisodeCard({
    required this.episode,
    required this.onTap,
    super.key,
  });

  final Episode episode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimensions.borderThin,
      margin: const EdgeInsets.symmetric(vertical: AppDimensions.spacing4 + AppDimensions.borderThick),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.spacing12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                child: SizedBox(
                  width: AppDimensions.imageSmall,
                  height: AppDimensions.imageSmall,
                  child: episode.imageUrl != null
                      ? CachedNetworkImage(
                          imageUrl: episode.imageUrl!,
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
                              Icons.music_note,
                              size: AppDimensions.iconLarge,
                              color: AppColors.textTertiary,
                            ),
                          ),
                        )
                      : Container(
                          color: AppColors.border,
                          child: const Icon(
                            Icons.music_note,
                            size: AppDimensions.iconLarge,
                            color: AppColors.textTertiary,
                          ),
                        ),
                ),
              ),
              const SizedBox(width: AppDimensions.spacing12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      episode.title,
                      style: AppTypography.bodyLarge.copyWith(
                        fontWeight: AppTypography.weightSemiBold,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (episode.description != null) ...[
                      const SizedBox(height: AppDimensions.spacing4),
                      Text(
                        episode.description!,
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    const SizedBox(height: AppDimensions.spacing8),
                    Row(
                      children: [
                        if (episode.duration != null) ...[
                          const Icon(
                            Icons.access_time,
                            size: AppDimensions.iconSmall - AppDimensions.borderThick,
                            color: AppColors.textTertiary,
                          ),
                          const SizedBox(width: AppDimensions.spacing4),
                          Text(
                            episode.formattedDuration,
                            style: AppTypography.caption.copyWith(
                              color: AppColors.textTertiary,
                            ),
                          ),
                        ],
                        if (episode.publishedAt != null) ...[
                          if (episode.duration != null) ...[
                            const SizedBox(width: AppDimensions.spacing12),
                            Container(
                              width: AppDimensions.spacing4,
                              height: AppDimensions.spacing4,
                              decoration: const BoxDecoration(
                                color: AppColors.textTertiary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: AppDimensions.spacing12),
                          ],
                          Text(
                            _formatDate(episode.publishedAt!),
                            style: AppTypography.caption.copyWith(
                              color: AppColors.textTertiary,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }
}
