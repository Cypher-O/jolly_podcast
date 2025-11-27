import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_assets.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_strings.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/viewmodels/podcast_player_viewmodel.dart';
import 'package:jolly_podcast/presentation/views/now_playing/now_playing_view.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';
import 'package:jolly_podcast/presentation/widgets/episode_card.dart';
import 'package:jolly_podcast/presentation/widgets/loading_indicator.dart';

/// {@template episodes_list_sliver}
/// Sliver widget that displays the list of podcast episodes.
///
/// Shows loading state, empty state, or the episode list with header.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment - SRP Compliance
class EpisodesListSliver extends StatelessWidget {
  const EpisodesListSliver({
    required this.viewModel,
    required this.podcastId,
    super.key,
  });

  final PodcastPlayerViewModel viewModel;
  final String podcastId;

  @override
  Widget build(BuildContext context) {
    if (viewModel.isLoadingEpisodes) {
      return const SliverFillRemaining(
        child: LoadingIndicator(message: AppStrings.loading),
      );
    }

    if (viewModel.episodes.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.headphones_outlined,
                size: AppDimensions.iconXXLarge,
                color: AppColors.textTertiary,
              ),
              const SizedBox(height: AppDimensions.spacing16),
              AppText(
                AppStrings.noEpisodesAvailable,
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            // Add header before first item
            if (index == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppAssets.moreIcon,
                            width: AppDimensions.iconSmall,
                            height: AppDimensions.iconSmall,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: AppDimensions.spacing8),
                          AppText(
                            AppStrings.sortByNewest,
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w700,
                              fontSize: AppTypography.fontSize14,
                            ),
                          ),
                          const SizedBox(width: AppDimensions.spacing4),
                          Image.asset(
                            AppAssets.chevronDown,
                            width: AppDimensions.iconTiny,
                            height: AppDimensions.iconTiny,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: AppDimensions.spacing12,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppAssets.moreIcon,
                            width: AppDimensions.iconSmall,
                            height: AppDimensions.iconSmall,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: AppDimensions.spacing8),
                          AppText(
                            AppStrings.filterAllEpisodes,
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w700,
                              fontSize: AppTypography.fontSize14,
                            ),
                          ),
                          const SizedBox(width: AppDimensions.spacing4),
                          Image.asset(
                            AppAssets.chevronDown,
                            width: AppDimensions.iconTiny,
                            height: AppDimensions.iconTiny,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.spacing16),
                  _buildEpisodeItem(context, 0),
                ],
              );
            }

            return _buildEpisodeItem(context, index);
          },
          childCount: viewModel.episodes.length,
        ),
      ),
    );
  }

  Widget _buildEpisodeItem(BuildContext context, int index) {
    final episode = viewModel.episodes[index];
    final isCurrentEpisode = viewModel.currentEpisode?.id == episode.id;
    final isPlaying = isCurrentEpisode && viewModel.isPlaying;

    return Container(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacing12),
      child: EpisodeCard(
        episode: episode,
        isPlaying: isPlaying,
        onTap: () async {
          await viewModel.selectEpisode(episode);
          // Immediately open Now Playing modal
          if (!context.mounted) return;
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => NowPlayingView(podcastId: podcastId),
          );
        },
      ),
    );
  }
}
