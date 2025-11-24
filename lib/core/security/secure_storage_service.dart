import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// {@template secure_storage_service}
/// Service for securely storing sensitive data like authentication tokens.
///
/// This service uses flutter_secure_storage to store data in a secure manner
/// using platform-specific secure storage mechanisms (Keychain on iOS,
/// KeyStore on Android, etc.).
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class SecureStorageService {
  SecureStorageService(this._storage);

  final FlutterSecureStorage _storage;

  static const String _tokenKey = 'auth_token';

  /// Saves the authentication token securely
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  /// Retrieves the stored authentication token
  /// Returns null if no token is stored
  Future<String?> getToken() async {
    return _storage.read(key: _tokenKey);
  }

  /// Deletes the stored authentication token
  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  /// Checks if a token is stored
  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  /// Clears all stored data
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
