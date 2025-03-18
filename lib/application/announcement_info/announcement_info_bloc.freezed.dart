// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnnouncementInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, SalesOrg salesOrg) initialize,
    required TResult Function() fetch,
    required TResult Function() loadMore,
    required TResult Function(SearchKey searchKey) updateSearchKey,
    required TResult Function(List<String> categoryKeyList) setCategoryKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg)? initialize,
    TResult? Function()? fetch,
    TResult? Function()? loadMore,
    TResult? Function(SearchKey searchKey)? updateSearchKey,
    TResult? Function(List<String> categoryKeyList)? setCategoryKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg)? initialize,
    TResult Function()? fetch,
    TResult Function()? loadMore,
    TResult Function(SearchKey searchKey)? updateSearchKey,
    TResult Function(List<String> categoryKeyList)? setCategoryKey,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_SetCategoryKey value) setCategoryKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_SetCategoryKey value)? setCategoryKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_SetCategoryKey value)? setCategoryKey,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementInfoEventCopyWith<$Res> {
  factory $AnnouncementInfoEventCopyWith(AnnouncementInfoEvent value,
          $Res Function(AnnouncementInfoEvent) then) =
      _$AnnouncementInfoEventCopyWithImpl<$Res, AnnouncementInfoEvent>;
}

/// @nodoc
class _$AnnouncementInfoEventCopyWithImpl<$Res,
        $Val extends AnnouncementInfoEvent>
    implements $AnnouncementInfoEventCopyWith<$Res> {
  _$AnnouncementInfoEventCopyWithImpl(this._value, this._then);

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
  $Res call({User user, SalesOrg salesOrg});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$AnnouncementInfoEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrg = null,
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
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl({required this.user, required this.salesOrg});

  @override
  final User user;
  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'AnnouncementInfoEvent.initialize(user: $user, salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, SalesOrg salesOrg) initialize,
    required TResult Function() fetch,
    required TResult Function() loadMore,
    required TResult Function(SearchKey searchKey) updateSearchKey,
    required TResult Function(List<String> categoryKeyList) setCategoryKey,
  }) {
    return initialize(user, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg)? initialize,
    TResult? Function()? fetch,
    TResult? Function()? loadMore,
    TResult? Function(SearchKey searchKey)? updateSearchKey,
    TResult? Function(List<String> categoryKeyList)? setCategoryKey,
  }) {
    return initialize?.call(user, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg)? initialize,
    TResult Function()? fetch,
    TResult Function()? loadMore,
    TResult Function(SearchKey searchKey)? updateSearchKey,
    TResult Function(List<String> categoryKeyList)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(user, salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_SetCategoryKey value) setCategoryKey,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_SetCategoryKey value)? setCategoryKey,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_SetCategoryKey value)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements AnnouncementInfoEvent {
  const factory _Initialize(
      {required final User user,
      required final SalesOrg salesOrg}) = _$InitializeImpl;

  User get user;
  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$AnnouncementInfoEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl();

  @override
  String toString() {
    return 'AnnouncementInfoEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, SalesOrg salesOrg) initialize,
    required TResult Function() fetch,
    required TResult Function() loadMore,
    required TResult Function(SearchKey searchKey) updateSearchKey,
    required TResult Function(List<String> categoryKeyList) setCategoryKey,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg)? initialize,
    TResult? Function()? fetch,
    TResult? Function()? loadMore,
    TResult? Function(SearchKey searchKey)? updateSearchKey,
    TResult? Function(List<String> categoryKeyList)? setCategoryKey,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg)? initialize,
    TResult Function()? fetch,
    TResult Function()? loadMore,
    TResult Function(SearchKey searchKey)? updateSearchKey,
    TResult Function(List<String> categoryKeyList)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_SetCategoryKey value) setCategoryKey,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_SetCategoryKey value)? setCategoryKey,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_SetCategoryKey value)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements AnnouncementInfoEvent {
  const factory _Fetch() = _$FetchImpl;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
          _$LoadMoreImpl value, $Res Function(_$LoadMoreImpl) then) =
      __$$LoadMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreImplCopyWithImpl<$Res>
    extends _$AnnouncementInfoEventCopyWithImpl<$Res, _$LoadMoreImpl>
    implements _$$LoadMoreImplCopyWith<$Res> {
  __$$LoadMoreImplCopyWithImpl(
      _$LoadMoreImpl _value, $Res Function(_$LoadMoreImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreImpl implements _LoadMore {
  const _$LoadMoreImpl();

  @override
  String toString() {
    return 'AnnouncementInfoEvent.loadMore()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, SalesOrg salesOrg) initialize,
    required TResult Function() fetch,
    required TResult Function() loadMore,
    required TResult Function(SearchKey searchKey) updateSearchKey,
    required TResult Function(List<String> categoryKeyList) setCategoryKey,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg)? initialize,
    TResult? Function()? fetch,
    TResult? Function()? loadMore,
    TResult? Function(SearchKey searchKey)? updateSearchKey,
    TResult? Function(List<String> categoryKeyList)? setCategoryKey,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg)? initialize,
    TResult Function()? fetch,
    TResult Function()? loadMore,
    TResult Function(SearchKey searchKey)? updateSearchKey,
    TResult Function(List<String> categoryKeyList)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_SetCategoryKey value) setCategoryKey,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_SetCategoryKey value)? setCategoryKey,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_SetCategoryKey value)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements AnnouncementInfoEvent {
  const factory _LoadMore() = _$LoadMoreImpl;
}

