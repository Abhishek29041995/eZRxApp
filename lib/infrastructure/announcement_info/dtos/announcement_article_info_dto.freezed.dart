// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_article_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnnouncementArticleInfoDto _$AnnouncementArticleInfoDtoFromJson(
    Map<String, dynamic> json) {
  return _AnnouncementArticleInfoDto.fromJson(json);
}

/// @nodoc
mixin _$AnnouncementArticleInfoDto {
  @JsonKey(
      name: 'pageInfo',
      defaultValue: '',
      readValue: JsonReadValueHelper.readEndCursorValue)
  String get endCursor => throw _privateConstructorUsedError;
  @JsonKey(name: 'total', defaultValue: 0)
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
  List<AnnouncementArticleItemDto> get announcementList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementArticleInfoDtoCopyWith<AnnouncementArticleInfoDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementArticleInfoDtoCopyWith<$Res> {
  factory $AnnouncementArticleInfoDtoCopyWith(AnnouncementArticleInfoDto value,
          $Res Function(AnnouncementArticleInfoDto) then) =
      _$AnnouncementArticleInfoDtoCopyWithImpl<$Res,
          AnnouncementArticleInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'pageInfo',
          defaultValue: '',
          readValue: JsonReadValueHelper.readEndCursorValue)
      String endCursor,
      @JsonKey(name: 'total', defaultValue: 0) int total,
      @JsonKey(name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
      List<AnnouncementArticleItemDto> announcementList});
}

