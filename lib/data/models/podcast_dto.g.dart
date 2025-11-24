// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PodcastDtoImpl _$$PodcastDtoImplFromJson(Map<String, dynamic> json) =>
    _$PodcastDtoImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      title: json['title'] as String,
      author: json['author'] as String,
      categoryName: json['category_name'] as String,
      categoryType: json['category_type'] as String,
      pictureUrl: json['picture_url'] as String?,
      coverPictureUrl: json['cover_picture_url'] as String?,
      description: json['description'] as String?,
      embeddablePlayerSettings:
          json['embeddable_player_settings'] as Map<String, dynamic>?,
      subscriberCount: (json['subscriber_count'] as num?)?.toInt(),
      publisher: json['publisher'] == null
          ? null
          : PublisherDto.fromJson(json['publisher'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PodcastDtoImplToJson(_$PodcastDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'author': instance.author,
      'category_name': instance.categoryName,
      'category_type': instance.categoryType,
      'picture_url': instance.pictureUrl,
      'cover_picture_url': instance.coverPictureUrl,
      'description': instance.description,
      'embeddable_player_settings': instance.embeddablePlayerSettings,
      'subscriber_count': instance.subscriberCount,
      'publisher': instance.publisher,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
