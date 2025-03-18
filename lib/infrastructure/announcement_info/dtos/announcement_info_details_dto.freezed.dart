// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_info_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnnouncementInfoDetailsDto _$AnnouncementInfoDetailsDtoFromJson(
    Map<String, dynamic> json) {
  return _AnnouncementInfoDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$AnnouncementInfoDetailsDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'title',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'content',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'summary', defaultValue: '')
  String get summary => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'thumbnail',
      readValue: JsonReadValueHelper.readSrcValue,
      defaultValue: '')
  String get thumbnail => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'publishedDate',
      readValue: JsonReadValueHelper.readValueDateISO,
      defaultValue: '')
  String get publishedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'releaseDate', readValue: JsonReadValueHelper.readValueDateISO)
  String get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'manufacturer',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  String get manufacturer => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'source',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  String get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTagName)
  String get tag => throw _privateConstructorUsedError;
  @JsonKey(name: 'documents', readValue: JsonReadValueHelper.readDocumentsList)
  List<String> get documentsList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementInfoDetailsDtoCopyWith<AnnouncementInfoDetailsDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementInfoDetailsDtoCopyWith<$Res> {
  factory $AnnouncementInfoDetailsDtoCopyWith(AnnouncementInfoDetailsDto value,
          $Res Function(AnnouncementInfoDetailsDto) then) =
      _$AnnouncementInfoDetailsDtoCopyWithImpl<$Res,
          AnnouncementInfoDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(
          name: 'title',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      String title,
      @JsonKey(
          name: 'content',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      String content,
      @JsonKey(name: 'summary', defaultValue: '') String summary,
      @JsonKey(
          name: 'thumbnail',
          readValue: JsonReadValueHelper.readSrcValue,
          defaultValue: '')
      String thumbnail,
      @JsonKey(
          name: 'publishedDate',
          readValue: JsonReadValueHelper.readValueDateISO,
          defaultValue: '')
      String publishedDate,
      @JsonKey(
          name: 'releaseDate', readValue: JsonReadValueHelper.readValueDateISO)
      String releaseDate,
      @JsonKey(
          name: 'manufacturer',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      String manufacturer,
      @JsonKey(
          name: 'source',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      String source,
      @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTagName)
      String tag,
      @JsonKey(
          name: 'documents', readValue: JsonReadValueHelper.readDocumentsList)
      List<String> documentsList});
}

/// @nodoc
class _$AnnouncementInfoDetailsDtoCopyWithImpl<$Res,
        $Val extends AnnouncementInfoDetailsDto>
    implements $AnnouncementInfoDetailsDtoCopyWith<$Res> {
  _$AnnouncementInfoDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? summary = null,
    Object? thumbnail = null,
    Object? publishedDate = null,
    Object? releaseDate = null,
    Object? manufacturer = null,
    Object? source = null,
    Object? tag = null,
    Object? documentsList = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      documentsList: null == documentsList
          ? _value.documentsList
          : documentsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnouncementInfoDetailsDtoImplCopyWith<$Res>
    implements $AnnouncementInfoDetailsDtoCopyWith<$Res> {
  factory _$$AnnouncementInfoDetailsDtoImplCopyWith(
          _$AnnouncementInfoDetailsDtoImpl value,
          $Res Function(_$AnnouncementInfoDetailsDtoImpl) then) =
      __$$AnnouncementInfoDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(
          name: 'title',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      String title,
      @JsonKey(
          name: 'content',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      String content,
      @JsonKey(name: 'summary', defaultValue: '') String summary,
      @JsonKey(
          name: 'thumbnail',
          readValue: JsonReadValueHelper.readSrcValue,
          defaultValue: '')
      String thumbnail,
      @JsonKey(
          name: 'publishedDate',
          readValue: JsonReadValueHelper.readValueDateISO,
          defaultValue: '')
      String publishedDate,
      @JsonKey(
          name: 'releaseDate', readValue: JsonReadValueHelper.readValueDateISO)
      String releaseDate,
      @JsonKey(
          name: 'manufacturer',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      String manufacturer,
      @JsonKey(
          name: 'source',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      String source,
      @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTagName)
      String tag,
      @JsonKey(
          name: 'documents', readValue: JsonReadValueHelper.readDocumentsList)
      List<String> documentsList});
}

/// @nodoc
class __$$AnnouncementInfoDetailsDtoImplCopyWithImpl<$Res>
    extends _$AnnouncementInfoDetailsDtoCopyWithImpl<$Res,
        _$AnnouncementInfoDetailsDtoImpl>
    implements _$$AnnouncementInfoDetailsDtoImplCopyWith<$Res> {
  __$$AnnouncementInfoDetailsDtoImplCopyWithImpl(
      _$AnnouncementInfoDetailsDtoImpl _value,
      $Res Function(_$AnnouncementInfoDetailsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? summary = null,
    Object? thumbnail = null,
    Object? publishedDate = null,
    Object? releaseDate = null,
    Object? manufacturer = null,
    Object? source = null,
    Object? tag = null,
    Object? documentsList = null,
  }) {
    return _then(_$AnnouncementInfoDetailsDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      documentsList: null == documentsList
          ? _value._documentsList
          : documentsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnnouncementInfoDetailsDtoImpl extends _AnnouncementInfoDetailsDto {
  const _$AnnouncementInfoDetailsDtoImpl(
      {@JsonKey(name: 'id', defaultValue: '') required this.id,
      @JsonKey(
          name: 'title',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      required this.title,
      @JsonKey(
          name: 'content',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      required this.content,
      @JsonKey(name: 'summary', defaultValue: '') required this.summary,
      @JsonKey(
          name: 'thumbnail',
          readValue: JsonReadValueHelper.readSrcValue,
          defaultValue: '')
      required this.thumbnail,
      @JsonKey(
          name: 'publishedDate',
          readValue: JsonReadValueHelper.readValueDateISO,
          defaultValue: '')
      required this.publishedDate,
      @JsonKey(
          name: 'releaseDate', readValue: JsonReadValueHelper.readValueDateISO)
      required this.releaseDate,
      @JsonKey(
          name: 'manufacturer',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      required this.manufacturer,
      @JsonKey(
          name: 'source',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      required this.source,
      @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTagName)
      required this.tag,
      @JsonKey(
          name: 'documents', readValue: JsonReadValueHelper.readDocumentsList)
      required final List<String> documentsList})
      : _documentsList = documentsList,
        super._();

  factory _$AnnouncementInfoDetailsDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AnnouncementInfoDetailsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(
      name: 'title',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  final String title;
  @override
  @JsonKey(
      name: 'content',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  final String content;
  @override
  @JsonKey(name: 'summary', defaultValue: '')
  final String summary;
  @override
  @JsonKey(
      name: 'thumbnail',
      readValue: JsonReadValueHelper.readSrcValue,
      defaultValue: '')
  final String thumbnail;
  @override
  @JsonKey(
      name: 'publishedDate',
      readValue: JsonReadValueHelper.readValueDateISO,
      defaultValue: '')
  final String publishedDate;
  @override
  @JsonKey(name: 'releaseDate', readValue: JsonReadValueHelper.readValueDateISO)
  final String releaseDate;
  @override
  @JsonKey(
      name: 'manufacturer',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  final String manufacturer;
  @override
  @JsonKey(
      name: 'source',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  final String source;
  @override
  @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTagName)
  final String tag;
  final List<String> _documentsList;
  @override
  @JsonKey(name: 'documents', readValue: JsonReadValueHelper.readDocumentsList)
  List<String> get documentsList {
    if (_documentsList is EqualUnmodifiableListView) return _documentsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documentsList);
  }

  @override
  String toString() {
    return 'AnnouncementInfoDetailsDto(id: $id, title: $title, content: $content, summary: $summary, thumbnail: $thumbnail, publishedDate: $publishedDate, releaseDate: $releaseDate, manufacturer: $manufacturer, source: $source, tag: $tag, documentsList: $documentsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementInfoDetailsDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            const DeepCollectionEquality()
                .equals(other._documentsList, _documentsList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      summary,
      thumbnail,
      publishedDate,
      releaseDate,
      manufacturer,
      source,
      tag,
      const DeepCollectionEquality().hash(_documentsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementInfoDetailsDtoImplCopyWith<_$AnnouncementInfoDetailsDtoImpl>
      get copyWith => __$$AnnouncementInfoDetailsDtoImplCopyWithImpl<
          _$AnnouncementInfoDetailsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnnouncementInfoDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _AnnouncementInfoDetailsDto extends AnnouncementInfoDetailsDto {
  const factory _AnnouncementInfoDetailsDto(
      {@JsonKey(name: 'id', defaultValue: '') required final String id,
      @JsonKey(
          name: 'title',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      required final String title,
      @JsonKey(
          name: 'content',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      required final String content,
      @JsonKey(name: 'summary', defaultValue: '') required final String summary,
      @JsonKey(
          name: 'thumbnail',
          readValue: JsonReadValueHelper.readSrcValue,
          defaultValue: '')
      required final String thumbnail,
      @JsonKey(
          name: 'publishedDate',
          readValue: JsonReadValueHelper.readValueDateISO,
          defaultValue: '')
      required final String publishedDate,
      @JsonKey(
          name: 'releaseDate', readValue: JsonReadValueHelper.readValueDateISO)
      required final String releaseDate,
      @JsonKey(
          name: 'manufacturer',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      required final String manufacturer,
      @JsonKey(
          name: 'source',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      required final String source,
      @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTagName)
      required final String tag,
      @JsonKey(
          name: 'documents', readValue: JsonReadValueHelper.readDocumentsList)
      required final List<String>
          documentsList}) = _$AnnouncementInfoDetailsDtoImpl;
  const _AnnouncementInfoDetailsDto._() : super._();

  factory _AnnouncementInfoDetailsDto.fromJson(Map<String, dynamic> json) =
      _$AnnouncementInfoDetailsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(
      name: 'title',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  String get title;
  @override
  @JsonKey(
      name: 'content',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  String get content;
  @override
  @JsonKey(name: 'summary', defaultValue: '')
  String get summary;
  @override
  @JsonKey(
      name: 'thumbnail',
      readValue: JsonReadValueHelper.readSrcValue,
      defaultValue: '')
  String get thumbnail;
  @override
  @JsonKey(
      name: 'publishedDate',
      readValue: JsonReadValueHelper.readValueDateISO,
      defaultValue: '')
  String get publishedDate;
  @override
  @JsonKey(name: 'releaseDate', readValue: JsonReadValueHelper.readValueDateISO)
  String get releaseDate;
  @override
  @JsonKey(
      name: 'manufacturer',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  String get manufacturer;
  @override
  @JsonKey(
      name: 'source',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  String get source;
  @override
  @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTagName)
  String get tag;
  @override
  @JsonKey(name: 'documents', readValue: JsonReadValueHelper.readDocumentsList)
  List<String> get documentsList;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementInfoDetailsDtoImplCopyWith<_$AnnouncementInfoDetailsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
