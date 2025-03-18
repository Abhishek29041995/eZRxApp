// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_list_by_request_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReturnListByRequestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
    required TResult Function() downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult? Function()? loadMore,
    TResult? Function()? downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult Function()? loadMore,
    TResult Function()? downloadFile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_DownloadFile value) downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnListByRequestEventCopyWith<$Res> {
  factory $ReturnListByRequestEventCopyWith(ReturnListByRequestEvent value,
          $Res Function(ReturnListByRequestEvent) then) =
      _$ReturnListByRequestEventCopyWithImpl<$Res, ReturnListByRequestEvent>;
}

/// @nodoc
class _$ReturnListByRequestEventCopyWithImpl<$Res,
        $Val extends ReturnListByRequestEvent>
    implements $ReturnListByRequestEventCopyWith<$Res> {
  _$ReturnListByRequestEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      ShipToInfo shipInfo,
      CustomerCodeInfo customerCodeInfo,
      User user});

  $ShipToInfoCopyWith<$Res> get shipInfo;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$ReturnListByRequestEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? shipInfo = null,
    Object? customerCodeInfo = null,
    Object? user = null,
  }) {
    return _then(_$InitializedImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      shipInfo: null == shipInfo
          ? _value.shipInfo
          : shipInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipInfo, (value) {
      return _then(_value.copyWith(shipInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
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

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(
      {required this.salesOrg,
      required this.shipInfo,
      required this.customerCodeInfo,
      required this.user});

  @override
  final SalesOrg salesOrg;
  @override
  final ShipToInfo shipInfo;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;

  @override
  String toString() {
    return 'ReturnListByRequestEvent.initialized(salesOrg: $salesOrg, shipInfo: $shipInfo, customerCodeInfo: $customerCodeInfo, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.shipInfo, shipInfo) ||
                other.shipInfo == shipInfo) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrg, shipInfo, customerCodeInfo, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
    required TResult Function() downloadFile,
  }) {
    return initialized(salesOrg, shipInfo, customerCodeInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult? Function()? loadMore,
    TResult? Function()? downloadFile,
  }) {
    return initialized?.call(salesOrg, shipInfo, customerCodeInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult Function()? loadMore,
    TResult Function()? downloadFile,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrg, shipInfo, customerCodeInfo, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_DownloadFile value) downloadFile,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ReturnListByRequestEvent {
  const factory _Initialized(
      {required final SalesOrg salesOrg,
      required final ShipToInfo shipInfo,
      required final CustomerCodeInfo customerCodeInfo,
      required final User user}) = _$InitializedImpl;

  SalesOrg get salesOrg;
  ShipToInfo get shipInfo;
  CustomerCodeInfo get customerCodeInfo;
  User get user;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReturnFilter appliedFilter, SearchKey searchKey});

  $ReturnFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$ReturnListByRequestEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appliedFilter = null,
    Object? searchKey = null,
  }) {
    return _then(_$FetchImpl(
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ReturnFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnFilterCopyWith<$Res> get appliedFilter {
    return $ReturnFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.appliedFilter, required this.searchKey});

  @override
  final ReturnFilter appliedFilter;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ReturnListByRequestEvent.fetch(appliedFilter: $appliedFilter, searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appliedFilter, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
    required TResult Function() downloadFile,
  }) {
    return fetch(appliedFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult? Function()? loadMore,
    TResult? Function()? downloadFile,
  }) {
    return fetch?.call(appliedFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult Function()? loadMore,
    TResult Function()? downloadFile,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(appliedFilter, searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_DownloadFile value) downloadFile,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ReturnListByRequestEvent {
  const factory _Fetch(
      {required final ReturnFilter appliedFilter,
      required final SearchKey searchKey}) = _$FetchImpl;

  ReturnFilter get appliedFilter;
  SearchKey get searchKey;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
          _$LoadMoreImpl value, $Res Function(_$LoadMoreImpl) then) =
      __$$LoadMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreImplCopyWithImpl<$Res>
    extends _$ReturnListByRequestEventCopyWithImpl<$Res, _$LoadMoreImpl>
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
    return 'ReturnListByRequestEvent.loadMore()';
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
    required TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
    required TResult Function() downloadFile,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult? Function()? loadMore,
    TResult? Function()? downloadFile,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult Function()? loadMore,
    TResult Function()? downloadFile,
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
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_DownloadFile value) downloadFile,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements ReturnListByRequestEvent {
  const factory _LoadMore() = _$LoadMoreImpl;
}

/// @nodoc
abstract class _$$DownloadFileImplCopyWith<$Res> {
  factory _$$DownloadFileImplCopyWith(
          _$DownloadFileImpl value, $Res Function(_$DownloadFileImpl) then) =
      __$$DownloadFileImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadFileImplCopyWithImpl<$Res>
    extends _$ReturnListByRequestEventCopyWithImpl<$Res, _$DownloadFileImpl>
    implements _$$DownloadFileImplCopyWith<$Res> {
  __$$DownloadFileImplCopyWithImpl(
      _$DownloadFileImpl _value, $Res Function(_$DownloadFileImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownloadFileImpl implements _DownloadFile {
  const _$DownloadFileImpl();

  @override
  String toString() {
    return 'ReturnListByRequestEvent.downloadFile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownloadFileImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
    required TResult Function() downloadFile,
  }) {
    return downloadFile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult? Function()? loadMore,
    TResult? Function()? downloadFile,
  }) {
    return downloadFile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult Function()? loadMore,
    TResult Function()? downloadFile,
    required TResult orElse(),
  }) {
    if (downloadFile != null) {
      return downloadFile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_DownloadFile value) downloadFile,
  }) {
    return downloadFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) {
    return downloadFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) {
    if (downloadFile != null) {
      return downloadFile(this);
    }
    return orElse();
  }
}

abstract class _DownloadFile implements ReturnListByRequestEvent {
  const factory _DownloadFile() = _$DownloadFileImpl;
}

/// @nodoc
mixin _$ReturnListByRequestState {
  List<ReturnItem> get returnItemList => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  ReturnFilter get appliedFilter => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipInfo => throw _privateConstructorUsedError;
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  bool get isDownloadInProgress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnListByRequestStateCopyWith<ReturnListByRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnListByRequestStateCopyWith<$Res> {
  factory $ReturnListByRequestStateCopyWith(ReturnListByRequestState value,
          $Res Function(ReturnListByRequestState) then) =
      _$ReturnListByRequestStateCopyWithImpl<$Res, ReturnListByRequestState>;
  @useResult
  $Res call(
      {List<ReturnItem> returnItemList,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isFetching,
      bool canLoadMore,
      ReturnFilter appliedFilter,
      SearchKey searchKey,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipInfo,
      SalesOrg salesOrg,
      User user,
      bool isDownloadInProgress});

  $ReturnFilterCopyWith<$Res> get appliedFilter;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$ReturnListByRequestStateCopyWithImpl<$Res,
        $Val extends ReturnListByRequestState>
    implements $ReturnListByRequestStateCopyWith<$Res> {
  _$ReturnListByRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnItemList = null,
    Object? failureOrSuccessOption = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
    Object? customerCodeInfo = null,
    Object? shipInfo = null,
    Object? salesOrg = null,
    Object? user = null,
    Object? isDownloadInProgress = null,
  }) {
    return _then(_value.copyWith(
      returnItemList: null == returnItemList
          ? _value.returnItemList
          : returnItemList // ignore: cast_nullable_to_non_nullable
              as List<ReturnItem>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ReturnFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipInfo: null == shipInfo
          ? _value.shipInfo
          : shipInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isDownloadInProgress: null == isDownloadInProgress
          ? _value.isDownloadInProgress
          : isDownloadInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnFilterCopyWith<$Res> get appliedFilter {
    return $ReturnFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipInfo, (value) {
      return _then(_value.copyWith(shipInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReturnListByRequestStateImplCopyWith<$Res>
    implements $ReturnListByRequestStateCopyWith<$Res> {
  factory _$$ReturnListByRequestStateImplCopyWith(
          _$ReturnListByRequestStateImpl value,
          $Res Function(_$ReturnListByRequestStateImpl) then) =
      __$$ReturnListByRequestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ReturnItem> returnItemList,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isFetching,
      bool canLoadMore,
      ReturnFilter appliedFilter,
      SearchKey searchKey,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipInfo,
      SalesOrg salesOrg,
      User user,
      bool isDownloadInProgress});

  @override
  $ReturnFilterCopyWith<$Res> get appliedFilter;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipInfo;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$ReturnListByRequestStateImplCopyWithImpl<$Res>
    extends _$ReturnListByRequestStateCopyWithImpl<$Res,
        _$ReturnListByRequestStateImpl>
    implements _$$ReturnListByRequestStateImplCopyWith<$Res> {
  __$$ReturnListByRequestStateImplCopyWithImpl(
      _$ReturnListByRequestStateImpl _value,
      $Res Function(_$ReturnListByRequestStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnItemList = null,
    Object? failureOrSuccessOption = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
    Object? customerCodeInfo = null,
    Object? shipInfo = null,
    Object? salesOrg = null,
    Object? user = null,
    Object? isDownloadInProgress = null,
  }) {
    return _then(_$ReturnListByRequestStateImpl(
      returnItemList: null == returnItemList
          ? _value._returnItemList
          : returnItemList // ignore: cast_nullable_to_non_nullable
              as List<ReturnItem>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ReturnFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipInfo: null == shipInfo
          ? _value.shipInfo
          : shipInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isDownloadInProgress: null == isDownloadInProgress
          ? _value.isDownloadInProgress
          : isDownloadInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReturnListByRequestStateImpl extends _ReturnListByRequestState {
  const _$ReturnListByRequestStateImpl(
      {required final List<ReturnItem> returnItemList,
      required this.failureOrSuccessOption,
      required this.isFetching,
      required this.canLoadMore,
      required this.appliedFilter,
      required this.searchKey,
      required this.customerCodeInfo,
      required this.shipInfo,
      required this.salesOrg,
      required this.user,
      required this.isDownloadInProgress})
      : _returnItemList = returnItemList,
        super._();

  final List<ReturnItem> _returnItemList;
  @override
  List<ReturnItem> get returnItemList {
    if (_returnItemList is EqualUnmodifiableListView) return _returnItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_returnItemList);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool isFetching;
  @override
  final bool canLoadMore;
  @override
  final ReturnFilter appliedFilter;
  @override
  final SearchKey searchKey;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipInfo;
  @override
  final SalesOrg salesOrg;
  @override
  final User user;
  @override
  final bool isDownloadInProgress;

  @override
  String toString() {
    return 'ReturnListByRequestState(returnItemList: $returnItemList, failureOrSuccessOption: $failureOrSuccessOption, isFetching: $isFetching, canLoadMore: $canLoadMore, appliedFilter: $appliedFilter, searchKey: $searchKey, customerCodeInfo: $customerCodeInfo, shipInfo: $shipInfo, salesOrg: $salesOrg, user: $user, isDownloadInProgress: $isDownloadInProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnListByRequestStateImpl &&
            const DeepCollectionEquality()
                .equals(other._returnItemList, _returnItemList) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipInfo, shipInfo) ||
                other.shipInfo == shipInfo) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isDownloadInProgress, isDownloadInProgress) ||
                other.isDownloadInProgress == isDownloadInProgress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_returnItemList),
      failureOrSuccessOption,
      isFetching,
      canLoadMore,
      appliedFilter,
      searchKey,
      customerCodeInfo,
      shipInfo,
      salesOrg,
      user,
      isDownloadInProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnListByRequestStateImplCopyWith<_$ReturnListByRequestStateImpl>
      get copyWith => __$$ReturnListByRequestStateImplCopyWithImpl<
          _$ReturnListByRequestStateImpl>(this, _$identity);
}

abstract class _ReturnListByRequestState extends ReturnListByRequestState {
  const factory _ReturnListByRequestState(
      {required final List<ReturnItem> returnItemList,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isFetching,
      required final bool canLoadMore,
      required final ReturnFilter appliedFilter,
      required final SearchKey searchKey,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipInfo,
      required final SalesOrg salesOrg,
      required final User user,
      required final bool
          isDownloadInProgress}) = _$ReturnListByRequestStateImpl;
  const _ReturnListByRequestState._() : super._();

  @override
  List<ReturnItem> get returnItemList;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isFetching;
  @override
  bool get canLoadMore;
  @override
  ReturnFilter get appliedFilter;
  @override
  SearchKey get searchKey;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipInfo;
  @override
  SalesOrg get salesOrg;
  @override
  User get user;
  @override
  bool get isDownloadInProgress;
  @override
  @JsonKey(ignore: true)
  _$$ReturnListByRequestStateImplCopyWith<_$ReturnListByRequestStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
