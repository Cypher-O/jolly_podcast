import 'package:jolly_podcast/core/constants/app_strings.dart';

/// {@template validators}
/// Collection of validation utilities for form inputs.
///
/// Provides reusable validation logic for common input types
/// to ensure data consistency and proper error messaging.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class Validators {
  Validators._();

  /// Validates phone numbers
  /// Accepts formats: 08012345678, 2348012345678, +2348012345678
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.phoneNumberRequired;
    }

    // Remove spaces and special characters
    final cleanNumber = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    // phone number patterns
    final patterns = [
      RegExp(r'^0[7-9][0-1]\d{8}$'), // 08012345678
      RegExp(r'^234[7-9][0-1]\d{8}$'), // 2348012345678
      RegExp(r'^\+234[7-9][0-1]\d{8}$'), // +2348012345678
    ];

    final isValid = patterns.any((pattern) => pattern.hasMatch(cleanNumber));

    if (!isValid) {
      return AppStrings.phoneNumberInvalid;
    }

    return null;
  }

  /// Validates password requirements
  /// - Minimum 8 characters
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    }

    if (value.length < 8) {
      return AppStrings.passwordLengthRequirement;
    }

    return null;
  }

  /// Validates that a field is not empty
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Normalizes phone number to API format (without +)
  /// Converts any format to: 2348012345678
  static String normalizePhoneNumber(String phoneNumber) {
    // Remove all non-digit characters
    String cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

    // If starts with 0, replace with 234
    if (cleanNumber.startsWith('0')) {
      cleanNumber = '234${cleanNumber.substring(1)}';
    }

    // If doesn't start with 234, assume it needs to be prepended
    if (!cleanNumber.startsWith('234')) {
      cleanNumber = '234$cleanNumber';
    }

    return cleanNumber;
  }
}
