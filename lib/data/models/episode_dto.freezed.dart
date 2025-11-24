// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EpisodeDto _$EpisodeDtoFromJson(Map<String, dynamic> json) {
  return _EpisodeDto.fromJson(json);
}

/// @nodoc
mixin _$EpisodeDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'podcast_id')
  int get podcastId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_url')
  String? get contentUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'picture_url')
  String? get pictureUrl => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  int? get season => throw _privateConstructorUsedError;
  bool? get explicit => throw _privateConstructorUsedError;
  @JsonKey(name: 'play_count')
  int? get playCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'like_count')
  int? get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_rating')
  double? get averageRating => throw _privateConstructorUsedError;
  PodcastDto? get podcast => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeDtoCopyWith<EpisodeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeDtoCopyWith<$Res> {
  factory $EpisodeDtoCopyWith(
          EpisodeDto value, $Res Function(EpisodeDto) then) =
      _$EpisodeDtoCopyWithImpl<$Res, EpisodeDto>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'podcast_id') int podcastId,
      String title,
      String? description,
      @JsonKey(name: 'content_url') String? contentUrl,
      @JsonKey(name: 'picture_url') String? pictureUrl,
      int? duration,
      @JsonKey(name: 'published_at') DateTime? publishedAt,
      int? number,
      int? season,
      bool? explicit,
      @JsonKey(name: 'play_count') int? playCount,
      @JsonKey(name: 'like_count') int? likeCount,
      @JsonKey(name: 'average_rating') double? averageRating,
      PodcastDto? podcast,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $PodcastDtoCopyWith<$Res>? get podcast;
}

