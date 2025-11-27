import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/viewmodels/podcast_player_viewmodel.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';

/// {@template mini_player_widget}
/// Mini player widget displayed at the bottom of the podcast player screen.
///
/// Shows episode thumbnail, title, and playback controls.
/// Tapping opens the full Now Playing view.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment - SRP Compliance
class MiniPlayerWidget extends StatelessWidget {
  const MiniPlayerWidget({
    required this.viewModel,
    required this.onTap,
    super.key,
  });

  final PodcastPlayerViewModel viewModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppDimensions.miniPlayerHeight,
        decoration: BoxDecoration(
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: AppDimensions.spacing8,
              offset: const Offset(0, -AppDimensions.borderThick),
            ),
          ],
        ),
        child: Column(
          children: [
            // Progress bar
            LinearProgressIndicator(
              value: viewModel.progress,
              backgroundColor: AppColors.surfaceDark,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColors.primary),
              minHeight: AppDimensions.miniPlayerProgressHeight,
            ),
            // Mini player content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppDimensions.spacing16,
                  AppDimensions.spacing8,
                  AppDimensions.spacing16,
                  AppDimensions.spacing16,
                ),
                child: Row(
                  children: [
                    // Episode Image
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radiusSmall),
                      child: SizedBox(
                        width: AppDimensions.miniPlayerImageSize,
                        height: AppDimensions.miniPlayerImageSize,
                        child: viewModel.currentEpisode?.imageUrl != null
                            ? CachedNetworkImage(
                                imageUrl: viewModel.currentEpisode!.imageUrl!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  color: AppColors.surfaceDark,
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
                    const SizedBox(width: AppDimensions.spacing12),
                    // Episode Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            viewModel.currentEpisode?.title ?? '',
                            style: AppTypography.bodyMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppDimensions.borderThick),
                          AppText(
                            viewModel.podcast?.title ?? '',
                            style: AppTypography.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    // Play/Pause Button
                    IconButton(
                      onPressed: viewModel.togglePlayPause,
                      icon: Icon(
                        viewModel.isPlaying ? Icons.pause : Icons.play_arrow,
                        color: AppColors.textPrimary,
                        size: AppDimensions.iconMedium28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