/// @nodoc
class _$AnnouncementArticleInfoDtoCopyWithImpl<$Res,
        $Val extends AnnouncementArticleInfoDto>
    implements $AnnouncementArticleInfoDtoCopyWith<$Res> {
  _$AnnouncementArticleInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endCursor = null,
    Object? total = null,
    Object? announcementList = null,
  }) {
    return _then(_value.copyWith(
      endCursor: null == endCursor
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      announcementList: null == announcementList
          ? _value.announcementList
          : announcementList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementArticleItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnouncementArticleInfoDtoImplCopyWith<$Res>
    implements $AnnouncementArticleInfoDtoCopyWith<$Res> {
  factory _$$AnnouncementArticleInfoDtoImplCopyWith(
          _$AnnouncementArticleInfoDtoImpl value,
          $Res Function(_$AnnouncementArticleInfoDtoImpl) then) =
      __$$AnnouncementArticleInfoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'pageInfo',
          defaultValue: '',
          readValue: JsonReadValueHelper.readEndCursorValue)
      String endCursor,
      @JsonKey(name: 'total', defaultValue: 0) int total,
      @JsonKey(name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
      List<AnnouncementArticleItemDto> announcementList});
}

/// @nodoc
class __$$AnnouncementArticleInfoDtoImplCopyWithImpl<$Res>
    extends _$AnnouncementArticleInfoDtoCopyWithImpl<$Res,
        _$AnnouncementArticleInfoDtoImpl>
    implements _$$AnnouncementArticleInfoDtoImplCopyWith<$Res> {
  __$$AnnouncementArticleInfoDtoImplCopyWithImpl(
      _$AnnouncementArticleInfoDtoImpl _value,
      $Res Function(_$AnnouncementArticleInfoDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endCursor = null,
    Object? total = null,
    Object? announcementList = null,
  }) {
    return _then(_$AnnouncementArticleInfoDtoImpl(
      endCursor: null == endCursor
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      announcementList: null == announcementList
          ? _value._announcementList
          : announcementList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementArticleItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnnouncementArticleInfoDtoImpl extends _AnnouncementArticleInfoDto {
  const _$AnnouncementArticleInfoDtoImpl(
      {@JsonKey(
          name: 'pageInfo',
          defaultValue: '',
          readValue: JsonReadValueHelper.readEndCursorValue)
      required this.endCursor,
      @JsonKey(name: 'total', defaultValue: 0) required this.total,
      @JsonKey(name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
      required final List<AnnouncementArticleItemDto> announcementList})
      : _announcementList = announcementList,
        super._();

  factory _$AnnouncementArticleInfoDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AnnouncementArticleInfoDtoImplFromJson(json);

  @override
  @JsonKey(
      name: 'pageInfo',
      defaultValue: '',
      readValue: JsonReadValueHelper.readEndCursorValue)
  final String endCursor;
  @override
  @JsonKey(name: 'total', defaultValue: 0)
  final int total;
  final List<AnnouncementArticleItemDto> _announcementList;
  @override
  @JsonKey(name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
  List<AnnouncementArticleItemDto> get announcementList {
    if (_announcementList is EqualUnmodifiableListView)
      return _announcementList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_announcementList);
  }

  @override
  String toString() {
    return 'AnnouncementArticleInfoDto(endCursor: $endCursor, total: $total, announcementList: $announcementList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementArticleInfoDtoImpl &&
            (identical(other.endCursor, endCursor) ||
                other.endCursor == endCursor) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._announcementList, _announcementList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, endCursor, total,
      const DeepCollectionEquality().hash(_announcementList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementArticleInfoDtoImplCopyWith<_$AnnouncementArticleInfoDtoImpl>
      get copyWith => __$$AnnouncementArticleInfoDtoImplCopyWithImpl<
          _$AnnouncementArticleInfoDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnnouncementArticleInfoDtoImplToJson(
      this,
    );
  }
}

abstract class _AnnouncementArticleInfoDto extends AnnouncementArticleInfoDto {
  const factory _AnnouncementArticleInfoDto(
          {@JsonKey(
              name: 'pageInfo',
              defaultValue: '',
              readValue: JsonReadValueHelper.readEndCursorValue)
          required final String endCursor,
          @JsonKey(name: 'total', defaultValue: 0) required final int total,
          @JsonKey(
              name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
          required final List<AnnouncementArticleItemDto> announcementList}) =
      _$AnnouncementArticleInfoDtoImpl;
  const _AnnouncementArticleInfoDto._() : super._();

  factory _AnnouncementArticleInfoDto.fromJson(Map<String, dynamic> json) =
      _$AnnouncementArticleInfoDtoImpl.fromJson;

  @override
  @JsonKey(
      name: 'pageInfo',
      defaultValue: '',
      readValue: JsonReadValueHelper.readEndCursorValue)
  String get endCursor;
  @override
  @JsonKey(name: 'total', defaultValue: 0)
  int get total;
  @override
  @JsonKey(name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
  List<AnnouncementArticleItemDto> get announcementList;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementArticleInfoDtoImplCopyWith<_$AnnouncementArticleInfoDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AnnouncementArticleItemDto _$AnnouncementArticleItemDtoFromJson(
    Map<String, dynamic> json) {
  return _AnnouncementArticleItemDto.fromJson(json);
}

/// @nodoc
mixin _$AnnouncementArticleItemDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'summary', readValue: JsonReadValueHelper.readValueString)
  String get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail', readValue: JsonReadValueHelper.readSrcValue)
  String get thumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: 'content', readValue: JsonReadValueHelper.readValueString)
  String get content => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'publishedDate', readValue: JsonReadValueHelper.readValueDateISO)
  String get publishedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'releaseDate', readValue: JsonReadValueHelper.readValueDateISO)
  String get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch', readValue: JsonReadValueHelper.readValueList)
  List<BranchAndIc4InfoDto> get branchInfo =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'iC4', readValue: JsonReadValueHelper.readValueList)
  List<BranchAndIc4InfoDto> get iC4Info => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTag)
  String get tag => throw _privateConstructorUsedError;
  @JsonKey(name: 'manufacturer', readValue: JsonReadValueHelper.readValueString)
  String get manufacturer => throw _privateConstructorUsedError;
  @JsonKey(name: 'documents', readValue: JsonReadValueHelper.readDocumentsList)
  List<String> get documentsList => throw _privateConstructorUsedError;
  @JsonKey(name: 'pinToTop', readValue: JsonReadValueHelper.readPinToTop)
  bool get pinToTop => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementArticleItemDtoCopyWith<AnnouncementArticleItemDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementArticleItemDtoCopyWith<$Res> {
  factory $AnnouncementArticleItemDtoCopyWith(AnnouncementArticleItemDto value,
          $Res Function(AnnouncementArticleItemDto) then) =
      _$AnnouncementArticleItemDtoCopyWithImpl<$Res,
          AnnouncementArticleItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
      String title,
      @JsonKey(name: 'summary', readValue: JsonReadValueHelper.readValueString)
      String summary,
      @JsonKey(name: 'thumbnail', readValue: JsonReadValueHelper.readSrcValue)
      String thumbnail,
      @JsonKey(name: 'content', readValue: JsonReadValueHelper.readValueString)
      String content,
      @JsonKey(
          name: 'publishedDate',
          readValue: JsonReadValueHelper.readValueDateISO)
      String publishedDate,
      @JsonKey(
          name: 'releaseDate', readValue: JsonReadValueHelper.readValueDateISO)
      String releaseDate,
      @JsonKey(name: 'branch', readValue: JsonReadValueHelper.readValueList)
      List<BranchAndIc4InfoDto> branchInfo,
      @JsonKey(name: 'iC4', readValue: JsonReadValueHelper.readValueList)
      List<BranchAndIc4InfoDto> iC4Info,
      @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTag) String tag,
      @JsonKey(
          name: 'manufacturer', readValue: JsonReadValueHelper.readValueString)
      String manufacturer,
      @JsonKey(
          name: 'documents', readValue: JsonReadValueHelper.readDocumentsList)
      List<String> documentsList,
      @JsonKey(name: 'pinToTop', readValue: JsonReadValueHelper.readPinToTop)
      bool pinToTop});
}

/// @nodoc
class _$AnnouncementArticleItemDtoCopyWithImpl<$Res,
        $Val extends AnnouncementArticleItemDto>
    implements $AnnouncementArticleItemDtoCopyWith<$Res> {
  _$AnnouncementArticleItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? thumbnail = null,
    Object? content = null,
    Object? publishedDate = null,
    Object? releaseDate = null,
    Object? branchInfo = null,
    Object? iC4Info = null,
    Object? tag = null,
    Object? manufacturer = null,
    Object? documentsList = null,
    Object? pinToTop = null,
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
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      branchInfo: null == branchInfo
          ? _value.branchInfo
          : branchInfo // ignore: cast_nullable_to_non_nullable
              as List<BranchAndIc4InfoDto>,
      iC4Info: null == iC4Info
          ? _value.iC4Info
          : iC4Info // ignore: cast_nullable_to_non_nullable
              as List<BranchAndIc4InfoDto>,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      documentsList: null == documentsList
          ? _value.documentsList
          : documentsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pinToTop: null == pinToTop
          ? _value.pinToTop
          : pinToTop // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnouncementArticleItemDtoImplCopyWith<$Res>
    implements $AnnouncementArticleItemDtoCopyWith<$Res> {
  factory _$$AnnouncementArticleItemDtoImplCopyWith(
          _$AnnouncementArticleItemDtoImpl value,
          $Res Function(_$AnnouncementArticleItemDtoImpl) then) =
      __$$AnnouncementArticleItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
      String title,
      @JsonKey(name: 'summary', readValue: JsonReadValueHelper.readValueString)
      String summary,
      @JsonKey(name: 'thumbnail', readValue: JsonReadValueHelper.readSrcValue)
      String thumbnail,
      @JsonKey(name: 'content', readValue: JsonReadValueHelper.readValueString)
      String content,
      @JsonKey(
          name: 'publishedDate',
          readValue: JsonReadValueHelper.readValueDateISO)
      String publishedDate,
      @JsonKey(
          name: 'releaseDate', readValue: JsonReadValueHelper.readValueDateISO)
      String releaseDate,
      @JsonKey(name: 'branch', readValue: JsonReadValueHelper.readValueList)
      List<BranchAndIc4InfoDto> branchInfo,
      @JsonKey(name: 'iC4', readValue: JsonReadValueHelper.readValueList)
      List<BranchAndIc4InfoDto> iC4Info,
      @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTag) String tag,
      @JsonKey(
          name: 'manufacturer', readValue: JsonReadValueHelper.readValueString)
      String manufacturer,
      @JsonKey(
          name: 'documents', readValue: JsonReadValueHelper.readDocumentsList)
      List<String> documentsList,
      @JsonKey(name: 'pinToTop', readValue: JsonReadValueHelper.readPinToTop)
      bool pinToTop});
}

