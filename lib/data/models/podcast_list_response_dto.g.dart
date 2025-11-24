// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PodcastListResponseDtoImpl _$$PodcastListResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PodcastListResponseDtoImpl(
      message: json['message'] as String,
      data:
          PodcastDataWrapperDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PodcastListResponseDtoImplToJson(
        _$PodcastListResponseDtoImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
