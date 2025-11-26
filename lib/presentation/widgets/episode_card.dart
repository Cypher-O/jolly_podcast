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
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
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
              // Episode Image with Play Icon Overlay
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                    child: SizedBox(
                      width: 80,
                      height: 80,
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
                      child: Container(
                        width: 40,
                        height: 40,
                        // decoration: BoxDecoration(
                        //   color: AppColors.primary.withOpacity(0.9),
                        //   shape: BoxShape.circle,
                        // ),
                        child: Image.asset(
                          isPlaying
                              ? 'assets/images/pause.png'
                              : 'assets/images/play.png',
                          width: 20,
                          height: 20,
                          // color: AppColors.textOnPrimary,
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
                    Text(
                      episode.title,
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppDimensions.spacing4),
                    // Description
                    if (episode.description != null)
                      Text(
                        episode.description!,
                        style: AppTypography.caption.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 11,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    const SizedBox(height: AppDimensions.spacing4),
                    // Date and Duration
                    Row(
                      children: [
                        if (episode.publishedAt != null) ...[
                          Text(
                            _formatDate(episode.publishedAt!),
                            style: AppTypography.caption.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 10,
                            ),
                          ),
                        ],
                        if (episode.duration != null && episode.publishedAt != null) ...[
                          const SizedBox(width: AppDimensions.spacing8),
                          Container(
                            width: 3,
                            height: 3,
                            decoration: const BoxDecoration(
                              color: AppColors.textSecondary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: AppDimensions.spacing8),
                        ],
                        if (episode.duration != null) ...[
                          Text(
                            episode.formattedDuration,
                            style: AppTypography.caption.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 10,
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
                  size: 24,
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
      builder: (context) => _EpisodeMenuSheet(episode: episode),
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

/// Bottom sheet menu for episode actions
class _EpisodeMenuSheet extends StatelessWidget {
  const _EpisodeMenuSheet({required this.episode});

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
                  width: 80,
                  height: 80,
                  child: episode.imageUrl != null
                      ? CachedNetworkImage(
                          imageUrl: episode.imageUrl!,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Container(
                            color: AppColors.surfaceDark,
                            child: const Icon(
                              Icons.music_note,
                              size: 40,
                              color: AppColors.textTertiary,
                            ),
                          ),
                        )
                      : Container(
                          color: AppColors.surfaceDark,
                          child: const Icon(
                            Icons.music_note,
                            size: 40,
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
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppDimensions.spacing4),
                    if (episode.description != null)
                      Text(
                        episode.description!,
                        style: AppTypography.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
            label: 'Play',
            onTap: () {
              Navigator.pop(context);
              // Play episode
            },
          ),
          _MenuOption(
            icon: Icons.favorite,
            iconColor: AppColors.primary,
            label: 'Remove from favorite',
            onTap: () {
              Navigator.pop(context);
              // Remove from favorites
            },
          ),
          _MenuOption(
            icon: Icons.playlist_add,
            label: 'Add to queue',
            onTap: () {
              Navigator.pop(context);
              // Add to queue
            },
          ),
          _MenuOption(
            icon: Icons.share,
            label: 'Share episode',
            onTap: () {
              Navigator.pop(context);
              // Share episode
            },
          ),
          _MenuOption(
            icon: Icons.remove_circle_outline,
            label: 'Remove from playlist',
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
}

/// Menu option item
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
              size: 24,
            ),
            const SizedBox(width: AppDimensions.spacing16),
            Text(
              label,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
