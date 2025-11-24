import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_strings.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/viewmodels/podcast_player_viewmodel.dart';
import 'package:jolly_podcast/presentation/widgets/episode_card.dart';
import 'package:jolly_podcast/presentation/widgets/loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// {@template podcast_player_view}
/// Podcast player screen for the Jolly Podcast application.
///
/// Displays podcast details, episode list, and audio playback controls.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class PodcastPlayerView extends ConsumerWidget {
  const PodcastPlayerView({
    required this.podcastId,
    super.key,
  });

  final String podcastId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(podcastPlayerViewModelProvider(podcastId));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          viewModel.podcast?.title ?? AppStrings.loading,
          style: AppTypography.h2.copyWith(
            fontWeight: AppTypography.weightBold,
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: AppDimensions.cardElevation - AppDimensions.cardElevation,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (viewModel.isLoadingPodcast) {
            return const LoadingIndicator(message: AppStrings.loading);
          }

          if (viewModel.hasError && viewModel.podcast == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.spacing24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: AppDimensions.iconXXLarge,
                      color: AppColors.error,
                    ),
                    const SizedBox(height: AppDimensions.spacing16),
                    Text(
                      viewModel.errorMessage ?? AppStrings.unknownError,
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppDimensions.spacing24),
                    ElevatedButton.icon(
                      onPressed: viewModel.loadPodcastDetails,
                      icon: const Icon(Icons.refresh),
                      label: const Text(AppStrings.retry),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textOnPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Column(
            children: [
              if (viewModel.currentEpisode != null)
                _buildPlayerSection(viewModel),
              Expanded(
                child: _buildEpisodesList(viewModel),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPlayerSection(PodcastPlayerViewModel viewModel) {
    return Container(
      color: AppColors.playerBackground,
      padding: const EdgeInsets.all(AppDimensions.spacing20),
      child: Column(
        children: [
          if (viewModel.currentEpisode?.imageUrl != null ||
              viewModel.podcast?.imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
              child: SizedBox(
                width: AppDimensions.imageLarge,
                height: AppDimensions.imageLarge,
                child: CachedNetworkImage(
                  imageUrl: viewModel.currentEpisode?.imageUrl ??
                      viewModel.podcast?.imageUrl ??
                      '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: AppColors.border,
                    child: const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: AppDimensions.borderThick,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.primary),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.border,
                    child: const Icon(
                      Icons.music_note,
                      size: AppDimensions.iconXXLarge,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(height: AppDimensions.spacing20),
          Text(
            viewModel.currentEpisode?.title ?? '',
            style: AppTypography.h3.copyWith(
              fontWeight: AppTypography.weightBold,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (viewModel.podcast?.title != null) ...[
            const SizedBox(height: AppDimensions.spacing4),
            Text(
              viewModel.podcast!.title,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: AppDimensions.spacing20),
          if (viewModel.isLoadingAudio)
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            )
          else
            Column(
              children: [
                Slider(
                  value: viewModel.progress,
                  onChanged: (value) {
                    final position = Duration(
                      milliseconds:
                          (value * viewModel.totalDuration.inMilliseconds)
                              .round(),
                    );
                    viewModel.seek(position);
                  },
                  activeColor: AppColors.primary,
                  inactiveColor: AppColors.audioSeekBar,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        viewModel.formattedCurrentPosition,
                        style: AppTypography.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        viewModel.formattedTotalDuration,
                        style: AppTypography.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppDimensions.spacing20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        final newPosition = viewModel.currentPosition -
                            const Duration(seconds: 10);
                        viewModel.seek(
                          newPosition.isNegative
                              ? Duration.zero
                              : newPosition,
                        );
                      },
                      icon: const Icon(Icons.replay_10),
                      iconSize: AppDimensions.playerSkipIconSize,
                      color: AppColors.textPrimary,
                    ),
                    const SizedBox(width: AppDimensions.spacing24),
                    Container(
                      width: AppDimensions.playerControlSize,
                      height: AppDimensions.playerControlSize,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: viewModel.togglePlayPause,
                        icon: Icon(
                          viewModel.isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                        iconSize: AppDimensions.playerControlIconSize,
                        color: AppColors.textOnPrimary,
                      ),
                    ),
                    const SizedBox(width: AppDimensions.spacing24),
                    IconButton(
                      onPressed: () {
                        final newPosition = viewModel.currentPosition +
                            const Duration(seconds: 10);
                        viewModel.seek(
                          newPosition > viewModel.totalDuration
                              ? viewModel.totalDuration
                              : newPosition,
                        );
                      },
                      icon: const Icon(Icons.forward_10),
                      iconSize: AppDimensions.playerSkipIconSize,
                      color: AppColors.textPrimary,
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildEpisodesList(PodcastPlayerViewModel viewModel) {
    if (viewModel.isLoadingEpisodes) {
      return const LoadingIndicator(message: AppStrings.loading);
    }

    if (viewModel.episodes.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.headphones_outlined,
              size: AppDimensions.iconXXLarge,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: AppDimensions.spacing16),
            Text(
              AppStrings.noEpisodesAvailable,
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDimensions.spacing16),
          child: Text(
            AppStrings.episodes,
            style: AppTypography.h2.copyWith(
              fontWeight: AppTypography.weightBold,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing16),
            itemCount: viewModel.episodes.length,
            itemBuilder: (context, index) {
              final episode = viewModel.episodes[index];
              final isCurrentEpisode =
                  viewModel.currentEpisode?.id == episode.id;

              return Container(
                decoration: isCurrentEpisode
                    ? BoxDecoration(
                        border: Border.all(
                          color: AppColors.primary,
                          width: AppDimensions.borderThick,
                        ),
                        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                      )
                    : null,
                child: EpisodeCard(
                  episode: episode,
                  onTap: () => viewModel.selectEpisode(episode),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