/// @nodoc
abstract class _$$UpdateSearchKeyImplCopyWith<$Res> {
  factory _$$UpdateSearchKeyImplCopyWith(_$UpdateSearchKeyImpl value,
          $Res Function(_$UpdateSearchKeyImpl) then) =
      __$$UpdateSearchKeyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchKey searchKey});
}

/// @nodoc
class __$$UpdateSearchKeyImplCopyWithImpl<$Res>
    extends _$AnnouncementInfoEventCopyWithImpl<$Res, _$UpdateSearchKeyImpl>
    implements _$$UpdateSearchKeyImplCopyWith<$Res> {
  __$$UpdateSearchKeyImplCopyWithImpl(
      _$UpdateSearchKeyImpl _value, $Res Function(_$UpdateSearchKeyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$UpdateSearchKeyImpl(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$UpdateSearchKeyImpl implements _UpdateSearchKey {
  const _$UpdateSearchKeyImpl({required this.searchKey});

  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'AnnouncementInfoEvent.updateSearchKey(searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSearchKeyImpl &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSearchKeyImplCopyWith<_$UpdateSearchKeyImpl> get copyWith =>
      __$$UpdateSearchKeyImplCopyWithImpl<_$UpdateSearchKeyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, SalesOrg salesOrg) initialize,
    required TResult Function() fetch,
    required TResult Function() loadMore,
    required TResult Function(SearchKey searchKey) updateSearchKey,
    required TResult Function(List<String> categoryKeyList) setCategoryKey,
  }) {
    return updateSearchKey(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg)? initialize,
    TResult? Function()? fetch,
    TResult? Function()? loadMore,
    TResult? Function(SearchKey searchKey)? updateSearchKey,
    TResult? Function(List<String> categoryKeyList)? setCategoryKey,
  }) {
    return updateSearchKey?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg)? initialize,
    TResult Function()? fetch,
    TResult Function()? loadMore,
    TResult Function(SearchKey searchKey)? updateSearchKey,
    TResult Function(List<String> categoryKeyList)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (updateSearchKey != null) {
      return updateSearchKey(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_SetCategoryKey value) setCategoryKey,
  }) {
    return updateSearchKey(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_SetCategoryKey value)? setCategoryKey,
  }) {
    return updateSearchKey?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_SetCategoryKey value)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (updateSearchKey != null) {
      return updateSearchKey(this);
    }
    return orElse();
  }
}

abstract class _UpdateSearchKey implements AnnouncementInfoEvent {
  const factory _UpdateSearchKey({required final SearchKey searchKey}) =
      _$UpdateSearchKeyImpl;

  SearchKey get searchKey;
  @JsonKey(ignore: true)
  _$$UpdateSearchKeyImplCopyWith<_$UpdateSearchKeyImpl> get copyWith =>
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
    extends _$AnnouncementInfoEventCopyWithImpl<$Res, _$SetCategoryKeyImpl>
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
    return 'AnnouncementInfoEvent.setCategoryKey(categoryKeyList: $categoryKeyList)';
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
    required TResult Function(User user, SalesOrg salesOrg) initialize,
    required TResult Function() fetch,
    required TResult Function() loadMore,
    required TResult Function(SearchKey searchKey) updateSearchKey,
    required TResult Function(List<String> categoryKeyList) setCategoryKey,
  }) {
    return setCategoryKey(categoryKeyList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg)? initialize,
    TResult? Function()? fetch,
    TResult? Function()? loadMore,
    TResult? Function(SearchKey searchKey)? updateSearchKey,
    TResult? Function(List<String> categoryKeyList)? setCategoryKey,
  }) {
    return setCategoryKey?.call(categoryKeyList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg)? initialize,
    TResult Function()? fetch,
    TResult Function()? loadMore,
    TResult Function(SearchKey searchKey)? updateSearchKey,
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
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_SetCategoryKey value) setCategoryKey,
  }) {
    return setCategoryKey(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_SetCategoryKey value)? setCategoryKey,
  }) {
    return setCategoryKey?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_SetCategoryKey value)? setCategoryKey,
    required TResult orElse(),
  }) {
    if (setCategoryKey != null) {
      return setCategoryKey(this);
    }
    return orElse();
  }
}

abstract class _SetCategoryKey implements AnnouncementInfoEvent {
  const factory _SetCategoryKey({required final List<String> categoryKeyList}) =
      _$SetCategoryKeyImpl;

