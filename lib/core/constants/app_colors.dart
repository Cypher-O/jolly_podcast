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

  // Primary colors
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryDark = Color(0xFF5549E0);
  static const Color primaryLight = Color(0xFF8A82FF);

  // Background colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color backgroundDark = Color(0xFF1A1A2E);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF252540);

  // Text colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Status colors
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // UI element colors
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderDark = Color(0xFF374151);
  static const Color divider = Color(0xFFE5E7EB);
  static const Color shadow = Color(0x1A000000);

  // Podcast specific colors
  static const Color playerBackground = Color(0xFFF3F4F6);
  static const Color waveform = Color(0xFF6C63FF);
  static const Color progressIndicator = Color(0xFF6C63FF);
  static const Color audioSeekBar = Color(0xFFE5E7EB);
}