/// @nodoc
class __$$AnnouncementArticleItemDtoImplCopyWithImpl<$Res>
    extends _$AnnouncementArticleItemDtoCopyWithImpl<$Res,
        _$AnnouncementArticleItemDtoImpl>
    implements _$$AnnouncementArticleItemDtoImplCopyWith<$Res> {
  __$$AnnouncementArticleItemDtoImplCopyWithImpl(
      _$AnnouncementArticleItemDtoImpl _value,
      $Res Function(_$AnnouncementArticleItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? thumbnail = null,
    Object? content = null,
    Object? publishedDate = null,
    Object? releaseDate = null,
    Object? branchInfo = null,
    Object? iC4Info = null,
    Object? tag = null,
    Object? manufacturer = null,
    Object? documentsList = null,
    Object? pinToTop = null,
  }) {
    return _then(_$AnnouncementArticleItemDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      branchInfo: null == branchInfo
          ? _value._branchInfo
          : branchInfo // ignore: cast_nullable_to_non_nullable
              as List<BranchAndIc4InfoDto>,
      iC4Info: null == iC4Info
          ? _value._iC4Info
          : iC4Info // ignore: cast_nullable_to_non_nullable
              as List<BranchAndIc4InfoDto>,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      documentsList: null == documentsList
          ? _value._documentsList
          : documentsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pinToTop: null == pinToTop
          ? _value.pinToTop
          : pinToTop // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnnouncementArticleItemDtoImpl extends _AnnouncementArticleItemDto {
  const _$AnnouncementArticleItemDtoImpl(
      {@JsonKey(name: 'id', defaultValue: '') required this.id,
      @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
      required this.title,
      @JsonKey(name: 'summary', readValue: JsonReadValueHelper.readValueString)
      required this.summary,
      @JsonKey(name: 'thumbnail', readValue: JsonReadValueHelper.readSrcValue)
      required this.thumbnail,
      @JsonKey(name: 'content', readValue: JsonReadValueHelper.readValueString)
      required this.content,
      @JsonKey(
          name: 'publishedDate',
          readValue: JsonReadValueHelper.readValueDateISO)
      required this.publishedDate,
      @JsonKey(
          name: 'releaseDate', readValue: JsonReadValueHelper.readValueDateISO)
      required this.releaseDate,
      @JsonKey(name: 'branch', readValue: JsonReadValueHelper.readValueList)
      required final List<BranchAndIc4InfoDto> branchInfo,
      @JsonKey(name: 'iC4', readValue: JsonReadValueHelper.readValueList)
      required final List<BranchAndIc4InfoDto> iC4Info,
      @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTag)
      required this.tag,
      @JsonKey(
          name: 'manufacturer', readValue: JsonReadValueHelper.readValueString)
      required this.manufacturer,
      @JsonKey(
          name: 'documents', readValue: JsonReadValueHelper.readDocumentsList)
      required final List<String> documentsList,
      @JsonKey(name: 'pinToTop', readValue: JsonReadValueHelper.readPinToTop)
      required this.pinToTop})
      : _branchInfo = branchInfo,
        _iC4Info = iC4Info,
        _documentsList = documentsList,
        super._();

  factory _$AnnouncementArticleItemDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AnnouncementArticleItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
  final String title;
  @override
  @JsonKey(name: 'summary', readValue: JsonReadValueHelper.readValueString)
  final String summary;
  @override
  @JsonKey(name: 'thumbnail', readValue: JsonReadValueHelper.readSrcValue)
  final String thumbnail;
  @override
  @JsonKey(name: 'content', readValue: JsonReadValueHelper.readValueString)
  final String content;
  @override
  @JsonKey(
      name: 'publishedDate', readValue: JsonReadValueHelper.readValueDateISO)
  final String publishedDate;
  @override
  @JsonKey(name: 'releaseDate', readValue: JsonReadValueHelper.readValueDateISO)
  final String releaseDate;
  final List<BranchAndIc4InfoDto> _branchInfo;
  @override
  @JsonKey(name: 'branch', readValue: JsonReadValueHelper.readValueList)
  List<BranchAndIc4InfoDto> get branchInfo {
    if (_branchInfo is EqualUnmodifiableListView) return _branchInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_branchInfo);
  }

  final List<BranchAndIc4InfoDto> _iC4Info;
  @override
  @JsonKey(name: 'iC4', readValue: JsonReadValueHelper.readValueList)
  List<BranchAndIc4InfoDto> get iC4Info {
    if (_iC4Info is EqualUnmodifiableListView) return _iC4Info;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_iC4Info);
  }

  @override
  @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTag)
  final String tag;
  @override
  @JsonKey(name: 'manufacturer', readValue: JsonReadValueHelper.readValueString)
  final String manufacturer;
  final List<String> _documentsList;
  @override
  @JsonKey(name: 'documents', readValue: JsonReadValueHelper.readDocumentsList)
  List<String> get documentsList {
    if (_documentsList is EqualUnmodifiableListView) return _documentsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documentsList);
  }

  @override
  @JsonKey(name: 'pinToTop', readValue: JsonReadValueHelper.readPinToTop)
  final bool pinToTop;

  @override
  String toString() {
    return 'AnnouncementArticleItemDto(id: $id, title: $title, summary: $summary, thumbnail: $thumbnail, content: $content, publishedDate: $publishedDate, releaseDate: $releaseDate, branchInfo: $branchInfo, iC4Info: $iC4Info, tag: $tag, manufacturer: $manufacturer, documentsList: $documentsList, pinToTop: $pinToTop)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementArticleItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            const DeepCollectionEquality()
                .equals(other._branchInfo, _branchInfo) &&
            const DeepCollectionEquality().equals(other._iC4Info, _iC4Info) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            const DeepCollectionEquality()
                .equals(other._documentsList, _documentsList) &&
            (identical(other.pinToTop, pinToTop) ||
                other.pinToTop == pinToTop));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      summary,
      thumbnail,
      content,
      publishedDate,
      releaseDate,
      const DeepCollectionEquality().hash(_branchInfo),
      const DeepCollectionEquality().hash(_iC4Info),
      tag,
      manufacturer,
      const DeepCollectionEquality().hash(_documentsList),
      pinToTop);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementArticleItemDtoImplCopyWith<_$AnnouncementArticleItemDtoImpl>
      get copyWith => __$$AnnouncementArticleItemDtoImplCopyWithImpl<
          _$AnnouncementArticleItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnnouncementArticleItemDtoImplToJson(
      this,
    );
  }
}

