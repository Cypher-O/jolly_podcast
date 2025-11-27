import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';

/// {@template category_chip}
/// A chip widget that displays a category label.
///
/// Used to display podcast categories in a styled container.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment - SRP Compliance
class CategoryChip extends StatelessWidget {
  const CategoryChip({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing12,
        vertical: AppDimensions.spacing4,
      ),
      decoration: BoxDecoration(
        color: AppColors.buttonTertiary,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXLarge - 2),
      ),
      child: AppText(
        label,
        style: AppTypography.caption.copyWith(
          color: AppColors.textOnGrey,
          fontWeight: FontWeight.w700,
          fontSize: AppDimensions.fontMedium14,
        ),
      ),
    );
  }
}
