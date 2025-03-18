// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewByOrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            User user,
            String sortDirection,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(
            ViewByOrdersFilter filter, SearchKey searchKey, bool isDetailsPage)
        fetch,
    required TResult Function() loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            User user,
            String sortDirection,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(
            ViewByOrdersFilter filter, SearchKey searchKey, bool isDetailsPage)?
        fetch,
    TResult? Function()? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            User user,
            String sortDirection,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(
            ViewByOrdersFilter filter, SearchKey searchKey, bool isDetailsPage)?
        fetch,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderEventCopyWith<$Res> {
  factory $ViewByOrderEventCopyWith(
          ViewByOrderEvent value, $Res Function(ViewByOrderEvent) then) =
      _$ViewByOrderEventCopyWithImpl<$Res, ViewByOrderEvent>;
}

/// @nodoc
class _$ViewByOrderEventCopyWithImpl<$Res, $Val extends ViewByOrderEvent>
    implements $ViewByOrderEventCopyWith<$Res> {
  _$ViewByOrderEventCopyWithImpl(this._value, this._then);

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
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo,
      User user,
      String sortDirection,
      ShipToInfo shipToInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$ViewByOrderEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? salesOrgConfigs = null,
    Object? customerCodeInfo = null,
    Object? user = null,
    Object? sortDirection = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$InitializedImpl(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      sortDirection: null == sortDirection
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as String,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfigs,
        (value) {
      return _then(_value.copyWith(salesOrgConfigs: value));
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

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(
      {required this.salesOrganisation,
      required this.salesOrgConfigs,
      required this.customerCodeInfo,
      required this.user,
      required this.sortDirection,
      required this.shipToInfo});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesOrgConfigs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;
  @override
  final String sortDirection;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'ViewByOrderEvent.initialized(salesOrganisation: $salesOrganisation, salesOrgConfigs: $salesOrgConfigs, customerCodeInfo: $customerCodeInfo, user: $user, sortDirection: $sortDirection, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.salesOrgConfigs, salesOrgConfigs) ||
                other.salesOrgConfigs == salesOrgConfigs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.sortDirection, sortDirection) ||
                other.sortDirection == sortDirection) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation,
      salesOrgConfigs, customerCodeInfo, user, sortDirection, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            User user,
            String sortDirection,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(
            ViewByOrdersFilter filter, SearchKey searchKey, bool isDetailsPage)
        fetch,
    required TResult Function() loadMore,
  }) {
    return initialized(salesOrganisation, salesOrgConfigs, customerCodeInfo,
        user, sortDirection, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            User user,
            String sortDirection,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(
            ViewByOrdersFilter filter, SearchKey searchKey, bool isDetailsPage)?
        fetch,
    TResult? Function()? loadMore,
  }) {
    return initialized?.call(salesOrganisation, salesOrgConfigs,
        customerCodeInfo, user, sortDirection, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            User user,
            String sortDirection,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(
            ViewByOrdersFilter filter, SearchKey searchKey, bool isDetailsPage)?
        fetch,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganisation, salesOrgConfigs, customerCodeInfo,
          user, sortDirection, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ViewByOrderEvent {
  const factory _Initialized(
      {required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesOrgConfigs,
      required final CustomerCodeInfo customerCodeInfo,
      required final User user,
      required final String sortDirection,
      required final ShipToInfo shipToInfo}) = _$InitializedImpl;

  SalesOrganisation get salesOrganisation;
  SalesOrganisationConfigs get salesOrgConfigs;
  CustomerCodeInfo get customerCodeInfo;
  User get user;
  String get sortDirection;
  ShipToInfo get shipToInfo;
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
  $Res call(
      {ViewByOrdersFilter filter, SearchKey searchKey, bool isDetailsPage});

  $ViewByOrdersFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$ViewByOrderEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? searchKey = null,
    Object? isDetailsPage = null,
  }) {
    return _then(_$FetchImpl(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ViewByOrdersFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      isDetailsPage: null == isDetailsPage
          ? _value.isDetailsPage
          : isDetailsPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewByOrdersFilterCopyWith<$Res> get filter {
    return $ViewByOrdersFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {required this.filter,
      required this.searchKey,
      required this.isDetailsPage});

  @override
  final ViewByOrdersFilter filter;
  @override
  final SearchKey searchKey;
  @override
  final bool isDetailsPage;

  @override
  String toString() {
    return 'ViewByOrderEvent.fetch(filter: $filter, searchKey: $searchKey, isDetailsPage: $isDetailsPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.isDetailsPage, isDetailsPage) ||
                other.isDetailsPage == isDetailsPage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, filter, searchKey, isDetailsPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            User user,
            String sortDirection,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(
            ViewByOrdersFilter filter, SearchKey searchKey, bool isDetailsPage)
        fetch,
    required TResult Function() loadMore,
  }) {
    return fetch(filter, searchKey, isDetailsPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            User user,
            String sortDirection,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(
            ViewByOrdersFilter filter, SearchKey searchKey, bool isDetailsPage)?
        fetch,
    TResult? Function()? loadMore,
  }) {
    return fetch?.call(filter, searchKey, isDetailsPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            User user,
            String sortDirection,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(
            ViewByOrdersFilter filter, SearchKey searchKey, bool isDetailsPage)?
        fetch,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(filter, searchKey, isDetailsPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ViewByOrderEvent {
  const factory _Fetch(
      {required final ViewByOrdersFilter filter,
      required final SearchKey searchKey,
      required final bool isDetailsPage}) = _$FetchImpl;

  ViewByOrdersFilter get filter;
  SearchKey get searchKey;
  bool get isDetailsPage;
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
    extends _$ViewByOrderEventCopyWithImpl<$Res, _$LoadMoreImpl>
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
    return 'ViewByOrderEvent.loadMore()';
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
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            User user,
            String sortDirection,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(
            ViewByOrdersFilter filter, SearchKey searchKey, bool isDetailsPage)
        fetch,
    required TResult Function() loadMore,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            User user,
            String sortDirection,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(
            ViewByOrdersFilter filter, SearchKey searchKey, bool isDetailsPage)?
        fetch,
    TResult? Function()? loadMore,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            User user,
            String sortDirection,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(
            ViewByOrdersFilter filter, SearchKey searchKey, bool isDetailsPage)?
        fetch,
    TResult Function()? loadMore,
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
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements ViewByOrderEvent {
  const factory _LoadMore() = _$LoadMoreImpl;
}

/// @nodoc
mixin _$ViewByOrderState {
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get salesOrgConfigs =>
      throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  String get sortDirection => throw _privateConstructorUsedError;
  ViewByOrder get viewByOrderList => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  int get nextPageIndex => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  ViewByOrdersFilter get appliedFilter => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByOrderStateCopyWith<ViewByOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderStateCopyWith<$Res> {
  factory $ViewByOrderStateCopyWith(
          ViewByOrderState value, $Res Function(ViewByOrderState) then) =
      _$ViewByOrderStateCopyWithImpl<$Res, ViewByOrderState>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo,
      User user,
      String sortDirection,
      ViewByOrder viewByOrderList,
      bool canLoadMore,
      bool isFetching,
      SearchKey searchKey,
      int nextPageIndex,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      ViewByOrdersFilter appliedFilter,
      ShipToInfo shipToInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
  $ViewByOrderCopyWith<$Res> get viewByOrderList;
  $ViewByOrdersFilterCopyWith<$Res> get appliedFilter;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class _$ViewByOrderStateCopyWithImpl<$Res, $Val extends ViewByOrderState>
    implements $ViewByOrderStateCopyWith<$Res> {
  _$ViewByOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? salesOrgConfigs = null,
    Object? customerCodeInfo = null,
    Object? user = null,
    Object? sortDirection = null,
    Object? viewByOrderList = null,
    Object? canLoadMore = null,
    Object? isFetching = null,
    Object? searchKey = null,
    Object? nextPageIndex = null,
    Object? failureOrSuccessOption = null,
    Object? appliedFilter = null,
    Object? shipToInfo = null,
  }) {
    return _then(_value.copyWith(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      sortDirection: null == sortDirection
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as String,
      viewByOrderList: null == viewByOrderList
          ? _value.viewByOrderList
          : viewByOrderList // ignore: cast_nullable_to_non_nullable
              as ViewByOrder,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ViewByOrdersFilter,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfigs,
        (value) {
      return _then(_value.copyWith(salesOrgConfigs: value) as $Val);
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
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewByOrderCopyWith<$Res> get viewByOrderList {
    return $ViewByOrderCopyWith<$Res>(_value.viewByOrderList, (value) {
      return _then(_value.copyWith(viewByOrderList: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewByOrdersFilterCopyWith<$Res> get appliedFilter {
    return $ViewByOrdersFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViewByOrderStateImplCopyWith<$Res>
    implements $ViewByOrderStateCopyWith<$Res> {
  factory _$$ViewByOrderStateImplCopyWith(_$ViewByOrderStateImpl value,
          $Res Function(_$ViewByOrderStateImpl) then) =
      __$$ViewByOrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo,
      User user,
      String sortDirection,
      ViewByOrder viewByOrderList,
      bool canLoadMore,
      bool isFetching,
      SearchKey searchKey,
      int nextPageIndex,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      ViewByOrdersFilter appliedFilter,
      ShipToInfo shipToInfo});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $ViewByOrderCopyWith<$Res> get viewByOrderList;
  @override
  $ViewByOrdersFilterCopyWith<$Res> get appliedFilter;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$ViewByOrderStateImplCopyWithImpl<$Res>
    extends _$ViewByOrderStateCopyWithImpl<$Res, _$ViewByOrderStateImpl>
    implements _$$ViewByOrderStateImplCopyWith<$Res> {
  __$$ViewByOrderStateImplCopyWithImpl(_$ViewByOrderStateImpl _value,
      $Res Function(_$ViewByOrderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? salesOrgConfigs = null,
    Object? customerCodeInfo = null,
    Object? user = null,
    Object? sortDirection = null,
    Object? viewByOrderList = null,
    Object? canLoadMore = null,
    Object? isFetching = null,
    Object? searchKey = null,
    Object? nextPageIndex = null,
    Object? failureOrSuccessOption = null,
    Object? appliedFilter = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$ViewByOrderStateImpl(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      sortDirection: null == sortDirection
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as String,
      viewByOrderList: null == viewByOrderList
          ? _value.viewByOrderList
          : viewByOrderList // ignore: cast_nullable_to_non_nullable
              as ViewByOrder,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ViewByOrdersFilter,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }
}

/// @nodoc

class _$ViewByOrderStateImpl extends _ViewByOrderState {
  const _$ViewByOrderStateImpl(
      {required this.salesOrganisation,
      required this.salesOrgConfigs,
      required this.customerCodeInfo,
      required this.user,
      required this.sortDirection,
      required this.viewByOrderList,
      required this.canLoadMore,
      required this.isFetching,
      required this.searchKey,
      required this.nextPageIndex,
      required this.failureOrSuccessOption,
      required this.appliedFilter,
      required this.shipToInfo})
      : super._();

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesOrgConfigs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;
  @override
  final String sortDirection;
  @override
  final ViewByOrder viewByOrderList;
  @override
  final bool canLoadMore;
  @override
  final bool isFetching;
  @override
  final SearchKey searchKey;
  @override
  final int nextPageIndex;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final ViewByOrdersFilter appliedFilter;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'ViewByOrderState(salesOrganisation: $salesOrganisation, salesOrgConfigs: $salesOrgConfigs, customerCodeInfo: $customerCodeInfo, user: $user, sortDirection: $sortDirection, viewByOrderList: $viewByOrderList, canLoadMore: $canLoadMore, isFetching: $isFetching, searchKey: $searchKey, nextPageIndex: $nextPageIndex, failureOrSuccessOption: $failureOrSuccessOption, appliedFilter: $appliedFilter, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewByOrderStateImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.salesOrgConfigs, salesOrgConfigs) ||
                other.salesOrgConfigs == salesOrgConfigs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.sortDirection, sortDirection) ||
                other.sortDirection == sortDirection) &&
            (identical(other.viewByOrderList, viewByOrderList) ||
                other.viewByOrderList == viewByOrderList) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.nextPageIndex, nextPageIndex) ||
                other.nextPageIndex == nextPageIndex) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganisation,
      salesOrgConfigs,
      customerCodeInfo,
      user,
      sortDirection,
      viewByOrderList,
      canLoadMore,
      isFetching,
      searchKey,
      nextPageIndex,
      failureOrSuccessOption,
      appliedFilter,
      shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewByOrderStateImplCopyWith<_$ViewByOrderStateImpl> get copyWith =>
      __$$ViewByOrderStateImplCopyWithImpl<_$ViewByOrderStateImpl>(
          this, _$identity);
}

abstract class _ViewByOrderState extends ViewByOrderState {
  const factory _ViewByOrderState(
      {required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesOrgConfigs,
      required final CustomerCodeInfo customerCodeInfo,
      required final User user,
      required final String sortDirection,
      required final ViewByOrder viewByOrderList,
      required final bool canLoadMore,
      required final bool isFetching,
      required final SearchKey searchKey,
      required final int nextPageIndex,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final ViewByOrdersFilter appliedFilter,
      required final ShipToInfo shipToInfo}) = _$ViewByOrderStateImpl;
  const _ViewByOrderState._() : super._();

  @override
  SalesOrganisation get salesOrganisation;
  @override
  SalesOrganisationConfigs get salesOrgConfigs;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  User get user;
  @override
  String get sortDirection;
  @override
  ViewByOrder get viewByOrderList;
  @override
  bool get canLoadMore;
  @override
  bool get isFetching;
  @override
  SearchKey get searchKey;
  @override
  int get nextPageIndex;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  ViewByOrdersFilter get appliedFilter;
  @override
  ShipToInfo get shipToInfo;
  @override
  @JsonKey(ignore: true)
  _$$ViewByOrderStateImplCopyWith<_$ViewByOrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
