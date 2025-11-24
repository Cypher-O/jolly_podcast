// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'podcast_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PodcastDto _$PodcastDtoFromJson(Map<String, dynamic> json) {
  return _PodcastDto.fromJson(json);
}

/// @nodoc
mixin _$PodcastDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_type')
  String get categoryType => throw _privateConstructorUsedError;
  @JsonKey(name: 'picture_url')
  String? get pictureUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_picture_url')
  String? get coverPictureUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'embeddable_player_settings')
  Map<String, dynamic>? get embeddablePlayerSettings =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'subscriber_count')
  int? get subscriberCount => throw _privateConstructorUsedError;
  PublisherDto? get publisher => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PodcastDtoCopyWith<PodcastDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PodcastDtoCopyWith<$Res> {
  factory $PodcastDtoCopyWith(
          PodcastDto value, $Res Function(PodcastDto) then) =
      _$PodcastDtoCopyWithImpl<$Res, PodcastDto>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      String title,
      String author,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'category_type') String categoryType,
      @JsonKey(name: 'picture_url') String? pictureUrl,
      @JsonKey(name: 'cover_picture_url') String? coverPictureUrl,
      String? description,
      @JsonKey(name: 'embeddable_player_settings')
      Map<String, dynamic>? embeddablePlayerSettings,
      @JsonKey(name: 'subscriber_count') int? subscriberCount,
      PublisherDto? publisher,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $PublisherDtoCopyWith<$Res>? get publisher;
}