abstract class _AnnouncementArticleItemDto extends AnnouncementArticleItemDto {
  const factory _AnnouncementArticleItemDto(
      {@JsonKey(name: 'id', defaultValue: '') required final String id,
      @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
      required final String title,
      @JsonKey(name: 'summary', readValue: JsonReadValueHelper.readValueString)
      required final String summary,
      @JsonKey(name: 'thumbnail', readValue: JsonReadValueHelper.readSrcValue)
      required final String thumbnail,
      @JsonKey(name: 'content', readValue: JsonReadValueHelper.readValueString)
      required final String content,
      @JsonKey(
          name: 'publishedDate',
          readValue: JsonReadValueHelper.readValueDateISO)
      required final String publishedDate,
      @JsonKey(
          name: 'releaseDate', readValue: JsonReadValueHelper.readValueDateISO)
      required final String releaseDate,
      @JsonKey(name: 'branch', readValue: JsonReadValueHelper.readValueList)
      required final List<BranchAndIc4InfoDto> branchInfo,
      @JsonKey(name: 'iC4', readValue: JsonReadValueHelper.readValueList)
      required final List<BranchAndIc4InfoDto> iC4Info,
      @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTag)
      required final String tag,
      @JsonKey(
          name: 'manufacturer', readValue: JsonReadValueHelper.readValueString)
      required final String manufacturer,
      @JsonKey(
          name: 'documents', readValue: JsonReadValueHelper.readDocumentsList)
      required final List<String> documentsList,
      @JsonKey(name: 'pinToTop', readValue: JsonReadValueHelper.readPinToTop)
      required final bool pinToTop}) = _$AnnouncementArticleItemDtoImpl;
  const _AnnouncementArticleItemDto._() : super._();

  factory _AnnouncementArticleItemDto.fromJson(Map<String, dynamic> json) =
      _$AnnouncementArticleItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
  String get title;
  @override
  @JsonKey(name: 'summary', readValue: JsonReadValueHelper.readValueString)
  String get summary;
  @override
  @JsonKey(name: 'thumbnail', readValue: JsonReadValueHelper.readSrcValue)
  String get thumbnail;
  @override
  @JsonKey(name: 'content', readValue: JsonReadValueHelper.readValueString)
  String get content;
  @override
  @JsonKey(
      name: 'publishedDate', readValue: JsonReadValueHelper.readValueDateISO)
  String get publishedDate;
  @override
  @JsonKey(name: 'releaseDate', readValue: JsonReadValueHelper.readValueDateISO)
  String get releaseDate;
  @override
  @JsonKey(name: 'branch', readValue: JsonReadValueHelper.readValueList)
  List<BranchAndIc4InfoDto> get branchInfo;
  @override
  @JsonKey(name: 'iC4', readValue: JsonReadValueHelper.readValueList)
  List<BranchAndIc4InfoDto> get iC4Info;
  @override
  @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTag)
  String get tag;
  @override
  @JsonKey(name: 'manufacturer', readValue: JsonReadValueHelper.readValueString)
  String get manufacturer;
  @override
  @JsonKey(name: 'documents', readValue: JsonReadValueHelper.readDocumentsList)
  List<String> get documentsList;
  @override
  @JsonKey(name: 'pinToTop', readValue: JsonReadValueHelper.readPinToTop)
  bool get pinToTop;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementArticleItemDtoImplCopyWith<_$AnnouncementArticleItemDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BranchAndIc4InfoDto _$BranchAndIc4InfoDtoFromJson(Map<String, dynamic> json) {
  return _BranchAndIc4Dto.fromJson(json);
}

