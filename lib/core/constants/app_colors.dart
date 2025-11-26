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
  static const Color buttonTertiary = Color(0xFF2A3F37);
}
