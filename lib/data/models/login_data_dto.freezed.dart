// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginDataDto _$LoginDataDtoFromJson(Map<String, dynamic> json) {
  return _LoginDataDto.fromJson(json);
}

/// @nodoc
mixin _$LoginDataDto {
  String get token => throw _privateConstructorUsedError;
  UserDto get user => throw _privateConstructorUsedError;
  Map<String, dynamic>? get subscription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDataDtoCopyWith<LoginDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDataDtoCopyWith<$Res> {
  factory $LoginDataDtoCopyWith(
          LoginDataDto value, $Res Function(LoginDataDto) then) =
      _$LoginDataDtoCopyWithImpl<$Res, LoginDataDto>;
  @useResult
  $Res call({String token, UserDto user, Map<String, dynamic>? subscription});

  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class _$LoginDataDtoCopyWithImpl<$Res, $Val extends LoginDataDto>
    implements $LoginDataDtoCopyWith<$Res> {
  _$LoginDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? user = null,
    Object? subscription = freezed,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get user {
    return $UserDtoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginDataDtoImplCopyWith<$Res>
    implements $LoginDataDtoCopyWith<$Res> {
  factory _$$LoginDataDtoImplCopyWith(
          _$LoginDataDtoImpl value, $Res Function(_$LoginDataDtoImpl) then) =
      __$$LoginDataDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, UserDto user, Map<String, dynamic>? subscription});

  @override
  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoginDataDtoImplCopyWithImpl<$Res>
    extends _$LoginDataDtoCopyWithImpl<$Res, _$LoginDataDtoImpl>
    implements _$$LoginDataDtoImplCopyWith<$Res> {
  __$$LoginDataDtoImplCopyWithImpl(
      _$LoginDataDtoImpl _value, $Res Function(_$LoginDataDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? user = null,
    Object? subscription = freezed,
  }) {
    return _then(_$LoginDataDtoImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
      subscription: freezed == subscription
          ? _value._subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginDataDtoImpl implements _LoginDataDto {
  const _$LoginDataDtoImpl(
      {required this.token,
      required this.user,
      final Map<String, dynamic>? subscription})
      : _subscription = subscription;

  factory _$LoginDataDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginDataDtoImplFromJson(json);

  @override
  final String token;
  @override
  final UserDto user;
  final Map<String, dynamic>? _subscription;
  @override
  Map<String, dynamic>? get subscription {
    final value = _subscription;
    if (value == null) return null;
    if (_subscription is EqualUnmodifiableMapView) return _subscription;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'LoginDataDto(token: $token, user: $user, subscription: $subscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDataDtoImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._subscription, _subscription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, user,
      const DeepCollectionEquality().hash(_subscription));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginDataDtoImplCopyWith<_$LoginDataDtoImpl> get copyWith =>
      __$$LoginDataDtoImplCopyWithImpl<_$LoginDataDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginDataDtoImplToJson(
      this,
    );
  }
}

abstract class _LoginDataDto implements LoginDataDto {
  const factory _LoginDataDto(
      {required final String token,
      required final UserDto user,
      final Map<String, dynamic>? subscription}) = _$LoginDataDtoImpl;

  factory _LoginDataDto.fromJson(Map<String, dynamic> json) =
      _$LoginDataDtoImpl.fromJson;

  @override
  String get token;
  @override
  UserDto get user;
  @override
  Map<String, dynamic>? get subscription;
  @override
  @JsonKey(ignore: true)
  _$$LoginDataDtoImplCopyWith<_$LoginDataDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
