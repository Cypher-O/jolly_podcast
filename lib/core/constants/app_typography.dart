import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';

/// {@template app_typography}
/// Defines the typography system for the Jolly Podcast application.
///
/// This class contains all text styles used throughout the app
/// to maintain consistent typography and easy style updates.
/// Follows a scale-based system for maintainability.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class AppTypography {
  AppTypography._();

  // Font sizes - Scale-based system
  static const double fontSize10 = 10.0;
  static const double fontSize12 = 12.0;
  static const double fontSize14 = 14.0;
  static const double fontSize16 = 16.0;
  static const double fontSize18 = 18.0;
  static const double fontSize20 = 20.0;
  static const double fontSize24 = 24.0;
  static const double fontSize32 = 32.0;
  static const double fontSize48 = 48.0;

  // Font weights
  static const FontWeight weightLight = FontWeight.w300;
  static const FontWeight weightRegular = FontWeight.w400;
  static const FontWeight weightMedium = FontWeight.w500;
  static const FontWeight weightSemiBold = FontWeight.w600;
  static const FontWeight weightBold = FontWeight.w700;

  // Letter spacing
  static const double letterSpacingTight = -0.5;
  static const double letterSpacingNormal = 0.0;
  static const double letterSpacingWide = 0.5;

  // Line heights
  static const double lineHeightTight = 1.2;
  static const double lineHeightNormal = 1.5;
  static const double lineHeightLoose = 1.8;

  // Heading styles
  static const TextStyle h1 = TextStyle(
    fontSize: fontSize32,
    fontWeight: weightBold,
    color: AppColors.textPrimary,
    height: lineHeightTight,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: fontSize24,
    fontWeight: weightBold,
    color: AppColors.textPrimary,
    height: lineHeightTight,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: fontSize20,
    fontWeight: weightBold,
    color: AppColors.textPrimary,
    height: lineHeightTight,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: fontSize18,
    fontWeight: weightSemiBold,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );

  // Body text styles
  static const TextStyle bodyLarge = TextStyle(
    fontSize: fontSize16,
    fontWeight: weightRegular,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: fontSize14,
    fontWeight: weightRegular,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: fontSize12,
    fontWeight: weightRegular,
    color: AppColors.textSecondary,
    height: lineHeightNormal,
  );

  // Label styles
  static const TextStyle labelLarge = TextStyle(
    fontSize: fontSize16,
    fontWeight: weightMedium,
    color: AppColors.textPrimary,
    letterSpacing: letterSpacingWide,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: fontSize14,
    fontWeight: weightMedium,
    color: AppColors.textPrimary,
    letterSpacing: letterSpacingWide,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: fontSize12,
    fontWeight: weightMedium,
    color: AppColors.textSecondary,
    letterSpacing: letterSpacingWide,
  );

  // Button styles
  static const TextStyle button = TextStyle(
    fontSize: fontSize16,
    fontWeight: weightSemiBold,
    letterSpacing: letterSpacingWide,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: fontSize14,
    fontWeight: weightSemiBold,
    letterSpacing: letterSpacingWide,
  );

  // Caption styles
  static const TextStyle caption = TextStyle(
    fontSize: fontSize12,
    fontWeight: weightRegular,
    color: AppColors.textTertiary,
    height: lineHeightNormal,
  );

  static const TextStyle overline = TextStyle(
    fontSize: fontSize10,
    fontWeight: weightMedium,
    color: AppColors.textTertiary,
    letterSpacing: letterSpacingWide,
  );
}
