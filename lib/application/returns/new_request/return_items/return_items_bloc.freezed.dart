// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_items_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReturnItemsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(
            ReturnItemsFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(ReturnItemsFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(ReturnItemsFilter appliedFilter, SearchKey searchKey)?
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
abstract class $ReturnItemsEventCopyWith<$Res> {
  factory $ReturnItemsEventCopyWith(
          ReturnItemsEvent value, $Res Function(ReturnItemsEvent) then) =
      _$ReturnItemsEventCopyWithImpl<$Res, ReturnItemsEvent>;
}

/// @nodoc
class _$ReturnItemsEventCopyWithImpl<$Res, $Val extends ReturnItemsEvent>
    implements $ReturnItemsEventCopyWith<$Res> {
  _$ReturnItemsEventCopyWithImpl(this._value, this._then);

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
      {User user,
      SalesOrganisation salesOrganisation,
      ShipToInfo shipToInfo,
      CustomerCodeInfo customerCodeInfo});

  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$ReturnItemsEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrganisation = null,
    Object? shipToInfo = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$InitializedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(
      {required this.user,
      required this.salesOrganisation,
      required this.shipToInfo,
      required this.customerCodeInfo});

  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final ShipToInfo shipToInfo;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'ReturnItemsEvent.initialized(user: $user, salesOrganisation: $salesOrganisation, shipToInfo: $shipToInfo, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, user, salesOrganisation, shipToInfo, customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(
            ReturnItemsFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
  }) {
    return initialized(user, salesOrganisation, shipToInfo, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(ReturnItemsFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
  }) {
    return initialized?.call(
        user, salesOrganisation, shipToInfo, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(ReturnItemsFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(user, salesOrganisation, shipToInfo, customerCodeInfo);
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

abstract class _Initialized implements ReturnItemsEvent {
  const factory _Initialized(
      {required final User user,
      required final SalesOrganisation salesOrganisation,
      required final ShipToInfo shipToInfo,
      required final CustomerCodeInfo customerCodeInfo}) = _$InitializedImpl;

  User get user;
  SalesOrganisation get salesOrganisation;
  ShipToInfo get shipToInfo;
  CustomerCodeInfo get customerCodeInfo;
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
  $Res call({ReturnItemsFilter appliedFilter, SearchKey searchKey});

  $ReturnItemsFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$ReturnItemsEventCopyWithImpl<$Res, _$FetchImpl>
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
              as ReturnItemsFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnItemsFilterCopyWith<$Res> get appliedFilter {
    return $ReturnItemsFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.appliedFilter, required this.searchKey});

  @override
  final ReturnItemsFilter appliedFilter;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ReturnItemsEvent.fetch(appliedFilter: $appliedFilter, searchKey: $searchKey)';
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
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(
            ReturnItemsFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
  }) {
    return fetch(appliedFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(ReturnItemsFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
  }) {
    return fetch?.call(appliedFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(ReturnItemsFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
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

abstract class _Fetch implements ReturnItemsEvent {
  const factory _Fetch(
      {required final ReturnItemsFilter appliedFilter,
      required final SearchKey searchKey}) = _$FetchImpl;

  ReturnItemsFilter get appliedFilter;
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
    extends _$ReturnItemsEventCopyWithImpl<$Res, _$LoadMoreImpl>
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
    return 'ReturnItemsEvent.loadMore()';
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
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(
            ReturnItemsFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(ReturnItemsFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(ReturnItemsFilter appliedFilter, SearchKey searchKey)?
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

abstract class _LoadMore implements ReturnItemsEvent {
  const factory _LoadMore() = _$LoadMoreImpl;
}

/// @nodoc
mixin _$ReturnItemsState {
  User get user => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ReturnItemsFilter get appliedFilter => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  List<ReturnMaterial> get items => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, ReturnMaterialList>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnItemsStateCopyWith<ReturnItemsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnItemsStateCopyWith<$Res> {
  factory $ReturnItemsStateCopyWith(
          ReturnItemsState value, $Res Function(ReturnItemsState) then) =
      _$ReturnItemsStateCopyWithImpl<$Res, ReturnItemsState>;
  @useResult
  $Res call(
      {User user,
      SalesOrganisation salesOrganisation,
      ShipToInfo shipToInfo,
      CustomerCodeInfo customerCodeInfo,
      ReturnItemsFilter appliedFilter,
      SearchKey searchKey,
      List<ReturnMaterial> items,
      Option<Either<ApiFailure, ReturnMaterialList>> failureOrSuccessOption,
      bool isLoading,
      bool canLoadMore});

  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ReturnItemsFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class _$ReturnItemsStateCopyWithImpl<$Res, $Val extends ReturnItemsState>
    implements $ReturnItemsStateCopyWith<$Res> {
  _$ReturnItemsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrganisation = null,
    Object? shipToInfo = null,
    Object? customerCodeInfo = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
    Object? items = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ReturnItemsFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterial>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, ReturnMaterialList>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
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
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnItemsFilterCopyWith<$Res> get appliedFilter {
    return $ReturnItemsFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReturnItemsStateImplCopyWith<$Res>
    implements $ReturnItemsStateCopyWith<$Res> {
  factory _$$ReturnItemsStateImplCopyWith(_$ReturnItemsStateImpl value,
          $Res Function(_$ReturnItemsStateImpl) then) =
      __$$ReturnItemsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      SalesOrganisation salesOrganisation,
      ShipToInfo shipToInfo,
      CustomerCodeInfo customerCodeInfo,
      ReturnItemsFilter appliedFilter,
      SearchKey searchKey,
      List<ReturnMaterial> items,
      Option<Either<ApiFailure, ReturnMaterialList>> failureOrSuccessOption,
      bool isLoading,
      bool canLoadMore});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ReturnItemsFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$ReturnItemsStateImplCopyWithImpl<$Res>
    extends _$ReturnItemsStateCopyWithImpl<$Res, _$ReturnItemsStateImpl>
    implements _$$ReturnItemsStateImplCopyWith<$Res> {
  __$$ReturnItemsStateImplCopyWithImpl(_$ReturnItemsStateImpl _value,
      $Res Function(_$ReturnItemsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrganisation = null,
    Object? shipToInfo = null,
    Object? customerCodeInfo = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
    Object? items = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
  }) {
    return _then(_$ReturnItemsStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ReturnItemsFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterial>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, ReturnMaterialList>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReturnItemsStateImpl extends _ReturnItemsState {
  const _$ReturnItemsStateImpl(
      {required this.user,
      required this.salesOrganisation,
      required this.shipToInfo,
      required this.customerCodeInfo,
      required this.appliedFilter,
      required this.searchKey,
      required final List<ReturnMaterial> items,
      required this.failureOrSuccessOption,
      required this.isLoading,
      required this.canLoadMore})
      : _items = items,
        super._();

  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final ShipToInfo shipToInfo;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ReturnItemsFilter appliedFilter;
  @override
  final SearchKey searchKey;
  final List<ReturnMaterial> _items;
  @override
  List<ReturnMaterial> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final Option<Either<ApiFailure, ReturnMaterialList>> failureOrSuccessOption;
  @override
  final bool isLoading;
  @override
  final bool canLoadMore;

  @override
  String toString() {
    return 'ReturnItemsState(user: $user, salesOrganisation: $salesOrganisation, shipToInfo: $shipToInfo, customerCodeInfo: $customerCodeInfo, appliedFilter: $appliedFilter, searchKey: $searchKey, items: $items, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading, canLoadMore: $canLoadMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnItemsStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      salesOrganisation,
      shipToInfo,
      customerCodeInfo,
      appliedFilter,
      searchKey,
      const DeepCollectionEquality().hash(_items),
      failureOrSuccessOption,
      isLoading,
      canLoadMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnItemsStateImplCopyWith<_$ReturnItemsStateImpl> get copyWith =>
      __$$ReturnItemsStateImplCopyWithImpl<_$ReturnItemsStateImpl>(
          this, _$identity);
}

abstract class _ReturnItemsState extends ReturnItemsState {
  const factory _ReturnItemsState(
      {required final User user,
      required final SalesOrganisation salesOrganisation,
      required final ShipToInfo shipToInfo,
      required final CustomerCodeInfo customerCodeInfo,
      required final ReturnItemsFilter appliedFilter,
      required final SearchKey searchKey,
      required final List<ReturnMaterial> items,
      required final Option<Either<ApiFailure, ReturnMaterialList>>
          failureOrSuccessOption,
      required final bool isLoading,
      required final bool canLoadMore}) = _$ReturnItemsStateImpl;
  const _ReturnItemsState._() : super._();

  @override
  User get user;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  ShipToInfo get shipToInfo;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ReturnItemsFilter get appliedFilter;
  @override
  SearchKey get searchKey;
  @override
  List<ReturnMaterial> get items;
  @override
  Option<Either<ApiFailure, ReturnMaterialList>> get failureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  bool get canLoadMore;
  @override
  @JsonKey(ignore: true)
  _$$ReturnItemsStateImplCopyWith<_$ReturnItemsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
