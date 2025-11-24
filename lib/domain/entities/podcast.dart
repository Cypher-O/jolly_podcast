import 'package:jolly_podcast/data/models/podcast_dto.dart';

/// {@template podcast}
/// Domain entity representing a podcast in the Jolly Podcast application.
///
/// This is the business logic representation of a podcast, separate from
/// the data transfer object used for API communication.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class Podcast {
  const Podcast({
    required this.id,
    required this.userId,
    required this.title,
    required this.author,
    required this.categoryName,
    required this.categoryType,
    this.pictureUrl,
    this.coverPictureUrl,
    this.description,
    this.subscriberCount,
    this.publisherName,
    this.publisherCompany,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final int userId;
  final String title;
  final String author;
  final String categoryName;
  final String categoryType;
  final String? pictureUrl;
  final String? coverPictureUrl;
  final String? description;
  final int? subscriberCount;
  final String? publisherName;
  final String? publisherCompany;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  String get imageUrl => pictureUrl ?? coverPictureUrl ?? '';

  /// Creates a Podcast entity from a PodcastDto
  factory Podcast.fromDto(PodcastDto dto) {
    String? publisherName;
    String? publisherCompany;

    if (dto.publisher != null) {
      final publisher = dto.publisher!;
      if (publisher.firstName != null && publisher.lastName != null) {
        publisherName = '${publisher.firstName} ${publisher.lastName}';
      } else {
        publisherName = publisher.firstName ?? publisher.lastName;
      }
      publisherCompany = publisher.companyName;
    }

    return Podcast(
      id: dto.id,
      userId: dto.userId,
      title: dto.title,
      author: dto.author,
      categoryName: dto.categoryName,
      categoryType: dto.categoryType,
      pictureUrl: dto.pictureUrl,
      coverPictureUrl: dto.coverPictureUrl,
      description: dto.description,
      subscriberCount: dto.subscriberCount,
      publisherName: publisherName,
      publisherCompany: publisherCompany,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
