import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jolly_podcast/core/network/dio_client.dart';
import 'package:jolly_podcast/core/security/secure_storage_service.dart';
import 'package:jolly_podcast/core/utils/logger_service.dart';
import 'package:jolly_podcast/data/datasources/auth_remote_datasource.dart';
import 'package:jolly_podcast/data/datasources/podcast_remote_datasource.dart';
import 'package:jolly_podcast/data/repositories/auth_repository_impl.dart';
import 'package:jolly_podcast/data/repositories/podcast_repository_impl.dart';
import 'package:jolly_podcast/domain/repositories/auth_repository.dart';
import 'package:jolly_podcast/domain/repositories/podcast_repository.dart';

/// {@template providers}
/// Central location for all Riverpod providers.
///
/// Single Responsibility: Manages dependency injection configuration
/// for the entire application.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment

// Core layer providers

/// Provider for LoggerService singleton
final loggerServiceProvider = Provider<LoggerService>((ref) {
  return LoggerService.instance;
});

/// Provider for FlutterSecureStorage
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );
});

/// Provider for SecureStorageService
final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService(ref.watch(secureStorageProvider));
});

/// Provider for DioClient
final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient(
    ref.watch(secureStorageServiceProvider),
    ref.watch(loggerServiceProvider),
  );
});

// Data layer providers

/// Provider for AuthRemoteDatasource
final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
  return AuthRemoteDatasource(
    ref.watch(dioClientProvider),
    ref.watch(loggerServiceProvider),
  );
});

/// Provider for PodcastRemoteDatasource
final podcastRemoteDatasourceProvider =
    Provider<PodcastRemoteDatasource>((ref) {
  return PodcastRemoteDatasource(
    ref.watch(dioClientProvider), 
    ref.watch(loggerServiceProvider),
  );
});

// Repository providers

/// Provider for AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDatasource: ref.watch(authRemoteDatasourceProvider),
    secureStorage: ref.watch(secureStorageServiceProvider),
  );
});

/// Provider for PodcastRepository
final podcastRepositoryProvider = Provider<PodcastRepository>((ref) {
  return PodcastRepositoryImpl(
    remoteDatasource: ref.watch(podcastRemoteDatasourceProvider),
  );
});
