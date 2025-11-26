import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_strings.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/viewmodels/podcast_player_viewmodel.dart';
import 'package:jolly_podcast/presentation/views/now_playing/now_playing_view.dart';
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
      body: SafeArea(
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

            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    // Header matching podcast list
                    SliverToBoxAdapter(
                      child: _buildHeader(context),
                    ),
                    // GO BACK and Title Section
                    SliverToBoxAdapter(
                      child: _buildTitleSection(context, viewModel),
                    ),
                    // Podcast Header with Image and Info
                    SliverToBoxAdapter(
                      child: _buildPodcastHeader(viewModel),
                    ),
                    // Episodes Section
                    _buildEpisodesListSliver(viewModel),
                    // Add bottom padding for mini player
                    if (viewModel.currentEpisode != null)
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 80),
                      ),
                  ],
                ),
                // Mini Player at Bottom
                if (viewModel.currentEpisode != null)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _buildMiniPlayer(context, viewModel),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.spacing16),
      child: Row(
        children: [
          // // GO BACK Button
          // Container(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 12,
          //     vertical: 6,
          //   ),
          //   decoration: BoxDecoration(
          //     color: Colors.white.withOpacity(0.1),
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: InkWell(
          //     onTap: () => Navigator.of(context).pop(),
          //     child: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         const Icon(
          //           Icons.arrow_back_ios,
          //           size: 16,
          //           color: AppColors.textPrimary,
          //         ),
          //         const SizedBox(width: 4),
          //         Text(
          //           'Go back',
          //           style: AppTypography.bodySmall.copyWith(
          //             color: AppColors.textPrimary,
          //             fontWeight: FontWeight.w600,
          //             fontSize: 12,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Image.asset(
            'assets/images/jolly_logo_login.png',
            height: 32,
            fit: BoxFit.contain,
          ),
          const Spacer(),
          // Icons Container - notification, user, search
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Bell/Notification Icon
                Image.asset(
                  'assets/images/notification.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 12),
                // User Avatar
                Image.asset(
                  'assets/images/user.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 12),
                // Search Icon
                Image.asset(
                  'assets/images/search.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSection(
      BuildContext context, PodcastPlayerViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // GO BACK Button
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                  color: AppColors.textPrimary,
                ),
                const SizedBox(width: AppDimensions.spacing4),
                Text(
                  'Go back',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.spacing16),
          // Title
          Text(
            viewModel.podcast?.title ?? 'Podcast',
            style: AppTypography.h2.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppDimensions.spacing8),
          // Category Tags
          Wrap(
            spacing: AppDimensions.spacing8,
            children: [
              if (viewModel.podcast?.categoryName != null)
                _buildCategoryChip(viewModel.podcast!.categoryName),
              if (viewModel.podcast?.categoryType != null)
                _buildCategoryChip(viewModel.podcast!.categoryType),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing24),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing12,
        vertical: AppDimensions.spacing4,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      ),
      child: Text(
        label,
        style: AppTypography.caption.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildPodcastHeader(PodcastPlayerViewModel viewModel) {
    return _PodcastHeaderSection(viewModel: viewModel);
  }

  Widget _buildEpisodesListSliver(PodcastPlayerViewModel viewModel) {
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
              Text(
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
        delegate: SliverChildBuilderDelegate((context, index) {
          // Add header before first item
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Episodes',
                      style: AppTypography.h3.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      '${viewModel.episodes.length} episodes',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.spacing16),
                _buildEpisodeItem(context, viewModel, 0),
              ],
            );
          }

          return _buildEpisodeItem(context, viewModel, index);
        }, childCount: viewModel.episodes.length),
      ),
    );
  }

  Widget _buildEpisodeItem(
      BuildContext context, PodcastPlayerViewModel viewModel, int index) {
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

  Widget _buildMiniPlayer(
      BuildContext context, PodcastPlayerViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        // Show full-screen now playing view as modal bottom sheet
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => NowPlayingView(podcastId: podcastId),
        );
      },
      child: Container(
        height: 72,
        decoration: BoxDecoration(
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, -2),
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
              minHeight: 2,
            ),
            // Mini player content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spacing16,
                  vertical: AppDimensions.spacing8,
                ),
                child: Row(
                  children: [
                    // Episode Image
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radiusSmall),
                      child: SizedBox(
                        width: 48,
                        height: 48,
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
                                    size: 24,
                                    color: AppColors.textTertiary,
                                  ),
                                ),
                              )
                            : Container(
                                color: AppColors.surfaceDark,
                                child: const Icon(
                                  Icons.music_note,
                                  size: 24,
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
                          Text(
                            viewModel.currentEpisode?.title ?? '',
                            style: AppTypography.bodyMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
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
                        size: 28,
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

/// Stateful widget for podcast header with expandable description
class _PodcastHeaderSection extends StatefulWidget {
  const _PodcastHeaderSection({required this.viewModel});

  final PodcastPlayerViewModel viewModel;

  @override
  State<_PodcastHeaderSection> createState() => _PodcastHeaderSectionState();
}

class _PodcastHeaderSectionState extends State<_PodcastHeaderSection> {
  bool _isDescriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Large Centered Podcast Image - Bigger size
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 300,
              height: 300,
              child: widget.viewModel.podcast?.imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: widget.viewModel.podcast!.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: AppColors.surfaceDark,
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: AppDimensions.borderThick,
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
                          size: 80,
                          color: AppColors.textTertiary,
                        ),
                      ),
                    )
                  : Container(
                      color: AppColors.surfaceDark,
                      child: const Icon(
                        Icons.podcasts,
                        size: 80,
                        color: AppColors.textTertiary,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacing16),
          // Follow Button and Action Icons Row - Using PNG images
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Follow Button with PNG image
              Container(
                height: 36,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF374151),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/add.png',
                      width: 16,
                      height: 16,
                      fit: BoxFit.contain,
                      color: Colors.white,
                    ),
                    const SizedBox(width: AppDimensions.spacing8),
                    Text(
                      'Follow',
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Bell Icon (Notification) - Using PNG image
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Color(0xFF374151),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/notification.png',
                    width: 18,
                    height: 18,
                    fit: BoxFit.contain,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Share Icon - Using PNG image
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Color(0xFF374151),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/share.png',
                    width: 16,
                    height: 16,
                    fit: BoxFit.contain,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing16),
          // Podcast Stats - Subscriber count and Episode count
          Text(
            _buildStatsText(),
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: AppDimensions.spacing16),
          // About Podcast Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Podcast',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: AppDimensions.spacing8),
              // Podcast Description with expandable text
              Text(
                widget.viewModel.podcast?.description ?? '',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                  fontSize: 12,
                ),
                maxLines: _isDescriptionExpanded ? null : 3,
                overflow: _isDescriptionExpanded
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
              ),
              if ((widget.viewModel.podcast?.description ?? '').length > 100)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isDescriptionExpanded = !_isDescriptionExpanded;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppDimensions.spacing4),
                    child: Text(
                      _isDescriptionExpanded ? 'Show less' : 'Show more',
                      style: AppTypography.bodySmall.copyWith(
                        color: const Color(0xFF10B981),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing24),
        ],
      ),
    );
  }

  String _buildStatsText() {
    final parts = <String>[];

    // Add subscriber count if available
    final subscriberCount = widget.viewModel.podcast?.subscriberCount;
    if (subscriberCount != null && subscriberCount > 0) {
      parts.add('$subscriberCount Subscribers');
    }

    // Add episode count
    final episodeCount = widget.viewModel.episodes.length;
    if (episodeCount > 0) {
      parts.add('$episodeCount Episodes');
    }

    return parts.isNotEmpty ? parts.join(' • ') : 'No stats available';
  }
}
