// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ArticlesInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user, SalesOrg salesOrg, ShipToInfo shipToInfo)
        initialize,
    required TResult Function() getArticles,
    required TResult Function() loadMoreArticles,
    required TResult Function(SearchKey searchKey) setSearchKey,
    required TResult Function(List<String> categoryKeyList) setCategoryKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg, ShipToInfo shipToInfo)?
        initialize,
    TResult? Function()? getArticles,
    TResult? Function()? loadMoreArticles,
    TResult? Function(SearchKey searchKey)? setSearchKey,
    TResult? Function(List<String> categoryKeyList)? setCategoryKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg, ShipToInfo shipToInfo)?
        initialize,
    TResult Function()? getArticles,
    TResult Function()? loadMoreArticles,
    TResult Function(SearchKey searchKey)? setSearchKey,
    TResult Function(List<String> categoryKeyList)? setCategoryKey,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetArticles value) getArticles,
    required TResult Function(_LoadMoreArticles value) loadMoreArticles,
    required TResult Function(_SetSearchKey value) setSearchKey,
    required TResult Function(_SetCategoryKey value) setCategoryKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetArticles value)? getArticles,
    TResult? Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult? Function(_SetSearchKey value)? setSearchKey,
    TResult? Function(_SetCategoryKey value)? setCategoryKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetArticles value)? getArticles,
    TResult Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult Function(_SetSearchKey value)? setSearchKey,
    TResult Function(_SetCategoryKey value)? setCategoryKey,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesInfoEventCopyWith<$Res> {
  factory $ArticlesInfoEventCopyWith(
          ArticlesInfoEvent value, $Res Function(ArticlesInfoEvent) then) =
      _$ArticlesInfoEventCopyWithImpl<$Res, ArticlesInfoEvent>;
}

/// @nodoc
class _$ArticlesInfoEventCopyWithImpl<$Res, $Val extends ArticlesInfoEvent>
    implements $ArticlesInfoEventCopyWith<$Res> {
  _$ArticlesInfoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user, SalesOrg salesOrg, ShipToInfo shipToInfo});

  $UserCopyWith<$Res> get user;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$ArticlesInfoEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrg = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$InitializeImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(
      {required this.user, required this.salesOrg, required this.shipToInfo});

  @override
  final User user;
  @override
  final SalesOrg salesOrg;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'ArticlesInfoEvent.initialize(user: $user, salesOrg: $salesOrg, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, salesOrg, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user, SalesOrg salesOrg, ShipToInfo shipToInfo)
        initialize,
    required TResult Function() getArticles,
    required TResult Function() loadMoreArticles,
    required TResult Function(SearchKey searchKey) setSearchKey,
    required TResult Function(List<String> categoryKeyList) setCategoryKey,
  }) {
    return initialize(user, salesOrg, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg, ShipToInfo shipToInfo)?
        initialize,
    TResult? Function()? getArticles,
    TResult? Function()? loadMoreArticles,
    TResult? Function(SearchKey searchKey)? setSearchKey,
    TResult? Function(List<String> categoryKeyList)? setCategoryKey,
  }) {
    return initialize?.call(user, salesOrg, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg, ShipToInfo shipToInfo)?
        initialize,
    TResult Function()? getArticles,
    TResult Function()? loadMoreArticles,
    TResult Function(SearchKey searchKey)? setSearchKey,
    TResult Function(List<String> categoryKeyList)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(user, salesOrg, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetArticles value) getArticles,
    required TResult Function(_LoadMoreArticles value) loadMoreArticles,
    required TResult Function(_SetSearchKey value) setSearchKey,
    required TResult Function(_SetCategoryKey value) setCategoryKey,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetArticles value)? getArticles,
    TResult? Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult? Function(_SetSearchKey value)? setSearchKey,
    TResult? Function(_SetCategoryKey value)? setCategoryKey,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetArticles value)? getArticles,
    TResult Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult Function(_SetSearchKey value)? setSearchKey,
    TResult Function(_SetCategoryKey value)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ArticlesInfoEvent {
  const factory _Initialize(
      {required final User user,
      required final SalesOrg salesOrg,
      required final ShipToInfo shipToInfo}) = _$InitializeImpl;

  User get user;
  SalesOrg get salesOrg;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetArticlesImplCopyWith<$Res> {
  factory _$$GetArticlesImplCopyWith(
          _$GetArticlesImpl value, $Res Function(_$GetArticlesImpl) then) =
      __$$GetArticlesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetArticlesImplCopyWithImpl<$Res>
    extends _$ArticlesInfoEventCopyWithImpl<$Res, _$GetArticlesImpl>
    implements _$$GetArticlesImplCopyWith<$Res> {
  __$$GetArticlesImplCopyWithImpl(
      _$GetArticlesImpl _value, $Res Function(_$GetArticlesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetArticlesImpl implements _GetArticles {
  const _$GetArticlesImpl();

  @override
  String toString() {
    return 'ArticlesInfoEvent.getArticles()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetArticlesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user, SalesOrg salesOrg, ShipToInfo shipToInfo)
        initialize,
    required TResult Function() getArticles,
    required TResult Function() loadMoreArticles,
    required TResult Function(SearchKey searchKey) setSearchKey,
    required TResult Function(List<String> categoryKeyList) setCategoryKey,
  }) {
    return getArticles();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg, ShipToInfo shipToInfo)?
        initialize,
    TResult? Function()? getArticles,
    TResult? Function()? loadMoreArticles,
    TResult? Function(SearchKey searchKey)? setSearchKey,
    TResult? Function(List<String> categoryKeyList)? setCategoryKey,
  }) {
    return getArticles?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg, ShipToInfo shipToInfo)?
        initialize,
    TResult Function()? getArticles,
    TResult Function()? loadMoreArticles,
    TResult Function(SearchKey searchKey)? setSearchKey,
    TResult Function(List<String> categoryKeyList)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (getArticles != null) {
      return getArticles();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetArticles value) getArticles,
    required TResult Function(_LoadMoreArticles value) loadMoreArticles,
    required TResult Function(_SetSearchKey value) setSearchKey,
    required TResult Function(_SetCategoryKey value) setCategoryKey,
  }) {
    return getArticles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetArticles value)? getArticles,
    TResult? Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult? Function(_SetSearchKey value)? setSearchKey,
    TResult? Function(_SetCategoryKey value)? setCategoryKey,
  }) {
    return getArticles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetArticles value)? getArticles,
    TResult Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult Function(_SetSearchKey value)? setSearchKey,
    TResult Function(_SetCategoryKey value)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (getArticles != null) {
      return getArticles(this);
    }
    return orElse();
  }
}

