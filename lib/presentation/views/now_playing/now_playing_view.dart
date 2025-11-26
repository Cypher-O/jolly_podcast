import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/viewmodels/podcast_player_viewmodel.dart';

/// {@template now_playing_view}
/// Full-screen now playing view for the Jolly Podcast application.
///
/// Displays the currently playing episode with playback controls.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
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
            Color(0xFF6FD643),
            Color(0xFF4FB830),
            Color(0xFF2F8A1F),
          ],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppDimensions.spacing60),
              // Top Bar with chevron down
              _buildTopBar(context),
              const SizedBox(height: AppDimensions.spacing16),
              // Album Art
              _buildAlbumArt(viewModel),
              const SizedBox(height: AppDimensions.spacing24),
              // Episode Title and Description
              _buildEpisodeInfo(viewModel),
              const SizedBox(height: AppDimensions.spacing32),
              // Progress Bar
              _buildProgressBar(viewModel),
              const SizedBox(height: AppDimensions.spacing24),
              // Playback Controls
              _buildPlaybackControls(viewModel),
              const SizedBox(height: AppDimensions.spacing24),
              // Action Buttons
              _buildActionButtons(),
              const SizedBox(height: AppDimensions.spacing16),
              // Bottom Buttons
              _buildBottomButtons(),
              const SizedBox(height: AppDimensions.spacing24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.spacing16),
      child: Stack(
        children: [
          Center(
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Image.asset(
                'assets/images/chevron_down_circular.png',
                width: 32,
                height: 32,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlbumArt(PodcastPlayerViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing32),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        child: AspectRatio(
          aspectRatio: 1,
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
                      size: 80,
                      color: Colors.white54,
                    ),
                  ),
                )
              : Container(
                  color: AppColors.surfaceDark,
                  child: const Icon(
                    Icons.music_note,
                    size: 80,
                    color: Colors.white54,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildEpisodeInfo(PodcastPlayerViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            viewModel.currentEpisode?.title ?? '',
            style: AppTypography.bodyLarge.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 16,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppDimensions.spacing8),
          Text(
            viewModel.currentEpisode?.description ?? '',
            style: AppTypography.bodySmall.copyWith(
              color: Colors.white.withOpacity(0.9),
              fontSize: 12,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(PodcastPlayerViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing24),
      child: Column(
        children: [
          // Draggable progress slider
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 3,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
              activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.white.withOpacity(0.3),
              thumbColor: Colors.white,
              overlayColor: Colors.white.withOpacity(0.2),
            ),
            child: Slider(
              value: viewModel.progress.clamp(0.0, 1.0),
              onChanged: (value) {
                final newPosition = viewModel.totalDuration * value;
                viewModel.seek(newPosition);
              },
            ),
          ),
          // Time labels
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  viewModel.formattedCurrentPosition,
                  style: AppTypography.caption.copyWith(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
                Text(
                  viewModel.formattedTotalDuration,
                  style: AppTypography.caption.copyWith(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaybackControls(PodcastPlayerViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Rewind 10s
          IconButton(
            onPressed: () {
              final newPosition =
                  viewModel.currentPosition - const Duration(seconds: 10);
              viewModel
                  .seek(newPosition.isNegative ? Duration.zero : newPosition);
            },
            icon: Image.asset(
              'assets/images/prev_10.png',
              width: 28,
              height: 28,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: AppDimensions.spacing8),
          // Previous Episode
          IconButton(
            onPressed: viewModel.playPreviousEpisode,
            icon: Image.asset(
              'assets/images/previous.png',
              width: 32,
              height: 32,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: AppDimensions.spacing16),
          // Play/Pause
          GestureDetector(
            onTap: viewModel.togglePlayPause,
            child: Image.asset(
              viewModel.isPlaying
                  ? 'assets/images/pause.png'
                  : 'assets/images/play.png',
              width: 56,
              height: 56,
            ),
          ),
          const SizedBox(width: AppDimensions.spacing16),
          // Next Episode
          IconButton(
            onPressed: viewModel.playNextEpisode,
            icon: Image.asset(
              'assets/images/next.png',
              width: 32,
              height: 32,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: AppDimensions.spacing8),
          // Forward 10s
          IconButton(
            onPressed: () {
              final newPosition =
                  viewModel.currentPosition + const Duration(seconds: 10);
              viewModel.seek(newPosition > viewModel.totalDuration
                  ? viewModel.totalDuration
                  : newPosition);
            },
            icon: Image.asset(
              'assets/images/next_10.png',
              width: 28,
              height: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing8),
      child: Wrap(
        spacing: 8,
        alignment: WrapAlignment.center,
        children: [
          OutlinedButton.icon(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/queue.png',
              width: 16,
              height: 16,
              color: Colors.white,
            ),
            label: Text(
              'Add to queue',
              style: AppTypography.bodySmall.copyWith(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white, width: 1),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border,
                color: Colors.white, size: 16),
            label: Text(
              'Save',
              style: AppTypography.bodySmall.copyWith(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white, width: 1),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/share.png',
              width: 16,
              height: 16,
              color: Colors.white,
            ),
            label: Text(
              'Share episode',
              style: AppTypography.bodySmall.copyWith(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white, width: 1),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing24),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.playlist_add, color: Colors.white),
              label: Text(
                'Add to playlist',
                style: AppTypography.bodySmall.copyWith(color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.spacing12),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward, color: Colors.white),
              label: Text(
                'Go to episode page',
                style: AppTypography.bodySmall.copyWith(color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
