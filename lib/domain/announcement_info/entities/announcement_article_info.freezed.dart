// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_article_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnnouncementArticleInfo {
  int get total => throw _privateConstructorUsedError;
  String get endCursor => throw _privateConstructorUsedError;
  List<AnnouncementArticleItem> get announcementList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementArticleInfoCopyWith<AnnouncementArticleInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementArticleInfoCopyWith<$Res> {
  factory $AnnouncementArticleInfoCopyWith(AnnouncementArticleInfo value,
          $Res Function(AnnouncementArticleInfo) then) =
      _$AnnouncementArticleInfoCopyWithImpl<$Res, AnnouncementArticleInfo>;
  @useResult
  $Res call(
      {int total,
      String endCursor,
      List<AnnouncementArticleItem> announcementList});
}

/// @nodoc
class _$AnnouncementArticleInfoCopyWithImpl<$Res,
        $Val extends AnnouncementArticleInfo>
    implements $AnnouncementArticleInfoCopyWith<$Res> {
  _$AnnouncementArticleInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? endCursor = null,
    Object? announcementList = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      endCursor: null == endCursor
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String,
      announcementList: null == announcementList
          ? _value.announcementList
          : announcementList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementArticleItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnouncementArticleInfoImplCopyWith<$Res>
    implements $AnnouncementArticleInfoCopyWith<$Res> {
  factory _$$AnnouncementArticleInfoImplCopyWith(
          _$AnnouncementArticleInfoImpl value,
          $Res Function(_$AnnouncementArticleInfoImpl) then) =
      __$$AnnouncementArticleInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total,
      String endCursor,
      List<AnnouncementArticleItem> announcementList});
}

/// @nodoc
class __$$AnnouncementArticleInfoImplCopyWithImpl<$Res>
    extends _$AnnouncementArticleInfoCopyWithImpl<$Res,
        _$AnnouncementArticleInfoImpl>
    implements _$$AnnouncementArticleInfoImplCopyWith<$Res> {
  __$$AnnouncementArticleInfoImplCopyWithImpl(
      _$AnnouncementArticleInfoImpl _value,
      $Res Function(_$AnnouncementArticleInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? endCursor = null,
    Object? announcementList = null,
  }) {
    return _then(_$AnnouncementArticleInfoImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      endCursor: null == endCursor
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String,
      announcementList: null == announcementList
          ? _value._announcementList
          : announcementList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementArticleItem>,
    ));
  }
}

/// @nodoc

class _$AnnouncementArticleInfoImpl extends _AnnouncementArticleInfo {
  const _$AnnouncementArticleInfoImpl(
      {required this.total,
      required this.endCursor,
      required final List<AnnouncementArticleItem> announcementList})
      : _announcementList = announcementList,
        super._();