/// @nodoc
class _$EpisodeDtoCopyWithImpl<$Res, $Val extends EpisodeDto>
    implements $EpisodeDtoCopyWith<$Res> {
  _$EpisodeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? podcastId = null,
    Object? title = null,
    Object? description = freezed,
    Object? contentUrl = freezed,
    Object? pictureUrl = freezed,
    Object? duration = freezed,
    Object? publishedAt = freezed,
    Object? number = freezed,
    Object? season = freezed,
    Object? explicit = freezed,
    Object? playCount = freezed,
    Object? likeCount = freezed,
    Object? averageRating = freezed,
    Object? podcast = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      podcastId: null == podcastId
          ? _value.podcastId
          : podcastId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      contentUrl: freezed == contentUrl
          ? _value.contentUrl
          : contentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pictureUrl: freezed == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      season: freezed == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as int?,
      explicit: freezed == explicit
          ? _value.explicit
          : explicit // ignore: cast_nullable_to_non_nullable
              as bool?,
      playCount: freezed == playCount
          ? _value.playCount
          : playCount // ignore: cast_nullable_to_non_nullable
              as int?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      podcast: freezed == podcast
          ? _value.podcast
          : podcast // ignore: cast_nullable_to_non_nullable
              as PodcastDto?,
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
  $PodcastDtoCopyWith<$Res>? get podcast {
    if (_value.podcast == null) {
      return null;
    }

    return $PodcastDtoCopyWith<$Res>(_value.podcast!, (value) {
      return _then(_value.copyWith(podcast: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EpisodeDtoImplCopyWith<$Res>
    implements $EpisodeDtoCopyWith<$Res> {
  factory _$$EpisodeDtoImplCopyWith(
          _$EpisodeDtoImpl value, $Res Function(_$EpisodeDtoImpl) then) =
      __$$EpisodeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'podcast_id') int podcastId,
      String title,
      String? description,
      @JsonKey(name: 'content_url') String? contentUrl,
      @JsonKey(name: 'picture_url') String? pictureUrl,
      int? duration,
      @JsonKey(name: 'published_at') DateTime? publishedAt,
      int? number,
      int? season,
      bool? explicit,
      @JsonKey(name: 'play_count') int? playCount,
      @JsonKey(name: 'like_count') int? likeCount,
      @JsonKey(name: 'average_rating') double? averageRating,
      PodcastDto? podcast,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $PodcastDtoCopyWith<$Res>? get podcast;
}

/// @nodoc
class __$$EpisodeDtoImplCopyWithImpl<$Res>
    extends _$EpisodeDtoCopyWithImpl<$Res, _$EpisodeDtoImpl>
    implements _$$EpisodeDtoImplCopyWith<$Res> {
  __$$EpisodeDtoImplCopyWithImpl(
      _$EpisodeDtoImpl _value, $Res Function(_$EpisodeDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? podcastId = null,
    Object? title = null,
    Object? description = freezed,
    Object? contentUrl = freezed,
    Object? pictureUrl = freezed,
    Object? duration = freezed,
    Object? publishedAt = freezed,
    Object? number = freezed,
    Object? season = freezed,
    Object? explicit = freezed,
    Object? playCount = freezed,
    Object? likeCount = freezed,
    Object? averageRating = freezed,
    Object? podcast = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$EpisodeDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      podcastId: null == podcastId
          ? _value.podcastId
          : podcastId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      contentUrl: freezed == contentUrl
          ? _value.contentUrl
          : contentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pictureUrl: freezed == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      season: freezed == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as int?,
      explicit: freezed == explicit
          ? _value.explicit
          : explicit // ignore: cast_nullable_to_non_nullable
              as bool?,
      playCount: freezed == playCount
          ? _value.playCount
          : playCount // ignore: cast_nullable_to_non_nullable
              as int?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      podcast: freezed == podcast
          ? _value.podcast
          : podcast // ignore: cast_nullable_to_non_nullable
              as PodcastDto?,
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
class _$EpisodeDtoImpl implements _EpisodeDto {
  const _$EpisodeDtoImpl(
      {required this.id,
      @JsonKey(name: 'podcast_id') required this.podcastId,
      required this.title,
      this.description,
      @JsonKey(name: 'content_url') this.contentUrl,
      @JsonKey(name: 'picture_url') this.pictureUrl,
      this.duration,
      @JsonKey(name: 'published_at') this.publishedAt,
      this.number,
      this.season,
      this.explicit,
      @JsonKey(name: 'play_count') this.playCount,
      @JsonKey(name: 'like_count') this.likeCount,
      @JsonKey(name: 'average_rating') this.averageRating,
      this.podcast,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$EpisodeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'podcast_id')
  final int podcastId;
  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'content_url')
  final String? contentUrl;
  @override
  @JsonKey(name: 'picture_url')
  final String? pictureUrl;
  @override
  final int? duration;
  @override
  @JsonKey(name: 'published_at')
  final DateTime? publishedAt;
  @override
  final int? number;
  @override
  final int? season;
  @override
  final bool? explicit;
  @override
  @JsonKey(name: 'play_count')
  final int? playCount;
  @override
  @JsonKey(name: 'like_count')
  final int? likeCount;
  @override
  @JsonKey(name: 'average_rating')
  final double? averageRating;
  @override
  final PodcastDto? podcast;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'EpisodeDto(id: $id, podcastId: $podcastId, title: $title, description: $description, contentUrl: $contentUrl, pictureUrl: $pictureUrl, duration: $duration, publishedAt: $publishedAt, number: $number, season: $season, explicit: $explicit, playCount: $playCount, likeCount: $likeCount, averageRating: $averageRating, podcast: $podcast, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.podcastId, podcastId) ||
                other.podcastId == podcastId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.contentUrl, contentUrl) ||
                other.contentUrl == contentUrl) &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.explicit, explicit) ||
                other.explicit == explicit) &&
            (identical(other.playCount, playCount) ||
                other.playCount == playCount) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.podcast, podcast) || other.podcast == podcast) &&
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
      podcastId,
      title,
      description,
      contentUrl,
      pictureUrl,
      duration,
      publishedAt,
      number,
      season,
      explicit,
      playCount,
      likeCount,
      averageRating,
      podcast,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeDtoImplCopyWith<_$EpisodeDtoImpl> get copyWith =>
      __$$EpisodeDtoImplCopyWithImpl<_$EpisodeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeDtoImplToJson(
      this,
    );
  }
}

abstract class _EpisodeDto implements EpisodeDto {
  const factory _EpisodeDto(
          {required final int id,
          @JsonKey(name: 'podcast_id') required final int podcastId,
          required final String title,
          final String? description,
          @JsonKey(name: 'content_url') final String? contentUrl,
          @JsonKey(name: 'picture_url') final String? pictureUrl,
          final int? duration,
          @JsonKey(name: 'published_at') final DateTime? publishedAt,
          final int? number,
          final int? season,
          final bool? explicit,
          @JsonKey(name: 'play_count') final int? playCount,
          @JsonKey(name: 'like_count') final int? likeCount,
          @JsonKey(name: 'average_rating') final double? averageRating,
          final PodcastDto? podcast,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$EpisodeDtoImpl;

  factory _EpisodeDto.fromJson(Map<String, dynamic> json) =
      _$EpisodeDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'podcast_id')
  int get podcastId;
  @override
  String get title;
  @override
  String? get description;
  @override
  @JsonKey(name: 'content_url')
  String? get contentUrl;
  @override
  @JsonKey(name: 'picture_url')
  String? get pictureUrl;
  @override
  int? get duration;
  @override
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt;
  @override
  int? get number;
  @override
  int? get season;
  @override
  bool? get explicit;
  @override
  @JsonKey(name: 'play_count')
  int? get playCount;
  @override
  @JsonKey(name: 'like_count')
  int? get likeCount;
  @override
  @JsonKey(name: 'average_rating')
  double? get averageRating;
  @override
  PodcastDto? get podcast;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$EpisodeDtoImplCopyWith<_$EpisodeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
