import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_assets.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/domain/entities/episode.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';
import 'package:jolly_podcast/presentation/widgets/episode_menu_sheet.dart';

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
    this.onMenuTap,
    this.isPlaying = false,
    super.key,
  });

  final Episode episode;
  final VoidCallback onTap;
  final VoidCallback? onMenuTap;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimensions.spacing8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Episode Image with Play Icon Overlay
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radiusSmall),
                    child: SizedBox(
                      width: AppDimensions.imageSmall,
                      height: AppDimensions.imageSmall,
                      child: episode.imageUrl != null
                          ? CachedNetworkImage(
                              imageUrl: episode.imageUrl!,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: AppColors.surfaceDark,
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
                                color: AppColors.surfaceDark,
                                child: const Icon(
                                  Icons.music_note,
                                  size: AppDimensions.iconMedium,
                                  color: AppColors.textTertiary,
                                ),
                              ),
                            )
                          : Container(
                              color: AppColors.surfaceDark,
                              child: const Icon(
                                Icons.music_note,
                                size: AppDimensions.iconMedium,
                                color: AppColors.textTertiary,
                              ),
                            ),
                    ),
                  ),
                  // Play/Pause icon overlay on thumbnail
                  Positioned.fill(
                    child: Center(
                      child: SizedBox(
                        width: AppDimensions.playPauseOverlaySize,
                        height: AppDimensions.playPauseOverlaySize,
                        child: Image.asset(
                          isPlaying ? AppAssets.pauseIcon : AppAssets.playIcon,
                          width: AppDimensions.playPauseIconSize,
                          height: AppDimensions.playPauseIconSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: AppDimensions.spacing12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    AppText(
                      episode.title,
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                        fontSize: AppTypography.fontSize16 - 1,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppDimensions.spacing4),
                    // Description
                    if (episode.description != null)
                      AppText(
                        episode.description!,
                        style: AppTypography.caption.copyWith(
                          color: AppColors.textEpisodeCard,
                          fontSize: AppDimensions.fontMedium13,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    const SizedBox(height: AppDimensions.spacing4),
                    // Date and Duration
                    Row(
                      children: [
                        if (episode.publishedAt != null) ...[
                          AppText(
                            episode.formattedPublishedDate,
                            style: AppTypography.caption.copyWith(
                              color: AppColors.textGreyLight,
                              fontSize: AppTypography.fontSize12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                        if (episode.duration != null &&
                            episode.publishedAt != null) ...[
                          AppText(
                            ', ',
                            style: AppTypography.caption.copyWith(
                              color: AppColors.textGreyLight,
                              fontSize: AppTypography.fontSize12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                        if (episode.duration != null) ...[
                          AppText(
                            episode.formattedDuration,
                            style: AppTypography.caption.copyWith(
                              color: AppColors.textGreyLight,
                              fontSize: AppTypography.fontSize12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppDimensions.spacing8),
              // Triple-dot menu button only
              GestureDetector(
                onTap: onMenuTap ?? () => _showEpisodeMenu(context),
                child: const Icon(
                  Icons.more_vert,
                  color: AppColors.textSecondary,
                  size: AppDimensions.iconMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEpisodeMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusLarge),
        ),
      ),
      builder: (context) => EpisodeMenuSheet(episode: episode),
    );
  }
}
