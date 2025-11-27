import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jolly_podcast/core/constants/app_assets.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_strings.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/viewmodels/podcast_player_viewmodel.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';

/// {@template podcast_header_section}
/// Podcast header section widget with expandable description.
///
/// Displays the podcast image, follow/notification/share buttons,
/// stats, and an expandable description.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment - SRP Compliance
class PodcastHeaderSection extends StatefulWidget {
  const PodcastHeaderSection({
    required this.viewModel,
    super.key,
  });

  final PodcastPlayerViewModel viewModel;

  @override
  State<PodcastHeaderSection> createState() => _PodcastHeaderSectionState();
}

class _PodcastHeaderSectionState extends State<PodcastHeaderSection> {
  bool _isDescriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing16,
        vertical: AppDimensions.spacing4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Large Centered Podcast Image - Bigger size
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            child: SizedBox(
              width: AppDimensions.imageXLarge,
              height: AppDimensions.imageXLargeHeight,
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
                          size: AppDimensions.iconHuge,
                          color: AppColors.textTertiary,
                        ),
                      ),
                    )
                  : Container(
                      color: AppColors.surfaceDark,
                      child: const Icon(
                        Icons.podcasts,
                        size: AppDimensions.iconHuge,
                        color: AppColors.textTertiary,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacing16),
          // Follow Button and Action Icons Row - Using PNG images
          Row(
            children: [
              // Follow Button with plus icon - grey background, white content
              Container(
                height: AppDimensions.buttonHeightXS30,
                width: AppDimensions.containerWidth78,
                decoration: BoxDecoration(
                  color: AppColors.buttonTertiary,
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusLarge + 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.addIcon,
                      width: AppDimensions.iconSmall18,
                      height: AppDimensions.iconSmall18,
                      fit: BoxFit.contain,
                      color: AppColors.textPrimary,
                    ),
                    const SizedBox(width: AppDimensions.spacing4),
                    AppText(
                      AppStrings.follow,
                      style: AppTypography.caption.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimensions.fontMedium13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppDimensions.buttonPaddingVertical6),
              // Share Icon Button - circular, separate
              Container(
                width: AppDimensions.buttonHeightMini,
                height: AppDimensions.buttonHeightMini,
                decoration: BoxDecoration(
                  color: AppColors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.textPrimary,
                    width: AppDimensions.borderThin,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    AppAssets.shareIcon,
                    width: AppDimensions.iconSmall - 1,
                    height: AppDimensions.iconSmall - 1,
                    fit: BoxFit.contain,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(width: AppDimensions.buttonPaddingVertical6),
              // Notification Icon Button - circular, separate
              Container(
                width: AppDimensions.buttonHeightMini,
                height: AppDimensions.buttonHeightMini,
                decoration: BoxDecoration(
                  color: AppColors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.textPrimary,
                    width: AppDimensions.borderThin,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    AppAssets.notificationIcon,
                    width: AppDimensions.iconSmall - 1,
                    height: AppDimensions.iconSmall - 1,
                    fit: BoxFit.contain,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          // About Podcast Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.spacing16),
              // Horizontal Divider
              Container(
                height: AppDimensions.separatorHeight,
                color: AppColors.border,
              ),
              const SizedBox(height: AppDimensions.spacing16),
              AppText(
                AppStrings.aboutPodcast,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textGreyLight,
                  fontWeight: FontWeight.w700,
                  fontSize: AppDimensions.fontMedium14,
                ),
              ),

              const SizedBox(height: AppDimensions.spacing8),
              // Podcast Stats - Subscriber count and Episode count
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  widget.viewModel.statsText,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: AppDimensions.fontMedium14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.spacing12),
              // Podcast Description with expandable text
              AppText(
                widget.viewModel.podcast?.description ?? '',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                  fontSize: AppTypography.fontSize16,
                  fontWeight: FontWeight.w500,
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
                    child: AppText(
                      _isDescriptionExpanded
                          ? AppStrings.showLess
                          : AppStrings.showMore,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: AppTypography.fontSize16,
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: AppDimensions.spacing32),
              // Horizontal Divider
              Container(
                height: AppDimensions.separatorHeight,
                color: AppColors.border,
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing12),
        ],
      ),
    );
  }
}
