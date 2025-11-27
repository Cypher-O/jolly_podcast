import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/presentation/viewmodels/podcast_player_viewmodel.dart';
import 'package:jolly_podcast/presentation/widgets/now_playing/now_playing_action_buttons.dart';
import 'package:jolly_podcast/presentation/widgets/now_playing/now_playing_album_art.dart';
import 'package:jolly_podcast/presentation/widgets/now_playing/now_playing_episode_info.dart';
import 'package:jolly_podcast/presentation/widgets/now_playing/now_playing_playback_controls.dart';
import 'package:jolly_podcast/presentation/widgets/now_playing/now_playing_progress_bar.dart';
import 'package:jolly_podcast/presentation/widgets/now_playing/now_playing_top_bar.dart';

/// {@template now_playing_view}
/// Full-screen now playing view for the Jolly Podcast application.
///
/// Displays the currently playing episode with playback controls.
/// Single Responsibility: Compose Now Playing widgets and manage state.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26 (Refactored with widget extraction)
/// **Purpose:** Bloocode Technology Recruitment
class NowPlayingView extends ConsumerWidget {
  const NowPlayingView({
    required this.podcastId,
    super.key,
  });

  final String podcastId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(podcastPlayerViewModelProvider(podcastId));

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.gradientStart,
            AppColors.gradientMiddle,
            AppColors.gradientEnd,
          ],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: AppDimensions.spacing60),
              // Top Bar with chevron down
              const NowPlayingTopBar(),
              const SizedBox(height: AppDimensions.spacing16),
              // Album Art
              NowPlayingAlbumArt(
                imageUrl: viewModel.currentEpisode?.imageUrl,
              ),
              const SizedBox(height: AppDimensions.spacing24),
              // Episode Title and Description
              NowPlayingEpisodeInfo(
                title: viewModel.currentEpisode?.title ?? '',
                description: viewModel.currentEpisode?.description ?? '',
              ),
              const SizedBox(height: AppDimensions.spacing32),
              // Progress Bar
              NowPlayingProgressBar(
                progress: viewModel.progress,
                currentPosition: viewModel.formattedCurrentPosition,
                totalDuration: viewModel.formattedTotalDuration,
                onSeek: (value) {
                  final newPosition = viewModel.totalDuration * value;
                  viewModel.seek(newPosition);
                },
              ),
              const SizedBox(height: AppDimensions.spacing24),
              // Playback Controls
              NowPlayingPlaybackControls(
                isPlaying: viewModel.isPlaying,
                onPlayPause: viewModel.togglePlayPause,
                onPrevious: viewModel.playPreviousEpisode,
                onNext: viewModel.playNextEpisode,
                onRewind: () {
                  final newPosition =
                      viewModel.currentPosition - const Duration(seconds: 10);
                  viewModel.seek(
                      newPosition.isNegative ? Duration.zero : newPosition);
                },
                onForward: () {
                  final newPosition =
                      viewModel.currentPosition + const Duration(seconds: 10);
                  viewModel.seek(newPosition > viewModel.totalDuration
                      ? viewModel.totalDuration
                      : newPosition);
                },
              ),
              const SizedBox(height: AppDimensions.spacing48),
              // Action Buttons
              const NowPlayingActionButtons(),
              const SizedBox(height: AppDimensions.spacing24),
            ],
          ),
        ),
      ),
    );
  }
}