abstract class _GetArticles implements ArticlesInfoEvent {
  const factory _GetArticles() = _$GetArticlesImpl;
}

/// @nodoc
abstract class _$$LoadMoreArticlesImplCopyWith<$Res> {
  factory _$$LoadMoreArticlesImplCopyWith(_$LoadMoreArticlesImpl value,
          $Res Function(_$LoadMoreArticlesImpl) then) =
      __$$LoadMoreArticlesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreArticlesImplCopyWithImpl<$Res>
    extends _$ArticlesInfoEventCopyWithImpl<$Res, _$LoadMoreArticlesImpl>
    implements _$$LoadMoreArticlesImplCopyWith<$Res> {
  __$$LoadMoreArticlesImplCopyWithImpl(_$LoadMoreArticlesImpl _value,
      $Res Function(_$LoadMoreArticlesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreArticlesImpl implements _LoadMoreArticles {
  const _$LoadMoreArticlesImpl();

  @override
  String toString() {
    return 'ArticlesInfoEvent.loadMoreArticles()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreArticlesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user, SalesOrg salesOrg, ShipToInfo shipToInfo)
        initialize,
    required TResult Function() getArticles,
    required TResult Function() loadMoreArticles,
    required TResult Function(SearchKey searchKey) setSearchKey,
    required TResult Function(List<String> categoryKeyList) setCategoryKey,
  }) {
    return loadMoreArticles();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg, ShipToInfo shipToInfo)?
        initialize,
    TResult? Function()? getArticles,
    TResult? Function()? loadMoreArticles,
    TResult? Function(SearchKey searchKey)? setSearchKey,
    TResult? Function(List<String> categoryKeyList)? setCategoryKey,
  }) {
    return loadMoreArticles?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg, ShipToInfo shipToInfo)?
        initialize,
    TResult Function()? getArticles,
    TResult Function()? loadMoreArticles,
    TResult Function(SearchKey searchKey)? setSearchKey,
    TResult Function(List<String> categoryKeyList)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (loadMoreArticles != null) {
      return loadMoreArticles();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetArticles value) getArticles,
    required TResult Function(_LoadMoreArticles value) loadMoreArticles,
    required TResult Function(_SetSearchKey value) setSearchKey,
    required TResult Function(_SetCategoryKey value) setCategoryKey,
  }) {
    return loadMoreArticles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetArticles value)? getArticles,
    TResult? Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult? Function(_SetSearchKey value)? setSearchKey,
    TResult? Function(_SetCategoryKey value)? setCategoryKey,
  }) {
    return loadMoreArticles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetArticles value)? getArticles,
    TResult Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult Function(_SetSearchKey value)? setSearchKey,
    TResult Function(_SetCategoryKey value)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (loadMoreArticles != null) {
      return loadMoreArticles(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreArticles implements ArticlesInfoEvent {
  const factory _LoadMoreArticles() = _$LoadMoreArticlesImpl;
}

/// @nodoc
abstract class _$$SetSearchKeyImplCopyWith<$Res> {
  factory _$$SetSearchKeyImplCopyWith(
          _$SetSearchKeyImpl value, $Res Function(_$SetSearchKeyImpl) then) =
      __$$SetSearchKeyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchKey searchKey});
}