  @override
  final int total;
  @override
  final String endCursor;
  final List<AnnouncementArticleItem> _announcementList;
  @override
  List<AnnouncementArticleItem> get announcementList {
    if (_announcementList is EqualUnmodifiableListView)
      return _announcementList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_announcementList);
  }

  @override
  String toString() {
    return 'AnnouncementArticleInfo(total: $total, endCursor: $endCursor, announcementList: $announcementList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementArticleInfoImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.endCursor, endCursor) ||
                other.endCursor == endCursor) &&
            const DeepCollectionEquality()
                .equals(other._announcementList, _announcementList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, total, endCursor,
      const DeepCollectionEquality().hash(_announcementList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementArticleInfoImplCopyWith<_$AnnouncementArticleInfoImpl>
      get copyWith => __$$AnnouncementArticleInfoImplCopyWithImpl<
          _$AnnouncementArticleInfoImpl>(this, _$identity);
}

abstract class _AnnouncementArticleInfo extends AnnouncementArticleInfo {
  const factory _AnnouncementArticleInfo(
          {required final int total,
          required final String endCursor,
          required final List<AnnouncementArticleItem> announcementList}) =
      _$AnnouncementArticleInfoImpl;
  const _AnnouncementArticleInfo._() : super._();

  @override
  int get total;
  @override
  String get endCursor;
  @override
  List<AnnouncementArticleItem> get announcementList;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementArticleInfoImplCopyWith<_$AnnouncementArticleInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnnouncementArticleItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  HtmlContent get content => throw _privateConstructorUsedError;
  DateTimeStringValue get publishedDate => throw _privateConstructorUsedError;
  DateTimeStringValue get releaseDate => throw _privateConstructorUsedError;
  List<BranchAndIc4Info> get branchInfo => throw _privateConstructorUsedError;
  List<BranchAndIc4Info> get iC4Info => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;
  String get manufacturer => throw _privateConstructorUsedError;
  List<String> get documents => throw _privateConstructorUsedError;
  bool get pinToTop => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementArticleItemCopyWith<AnnouncementArticleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementArticleItemCopyWith<$Res> {
  factory $AnnouncementArticleItemCopyWith(AnnouncementArticleItem value,
          $Res Function(AnnouncementArticleItem) then) =
      _$AnnouncementArticleItemCopyWithImpl<$Res, AnnouncementArticleItem>;
  @useResult
  $Res call(
      {String id,
      String title,
      String summary,
      String thumbnail,
      HtmlContent content,
      DateTimeStringValue publishedDate,
      DateTimeStringValue releaseDate,
      List<BranchAndIc4Info> branchInfo,
      List<BranchAndIc4Info> iC4Info,
      String tag,
      String manufacturer,
      List<String> documents,
      bool pinToTop});
}

/// @nodoc
class _$AnnouncementArticleItemCopyWithImpl<$Res,
        $Val extends AnnouncementArticleItem>
    implements $AnnouncementArticleItemCopyWith<$Res> {
  _$AnnouncementArticleItemCopyWithImpl(this._value, this._then);

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
    Object? documents = null,
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
              as HtmlContent,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      branchInfo: null == branchInfo
          ? _value.branchInfo
          : branchInfo // ignore: cast_nullable_to_non_nullable
              as List<BranchAndIc4Info>,
      iC4Info: null == iC4Info
          ? _value.iC4Info
          : iC4Info // ignore: cast_nullable_to_non_nullable
              as List<BranchAndIc4Info>,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pinToTop: null == pinToTop
          ? _value.pinToTop
          : pinToTop // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnouncementArticleItemImplCopyWith<$Res>
    implements $AnnouncementArticleItemCopyWith<$Res> {
  factory _$$AnnouncementArticleItemImplCopyWith(
          _$AnnouncementArticleItemImpl value,
          $Res Function(_$AnnouncementArticleItemImpl) then) =
      __$$AnnouncementArticleItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String summary,
      String thumbnail,
      HtmlContent content,
      DateTimeStringValue publishedDate,
      DateTimeStringValue releaseDate,
      List<BranchAndIc4Info> branchInfo,
      List<BranchAndIc4Info> iC4Info,
      String tag,
      String manufacturer,
      List<String> documents,
      bool pinToTop});
}

/// @nodoc
class __$$AnnouncementArticleItemImplCopyWithImpl<$Res>
    extends _$AnnouncementArticleItemCopyWithImpl<$Res,
        _$AnnouncementArticleItemImpl>
    implements _$$AnnouncementArticleItemImplCopyWith<$Res> {
  __$$AnnouncementArticleItemImplCopyWithImpl(
      _$AnnouncementArticleItemImpl _value,
      $Res Function(_$AnnouncementArticleItemImpl) _then)
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
    Object? documents = null,
    Object? pinToTop = null,
  }) {
    return _then(_$AnnouncementArticleItemImpl(
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
              as HtmlContent,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      branchInfo: null == branchInfo
          ? _value._branchInfo
          : branchInfo // ignore: cast_nullable_to_non_nullable
              as List<BranchAndIc4Info>,
      iC4Info: null == iC4Info
          ? _value._iC4Info
          : iC4Info // ignore: cast_nullable_to_non_nullable
              as List<BranchAndIc4Info>,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pinToTop: null == pinToTop
          ? _value.pinToTop
          : pinToTop // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AnnouncementArticleItemImpl extends _AnnouncementArticleItem {
  const _$AnnouncementArticleItemImpl(
      {required this.id,
      required this.title,
      required this.summary,
      required this.thumbnail,
      required this.content,
      required this.publishedDate,
      required this.releaseDate,
      required final List<BranchAndIc4Info> branchInfo,
      required final List<BranchAndIc4Info> iC4Info,
      required this.tag,
      required this.manufacturer,
      required final List<String> documents,
      required this.pinToTop})
      : _branchInfo = branchInfo,
        _iC4Info = iC4Info,
        _documents = documents,
        super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final String summary;
  @override
  final String thumbnail;
  @override
  final HtmlContent content;
  @override
  final DateTimeStringValue publishedDate;
  @override
  final DateTimeStringValue releaseDate;
  final List<BranchAndIc4Info> _branchInfo;
  @override
  List<BranchAndIc4Info> get branchInfo {
    if (_branchInfo is EqualUnmodifiableListView) return _branchInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_branchInfo);
  }

  final List<BranchAndIc4Info> _iC4Info;
  @override
  List<BranchAndIc4Info> get iC4Info {
    if (_iC4Info is EqualUnmodifiableListView) return _iC4Info;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_iC4Info);
  }

  @override
  final String tag;
  @override
  final String manufacturer;
  final List<String> _documents;
  @override
  List<String> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  final bool pinToTop;

  @override
  String toString() {
    return 'AnnouncementArticleItem(id: $id, title: $title, summary: $summary, thumbnail: $thumbnail, content: $content, publishedDate: $publishedDate, releaseDate: $releaseDate, branchInfo: $branchInfo, iC4Info: $iC4Info, tag: $tag, manufacturer: $manufacturer, documents: $documents, pinToTop: $pinToTop)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementArticleItemImpl &&
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
                .equals(other._documents, _documents) &&
            (identical(other.pinToTop, pinToTop) ||
                other.pinToTop == pinToTop));
  }

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
      const DeepCollectionEquality().hash(_documents),
      pinToTop);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementArticleItemImplCopyWith<_$AnnouncementArticleItemImpl>
      get copyWith => __$$AnnouncementArticleItemImplCopyWithImpl<
          _$AnnouncementArticleItemImpl>(this, _$identity);
}

