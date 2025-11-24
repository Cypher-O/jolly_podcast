// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpisodeDtoImpl _$$EpisodeDtoImplFromJson(Map<String, dynamic> json) =>
    _$EpisodeDtoImpl(
      id: (json['id'] as num).toInt(),
      podcastId: (json['podcast_id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      contentUrl: json['content_url'] as String?,
      pictureUrl: json['picture_url'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      publishedAt: json['published_at'] == null
          ? null
          : DateTime.parse(json['published_at'] as String),
      number: (json['number'] as num?)?.toInt(),
      season: (json['season'] as num?)?.toInt(),
      explicit: json['explicit'] as bool?,
      playCount: (json['play_count'] as num?)?.toInt(),
      likeCount: (json['like_count'] as num?)?.toInt(),
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      podcast: json['podcast'] == null
          ? null
          : PodcastDto.fromJson(json['podcast'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$EpisodeDtoImplToJson(_$EpisodeDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'podcast_id': instance.podcastId,
      'title': instance.title,
      'description': instance.description,
      'content_url': instance.contentUrl,
      'picture_url': instance.pictureUrl,
      'duration': instance.duration,
      'published_at': instance.publishedAt?.toIso8601String(),
      'number': instance.number,
      'season': instance.season,
      'explicit': instance.explicit,
      'play_count': instance.playCount,
      'like_count': instance.likeCount,
      'average_rating': instance.averageRating,
      'podcast': instance.podcast,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
