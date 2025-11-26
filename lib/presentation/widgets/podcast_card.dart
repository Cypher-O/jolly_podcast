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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(8),
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
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF10B981),
                            ),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: AppColors.surfaceDark,
                        child: const Icon(
                          Icons.podcasts,
                          size: 48,
                          color: AppColors.textTertiary,
                        ),
                      ),
                    )
                  : Container(
                      color: AppColors.surfaceDark,
                      child: const Icon(
                        Icons.podcasts,
                        size: 48,
                        color: AppColors.textTertiary,
                      ),
                    ),
            ),
            // Podcast Info Section
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    podcast.title,
                    style: AppTypography.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  // Author - Use publisher name
                  Text(
                    podcast.publisherName ?? podcast.author,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Follow button and Share icon row
                  Row(
                    children: [
                      // Follow Button with plus icon - grey background, white content
                      Expanded(
                        child: Container(
                          height: 28,
                          decoration: BoxDecoration(
                            color: const Color(0xFF374151),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/add.png',
                                width: 12,
                                height: 12,
                                fit: BoxFit.contain,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Follow',
                                style: AppTypography.caption.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      // Share Icon Button - circular, separate
                      Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: Color(0xFF374151),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/share.png',
                            width: 12,
                            height: 12,
                            fit: BoxFit.contain,
                            color: Colors.white,
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