abstract class _AnnouncementArticleItem extends AnnouncementArticleItem {
  const factory _AnnouncementArticleItem(
      {required final String id,
      required final String title,
      required final String summary,
      required final String thumbnail,
      required final HtmlContent content,
      required final DateTimeStringValue publishedDate,
      required final DateTimeStringValue releaseDate,
      required final List<BranchAndIc4Info> branchInfo,
      required final List<BranchAndIc4Info> iC4Info,
      required final String tag,
      required final String manufacturer,
      required final List<String> documents,
      required final bool pinToTop}) = _$AnnouncementArticleItemImpl;
  const _AnnouncementArticleItem._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String get summary;
  @override
  String get thumbnail;
  @override
  HtmlContent get content;
  @override
  DateTimeStringValue get publishedDate;
  @override
  DateTimeStringValue get releaseDate;
  @override
  List<BranchAndIc4Info> get branchInfo;
  @override
  List<BranchAndIc4Info> get iC4Info;
  @override
  String get tag;
  @override
  String get manufacturer;
  @override
  List<String> get documents;
  @override
  bool get pinToTop;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementArticleItemImplCopyWith<_$AnnouncementArticleItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BranchAndIc4Info {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BranchAndIc4InfoCopyWith<BranchAndIc4Info> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchAndIc4InfoCopyWith<$Res> {
  factory $BranchAndIc4InfoCopyWith(
          BranchAndIc4Info value, $Res Function(BranchAndIc4Info) then) =
      _$BranchAndIc4InfoCopyWithImpl<$Res, BranchAndIc4Info>;
  @useResult
  $Res call({String id, String name, String displayName});
}

/// @nodoc
class _$BranchAndIc4InfoCopyWithImpl<$Res, $Val extends BranchAndIc4Info>
    implements $BranchAndIc4InfoCopyWith<$Res> {
  _$BranchAndIc4InfoCopyWithImpl(this._value, this._then);

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
abstract class _$$BranchAndIc4InfoImplCopyWith<$Res>
    implements $BranchAndIc4InfoCopyWith<$Res> {
  factory _$$BranchAndIc4InfoImplCopyWith(_$BranchAndIc4InfoImpl value,
          $Res Function(_$BranchAndIc4InfoImpl) then) =
      __$$BranchAndIc4InfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String displayName});
}

/// @nodoc
class __$$BranchAndIc4InfoImplCopyWithImpl<$Res>
    extends _$BranchAndIc4InfoCopyWithImpl<$Res, _$BranchAndIc4InfoImpl>
    implements _$$BranchAndIc4InfoImplCopyWith<$Res> {
  __$$BranchAndIc4InfoImplCopyWithImpl(_$BranchAndIc4InfoImpl _value,
      $Res Function(_$BranchAndIc4InfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
  }) {
    return _then(_$BranchAndIc4InfoImpl(
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

class _$BranchAndIc4InfoImpl extends _BranchAndIc4Info {
  const _$BranchAndIc4InfoImpl(
      {required this.id, required this.name, required this.displayName})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String displayName;

  @override
  String toString() {
    return 'BranchAndIc4Info(id: $id, name: $name, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchAndIc4InfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchAndIc4InfoImplCopyWith<_$BranchAndIc4InfoImpl> get copyWith =>
      __$$BranchAndIc4InfoImplCopyWithImpl<_$BranchAndIc4InfoImpl>(
          this, _$identity);
}

abstract class _BranchAndIc4Info extends BranchAndIc4Info {
  const factory _BranchAndIc4Info(
      {required final String id,
      required final String name,
      required final String displayName}) = _$BranchAndIc4InfoImpl;
  const _BranchAndIc4Info._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String get displayName;
  @override
  @JsonKey(ignore: true)
  _$$BranchAndIc4InfoImplCopyWith<_$BranchAndIc4InfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