/// @nodoc
class __$$SetSearchKeyImplCopyWithImpl<$Res>
    extends _$ArticlesInfoEventCopyWithImpl<$Res, _$SetSearchKeyImpl>
    implements _$$SetSearchKeyImplCopyWith<$Res> {
  __$$SetSearchKeyImplCopyWithImpl(
      _$SetSearchKeyImpl _value, $Res Function(_$SetSearchKeyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$SetSearchKeyImpl(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$SetSearchKeyImpl implements _SetSearchKey {
  const _$SetSearchKeyImpl({required this.searchKey});

  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ArticlesInfoEvent.setSearchKey(searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetSearchKeyImpl &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetSearchKeyImplCopyWith<_$SetSearchKeyImpl> get copyWith =>
      __$$SetSearchKeyImplCopyWithImpl<_$SetSearchKeyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user, SalesOrg salesOrg, ShipToInfo shipToInfo)
        initialize,
    required TResult Function() getArticles,
    required TResult Function() loadMoreArticles,
    required TResult Function(SearchKey searchKey) setSearchKey,
    required TResult Function(List<String> categoryKeyList) setCategoryKey,
  }) {
    return setSearchKey(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg, ShipToInfo shipToInfo)?
        initialize,
    TResult? Function()? getArticles,
    TResult? Function()? loadMoreArticles,
    TResult? Function(SearchKey searchKey)? setSearchKey,
    TResult? Function(List<String> categoryKeyList)? setCategoryKey,
  }) {
    return setSearchKey?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg, ShipToInfo shipToInfo)?
        initialize,
    TResult Function()? getArticles,
    TResult Function()? loadMoreArticles,
    TResult Function(SearchKey searchKey)? setSearchKey,
    TResult Function(List<String> categoryKeyList)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (setSearchKey != null) {
      return setSearchKey(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetArticles value) getArticles,
    required TResult Function(_LoadMoreArticles value) loadMoreArticles,
    required TResult Function(_SetSearchKey value) setSearchKey,
    required TResult Function(_SetCategoryKey value) setCategoryKey,
  }) {
    return setSearchKey(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetArticles value)? getArticles,
    TResult? Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult? Function(_SetSearchKey value)? setSearchKey,
    TResult? Function(_SetCategoryKey value)? setCategoryKey,
  }) {
    return setSearchKey?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetArticles value)? getArticles,
    TResult Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult Function(_SetSearchKey value)? setSearchKey,
    TResult Function(_SetCategoryKey value)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (setSearchKey != null) {
      return setSearchKey(this);
    }
    return orElse();
  }
}

abstract class _SetSearchKey implements ArticlesInfoEvent {
  const factory _SetSearchKey({required final SearchKey searchKey}) =
      _$SetSearchKeyImpl;

  SearchKey get searchKey;
  @JsonKey(ignore: true)
  _$$SetSearchKeyImplCopyWith<_$SetSearchKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetCategoryKeyImplCopyWith<$Res> {
  factory _$$SetCategoryKeyImplCopyWith(_$SetCategoryKeyImpl value,
          $Res Function(_$SetCategoryKeyImpl) then) =
      __$$SetCategoryKeyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> categoryKeyList});
}