/// @nodoc
class _$PodcastDtoCopyWithImpl<$Res, $Val extends PodcastDto>
    implements $PodcastDtoCopyWith<$Res> {
  _$PodcastDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? author = null,
    Object? categoryName = null,
    Object? categoryType = null,
    Object? pictureUrl = freezed,
    Object? coverPictureUrl = freezed,
    Object? description = freezed,
    Object? embeddablePlayerSettings = freezed,
    Object? subscriberCount = freezed,
    Object? publisher = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String,
      pictureUrl: freezed == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverPictureUrl: freezed == coverPictureUrl
          ? _value.coverPictureUrl
          : coverPictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      embeddablePlayerSettings: freezed == embeddablePlayerSettings
          ? _value.embeddablePlayerSettings
          : embeddablePlayerSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      subscriberCount: freezed == subscriberCount
          ? _value.subscriberCount
          : subscriberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as PublisherDto?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PublisherDtoCopyWith<$Res>? get publisher {
    if (_value.publisher == null) {
      return null;
    }

    return $PublisherDtoCopyWith<$Res>(_value.publisher!, (value) {
      return _then(_value.copyWith(publisher: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PodcastDtoImplCopyWith<$Res>
    implements $PodcastDtoCopyWith<$Res> {
  factory _$$PodcastDtoImplCopyWith(
          _$PodcastDtoImpl value, $Res Function(_$PodcastDtoImpl) then) =
      __$$PodcastDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      String title,
      String author,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'category_type') String categoryType,
      @JsonKey(name: 'picture_url') String? pictureUrl,
      @JsonKey(name: 'cover_picture_url') String? coverPictureUrl,
      String? description,
      @JsonKey(name: 'embeddable_player_settings')
      Map<String, dynamic>? embeddablePlayerSettings,
      @JsonKey(name: 'subscriber_count') int? subscriberCount,
      PublisherDto? publisher,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $PublisherDtoCopyWith<$Res>? get publisher;
}

/// @nodoc
class __$$PodcastDtoImplCopyWithImpl<$Res>
    extends _$PodcastDtoCopyWithImpl<$Res, _$PodcastDtoImpl>
    implements _$$PodcastDtoImplCopyWith<$Res> {
  __$$PodcastDtoImplCopyWithImpl(
      _$PodcastDtoImpl _value, $Res Function(_$PodcastDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? author = null,
    Object? categoryName = null,
    Object? categoryType = null,
    Object? pictureUrl = freezed,
    Object? coverPictureUrl = freezed,
    Object? description = freezed,
    Object? embeddablePlayerSettings = freezed,
    Object? subscriberCount = freezed,
    Object? publisher = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PodcastDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String,
      pictureUrl: freezed == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverPictureUrl: freezed == coverPictureUrl
          ? _value.coverPictureUrl
          : coverPictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      embeddablePlayerSettings: freezed == embeddablePlayerSettings
          ? _value._embeddablePlayerSettings
          : embeddablePlayerSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      subscriberCount: freezed == subscriberCount
          ? _value.subscriberCount
          : subscriberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as PublisherDto?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PodcastDtoImpl implements _PodcastDto {
  const _$PodcastDtoImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.title,
      required this.author,
      @JsonKey(name: 'category_name') required this.categoryName,
      @JsonKey(name: 'category_type') required this.categoryType,
      @JsonKey(name: 'picture_url') this.pictureUrl,
      @JsonKey(name: 'cover_picture_url') this.coverPictureUrl,
      this.description,
      @JsonKey(name: 'embeddable_player_settings')
      final Map<String, dynamic>? embeddablePlayerSettings,
      @JsonKey(name: 'subscriber_count') this.subscriberCount,
      this.publisher,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _embeddablePlayerSettings = embeddablePlayerSettings;

  factory _$PodcastDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PodcastDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final String title;
  @override
  final String author;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  @JsonKey(name: 'category_type')
  final String categoryType;
  @override
  @JsonKey(name: 'picture_url')
  final String? pictureUrl;
  @override
  @JsonKey(name: 'cover_picture_url')
  final String? coverPictureUrl;
  @override
  final String? description;
  final Map<String, dynamic>? _embeddablePlayerSettings;
  @override
  @JsonKey(name: 'embeddable_player_settings')
  Map<String, dynamic>? get embeddablePlayerSettings {
    final value = _embeddablePlayerSettings;
    if (value == null) return null;
    if (_embeddablePlayerSettings is EqualUnmodifiableMapView)
      return _embeddablePlayerSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'subscriber_count')
  final int? subscriberCount;
  @override
  final PublisherDto? publisher;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PodcastDto(id: $id, userId: $userId, title: $title, author: $author, categoryName: $categoryName, categoryType: $categoryType, pictureUrl: $pictureUrl, coverPictureUrl: $coverPictureUrl, description: $description, embeddablePlayerSettings: $embeddablePlayerSettings, subscriberCount: $subscriberCount, publisher: $publisher, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PodcastDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl) &&
            (identical(other.coverPictureUrl, coverPictureUrl) ||
                other.coverPictureUrl == coverPictureUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
                other._embeddablePlayerSettings, _embeddablePlayerSettings) &&
            (identical(other.subscriberCount, subscriberCount) ||
                other.subscriberCount == subscriberCount) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      title,
      author,
      categoryName,
      categoryType,
      pictureUrl,
      coverPictureUrl,
      description,
      const DeepCollectionEquality().hash(_embeddablePlayerSettings),
      subscriberCount,
      publisher,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PodcastDtoImplCopyWith<_$PodcastDtoImpl> get copyWith =>
      __$$PodcastDtoImplCopyWithImpl<_$PodcastDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PodcastDtoImplToJson(
      this,
    );
  }
}

abstract class _PodcastDto implements PodcastDto {
  const factory _PodcastDto(
          {required final int id,
          @JsonKey(name: 'user_id') required final int userId,
          required final String title,
          required final String author,
          @JsonKey(name: 'category_name') required final String categoryName,
          @JsonKey(name: 'category_type') required final String categoryType,
          @JsonKey(name: 'picture_url') final String? pictureUrl,
          @JsonKey(name: 'cover_picture_url') final String? coverPictureUrl,
          final String? description,
          @JsonKey(name: 'embeddable_player_settings')
          final Map<String, dynamic>? embeddablePlayerSettings,
          @JsonKey(name: 'subscriber_count') final int? subscriberCount,
          final PublisherDto? publisher,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$PodcastDtoImpl;

  factory _PodcastDto.fromJson(Map<String, dynamic> json) =
      _$PodcastDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  String get title;
  @override
  String get author;
  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  @JsonKey(name: 'category_type')
  String get categoryType;
  @override
  @JsonKey(name: 'picture_url')
  String? get pictureUrl;
  @override
  @JsonKey(name: 'cover_picture_url')
  String? get coverPictureUrl;
  @override
  String? get description;
  @override
  @JsonKey(name: 'embeddable_player_settings')
  Map<String, dynamic>? get embeddablePlayerSettings;
  @override
  @JsonKey(name: 'subscriber_count')
  int? get subscriberCount;
  @override
  PublisherDto? get publisher;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PodcastDtoImplCopyWith<_$PodcastDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
