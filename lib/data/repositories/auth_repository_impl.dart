import 'package:jolly_podcast/core/security/secure_storage_service.dart';
import 'package:jolly_podcast/data/datasources/auth_remote_datasource.dart';
import 'package:jolly_podcast/domain/entities/user.dart';
import 'package:jolly_podcast/domain/repositories/auth_repository.dart';

/// {@template auth_repository_impl}
/// Implementation of [AuthRepository] using remote data source.
///
/// Handles authentication operations by coordinating between
/// the remote data source and secure storage.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDatasource remoteDatasource,
    required SecureStorageService secureStorage,
  })  : _remoteDatasource = remoteDatasource,
        _secureStorage = secureStorage;

  final AuthRemoteDatasource _remoteDatasource;
  final SecureStorageService _secureStorage;

  @override
  Future<({String token, User user})> login({
    required String phone,
    required String password,
  }) async {
    // Call the remote datasource to authenticate
    final response = await _remoteDatasource.login(
      phone: phone,
      password: password,
    );

    // Save the token securely
    await _secureStorage.saveToken(response.data.token);

    // Convert DTO to domain entity
    final user = User.fromDto(response.data.user);

    return (token: response.data.token, user: user);
  }

  @override
  Future<void> logout() async {
    // Clear the stored token
    await _secureStorage.deleteToken();
  }

  @override
  Future<bool> isAuthenticated() async {
    // Check if a token exists
    return _secureStorage.hasToken();
  }
}
