// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'podcast_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PodcastListResponseDto _$PodcastListResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _PodcastListResponseDto.fromJson(json);
}

/// @nodoc
mixin _$PodcastListResponseDto {
  String get message => throw _privateConstructorUsedError;
  PodcastDataWrapperDto get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PodcastListResponseDtoCopyWith<PodcastListResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PodcastListResponseDtoCopyWith<$Res> {
  factory $PodcastListResponseDtoCopyWith(PodcastListResponseDto value,
          $Res Function(PodcastListResponseDto) then) =
      _$PodcastListResponseDtoCopyWithImpl<$Res, PodcastListResponseDto>;
  @useResult
  $Res call({String message, PodcastDataWrapperDto data});

  $PodcastDataWrapperDtoCopyWith<$Res> get data;
}

/// @nodoc
class _$PodcastListResponseDtoCopyWithImpl<$Res,
        $Val extends PodcastListResponseDto>
    implements $PodcastListResponseDtoCopyWith<$Res> {
  _$PodcastListResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PodcastDataWrapperDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PodcastDataWrapperDtoCopyWith<$Res> get data {
    return $PodcastDataWrapperDtoCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PodcastListResponseDtoImplCopyWith<$Res>
    implements $PodcastListResponseDtoCopyWith<$Res> {
  factory _$$PodcastListResponseDtoImplCopyWith(
          _$PodcastListResponseDtoImpl value,
          $Res Function(_$PodcastListResponseDtoImpl) then) =
      __$$PodcastListResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, PodcastDataWrapperDto data});

  @override
  $PodcastDataWrapperDtoCopyWith<$Res> get data;
}

/// @nodoc
class __$$PodcastListResponseDtoImplCopyWithImpl<$Res>
    extends _$PodcastListResponseDtoCopyWithImpl<$Res,
        _$PodcastListResponseDtoImpl>
    implements _$$PodcastListResponseDtoImplCopyWith<$Res> {
  __$$PodcastListResponseDtoImplCopyWithImpl(
      _$PodcastListResponseDtoImpl _value,
      $Res Function(_$PodcastListResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$PodcastListResponseDtoImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PodcastDataWrapperDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PodcastListResponseDtoImpl implements _PodcastListResponseDto {
  const _$PodcastListResponseDtoImpl(
      {required this.message, required this.data});

  factory _$PodcastListResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PodcastListResponseDtoImplFromJson(json);

  @override
  final String message;
  @override
  final PodcastDataWrapperDto data;

  @override
  String toString() {
    return 'PodcastListResponseDto(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PodcastListResponseDtoImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PodcastListResponseDtoImplCopyWith<_$PodcastListResponseDtoImpl>
      get copyWith => __$$PodcastListResponseDtoImplCopyWithImpl<
          _$PodcastListResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PodcastListResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _PodcastListResponseDto implements PodcastListResponseDto {
  const factory _PodcastListResponseDto(
          {required final String message,
          required final PodcastDataWrapperDto data}) =
      _$PodcastListResponseDtoImpl;

  factory _PodcastListResponseDto.fromJson(Map<String, dynamic> json) =
      _$PodcastListResponseDtoImpl.fromJson;

  @override
  String get message;
  @override
  PodcastDataWrapperDto get data;
  @override
  @JsonKey(ignore: true)
  _$$PodcastListResponseDtoImplCopyWith<_$PodcastListResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
