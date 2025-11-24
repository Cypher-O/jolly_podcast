import 'package:jolly_podcast/data/models/user_dto.dart';

/// {@template user}
/// Domain entity representing a user in the Jolly Podcast application.
///
/// This is the business logic representation of a user, separate from
/// the data transfer object used for API communication.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class User {
  const User({
    required this.id,
    required this.phoneNumber,
    this.firstName,
    this.lastName,
    this.email,
    this.jollyEmail,
    this.country,
    this.personalizations,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String phoneNumber;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? jollyEmail;
  final String? country;
  final List<String>? personalizations;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  String get fullName {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    }
    return firstName ?? lastName ?? 'User';
  }

  /// Creates a User entity from a UserDto
  factory User.fromDto(UserDto dto) {
    return User(
      id: dto.id,
      phoneNumber: dto.phoneNumber?.toString() ?? '',
      firstName: dto.firstName,
      lastName: dto.lastName,
      email: dto.email,
      jollyEmail: dto.jollyEmail,
      country: dto.country,
      personalizations: dto.personalizations,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
