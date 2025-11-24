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
class PodcastListView extends ConsumerWidget {
  const PodcastListView({super.key});

  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.logout),
        content: const Text(AppStrings.logoutConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(AppStrings.cancel),
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

    if (confirmed == true && context.mounted) {
      await ref.read(podcastListViewModelProvider).logout();
      if (context.mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginView()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(podcastListViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.topPodcasts,
          style: AppTypography.h2.copyWith(
            fontWeight: AppTypography.weightBold,
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: AppDimensions.cardElevation - AppDimensions.cardElevation,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: AppColors.textPrimary),
            onPressed: () => _handleLogout(context, ref),
            tooltip: AppStrings.logout,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => viewModel.refresh(),
        color: AppColors.primary,
        child: Builder(
          builder: (context) {
            if (viewModel.isLoading && viewModel.podcasts.isEmpty) {
              return const LoadingIndicator(
                message: AppStrings.loading,
              );
            }

            if (viewModel.hasError && viewModel.podcasts.isEmpty) {
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
                        onPressed: viewModel.refresh,
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

            if (viewModel.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.podcasts,
                      size: AppDimensions.iconXXLarge,
                      color: AppColors.textTertiary,
                    ),
                    const SizedBox(height: AppDimensions.spacing16),
                    Text(
                      AppStrings.noPodcastsAvailable,
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacing24),
                    ElevatedButton.icon(
                      onPressed: viewModel.refresh,
                      icon: const Icon(Icons.refresh),
                      label: const Text(AppStrings.retry),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textOnPrimary,
                      ),
                    ),
                  ],
                ),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.all(AppDimensions.spacing16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppDimensions.spacing16,
                mainAxisSpacing: AppDimensions.spacing16,
                childAspectRatio: 0.7,
              ),
              itemCount: viewModel.podcasts.length,
              itemBuilder: (context, index) {
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
            );
          },
        ),
      ),
    );
  }
}
