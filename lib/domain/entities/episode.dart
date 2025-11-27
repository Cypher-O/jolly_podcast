import 'package:jolly_podcast/core/constants/app_strings.dart';
import 'package:jolly_podcast/data/models/episode_dto.dart';

/// {@template episode}
/// Domain entity representing a podcast episode in the Jolly Podcast application.
///
/// This is the business logic representation of an episode, separate from
/// the data transfer object used for API communication.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class Episode {
  const Episode({
    required this.id,
    required this.podcastId,
    required this.title,
    this.description,
    this.audioUrl,
    this.imageUrl,
    this.duration,
    this.publishedAt,
    this.episodeNumber,
    this.seasonNumber,
    this.explicit,
    this.playCount,
    this.likeCount,
    this.averageRating,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final int podcastId;
  final String title;
  final String? description;
  final String? audioUrl;
  final String? imageUrl;
  final int? duration;
  final DateTime? publishedAt;
  final int? episodeNumber;
  final int? seasonNumber;
  final bool? explicit;
  final int? playCount;
  final int? likeCount;
  final double? averageRating;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// Creates an Episode entity from an EpisodeDto
  factory Episode.fromDto(EpisodeDto dto) {
    return Episode(
      id: dto.id,
      podcastId: dto.podcastId,
      title: dto.title,
      description: dto.description,
      audioUrl: dto.contentUrl,
      imageUrl: dto.pictureUrl,
      duration: dto.duration,
      publishedAt: dto.publishedAt,
      episodeNumber: dto.number,
      seasonNumber: dto.season,
      explicit: dto.explicit,
      playCount: dto.playCount,
      likeCount: dto.likeCount,
      averageRating: dto.averageRating,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  /// Formats the duration in mm:ss or hh:mm:ss format
  String get formattedDuration {
    if (duration == null) return '00:00';

    final hours = duration! ~/ 3600;
    final minutes = (duration! % 3600) ~/ 60;
    final seconds = duration! % 60;

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }

  /// Formats the published date in a human-readable relative format
  String get formattedPublishedDate {
    if (publishedAt == null) return '';

    final now = DateTime.now();
    final difference = now.difference(publishedAt!);

    if (difference.inDays == 0) {
      return AppStrings.today;
    } else if (difference.inDays == 1) {
      return AppStrings.yesterday;
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }
}