/// @nodoc
class __$$SetCategoryKeyImplCopyWithImpl<$Res>
    extends _$ArticlesInfoEventCopyWithImpl<$Res, _$SetCategoryKeyImpl>
    implements _$$SetCategoryKeyImplCopyWith<$Res> {
  __$$SetCategoryKeyImplCopyWithImpl(
      _$SetCategoryKeyImpl _value, $Res Function(_$SetCategoryKeyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryKeyList = null,
  }) {
    return _then(_$SetCategoryKeyImpl(
      categoryKeyList: null == categoryKeyList
          ? _value._categoryKeyList
          : categoryKeyList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SetCategoryKeyImpl implements _SetCategoryKey {
  const _$SetCategoryKeyImpl({required final List<String> categoryKeyList})
      : _categoryKeyList = categoryKeyList;

  final List<String> _categoryKeyList;
  @override
  List<String> get categoryKeyList {
    if (_categoryKeyList is EqualUnmodifiableListView) return _categoryKeyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryKeyList);
  }

  @override
  String toString() {
    return 'ArticlesInfoEvent.setCategoryKey(categoryKeyList: $categoryKeyList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetCategoryKeyImpl &&
            const DeepCollectionEquality()
                .equals(other._categoryKeyList, _categoryKeyList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categoryKeyList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetCategoryKeyImplCopyWith<_$SetCategoryKeyImpl> get copyWith =>
      __$$SetCategoryKeyImplCopyWithImpl<_$SetCategoryKeyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user, SalesOrg salesOrg, ShipToInfo shipToInfo)
        initialize,
    required TResult Function() getArticles,
    required TResult Function() loadMoreArticles,
    required TResult Function(SearchKey searchKey) setSearchKey,
    required TResult Function(List<String> categoryKeyList) setCategoryKey,
  }) {
    return setCategoryKey(categoryKeyList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg, ShipToInfo shipToInfo)?
        initialize,
    TResult? Function()? getArticles,
    TResult? Function()? loadMoreArticles,
    TResult? Function(SearchKey searchKey)? setSearchKey,
    TResult? Function(List<String> categoryKeyList)? setCategoryKey,
  }) {
    return setCategoryKey?.call(categoryKeyList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg, ShipToInfo shipToInfo)?
        initialize,
    TResult Function()? getArticles,
    TResult Function()? loadMoreArticles,
    TResult Function(SearchKey searchKey)? setSearchKey,
    TResult Function(List<String> categoryKeyList)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (setCategoryKey != null) {
      return setCategoryKey(categoryKeyList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetArticles value) getArticles,
    required TResult Function(_LoadMoreArticles value) loadMoreArticles,
    required TResult Function(_SetSearchKey value) setSearchKey,
    required TResult Function(_SetCategoryKey value) setCategoryKey,
  }) {
    return setCategoryKey(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetArticles value)? getArticles,
    TResult? Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult? Function(_SetSearchKey value)? setSearchKey,
    TResult? Function(_SetCategoryKey value)? setCategoryKey,
  }) {
    return setCategoryKey?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetArticles value)? getArticles,
    TResult Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult Function(_SetSearchKey value)? setSearchKey,
    TResult Function(_SetCategoryKey value)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (setCategoryKey != null) {
      return setCategoryKey(this);
    }
    return orElse();
  }
}

abstract class _SetCategoryKey implements ArticlesInfoEvent {
  const factory _SetCategoryKey({required final List<String> categoryKeyList}) =
      _$SetCategoryKeyImpl;

