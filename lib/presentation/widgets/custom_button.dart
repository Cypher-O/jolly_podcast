import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';
import 'package:jolly_podcast/presentation/widgets/button_variant.dart';

/// {@template custom_button}
/// A customizable button widget used throughout the application.
///
/// Provides consistent styling for primary and secondary button variants.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.variant = ButtonVariant.primary,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final ButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final bool canPress = isEnabled && !isLoading && onPressed != null;

    return SizedBox(
      width: double.infinity,
      height: AppDimensions.buttonHeightLarge,
      child: ElevatedButton(
        onPressed: canPress ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: variant == ButtonVariant.primary
              ? AppColors.primary
              : AppColors.surface,
          foregroundColor: variant == ButtonVariant.primary
              ? AppColors.textOnPrimary
              : AppColors.primary,
          disabledBackgroundColor: AppColors.border,
          disabledForegroundColor: AppColors.textTertiary,
          elevation: AppDimensions.cardElevation - AppDimensions.borderThick,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            side: variant == ButtonVariant.secondary
                ? const BorderSide(
                    color: AppColors.primary,
                    width: AppDimensions.borderMedium,
                  )
                : BorderSide.none,
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: AppDimensions.iconSmall + AppDimensions.spacing4,
                width: AppDimensions.iconSmall + AppDimensions.spacing4,
                child: CircularProgressIndicator(
                  strokeWidth: AppDimensions.borderThick,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.textOnPrimary,
                  ),
                ),
              )
            : AppText(
                text,
                style: AppTypography.button,
              ),
      ),
    );
  }
}
