// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginDataDtoImpl _$$LoginDataDtoImplFromJson(Map<String, dynamic> json) =>
    _$LoginDataDtoImpl(
      token: json['token'] as String,
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      subscription: json['subscription'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$LoginDataDtoImplToJson(_$LoginDataDtoImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
      'subscription': instance.subscription,
    };
