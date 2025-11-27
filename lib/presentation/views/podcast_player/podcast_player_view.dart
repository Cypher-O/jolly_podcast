import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_strings.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/domain/entities/podcast.dart';
import 'package:jolly_podcast/presentation/viewmodels/podcast_player_viewmodel.dart';
import 'package:jolly_podcast/presentation/views/now_playing/now_playing_view.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';
import 'package:jolly_podcast/presentation/widgets/loading_indicator.dart';
import 'package:jolly_podcast/presentation/widgets/podcast_player/episodes_list_sliver.dart';
import 'package:jolly_podcast/presentation/widgets/podcast_player/mini_player_widget.dart';
import 'package:jolly_podcast/presentation/widgets/podcast_player/podcast_header_section.dart';
import 'package:jolly_podcast/presentation/widgets/podcast_player/podcast_player_header.dart';
import 'package:jolly_podcast/presentation/widgets/podcast_player/podcast_title_section.dart';

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
    this.podcast,
    super.key,
  });

  final String podcastId;
  final Podcast? podcast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(podcastPlayerViewModelProvider(podcastId));

    // Set initial podcast if provided
    if (podcast != null && viewModel.podcast == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.setInitialPodcast(podcast!);
      });
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Builder(
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
                      AppText(
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
                        label: const AppText(AppStrings.retry),
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

            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    // Header matching podcast list
                    const SliverToBoxAdapter(
                      child: PodcastPlayerHeader(),
                    ),
                    // GO BACK and Title Section
                    SliverToBoxAdapter(
                      child: PodcastTitleSection(viewModel: viewModel),
                    ),
                    // Podcast Header with Image and Info
                    SliverToBoxAdapter(
                      child: PodcastHeaderSection(viewModel: viewModel),
                    ),
                    // Episodes Section
                    EpisodesListSliver(
                      viewModel: viewModel,
                      podcastId: podcastId,
                    ),
                    // Add bottom padding for mini player
                    if (viewModel.currentEpisode != null)
                      const SliverToBoxAdapter(
                        child: SizedBox(height: AppDimensions.imageSmall),
                      ),
                  ],
                ),
                // Mini Player at Bottom
                if (viewModel.currentEpisode != null)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: MiniPlayerWidget(
                      viewModel: viewModel,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) =>
                              NowPlayingView(podcastId: podcastId),
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
