// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_data_wrapper_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PodcastDataWrapperDtoImpl _$$PodcastDataWrapperDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PodcastDataWrapperDtoImpl(
      message: json['message'] as String,
      data: PodcastPaginatedDataDto.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PodcastDataWrapperDtoImplToJson(
        _$PodcastDataWrapperDtoImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