/// @nodoc
mixin _$BranchAndIc4InfoDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchAndIc4InfoDtoCopyWith<BranchAndIc4InfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchAndIc4InfoDtoCopyWith<$Res> {
  factory $BranchAndIc4InfoDtoCopyWith(
          BranchAndIc4InfoDto value, $Res Function(BranchAndIc4InfoDto) then) =
      _$BranchAndIc4InfoDtoCopyWithImpl<$Res, BranchAndIc4InfoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'displayName', defaultValue: '') String displayName});
}

/// @nodoc
class _$BranchAndIc4InfoDtoCopyWithImpl<$Res, $Val extends BranchAndIc4InfoDto>
    implements $BranchAndIc4InfoDtoCopyWith<$Res> {
  _$BranchAndIc4InfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BranchAndIc4DtoImplCopyWith<$Res>
    implements $BranchAndIc4InfoDtoCopyWith<$Res> {
  factory _$$BranchAndIc4DtoImplCopyWith(_$BranchAndIc4DtoImpl value,
          $Res Function(_$BranchAndIc4DtoImpl) then) =
      __$$BranchAndIc4DtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'displayName', defaultValue: '') String displayName});
}

/// @nodoc
class __$$BranchAndIc4DtoImplCopyWithImpl<$Res>
    extends _$BranchAndIc4InfoDtoCopyWithImpl<$Res, _$BranchAndIc4DtoImpl>
    implements _$$BranchAndIc4DtoImplCopyWith<$Res> {
  __$$BranchAndIc4DtoImplCopyWithImpl(
      _$BranchAndIc4DtoImpl _value, $Res Function(_$BranchAndIc4DtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
  }) {
    return _then(_$BranchAndIc4DtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BranchAndIc4DtoImpl extends _BranchAndIc4Dto {
  const _$BranchAndIc4DtoImpl(
      {@JsonKey(name: 'id', defaultValue: '') required this.id,
      @JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'displayName', defaultValue: '')
      required this.displayName})
      : super._();

  factory _$BranchAndIc4DtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchAndIc4DtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  final String displayName;

  @override
  String toString() {
    return 'BranchAndIc4InfoDto(id: $id, name: $name, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchAndIc4DtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchAndIc4DtoImplCopyWith<_$BranchAndIc4DtoImpl> get copyWith =>
      __$$BranchAndIc4DtoImplCopyWithImpl<_$BranchAndIc4DtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchAndIc4DtoImplToJson(
      this,
    );
  }
}

abstract class _BranchAndIc4Dto extends BranchAndIc4InfoDto {
  const factory _BranchAndIc4Dto(
      {@JsonKey(name: 'id', defaultValue: '') required final String id,
      @JsonKey(name: 'name', defaultValue: '') required final String name,
      @JsonKey(name: 'displayName', defaultValue: '')
      required final String displayName}) = _$BranchAndIc4DtoImpl;
  const _BranchAndIc4Dto._() : super._();

  factory _BranchAndIc4Dto.fromJson(Map<String, dynamic> json) =
      _$BranchAndIc4DtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName;
  @override
  @JsonKey(ignore: true)
  _$$BranchAndIc4DtoImplCopyWith<_$BranchAndIc4DtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
