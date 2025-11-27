import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/core/constants/app_assets.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_strings.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/viewmodels/podcast_list_viewmodel.dart';
import 'package:jolly_podcast/presentation/views/login/login_view.dart';
import 'package:jolly_podcast/presentation/views/podcast_player/podcast_player_view.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';
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
        title: AppText(
          AppStrings.logout,
          style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
        ),
        content: AppText(
          AppStrings.logoutConfirmation,
          style:
              AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const AppText(
              AppStrings.cancel,
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const AppText(
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
      extendBodyBehindAppBar: true,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Custom Top Bar
            Padding(
              padding: const EdgeInsets.all(AppDimensions.spacing16),
              child: Row(
                children: [
                  // Jolly Logo (using image)
                  Image.asset(
                    AppAssets.jollyLogoLogin,
                    height: AppDimensions.iconLarge,
                    fit: BoxFit.contain,
                  ),
                  const Spacer(),
                  // Icons Container - all three icons in one rounded container
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.spacing8,
                      vertical: AppDimensions.buttonPaddingVertical6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radiusButton),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Bell/Notification Icon
                        Image.asset(
                          AppAssets.notificationIcon,
                          width: AppDimensions.iconMedium,
                          height: AppDimensions.iconMedium,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: AppDimensions.spacing12),
                        // User Avatar
                        InkWell(
                          onTap: _handleLogout,
                          child: Image.asset(
                            AppAssets.userIcon,
                            width: AppDimensions.iconMedium,
                            height: AppDimensions.iconMedium,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: AppDimensions.spacing12),
                        // Search Icon
                        Image.asset(
                          AppAssets.searchIcon,
                          width: AppDimensions.iconMedium,
                          height: AppDimensions.iconMedium,
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
                    AppText(
                      AppStrings.topJolly,
                      style: AppTypography.h2.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w800,
                        fontSize: AppTypography.fontSize20,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacing4),
                    AppText(
                      AppStrings.topJollyPodcasts,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                        fontSize: AppTypography.fontSize14,
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
                height: AppDimensions.separatorHeight,
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
                    AppAssets.moreIcon,
                    width: AppDimensions.iconSmall,
                    height: AppDimensions.iconSmall,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: AppDimensions.spacing8),
                  AppText(
                    AppStrings.sortBy,
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
                          AppText(
                            viewModel.errorMessage ??
                                AppStrings.anErrorOccurred,
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
                      child: AppText(
                        AppStrings.noPodcastsAvailable,
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
                              childAspectRatio: 0.62,
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
                                          podcast: podcast,
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
                              padding:
                                  const EdgeInsets.all(AppDimensions.spacing16),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.radiusXLarge - 2),
                                      color: AppColors.buttonTertiary),
                                  width: AppDimensions.loadMoreButtonWidth,
                                  height: AppDimensions.buttonHeightMedium,
                                  child: OutlinedButton(
                                    onPressed: viewModel.isLoadingMore
                                        ? null
                                        : () => viewModel.loadMore(),
                                    // style: OutlinedButton.styleFrom(
                                    //   side: const BorderSide(
                                    //     color: AppColors.border,
                                    //   ),
                                    //   shape: RoundedRectangleBorder(
                                    //     borderRadius: BorderRadius.circular(
                                    //         AppDimensions.radiusSmall),
                                    //   ),
                                    // ),
                                    child: viewModel.isLoadingMore
                                        ? const SizedBox(
                                            width: AppDimensions
                                                .loadMoreIndicatorSize,
                                            height: AppDimensions
                                                .loadMoreIndicatorSize,
                                            child: CircularProgressIndicator(
                                              strokeWidth:
                                                  AppDimensions.borderThick,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                AppColors.accent,
                                              ),
                                            ),
                                          )
                                        : AppText(
                                            AppStrings.showMore,
                                            style:
                                                AppTypography.button.copyWith(
                                              color: AppColors.textSecondary,
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  AppTypography.fontSize16,
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
