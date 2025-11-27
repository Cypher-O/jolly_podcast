import 'package:flutter/material.dart';

/// {@template app_colors}
/// Defines the color palette for the Jolly Podcast application.
///
/// This class contains all color constants used throughout the app
/// to maintain consistent theming and easy color updates.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class AppColors {
  AppColors._();

  // Primary colors - Jolly Green
  static const Color primary = Color(0xFF6FD643);
  static const Color primaryDark = Color(0xFF5BC12E);
  static const Color primaryLight = Color(0xFF8FE066);

  // Background colors - Dark theme
  static const Color background = Color(0xFF0A1E17);
  static const Color backgroundDark = Color(0xFF071611);
  static const Color surface = Color(0xFF1A2F27);
  static const Color surfaceDark = Color(0xFF142520);

  // Splash/Brand colors
  static const Color splashGreen = Color(0xFF6FD643);
  static const Color splashDark = Color(0xFF0F2922);

  // Text colors - Light for dark theme
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB4C4BE);
  static const Color textTertiary = Color(0xFF7A8A84);
  static const Color textOnPrimary = Color(0xFF0A1E17);
  static const Color textOnGrey = Color(0xFFD3D3D3);
  static const Color textGreyLight = Color(0xFFA7A7A7);
  static const Color textEpisodeCard = Color(0xFFCECECE);

  // Status colors
  static const Color success = Color(0xFF6FD643);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // UI element colors
  static const Color border = Color(0xFF2A3F37);
  static const Color borderDark = Color(0xFF1F3229);
  static const Color divider = Color(0xFF2A3F37);
  static const Color shadow = Color(0x1A000000);

  // Podcast specific colors
  static const Color playerBackground = Color(0xFF0F2922);
  static const Color waveform = Color(0xFF6FD643);
  static const Color progressIndicator = Color(0xFF6FD643);
  static const Color audioSeekBar = Color(0xFF2A3F37);

  // Button colors
  static const Color buttonPrimary = Color(0xFF6FD643);
  static const Color buttonSecondary = Color(0xFF1A2F27);
  static const Color buttonTertiary = Color(0xFF585454);
  static const Color buttonDark = Color(0xFF0D5241);

  // Action colors
  static const Color accent = Color(0xFF10B981);
  static const Color cardDark = Color(0xFF374151);

  // Gradient colors - Now Playing screen (Emerald Green to Dark Green)
  static const Color gradientStart =
      Color(0xFF34D399); // Bright emerald green top
  static const Color gradientMiddle =
      Color(0xFF10B981); // Medium emerald green middle
  static const Color gradientEnd = Color(0xFF064E3B); // Very dark green bottom

  // transparent color
  static const Color transparent = Colors.transparent;
}
