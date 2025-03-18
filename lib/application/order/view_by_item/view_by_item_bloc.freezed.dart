// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_item_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewByItemsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            ViewByItemFilter viewByItemFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
    required TResult Function(List<OrderHistoryItem> orderHistoryItems)
        fetchOrdersInvoiceData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
    TResult? Function(List<OrderHistoryItem> orderHistoryItems)?
        fetchOrdersInvoiceData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
    TResult Function(List<OrderHistoryItem> orderHistoryItems)?
        fetchOrdersInvoiceData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchOrdersInvoiceData value)
        fetchOrdersInvoiceData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByItemsEventCopyWith<$Res> {
  factory $ViewByItemsEventCopyWith(
          ViewByItemsEvent value, $Res Function(ViewByItemsEvent) then) =
      _$ViewByItemsEventCopyWithImpl<$Res, ViewByItemsEvent>;
}

/// @nodoc
class _$ViewByItemsEventCopyWithImpl<$Res, $Val extends ViewByItemsEvent>
    implements $ViewByItemsEventCopyWith<$Res> {
  _$ViewByItemsEventCopyWithImpl(this._value, this._then);

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
      {SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      SalesOrganisation salesOrganisation});

  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$ViewByItemsEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrgConfigs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? salesOrganisation = null,
  }) {
    return _then(_$InitializedImpl(
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ));
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(
      {required this.salesOrgConfigs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.salesOrganisation});

  @override
  final SalesOrganisationConfigs salesOrgConfigs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'ViewByItemsEvent.initialized(salesOrgConfigs: $salesOrgConfigs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.salesOrgConfigs, salesOrgConfigs) ||
                other.salesOrgConfigs == salesOrgConfigs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrgConfigs,
      customerCodeInfo, shipToInfo, user, salesOrganisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            ViewByItemFilter viewByItemFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
    required TResult Function(List<OrderHistoryItem> orderHistoryItems)
        fetchOrdersInvoiceData,
  }) {
    return initialized(
        salesOrgConfigs, customerCodeInfo, shipToInfo, user, salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
    TResult? Function(List<OrderHistoryItem> orderHistoryItems)?
        fetchOrdersInvoiceData,
  }) {
    return initialized?.call(
        salesOrgConfigs, customerCodeInfo, shipToInfo, user, salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
    TResult Function(List<OrderHistoryItem> orderHistoryItems)?
        fetchOrdersInvoiceData,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrgConfigs, customerCodeInfo, shipToInfo, user,
          salesOrganisation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchOrdersInvoiceData value)
        fetchOrdersInvoiceData,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ViewByItemsEvent {
  const factory _Initialized(
      {required final SalesOrganisationConfigs salesOrgConfigs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user,
      required final SalesOrganisation salesOrganisation}) = _$InitializedImpl;

  SalesOrganisationConfigs get salesOrgConfigs;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  User get user;
  SalesOrganisation get salesOrganisation;
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
  $Res call({ViewByItemFilter viewByItemFilter, SearchKey searchKey});

  $ViewByItemFilterCopyWith<$Res> get viewByItemFilter;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$ViewByItemsEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewByItemFilter = null,
    Object? searchKey = null,
  }) {
    return _then(_$FetchImpl(
      viewByItemFilter: null == viewByItemFilter
          ? _value.viewByItemFilter
          : viewByItemFilter // ignore: cast_nullable_to_non_nullable
              as ViewByItemFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewByItemFilterCopyWith<$Res> get viewByItemFilter {
    return $ViewByItemFilterCopyWith<$Res>(_value.viewByItemFilter, (value) {
      return _then(_value.copyWith(viewByItemFilter: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.viewByItemFilter, required this.searchKey});

  @override
  final ViewByItemFilter viewByItemFilter;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ViewByItemsEvent.fetch(viewByItemFilter: $viewByItemFilter, searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.viewByItemFilter, viewByItemFilter) ||
                other.viewByItemFilter == viewByItemFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewByItemFilter, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            ViewByItemFilter viewByItemFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
    required TResult Function(List<OrderHistoryItem> orderHistoryItems)
        fetchOrdersInvoiceData,
  }) {
    return fetch(viewByItemFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
    TResult? Function(List<OrderHistoryItem> orderHistoryItems)?
        fetchOrdersInvoiceData,
  }) {
    return fetch?.call(viewByItemFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
    TResult Function(List<OrderHistoryItem> orderHistoryItems)?
        fetchOrdersInvoiceData,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(viewByItemFilter, searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchOrdersInvoiceData value)
        fetchOrdersInvoiceData,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ViewByItemsEvent {
  const factory _Fetch(
      {required final ViewByItemFilter viewByItemFilter,
      required final SearchKey searchKey}) = _$FetchImpl;

  ViewByItemFilter get viewByItemFilter;
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
    extends _$ViewByItemsEventCopyWithImpl<$Res, _$LoadMoreImpl>
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
    return 'ViewByItemsEvent.loadMore()';
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
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            ViewByItemFilter viewByItemFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
    required TResult Function(List<OrderHistoryItem> orderHistoryItems)
        fetchOrdersInvoiceData,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
    TResult? Function(List<OrderHistoryItem> orderHistoryItems)?
        fetchOrdersInvoiceData,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
    TResult Function(List<OrderHistoryItem> orderHistoryItems)?
        fetchOrdersInvoiceData,
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
    required TResult Function(_FetchOrdersInvoiceData value)
        fetchOrdersInvoiceData,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements ViewByItemsEvent {
  const factory _LoadMore() = _$LoadMoreImpl;
}

/// @nodoc
abstract class _$$FetchOrdersInvoiceDataImplCopyWith<$Res> {
  factory _$$FetchOrdersInvoiceDataImplCopyWith(
          _$FetchOrdersInvoiceDataImpl value,
          $Res Function(_$FetchOrdersInvoiceDataImpl) then) =
      __$$FetchOrdersInvoiceDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OrderHistoryItem> orderHistoryItems});
}

/// @nodoc
class __$$FetchOrdersInvoiceDataImplCopyWithImpl<$Res>
    extends _$ViewByItemsEventCopyWithImpl<$Res, _$FetchOrdersInvoiceDataImpl>
    implements _$$FetchOrdersInvoiceDataImplCopyWith<$Res> {
  __$$FetchOrdersInvoiceDataImplCopyWithImpl(
      _$FetchOrdersInvoiceDataImpl _value,
      $Res Function(_$FetchOrdersInvoiceDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderHistoryItems = null,
  }) {
    return _then(_$FetchOrdersInvoiceDataImpl(
      orderHistoryItems: null == orderHistoryItems
          ? _value._orderHistoryItems
          : orderHistoryItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryItem>,
    ));
  }
}

/// @nodoc

class _$FetchOrdersInvoiceDataImpl implements _FetchOrdersInvoiceData {
  const _$FetchOrdersInvoiceDataImpl(
      {required final List<OrderHistoryItem> orderHistoryItems})
      : _orderHistoryItems = orderHistoryItems;

  final List<OrderHistoryItem> _orderHistoryItems;
  @override
  List<OrderHistoryItem> get orderHistoryItems {
    if (_orderHistoryItems is EqualUnmodifiableListView)
      return _orderHistoryItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryItems);
  }

  @override
  String toString() {
    return 'ViewByItemsEvent.fetchOrdersInvoiceData(orderHistoryItems: $orderHistoryItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchOrdersInvoiceDataImpl &&
            const DeepCollectionEquality()
                .equals(other._orderHistoryItems, _orderHistoryItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_orderHistoryItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchOrdersInvoiceDataImplCopyWith<_$FetchOrdersInvoiceDataImpl>
      get copyWith => __$$FetchOrdersInvoiceDataImplCopyWithImpl<
          _$FetchOrdersInvoiceDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            ViewByItemFilter viewByItemFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
    required TResult Function(List<OrderHistoryItem> orderHistoryItems)
        fetchOrdersInvoiceData,
  }) {
    return fetchOrdersInvoiceData(orderHistoryItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
    TResult? Function(List<OrderHistoryItem> orderHistoryItems)?
        fetchOrdersInvoiceData,
  }) {
    return fetchOrdersInvoiceData?.call(orderHistoryItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
    TResult Function(List<OrderHistoryItem> orderHistoryItems)?
        fetchOrdersInvoiceData,
    required TResult orElse(),
  }) {
    if (fetchOrdersInvoiceData != null) {
      return fetchOrdersInvoiceData(orderHistoryItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchOrdersInvoiceData value)
        fetchOrdersInvoiceData,
  }) {
    return fetchOrdersInvoiceData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
  }) {
    return fetchOrdersInvoiceData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    required TResult orElse(),
  }) {
    if (fetchOrdersInvoiceData != null) {
      return fetchOrdersInvoiceData(this);
    }
    return orElse();
  }
}

abstract class _FetchOrdersInvoiceData implements ViewByItemsEvent {
  const factory _FetchOrdersInvoiceData(
          {required final List<OrderHistoryItem> orderHistoryItems}) =
      _$FetchOrdersInvoiceDataImpl;

  List<OrderHistoryItem> get orderHistoryItems;
  @JsonKey(ignore: true)
  _$$FetchOrdersInvoiceDataImplCopyWith<_$FetchOrdersInvoiceDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ViewByItemsState {
  SalesOrganisationConfigs get salesOrgConfigs =>
      throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  OrderHistory get orderHistory => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get isFetchingInvoices => throw _privateConstructorUsedError;
  int get nextPageIndex => throw _privateConstructorUsedError;
  ViewByItemFilter get appliedFilter => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByItemsStateCopyWith<ViewByItemsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByItemsStateCopyWith<$Res> {
  factory $ViewByItemsStateCopyWith(
          ViewByItemsState value, $Res Function(ViewByItemsState) then) =
      _$ViewByItemsStateCopyWithImpl<$Res, ViewByItemsState>;
  @useResult
  $Res call(
      {SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      SalesOrganisation salesOrganisation,
      OrderHistory orderHistory,
      bool canLoadMore,
      bool isFetching,
      bool isFetchingInvoices,
      int nextPageIndex,
      ViewByItemFilter appliedFilter,
      SearchKey searchKey,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $OrderHistoryCopyWith<$Res> get orderHistory;
  $ViewByItemFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class _$ViewByItemsStateCopyWithImpl<$Res, $Val extends ViewByItemsState>
    implements $ViewByItemsStateCopyWith<$Res> {
  _$ViewByItemsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrgConfigs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? salesOrganisation = null,
    Object? orderHistory = null,
    Object? canLoadMore = null,
    Object? isFetching = null,
    Object? isFetchingInvoices = null,
    Object? nextPageIndex = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      orderHistory: null == orderHistory
          ? _value.orderHistory
          : orderHistory // ignore: cast_nullable_to_non_nullable
              as OrderHistory,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingInvoices: null == isFetchingInvoices
          ? _value.isFetchingInvoices
          : isFetchingInvoices // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ViewByItemFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value) as $Val);
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryCopyWith<$Res> get orderHistory {
    return $OrderHistoryCopyWith<$Res>(_value.orderHistory, (value) {
      return _then(_value.copyWith(orderHistory: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewByItemFilterCopyWith<$Res> get appliedFilter {
    return $ViewByItemFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViewByItemsStateImplCopyWith<$Res>
    implements $ViewByItemsStateCopyWith<$Res> {
  factory _$$ViewByItemsStateImplCopyWith(_$ViewByItemsStateImpl value,
          $Res Function(_$ViewByItemsStateImpl) then) =
      __$$ViewByItemsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      SalesOrganisation salesOrganisation,
      OrderHistory orderHistory,
      bool canLoadMore,
      bool isFetching,
      bool isFetchingInvoices,
      int nextPageIndex,
      ViewByItemFilter appliedFilter,
      SearchKey searchKey,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $OrderHistoryCopyWith<$Res> get orderHistory;
  @override
  $ViewByItemFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$ViewByItemsStateImplCopyWithImpl<$Res>
    extends _$ViewByItemsStateCopyWithImpl<$Res, _$ViewByItemsStateImpl>
    implements _$$ViewByItemsStateImplCopyWith<$Res> {
  __$$ViewByItemsStateImplCopyWithImpl(_$ViewByItemsStateImpl _value,
      $Res Function(_$ViewByItemsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrgConfigs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? salesOrganisation = null,
    Object? orderHistory = null,
    Object? canLoadMore = null,
    Object? isFetching = null,
    Object? isFetchingInvoices = null,
    Object? nextPageIndex = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$ViewByItemsStateImpl(
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      orderHistory: null == orderHistory
          ? _value.orderHistory
          : orderHistory // ignore: cast_nullable_to_non_nullable
              as OrderHistory,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingInvoices: null == isFetchingInvoices
          ? _value.isFetchingInvoices
          : isFetchingInvoices // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ViewByItemFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ViewByItemsStateImpl extends _ViewByItemsState {
  const _$ViewByItemsStateImpl(
      {required this.salesOrgConfigs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.salesOrganisation,
      required this.orderHistory,
      required this.canLoadMore,
      required this.isFetching,
      required this.isFetchingInvoices,
      required this.nextPageIndex,
      required this.appliedFilter,
      required this.searchKey,
      required this.failureOrSuccessOption})
      : super._();

  @override
  final SalesOrganisationConfigs salesOrgConfigs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final OrderHistory orderHistory;
  @override
  final bool canLoadMore;
  @override
  final bool isFetching;
  @override
  final bool isFetchingInvoices;
  @override
  final int nextPageIndex;
  @override
  final ViewByItemFilter appliedFilter;
  @override
  final SearchKey searchKey;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'ViewByItemsState(salesOrgConfigs: $salesOrgConfigs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, salesOrganisation: $salesOrganisation, orderHistory: $orderHistory, canLoadMore: $canLoadMore, isFetching: $isFetching, isFetchingInvoices: $isFetchingInvoices, nextPageIndex: $nextPageIndex, appliedFilter: $appliedFilter, searchKey: $searchKey, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewByItemsStateImpl &&
            (identical(other.salesOrgConfigs, salesOrgConfigs) ||
                other.salesOrgConfigs == salesOrgConfigs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.orderHistory, orderHistory) ||
                other.orderHistory == orderHistory) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.isFetchingInvoices, isFetchingInvoices) ||
                other.isFetchingInvoices == isFetchingInvoices) &&
            (identical(other.nextPageIndex, nextPageIndex) ||
                other.nextPageIndex == nextPageIndex) &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrgConfigs,
      customerCodeInfo,
      shipToInfo,
      user,
      salesOrganisation,
      orderHistory,
      canLoadMore,
      isFetching,
      isFetchingInvoices,
      nextPageIndex,
      appliedFilter,
      searchKey,
      failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewByItemsStateImplCopyWith<_$ViewByItemsStateImpl> get copyWith =>
      __$$ViewByItemsStateImplCopyWithImpl<_$ViewByItemsStateImpl>(
          this, _$identity);
}

abstract class _ViewByItemsState extends ViewByItemsState {
  const factory _ViewByItemsState(
      {required final SalesOrganisationConfigs salesOrgConfigs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user,
      required final SalesOrganisation salesOrganisation,
      required final OrderHistory orderHistory,
      required final bool canLoadMore,
      required final bool isFetching,
      required final bool isFetchingInvoices,
      required final int nextPageIndex,
      required final ViewByItemFilter appliedFilter,
      required final SearchKey searchKey,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$ViewByItemsStateImpl;
  const _ViewByItemsState._() : super._();

  @override
  SalesOrganisationConfigs get salesOrgConfigs;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  User get user;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  OrderHistory get orderHistory;
  @override
  bool get canLoadMore;
  @override
  bool get isFetching;
  @override
  bool get isFetchingInvoices;
  @override
  int get nextPageIndex;
  @override
  ViewByItemFilter get appliedFilter;
  @override
  SearchKey get searchKey;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$ViewByItemsStateImplCopyWith<_$ViewByItemsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