  List<String> get categoryKeyList;
  @JsonKey(ignore: true)
  _$$SetCategoryKeyImplCopyWith<_$SetCategoryKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnnouncementInfoState {
  User get user => throw _privateConstructorUsedError;
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  AnnouncementArticleInfo get announcementInfo =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  List<String> get categoryKeyList => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementInfoStateCopyWith<AnnouncementInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementInfoStateCopyWith<$Res> {
  factory $AnnouncementInfoStateCopyWith(AnnouncementInfoState value,
          $Res Function(AnnouncementInfoState) then) =
      _$AnnouncementInfoStateCopyWithImpl<$Res, AnnouncementInfoState>;
  @useResult
  $Res call(
      {User user,
      SalesOrg salesOrg,
      AnnouncementArticleInfo announcementInfo,
      bool isLoading,
      bool canLoadMore,
      SearchKey searchKey,
      List<String> categoryKeyList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  $UserCopyWith<$Res> get user;
  $AnnouncementArticleInfoCopyWith<$Res> get announcementInfo;
}

/// @nodoc
class _$AnnouncementInfoStateCopyWithImpl<$Res,
        $Val extends AnnouncementInfoState>
    implements $AnnouncementInfoStateCopyWith<$Res> {
  _$AnnouncementInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrg = null,
    Object? announcementInfo = null,
    Object? isLoading = null,
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
      announcementInfo: null == announcementInfo
          ? _value.announcementInfo
          : announcementInfo // ignore: cast_nullable_to_non_nullable
              as AnnouncementArticleInfo,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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
  $AnnouncementArticleInfoCopyWith<$Res> get announcementInfo {
    return $AnnouncementArticleInfoCopyWith<$Res>(_value.announcementInfo,
        (value) {
      return _then(_value.copyWith(announcementInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnnouncementInfoStateImplCopyWith<$Res>
    implements $AnnouncementInfoStateCopyWith<$Res> {
  factory _$$AnnouncementInfoStateImplCopyWith(
          _$AnnouncementInfoStateImpl value,
          $Res Function(_$AnnouncementInfoStateImpl) then) =
      __$$AnnouncementInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      SalesOrg salesOrg,
      AnnouncementArticleInfo announcementInfo,
      bool isLoading,
      bool canLoadMore,
      SearchKey searchKey,
      List<String> categoryKeyList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $AnnouncementArticleInfoCopyWith<$Res> get announcementInfo;
}

/// @nodoc
class __$$AnnouncementInfoStateImplCopyWithImpl<$Res>
    extends _$AnnouncementInfoStateCopyWithImpl<$Res,
        _$AnnouncementInfoStateImpl>
    implements _$$AnnouncementInfoStateImplCopyWith<$Res> {
  __$$AnnouncementInfoStateImplCopyWithImpl(_$AnnouncementInfoStateImpl _value,
      $Res Function(_$AnnouncementInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrg = null,
    Object? announcementInfo = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
    Object? searchKey = null,
    Object? categoryKeyList = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$AnnouncementInfoStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      announcementInfo: null == announcementInfo
          ? _value.announcementInfo
          : announcementInfo // ignore: cast_nullable_to_non_nullable
              as AnnouncementArticleInfo,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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

class _$AnnouncementInfoStateImpl extends _AnnouncementInfoState {
  const _$AnnouncementInfoStateImpl(
      {required this.user,
      required this.salesOrg,
      required this.announcementInfo,
      required this.isLoading,
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
  final AnnouncementArticleInfo announcementInfo;
  @override
  final bool isLoading;
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
    return 'AnnouncementInfoState(user: $user, salesOrg: $salesOrg, announcementInfo: $announcementInfo, isLoading: $isLoading, canLoadMore: $canLoadMore, searchKey: $searchKey, categoryKeyList: $categoryKeyList, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementInfoStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.announcementInfo, announcementInfo) ||
                other.announcementInfo == announcementInfo) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
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
      announcementInfo,
      isLoading,
      canLoadMore,
      searchKey,
      const DeepCollectionEquality().hash(_categoryKeyList),
      apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementInfoStateImplCopyWith<_$AnnouncementInfoStateImpl>
      get copyWith => __$$AnnouncementInfoStateImplCopyWithImpl<
          _$AnnouncementInfoStateImpl>(this, _$identity);
}

abstract class _AnnouncementInfoState extends AnnouncementInfoState {
  const factory _AnnouncementInfoState(
      {required final User user,
      required final SalesOrg salesOrg,
      required final AnnouncementArticleInfo announcementInfo,
      required final bool isLoading,
      required final bool canLoadMore,
      required final SearchKey searchKey,
      required final List<String> categoryKeyList,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$AnnouncementInfoStateImpl;
  const _AnnouncementInfoState._() : super._();

  @override
  User get user;
  @override
  SalesOrg get salesOrg;
  @override
  AnnouncementArticleInfo get announcementInfo;
  @override
  bool get isLoading;
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
  _$$AnnouncementInfoStateImplCopyWith<_$AnnouncementInfoStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
