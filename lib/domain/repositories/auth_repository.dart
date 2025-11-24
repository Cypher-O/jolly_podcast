import 'package:jolly_podcast/domain/entities/user.dart';

/// {@template auth_repository}
/// Repository interface for authentication operations.
///
/// Defines the contract for authentication-related data operations.
/// Implementations should handle the actual data fetching and caching.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
abstract class AuthRepository {
  /// Authenticates a user with phone number and password
  ///
  /// Returns the authentication token and user information on success.
  /// Throws [NetworkException] on failure.
  Future<({String token, User user})> login({
    required String phone,
    required String password,
  });

  /// Logs out the current user
  ///
  /// Clears the authentication token and any cached user data.
  Future<void> logout();

  /// Checks if a user is currently authenticated
  ///
  /// Returns true if a valid authentication token is stored.
  Future<bool> isAuthenticated();
}
