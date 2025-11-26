import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_strings.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/viewmodels/podcast_list_viewmodel.dart';
import 'package:jolly_podcast/presentation/views/login/login_view.dart';
import 'package:jolly_podcast/presentation/views/podcast_player/podcast_player_view.dart';
import 'package:jolly_podcast/presentation/widgets/loading_indicator.dart';
import 'package:jolly_podcast/presentation/widgets/podcast_card.dart';

/// {@template podcast_list_view}
/// Podcast list screen for the Jolly Podcast application.
///
/// Displays a grid of top podcasts with pull-to-refresh functionality
/// and handles navigation to the podcast player.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class PodcastListView extends ConsumerStatefulWidget {
  const PodcastListView({super.key});

  @override
  ConsumerState<PodcastListView> createState() => _PodcastListViewState();
}

class _PodcastListViewState extends ConsumerState<PodcastListView> {
  Future<void> _handleLogout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(
          AppStrings.logout,
          style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
        ),
        content: Text(
          AppStrings.logoutConfirmation,
          style:
              AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              AppStrings.cancel,
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              AppStrings.confirm,
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      await ref.read(podcastListViewModelProvider).logout();
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginView()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(podcastListViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Custom Top Bar
            Padding(
              padding: const EdgeInsets.all(AppDimensions.spacing16),
              child: Row(
                children: [
                  // Jolly Logo (using image)
                  Image.asset(
                    'assets/images/jolly_logo_login.png',
                    height: 32,
                    fit: BoxFit.contain,
                  ),
                  const Spacer(),
                  // Icons Container - all three icons in one rounded container
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
                        InkWell(
                          onTap: _handleLogout,
                          child: Image.asset(
                            'assets/images/user.png',
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                          ),
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
            ),
            const SizedBox(height: AppDimensions.spacing24),
            // Title Section - Left aligned
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spacing16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Top Jolly',
                      style: AppTypography.h2.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacing4),
                    Text(
                      'Top Jolly podcasts',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.spacing16),
            // Horizontal Divider
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spacing16,
              ),
              child: Container(
                height: 1,
                color: AppColors.border,
              ),
            ),
            const SizedBox(height: AppDimensions.spacing16),
            // Sort Filter - Left aligned
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spacing16,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/more.png',
                    width: 16,
                    height: 16,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: AppDimensions.spacing8),
                  Text(
                    'Sort by: Ascending',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spacing4),
                  Image.asset(
                    'assets/images/chevron_down.png',
                    width: 16,
                    height: 16,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.spacing16),
            // Podcast Grid
            Expanded(
              child: Builder(
                builder: (context) {
                  if (viewModel.isLoading && viewModel.podcasts.isEmpty) {
                    return const LoadingIndicator(
                      message: 'Loading podcasts...',
                    );
                  }

                  if (viewModel.hasError && viewModel.podcasts.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: AppDimensions.iconHuge,
                            color: AppColors.error,
                          ),
                          const SizedBox(height: AppDimensions.spacing16),
                          Text(
                            viewModel.errorMessage ?? 'An error occurred',
                            style: AppTypography.bodyLarge.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  if (viewModel.isEmpty) {
                    return Center(
                      child: Text(
                        'No podcasts available',
                        style: AppTypography.bodyLarge.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () => viewModel.refresh(),
                    color: AppColors.primary,
                    backgroundColor: AppColors.surface,
                    child: CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.spacing16,
                            vertical: AppDimensions.spacing8,
                          ),
                          sliver: SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.65,
                              crossAxisSpacing: AppDimensions.spacing12,
                              mainAxisSpacing: AppDimensions.spacing16,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final podcast = viewModel.podcasts[index];
                                return PodcastCard(
                                  podcast: podcast,
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => PodcastPlayerView(
                                          podcastId: podcast.id.toString(),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              childCount: viewModel.podcasts.length,
                            ),
                          ),
                        ),
                        // Show more button
                        if (viewModel.hasMore)
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Center(
                                child: SizedBox(
                                  width: 200,
                                  height: 44,
                                  child: OutlinedButton(
                                    onPressed: viewModel.isLoadingMore
                                        ? null
                                        : () => viewModel.loadMore(),
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        color: AppColors.border,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: viewModel.isLoadingMore
                                        ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Color(0xFF10B981),
                                              ),
                                            ),
                                          )
                                        : Text(
                                            'Show more',
                                            style: AppTypography.button.copyWith(
                                              color: AppColors.textSecondary,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
