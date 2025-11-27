import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_strings.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/domain/entities/episode.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';

/// {@template episode_menu_sheet}
/// Bottom sheet menu for episode actions.
///
/// Displays episode information and action menu options.
/// Single Responsibility: Display episode action menu only.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment - Widget Extraction
class EpisodeMenuSheet extends StatelessWidget {
  const EpisodeMenuSheet({
    required this.episode,
    super.key,
  });

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.spacing24,
        horizontal: AppDimensions.spacing16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Episode header
          Row(
            children: [
              // Episode thumbnail
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
                            color: AppColors.surfaceDark,
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: AppColors.surfaceDark,
                            child: const Icon(
                              Icons.music_note,
                              color: Colors.white54,
                            ),
                          ),
                        )
                      : Container(
                          color: AppColors.surfaceDark,
                          child: const Icon(
                            Icons.music_note,
                            color: Colors.white54,
                          ),
                        ),
                ),
              ),
              const SizedBox(width: AppDimensions.spacing12),
              // Episode info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      episode.title,
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppDimensions.spacing4),
                    if (episode.duration != null)
                      AppText(
                        _formatDuration(Duration(seconds: episode.duration!)),
                        style: AppTypography.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing24),
          // Menu options
          _MenuOption(
            icon: Icons.play_circle_outline,
            label: AppStrings.play,
            onTap: () {
              Navigator.pop(context);
              // Play episode
            },
          ),
          _MenuOption(
            icon: Icons.favorite,
            iconColor: AppColors.primary,
            label: AppStrings.removeFromFavorite,
            onTap: () {
              Navigator.pop(context);
              // Remove from favorites
            },
          ),
          _MenuOption(
            icon: Icons.playlist_add,
            label: AppStrings.addToQueue,
            onTap: () {
              Navigator.pop(context);
              // Add to queue
            },
          ),
          _MenuOption(
            icon: Icons.share,
            label: AppStrings.shareEpisode,
            onTap: () {
              Navigator.pop(context);
              // Share episode
            },
          ),
          _MenuOption(
            icon: Icons.remove_circle_outline,
            label: AppStrings.removeFromPlaylist,
            onTap: () {
              Navigator.pop(context);
              // Remove from playlist
            },
          ),
          const SizedBox(height: AppDimensions.spacing8),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    if (hours > 0) {
      return '$hours hr $minutes min';
    } else {
      return '$minutes min';
    }
  }
}

/// Menu option widget for episode menu
class _MenuOption extends StatelessWidget {
  const _MenuOption({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.spacing12,
          horizontal: AppDimensions.spacing8,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor ?? AppColors.textPrimary,
              size: AppDimensions.iconMedium,
            ),
            const SizedBox(width: AppDimensions.spacing16),
            Expanded(
              child: AppText(
                label,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
