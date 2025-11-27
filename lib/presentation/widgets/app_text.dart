import 'package:flutter/material.dart';

/// {@template app_text}
/// A custom text widget that handles font weights intelligently.
///
/// This widget automatically uses the correct Nunito font variant
/// based on the provided [fontWeight]. It simplifies text styling
/// throughout the app by providing a consistent API.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment
class AppText extends StatelessWidget {
  /// {@macro app_text}
  const AppText(
    this.text, {
    super.key,
    this.style,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.height,
    this.letterSpacing,
    this.fontStyle,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.fontFamily,
  });

  /// The text to display
  final String text;

  /// Base text style to merge with other properties.
  /// Properties defined directly on AppText will override those in [style].
  /// The Nunito font family will always be applied.
  final TextStyle? style;

  /// Font size (defaults to 14)
  final double fontSize;

  /// Font weight - automatically selects the correct Nunito variant
  /// Available weights:
  /// - FontWeight.w200 (ExtraLight)
  /// - FontWeight.w300 (Light)
  /// - FontWeight.w400 (Regular) - default
  /// - FontWeight.w500 (Medium)
  /// - FontWeight.w600 (SemiBold)
  /// - FontWeight.w700 (Bold)
  /// - FontWeight.w800 (ExtraBold)
  /// - FontWeight.w900 (Black)
  final FontWeight fontWeight;

  /// Text color (defaults to theme's text color)
  final Color? color;

  /// Text alignment
  final TextAlign? textAlign;

  /// Maximum number of lines
  final int? maxLines;

  /// Text overflow behavior
  final TextOverflow? overflow;

  /// Line height multiplier
  final double? height;

  /// Letter spacing
  final double? letterSpacing;

  /// Font style (normal or italic)
  final FontStyle? fontStyle;

  /// Text decoration (underline, line-through, etc.)
  final TextDecoration? decoration;

  /// Decoration color
  final Color? decorationColor;

  /// Decoration style (solid, dashed, etc.)
  final TextDecorationStyle? decorationStyle;

  /// Decoration thickness
  final double? decorationThickness;

  /// Font family (defaults to 'Nunito')
  final String? fontFamily;

  /// Creates a heading text (bold, large)
  factory AppText.heading(
    String text, {
    Key? key,
    double fontSize = 24,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return AppText(
      text,
      key: key,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  /// Creates a subheading text (semi-bold, medium)
  factory AppText.subheading(
    String text, {
    Key? key,
    double fontSize = 18,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return AppText(
      text,
      key: key,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  /// Creates a body text (regular)
  factory AppText.body(
    String text, {
    Key? key,
    double fontSize = 14,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return AppText(
      text,
      key: key,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  /// Creates a caption text (light, small)
  factory AppText.caption(
    String text, {
    Key? key,
    double fontSize = 12,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return AppText(
      text,
      key: key,
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  /// Creates a button text (medium, uppercase)
  factory AppText.button(
    String text, {
    Key? key,
    double fontSize = 14,
    Color? color,
    TextAlign? textAlign,
  }) {
    return AppText(
      text.toUpperCase(),
      key: key,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
      textAlign: textAlign,
      letterSpacing: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Merge base style with individual properties
    // Individual properties override base style properties
    final baseStyle = style ?? const TextStyle();

    // Build the final style by merging base style with explicit parameters
    final effectiveStyle = TextStyle(
      fontFamily: fontFamily ?? baseStyle.fontFamily ?? 'Nunito', // Default to Nunito if not specified
      fontSize: fontSize == 14 && baseStyle.fontSize != null
          ? baseStyle.fontSize
          : fontSize,
      fontWeight: fontWeight == FontWeight.w400 && baseStyle.fontWeight != null
          ? baseStyle.fontWeight
          : fontWeight,
      color: color ?? baseStyle.color,
      height: height ?? baseStyle.height,
      letterSpacing: letterSpacing ?? baseStyle.letterSpacing,
      fontStyle: fontStyle ?? baseStyle.fontStyle,
      decoration: decoration ?? baseStyle.decoration,
      decorationColor: decorationColor ?? baseStyle.decorationColor,
      decorationStyle: decorationStyle ?? baseStyle.decorationStyle,
      decorationThickness: decorationThickness ?? baseStyle.decorationThickness,
      backgroundColor: baseStyle.backgroundColor,
      wordSpacing: baseStyle.wordSpacing,
      textBaseline: baseStyle.textBaseline,
      shadows: baseStyle.shadows,
      fontFeatures: baseStyle.fontFeatures,
      fontVariations: baseStyle.fontVariations,
    );

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: effectiveStyle,
    );
  }
}
