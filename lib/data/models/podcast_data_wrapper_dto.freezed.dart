// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'podcast_data_wrapper_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PodcastDataWrapperDto _$PodcastDataWrapperDtoFromJson(
    Map<String, dynamic> json) {
  return _PodcastDataWrapperDto.fromJson(json);
}

/// @nodoc
mixin _$PodcastDataWrapperDto {
  String get message => throw _privateConstructorUsedError;
  PodcastPaginatedDataDto get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PodcastDataWrapperDtoCopyWith<PodcastDataWrapperDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PodcastDataWrapperDtoCopyWith<$Res> {
  factory $PodcastDataWrapperDtoCopyWith(PodcastDataWrapperDto value,
          $Res Function(PodcastDataWrapperDto) then) =
      _$PodcastDataWrapperDtoCopyWithImpl<$Res, PodcastDataWrapperDto>;
  @useResult
  $Res call({String message, PodcastPaginatedDataDto data});

  $PodcastPaginatedDataDtoCopyWith<$Res> get data;
}

/// @nodoc
class _$PodcastDataWrapperDtoCopyWithImpl<$Res,
        $Val extends PodcastDataWrapperDto>
    implements $PodcastDataWrapperDtoCopyWith<$Res> {
  _$PodcastDataWrapperDtoCopyWithImpl(this._value, this._then);

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
              as PodcastPaginatedDataDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PodcastPaginatedDataDtoCopyWith<$Res> get data {
    return $PodcastPaginatedDataDtoCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PodcastDataWrapperDtoImplCopyWith<$Res>
    implements $PodcastDataWrapperDtoCopyWith<$Res> {
  factory _$$PodcastDataWrapperDtoImplCopyWith(
          _$PodcastDataWrapperDtoImpl value,
          $Res Function(_$PodcastDataWrapperDtoImpl) then) =
      __$$PodcastDataWrapperDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, PodcastPaginatedDataDto data});

  @override
  $PodcastPaginatedDataDtoCopyWith<$Res> get data;
}

/// @nodoc
class __$$PodcastDataWrapperDtoImplCopyWithImpl<$Res>
    extends _$PodcastDataWrapperDtoCopyWithImpl<$Res,
        _$PodcastDataWrapperDtoImpl>
    implements _$$PodcastDataWrapperDtoImplCopyWith<$Res> {
  __$$PodcastDataWrapperDtoImplCopyWithImpl(_$PodcastDataWrapperDtoImpl _value,
      $Res Function(_$PodcastDataWrapperDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$PodcastDataWrapperDtoImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PodcastPaginatedDataDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PodcastDataWrapperDtoImpl implements _PodcastDataWrapperDto {
  const _$PodcastDataWrapperDtoImpl(
      {required this.message, required this.data});

  factory _$PodcastDataWrapperDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PodcastDataWrapperDtoImplFromJson(json);

  @override
  final String message;
  @override
  final PodcastPaginatedDataDto data;

  @override
  String toString() {
    return 'PodcastDataWrapperDto(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PodcastDataWrapperDtoImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PodcastDataWrapperDtoImplCopyWith<_$PodcastDataWrapperDtoImpl>
      get copyWith => __$$PodcastDataWrapperDtoImplCopyWithImpl<
          _$PodcastDataWrapperDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PodcastDataWrapperDtoImplToJson(
      this,
    );
  }
}

abstract class _PodcastDataWrapperDto implements PodcastDataWrapperDto {
  const factory _PodcastDataWrapperDto(
          {required final String message,
          required final PodcastPaginatedDataDto data}) =
      _$PodcastDataWrapperDtoImpl;

  factory _PodcastDataWrapperDto.fromJson(Map<String, dynamic> json) =
      _$PodcastDataWrapperDtoImpl.fromJson;

  @override
  String get message;
  @override
  PodcastPaginatedDataDto get data;
  @override
  @JsonKey(ignore: true)
  _$$PodcastDataWrapperDtoImplCopyWith<_$PodcastDataWrapperDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