  List<String> get categoryKeyList;
  @JsonKey(ignore: true)
  _$$SetCategoryKeyImplCopyWith<_$SetCategoryKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ArticlesInfoState {
  User get user => throw _privateConstructorUsedError;
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  AnnouncementArticleInfo get articleInfo => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  List<String> get categoryKeyList => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticlesInfoStateCopyWith<ArticlesInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesInfoStateCopyWith<$Res> {
  factory $ArticlesInfoStateCopyWith(
          ArticlesInfoState value, $Res Function(ArticlesInfoState) then) =
      _$ArticlesInfoStateCopyWithImpl<$Res, ArticlesInfoState>;
  @useResult
  $Res call(
      {User user,
      SalesOrg salesOrg,
      ShipToInfo shipToInfo,
      AnnouncementArticleInfo articleInfo,
      bool isFetching,
      bool canLoadMore,
      SearchKey searchKey,
      List<String> categoryKeyList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  $UserCopyWith<$Res> get user;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $AnnouncementArticleInfoCopyWith<$Res> get articleInfo;
}

/// @nodoc
class _$ArticlesInfoStateCopyWithImpl<$Res, $Val extends ArticlesInfoState>
    implements $ArticlesInfoStateCopyWith<$Res> {
  _$ArticlesInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrg = null,
    Object? shipToInfo = null,
    Object? articleInfo = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? searchKey = null,
    Object? categoryKeyList = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      articleInfo: null == articleInfo
          ? _value.articleInfo
          : articleInfo // ignore: cast_nullable_to_non_nullable
              as AnnouncementArticleInfo,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      categoryKeyList: null == categoryKeyList
          ? _value.categoryKeyList
          : categoryKeyList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AnnouncementArticleInfoCopyWith<$Res> get articleInfo {
    return $AnnouncementArticleInfoCopyWith<$Res>(_value.articleInfo, (value) {
      return _then(_value.copyWith(articleInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArticlesInfoStateImplCopyWith<$Res>
    implements $ArticlesInfoStateCopyWith<$Res> {
  factory _$$ArticlesInfoStateImplCopyWith(_$ArticlesInfoStateImpl value,
          $Res Function(_$ArticlesInfoStateImpl) then) =
      __$$ArticlesInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      SalesOrg salesOrg,
      ShipToInfo shipToInfo,
      AnnouncementArticleInfo articleInfo,
      bool isFetching,
      bool canLoadMore,
      SearchKey searchKey,
      List<String> categoryKeyList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $AnnouncementArticleInfoCopyWith<$Res> get articleInfo;
}

/// @nodoc
class __$$ArticlesInfoStateImplCopyWithImpl<$Res>
    extends _$ArticlesInfoStateCopyWithImpl<$Res, _$ArticlesInfoStateImpl>
    implements _$$ArticlesInfoStateImplCopyWith<$Res> {
  __$$ArticlesInfoStateImplCopyWithImpl(_$ArticlesInfoStateImpl _value,
      $Res Function(_$ArticlesInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrg = null,
    Object? shipToInfo = null,
    Object? articleInfo = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? searchKey = null,
    Object? categoryKeyList = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$ArticlesInfoStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      articleInfo: null == articleInfo
          ? _value.articleInfo
          : articleInfo // ignore: cast_nullable_to_non_nullable
              as AnnouncementArticleInfo,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      categoryKeyList: null == categoryKeyList
          ? _value._categoryKeyList
          : categoryKeyList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ArticlesInfoStateImpl extends _ArticlesInfoState {
  const _$ArticlesInfoStateImpl(
      {required this.user,
      required this.salesOrg,
      required this.shipToInfo,
      required this.articleInfo,
      required this.isFetching,
      required this.canLoadMore,
      required this.searchKey,
      required final List<String> categoryKeyList,
      required this.apiFailureOrSuccessOption})
      : _categoryKeyList = categoryKeyList,
        super._();

  @override
  final User user;
  @override
  final SalesOrg salesOrg;
  @override
  final ShipToInfo shipToInfo;
  @override
  final AnnouncementArticleInfo articleInfo;
  @override
  final bool isFetching;
  @override
  final bool canLoadMore;
  @override
  final SearchKey searchKey;
  final List<String> _categoryKeyList;
  @override
  List<String> get categoryKeyList {
    if (_categoryKeyList is EqualUnmodifiableListView) return _categoryKeyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryKeyList);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'ArticlesInfoState(user: $user, salesOrg: $salesOrg, shipToInfo: $shipToInfo, articleInfo: $articleInfo, isFetching: $isFetching, canLoadMore: $canLoadMore, searchKey: $searchKey, categoryKeyList: $categoryKeyList, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticlesInfoStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.articleInfo, articleInfo) ||
                other.articleInfo == articleInfo) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            const DeepCollectionEquality()
                .equals(other._categoryKeyList, _categoryKeyList) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      salesOrg,
      shipToInfo,
      articleInfo,
      isFetching,
      canLoadMore,
      searchKey,
      const DeepCollectionEquality().hash(_categoryKeyList),
      apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticlesInfoStateImplCopyWith<_$ArticlesInfoStateImpl> get copyWith =>
      __$$ArticlesInfoStateImplCopyWithImpl<_$ArticlesInfoStateImpl>(
          this, _$identity);
}

abstract class _ArticlesInfoState extends ArticlesInfoState {
  const factory _ArticlesInfoState(
      {required final User user,
      required final SalesOrg salesOrg,
      required final ShipToInfo shipToInfo,
      required final AnnouncementArticleInfo articleInfo,
      required final bool isFetching,
      required final bool canLoadMore,
      required final SearchKey searchKey,
      required final List<String> categoryKeyList,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$ArticlesInfoStateImpl;
  const _ArticlesInfoState._() : super._();

  @override
  User get user;
  @override
  SalesOrg get salesOrg;
  @override
  ShipToInfo get shipToInfo;
  @override
  AnnouncementArticleInfo get articleInfo;
  @override
  bool get isFetching;
  @override
  bool get canLoadMore;
  @override
  SearchKey get searchKey;
  @override
  List<String> get categoryKeyList;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$ArticlesInfoStateImplCopyWith<_$ArticlesInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
