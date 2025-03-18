// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_item_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewByItemDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(StringValue invoiceNumber) fetchZyllemStatus,
    required TResult Function(bool isExpanded) updateIsExpanded,
    required TResult Function(OrderNumber orderNumber) fetchOrdersInvoiceData,
    required TResult Function(LineNumber lineNumber, OrderNumber orderNumber)
        fetchOrderHistoryDetails,
    required TResult Function() loadMoreInvoices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(StringValue invoiceNumber)? fetchZyllemStatus,
    TResult? Function(bool isExpanded)? updateIsExpanded,
    TResult? Function(OrderNumber orderNumber)? fetchOrdersInvoiceData,
    TResult? Function(LineNumber lineNumber, OrderNumber orderNumber)?
        fetchOrderHistoryDetails,
    TResult? Function()? loadMoreInvoices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(StringValue invoiceNumber)? fetchZyllemStatus,
    TResult Function(bool isExpanded)? updateIsExpanded,
    TResult Function(OrderNumber orderNumber)? fetchOrdersInvoiceData,
    TResult Function(LineNumber lineNumber, OrderNumber orderNumber)?
        fetchOrderHistoryDetails,
    TResult Function()? loadMoreInvoices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchZyllemStatus value) fetchZyllemStatus,
    required TResult Function(_updateIsExpanded value) updateIsExpanded,
    required TResult Function(_FetchOrdersInvoiceData value)
        fetchOrdersInvoiceData,
    required TResult Function(_FetchOrderHistoryDetails value)
        fetchOrderHistoryDetails,
    required TResult Function(_LoadMoreInvoices value) loadMoreInvoices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    TResult? Function(_updateIsExpanded value)? updateIsExpanded,
    TResult? Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    TResult? Function(_FetchOrderHistoryDetails value)?
        fetchOrderHistoryDetails,
    TResult? Function(_LoadMoreInvoices value)? loadMoreInvoices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    TResult Function(_updateIsExpanded value)? updateIsExpanded,
    TResult Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    TResult Function(_FetchOrderHistoryDetails value)? fetchOrderHistoryDetails,
    TResult Function(_LoadMoreInvoices value)? loadMoreInvoices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByItemDetailsEventCopyWith<$Res> {
  factory $ViewByItemDetailsEventCopyWith(ViewByItemDetailsEvent value,
          $Res Function(ViewByItemDetailsEvent) then) =
      _$ViewByItemDetailsEventCopyWithImpl<$Res, ViewByItemDetailsEvent>;
}

/// @nodoc
class _$ViewByItemDetailsEventCopyWithImpl<$Res,
        $Val extends ViewByItemDetailsEvent>
    implements $ViewByItemDetailsEventCopyWith<$Res> {
  _$ViewByItemDetailsEventCopyWithImpl(this._value, this._then);

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
      {CustomerCodeInfo customerCodeInfo,
      User user,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrgConfig,
      ShipToInfo shipToInfo});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$ViewByItemDetailsEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? user = null,
    Object? salesOrganisation = null,
    Object? salesOrgConfig = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$InitializedImpl(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrgConfig: null == salesOrgConfig
          ? _value.salesOrgConfig
          : salesOrgConfig // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfig,
        (value) {
      return _then(_value.copyWith(salesOrgConfig: value));
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
      {required this.customerCodeInfo,
      required this.user,
      required this.salesOrganisation,
      required this.salesOrgConfig,
      required this.shipToInfo});

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesOrgConfig;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'ViewByItemDetailsEvent.initialized(customerCodeInfo: $customerCodeInfo, user: $user, salesOrganisation: $salesOrganisation, salesOrgConfig: $salesOrgConfig, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.salesOrgConfig, salesOrgConfig) ||
                other.salesOrgConfig == salesOrgConfig) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCodeInfo, user,
      salesOrganisation, salesOrgConfig, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(StringValue invoiceNumber) fetchZyllemStatus,
    required TResult Function(bool isExpanded) updateIsExpanded,
    required TResult Function(OrderNumber orderNumber) fetchOrdersInvoiceData,
    required TResult Function(LineNumber lineNumber, OrderNumber orderNumber)
        fetchOrderHistoryDetails,
    required TResult Function() loadMoreInvoices,
  }) {
    return initialized(
        customerCodeInfo, user, salesOrganisation, salesOrgConfig, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(StringValue invoiceNumber)? fetchZyllemStatus,
    TResult? Function(bool isExpanded)? updateIsExpanded,
    TResult? Function(OrderNumber orderNumber)? fetchOrdersInvoiceData,
    TResult? Function(LineNumber lineNumber, OrderNumber orderNumber)?
        fetchOrderHistoryDetails,
    TResult? Function()? loadMoreInvoices,
  }) {
    return initialized?.call(
        customerCodeInfo, user, salesOrganisation, salesOrgConfig, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(StringValue invoiceNumber)? fetchZyllemStatus,
    TResult Function(bool isExpanded)? updateIsExpanded,
    TResult Function(OrderNumber orderNumber)? fetchOrdersInvoiceData,
    TResult Function(LineNumber lineNumber, OrderNumber orderNumber)?
        fetchOrderHistoryDetails,
    TResult Function()? loadMoreInvoices,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(customerCodeInfo, user, salesOrganisation,
          salesOrgConfig, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchZyllemStatus value) fetchZyllemStatus,
    required TResult Function(_updateIsExpanded value) updateIsExpanded,
    required TResult Function(_FetchOrdersInvoiceData value)
        fetchOrdersInvoiceData,
    required TResult Function(_FetchOrderHistoryDetails value)
        fetchOrderHistoryDetails,
    required TResult Function(_LoadMoreInvoices value) loadMoreInvoices,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    TResult? Function(_updateIsExpanded value)? updateIsExpanded,
    TResult? Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    TResult? Function(_FetchOrderHistoryDetails value)?
        fetchOrderHistoryDetails,
    TResult? Function(_LoadMoreInvoices value)? loadMoreInvoices,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    TResult Function(_updateIsExpanded value)? updateIsExpanded,
    TResult Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    TResult Function(_FetchOrderHistoryDetails value)? fetchOrderHistoryDetails,
    TResult Function(_LoadMoreInvoices value)? loadMoreInvoices,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ViewByItemDetailsEvent {
  const factory _Initialized(
      {required final CustomerCodeInfo customerCodeInfo,
      required final User user,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesOrgConfig,
      required final ShipToInfo shipToInfo}) = _$InitializedImpl;

  CustomerCodeInfo get customerCodeInfo;
  User get user;
  SalesOrganisation get salesOrganisation;
  SalesOrganisationConfigs get salesOrgConfig;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchZyllemStatusImplCopyWith<$Res> {
  factory _$$FetchZyllemStatusImplCopyWith(_$FetchZyllemStatusImpl value,
          $Res Function(_$FetchZyllemStatusImpl) then) =
      __$$FetchZyllemStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StringValue invoiceNumber});
}

/// @nodoc
class __$$FetchZyllemStatusImplCopyWithImpl<$Res>
    extends _$ViewByItemDetailsEventCopyWithImpl<$Res, _$FetchZyllemStatusImpl>
    implements _$$FetchZyllemStatusImplCopyWith<$Res> {
  __$$FetchZyllemStatusImplCopyWithImpl(_$FetchZyllemStatusImpl _value,
      $Res Function(_$FetchZyllemStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
  }) {
    return _then(_$FetchZyllemStatusImpl(
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$FetchZyllemStatusImpl implements _FetchZyllemStatus {
  const _$FetchZyllemStatusImpl({required this.invoiceNumber});

  @override
  final StringValue invoiceNumber;

  @override
  String toString() {
    return 'ViewByItemDetailsEvent.fetchZyllemStatus(invoiceNumber: $invoiceNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchZyllemStatusImpl &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchZyllemStatusImplCopyWith<_$FetchZyllemStatusImpl> get copyWith =>
      __$$FetchZyllemStatusImplCopyWithImpl<_$FetchZyllemStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(StringValue invoiceNumber) fetchZyllemStatus,
    required TResult Function(bool isExpanded) updateIsExpanded,
    required TResult Function(OrderNumber orderNumber) fetchOrdersInvoiceData,
    required TResult Function(LineNumber lineNumber, OrderNumber orderNumber)
        fetchOrderHistoryDetails,
    required TResult Function() loadMoreInvoices,
  }) {
    return fetchZyllemStatus(invoiceNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(StringValue invoiceNumber)? fetchZyllemStatus,
    TResult? Function(bool isExpanded)? updateIsExpanded,
    TResult? Function(OrderNumber orderNumber)? fetchOrdersInvoiceData,
    TResult? Function(LineNumber lineNumber, OrderNumber orderNumber)?
        fetchOrderHistoryDetails,
    TResult? Function()? loadMoreInvoices,
  }) {
    return fetchZyllemStatus?.call(invoiceNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(StringValue invoiceNumber)? fetchZyllemStatus,
    TResult Function(bool isExpanded)? updateIsExpanded,
    TResult Function(OrderNumber orderNumber)? fetchOrdersInvoiceData,
    TResult Function(LineNumber lineNumber, OrderNumber orderNumber)?
        fetchOrderHistoryDetails,
    TResult Function()? loadMoreInvoices,
    required TResult orElse(),
  }) {
    if (fetchZyllemStatus != null) {
      return fetchZyllemStatus(invoiceNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchZyllemStatus value) fetchZyllemStatus,
    required TResult Function(_updateIsExpanded value) updateIsExpanded,
    required TResult Function(_FetchOrdersInvoiceData value)
        fetchOrdersInvoiceData,
    required TResult Function(_FetchOrderHistoryDetails value)
        fetchOrderHistoryDetails,
    required TResult Function(_LoadMoreInvoices value) loadMoreInvoices,
  }) {
    return fetchZyllemStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    TResult? Function(_updateIsExpanded value)? updateIsExpanded,
    TResult? Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    TResult? Function(_FetchOrderHistoryDetails value)?
        fetchOrderHistoryDetails,
    TResult? Function(_LoadMoreInvoices value)? loadMoreInvoices,
  }) {
    return fetchZyllemStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    TResult Function(_updateIsExpanded value)? updateIsExpanded,
    TResult Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    TResult Function(_FetchOrderHistoryDetails value)? fetchOrderHistoryDetails,
    TResult Function(_LoadMoreInvoices value)? loadMoreInvoices,
    required TResult orElse(),
  }) {
    if (fetchZyllemStatus != null) {
      return fetchZyllemStatus(this);
    }
    return orElse();
  }
}

abstract class _FetchZyllemStatus implements ViewByItemDetailsEvent {
  const factory _FetchZyllemStatus({required final StringValue invoiceNumber}) =
      _$FetchZyllemStatusImpl;

  StringValue get invoiceNumber;
  @JsonKey(ignore: true)
  _$$FetchZyllemStatusImplCopyWith<_$FetchZyllemStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$updateIsExpandedImplCopyWith<$Res> {
  factory _$$updateIsExpandedImplCopyWith(_$updateIsExpandedImpl value,
          $Res Function(_$updateIsExpandedImpl) then) =
      __$$updateIsExpandedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isExpanded});
}

/// @nodoc
class __$$updateIsExpandedImplCopyWithImpl<$Res>
    extends _$ViewByItemDetailsEventCopyWithImpl<$Res, _$updateIsExpandedImpl>
    implements _$$updateIsExpandedImplCopyWith<$Res> {
  __$$updateIsExpandedImplCopyWithImpl(_$updateIsExpandedImpl _value,
      $Res Function(_$updateIsExpandedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpanded = null,
  }) {
    return _then(_$updateIsExpandedImpl(
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$updateIsExpandedImpl implements _updateIsExpanded {
  const _$updateIsExpandedImpl({required this.isExpanded});

  @override
  final bool isExpanded;

  @override
  String toString() {
    return 'ViewByItemDetailsEvent.updateIsExpanded(isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$updateIsExpandedImpl &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isExpanded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$updateIsExpandedImplCopyWith<_$updateIsExpandedImpl> get copyWith =>
      __$$updateIsExpandedImplCopyWithImpl<_$updateIsExpandedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(StringValue invoiceNumber) fetchZyllemStatus,
    required TResult Function(bool isExpanded) updateIsExpanded,
    required TResult Function(OrderNumber orderNumber) fetchOrdersInvoiceData,
    required TResult Function(LineNumber lineNumber, OrderNumber orderNumber)
        fetchOrderHistoryDetails,
    required TResult Function() loadMoreInvoices,
  }) {
    return updateIsExpanded(isExpanded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(StringValue invoiceNumber)? fetchZyllemStatus,
    TResult? Function(bool isExpanded)? updateIsExpanded,
    TResult? Function(OrderNumber orderNumber)? fetchOrdersInvoiceData,
    TResult? Function(LineNumber lineNumber, OrderNumber orderNumber)?
        fetchOrderHistoryDetails,
    TResult? Function()? loadMoreInvoices,
  }) {
    return updateIsExpanded?.call(isExpanded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(StringValue invoiceNumber)? fetchZyllemStatus,
    TResult Function(bool isExpanded)? updateIsExpanded,
    TResult Function(OrderNumber orderNumber)? fetchOrdersInvoiceData,
    TResult Function(LineNumber lineNumber, OrderNumber orderNumber)?
        fetchOrderHistoryDetails,
    TResult Function()? loadMoreInvoices,
    required TResult orElse(),
  }) {
    if (updateIsExpanded != null) {
      return updateIsExpanded(isExpanded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchZyllemStatus value) fetchZyllemStatus,
    required TResult Function(_updateIsExpanded value) updateIsExpanded,
    required TResult Function(_FetchOrdersInvoiceData value)
        fetchOrdersInvoiceData,
    required TResult Function(_FetchOrderHistoryDetails value)
        fetchOrderHistoryDetails,
    required TResult Function(_LoadMoreInvoices value) loadMoreInvoices,
  }) {
    return updateIsExpanded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    TResult? Function(_updateIsExpanded value)? updateIsExpanded,
    TResult? Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    TResult? Function(_FetchOrderHistoryDetails value)?
        fetchOrderHistoryDetails,
    TResult? Function(_LoadMoreInvoices value)? loadMoreInvoices,
  }) {
    return updateIsExpanded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    TResult Function(_updateIsExpanded value)? updateIsExpanded,
    TResult Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    TResult Function(_FetchOrderHistoryDetails value)? fetchOrderHistoryDetails,
    TResult Function(_LoadMoreInvoices value)? loadMoreInvoices,
    required TResult orElse(),
  }) {
    if (updateIsExpanded != null) {
      return updateIsExpanded(this);
    }
    return orElse();
  }
}

abstract class _updateIsExpanded implements ViewByItemDetailsEvent {
  const factory _updateIsExpanded({required final bool isExpanded}) =
      _$updateIsExpandedImpl;

  bool get isExpanded;
  @JsonKey(ignore: true)
  _$$updateIsExpandedImplCopyWith<_$updateIsExpandedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchOrdersInvoiceDataImplCopyWith<$Res> {
  factory _$$FetchOrdersInvoiceDataImplCopyWith(
          _$FetchOrdersInvoiceDataImpl value,
          $Res Function(_$FetchOrdersInvoiceDataImpl) then) =
      __$$FetchOrdersInvoiceDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderNumber orderNumber});
}

/// @nodoc
class __$$FetchOrdersInvoiceDataImplCopyWithImpl<$Res>
    extends _$ViewByItemDetailsEventCopyWithImpl<$Res,
        _$FetchOrdersInvoiceDataImpl>
    implements _$$FetchOrdersInvoiceDataImplCopyWith<$Res> {
  __$$FetchOrdersInvoiceDataImplCopyWithImpl(
      _$FetchOrdersInvoiceDataImpl _value,
      $Res Function(_$FetchOrdersInvoiceDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderNumber = null,
  }) {
    return _then(_$FetchOrdersInvoiceDataImpl(
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
    ));
  }
}

/// @nodoc

class _$FetchOrdersInvoiceDataImpl implements _FetchOrdersInvoiceData {
  const _$FetchOrdersInvoiceDataImpl({required this.orderNumber});

  @override
  final OrderNumber orderNumber;

  @override
  String toString() {
    return 'ViewByItemDetailsEvent.fetchOrdersInvoiceData(orderNumber: $orderNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchOrdersInvoiceDataImpl &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderNumber);

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
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(StringValue invoiceNumber) fetchZyllemStatus,
    required TResult Function(bool isExpanded) updateIsExpanded,
    required TResult Function(OrderNumber orderNumber) fetchOrdersInvoiceData,
    required TResult Function(LineNumber lineNumber, OrderNumber orderNumber)
        fetchOrderHistoryDetails,
    required TResult Function() loadMoreInvoices,
  }) {
    return fetchOrdersInvoiceData(orderNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(StringValue invoiceNumber)? fetchZyllemStatus,
    TResult? Function(bool isExpanded)? updateIsExpanded,
    TResult? Function(OrderNumber orderNumber)? fetchOrdersInvoiceData,
    TResult? Function(LineNumber lineNumber, OrderNumber orderNumber)?
        fetchOrderHistoryDetails,
    TResult? Function()? loadMoreInvoices,
  }) {
    return fetchOrdersInvoiceData?.call(orderNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(StringValue invoiceNumber)? fetchZyllemStatus,
    TResult Function(bool isExpanded)? updateIsExpanded,
    TResult Function(OrderNumber orderNumber)? fetchOrdersInvoiceData,
    TResult Function(LineNumber lineNumber, OrderNumber orderNumber)?
        fetchOrderHistoryDetails,
    TResult Function()? loadMoreInvoices,
    required TResult orElse(),
  }) {
    if (fetchOrdersInvoiceData != null) {
      return fetchOrdersInvoiceData(orderNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchZyllemStatus value) fetchZyllemStatus,
    required TResult Function(_updateIsExpanded value) updateIsExpanded,
    required TResult Function(_FetchOrdersInvoiceData value)
        fetchOrdersInvoiceData,
    required TResult Function(_FetchOrderHistoryDetails value)
        fetchOrderHistoryDetails,
    required TResult Function(_LoadMoreInvoices value) loadMoreInvoices,
  }) {
    return fetchOrdersInvoiceData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    TResult? Function(_updateIsExpanded value)? updateIsExpanded,
    TResult? Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    TResult? Function(_FetchOrderHistoryDetails value)?
        fetchOrderHistoryDetails,
    TResult? Function(_LoadMoreInvoices value)? loadMoreInvoices,
  }) {
    return fetchOrdersInvoiceData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    TResult Function(_updateIsExpanded value)? updateIsExpanded,
    TResult Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    TResult Function(_FetchOrderHistoryDetails value)? fetchOrderHistoryDetails,
    TResult Function(_LoadMoreInvoices value)? loadMoreInvoices,
    required TResult orElse(),
  }) {
    if (fetchOrdersInvoiceData != null) {
      return fetchOrdersInvoiceData(this);
    }
    return orElse();
  }
}

abstract class _FetchOrdersInvoiceData implements ViewByItemDetailsEvent {
  const factory _FetchOrdersInvoiceData(
      {required final OrderNumber orderNumber}) = _$FetchOrdersInvoiceDataImpl;

  OrderNumber get orderNumber;
  @JsonKey(ignore: true)
  _$$FetchOrdersInvoiceDataImplCopyWith<_$FetchOrdersInvoiceDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchOrderHistoryDetailsImplCopyWith<$Res> {
  factory _$$FetchOrderHistoryDetailsImplCopyWith(
          _$FetchOrderHistoryDetailsImpl value,
          $Res Function(_$FetchOrderHistoryDetailsImpl) then) =
      __$$FetchOrderHistoryDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LineNumber lineNumber, OrderNumber orderNumber});
}

/// @nodoc
class __$$FetchOrderHistoryDetailsImplCopyWithImpl<$Res>
    extends _$ViewByItemDetailsEventCopyWithImpl<$Res,
        _$FetchOrderHistoryDetailsImpl>
    implements _$$FetchOrderHistoryDetailsImplCopyWith<$Res> {
  __$$FetchOrderHistoryDetailsImplCopyWithImpl(
      _$FetchOrderHistoryDetailsImpl _value,
      $Res Function(_$FetchOrderHistoryDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lineNumber = null,
    Object? orderNumber = null,
  }) {
    return _then(_$FetchOrderHistoryDetailsImpl(
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as LineNumber,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
    ));
  }
}

/// @nodoc

class _$FetchOrderHistoryDetailsImpl implements _FetchOrderHistoryDetails {
  const _$FetchOrderHistoryDetailsImpl(
      {required this.lineNumber, required this.orderNumber});

  @override
  final LineNumber lineNumber;
  @override
  final OrderNumber orderNumber;

  @override
  String toString() {
    return 'ViewByItemDetailsEvent.fetchOrderHistoryDetails(lineNumber: $lineNumber, orderNumber: $orderNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchOrderHistoryDetailsImpl &&
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lineNumber, orderNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchOrderHistoryDetailsImplCopyWith<_$FetchOrderHistoryDetailsImpl>
      get copyWith => __$$FetchOrderHistoryDetailsImplCopyWithImpl<
          _$FetchOrderHistoryDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(StringValue invoiceNumber) fetchZyllemStatus,
    required TResult Function(bool isExpanded) updateIsExpanded,
    required TResult Function(OrderNumber orderNumber) fetchOrdersInvoiceData,
    required TResult Function(LineNumber lineNumber, OrderNumber orderNumber)
        fetchOrderHistoryDetails,
    required TResult Function() loadMoreInvoices,
  }) {
    return fetchOrderHistoryDetails(lineNumber, orderNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(StringValue invoiceNumber)? fetchZyllemStatus,
    TResult? Function(bool isExpanded)? updateIsExpanded,
    TResult? Function(OrderNumber orderNumber)? fetchOrdersInvoiceData,
    TResult? Function(LineNumber lineNumber, OrderNumber orderNumber)?
        fetchOrderHistoryDetails,
    TResult? Function()? loadMoreInvoices,
  }) {
    return fetchOrderHistoryDetails?.call(lineNumber, orderNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(StringValue invoiceNumber)? fetchZyllemStatus,
    TResult Function(bool isExpanded)? updateIsExpanded,
    TResult Function(OrderNumber orderNumber)? fetchOrdersInvoiceData,
    TResult Function(LineNumber lineNumber, OrderNumber orderNumber)?
        fetchOrderHistoryDetails,
    TResult Function()? loadMoreInvoices,
    required TResult orElse(),
  }) {
    if (fetchOrderHistoryDetails != null) {
      return fetchOrderHistoryDetails(lineNumber, orderNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchZyllemStatus value) fetchZyllemStatus,
    required TResult Function(_updateIsExpanded value) updateIsExpanded,
    required TResult Function(_FetchOrdersInvoiceData value)
        fetchOrdersInvoiceData,
    required TResult Function(_FetchOrderHistoryDetails value)
        fetchOrderHistoryDetails,
    required TResult Function(_LoadMoreInvoices value) loadMoreInvoices,
  }) {
    return fetchOrderHistoryDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    TResult? Function(_updateIsExpanded value)? updateIsExpanded,
    TResult? Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    TResult? Function(_FetchOrderHistoryDetails value)?
        fetchOrderHistoryDetails,
    TResult? Function(_LoadMoreInvoices value)? loadMoreInvoices,
  }) {
    return fetchOrderHistoryDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    TResult Function(_updateIsExpanded value)? updateIsExpanded,
    TResult Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    TResult Function(_FetchOrderHistoryDetails value)? fetchOrderHistoryDetails,
    TResult Function(_LoadMoreInvoices value)? loadMoreInvoices,
    required TResult orElse(),
  }) {
    if (fetchOrderHistoryDetails != null) {
      return fetchOrderHistoryDetails(this);
    }
    return orElse();
  }
}

abstract class _FetchOrderHistoryDetails implements ViewByItemDetailsEvent {
  const factory _FetchOrderHistoryDetails(
      {required final LineNumber lineNumber,
      required final OrderNumber orderNumber}) = _$FetchOrderHistoryDetailsImpl;

  LineNumber get lineNumber;
  OrderNumber get orderNumber;
  @JsonKey(ignore: true)
  _$$FetchOrderHistoryDetailsImplCopyWith<_$FetchOrderHistoryDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreInvoicesImplCopyWith<$Res> {
  factory _$$LoadMoreInvoicesImplCopyWith(_$LoadMoreInvoicesImpl value,
          $Res Function(_$LoadMoreInvoicesImpl) then) =
      __$$LoadMoreInvoicesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreInvoicesImplCopyWithImpl<$Res>
    extends _$ViewByItemDetailsEventCopyWithImpl<$Res, _$LoadMoreInvoicesImpl>
    implements _$$LoadMoreInvoicesImplCopyWith<$Res> {
  __$$LoadMoreInvoicesImplCopyWithImpl(_$LoadMoreInvoicesImpl _value,
      $Res Function(_$LoadMoreInvoicesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreInvoicesImpl implements _LoadMoreInvoices {
  const _$LoadMoreInvoicesImpl();

  @override
  String toString() {
    return 'ViewByItemDetailsEvent.loadMoreInvoices()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreInvoicesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(StringValue invoiceNumber) fetchZyllemStatus,
    required TResult Function(bool isExpanded) updateIsExpanded,
    required TResult Function(OrderNumber orderNumber) fetchOrdersInvoiceData,
    required TResult Function(LineNumber lineNumber, OrderNumber orderNumber)
        fetchOrderHistoryDetails,
    required TResult Function() loadMoreInvoices,
  }) {
    return loadMoreInvoices();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(StringValue invoiceNumber)? fetchZyllemStatus,
    TResult? Function(bool isExpanded)? updateIsExpanded,
    TResult? Function(OrderNumber orderNumber)? fetchOrdersInvoiceData,
    TResult? Function(LineNumber lineNumber, OrderNumber orderNumber)?
        fetchOrderHistoryDetails,
    TResult? Function()? loadMoreInvoices,
  }) {
    return loadMoreInvoices?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfig,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(StringValue invoiceNumber)? fetchZyllemStatus,
    TResult Function(bool isExpanded)? updateIsExpanded,
    TResult Function(OrderNumber orderNumber)? fetchOrdersInvoiceData,
    TResult Function(LineNumber lineNumber, OrderNumber orderNumber)?
        fetchOrderHistoryDetails,
    TResult Function()? loadMoreInvoices,
    required TResult orElse(),
  }) {
    if (loadMoreInvoices != null) {
      return loadMoreInvoices();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchZyllemStatus value) fetchZyllemStatus,
    required TResult Function(_updateIsExpanded value) updateIsExpanded,
    required TResult Function(_FetchOrdersInvoiceData value)
        fetchOrdersInvoiceData,
    required TResult Function(_FetchOrderHistoryDetails value)
        fetchOrderHistoryDetails,
    required TResult Function(_LoadMoreInvoices value) loadMoreInvoices,
  }) {
    return loadMoreInvoices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    TResult? Function(_updateIsExpanded value)? updateIsExpanded,
    TResult? Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    TResult? Function(_FetchOrderHistoryDetails value)?
        fetchOrderHistoryDetails,
    TResult? Function(_LoadMoreInvoices value)? loadMoreInvoices,
  }) {
    return loadMoreInvoices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    TResult Function(_updateIsExpanded value)? updateIsExpanded,
    TResult Function(_FetchOrdersInvoiceData value)? fetchOrdersInvoiceData,
    TResult Function(_FetchOrderHistoryDetails value)? fetchOrderHistoryDetails,
    TResult Function(_LoadMoreInvoices value)? loadMoreInvoices,
    required TResult orElse(),
  }) {
    if (loadMoreInvoices != null) {
      return loadMoreInvoices(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreInvoices implements ViewByItemDetailsEvent {
  const factory _LoadMoreInvoices() = _$LoadMoreInvoicesImpl;
}

/// @nodoc
mixin _$ViewByItemDetailsState {
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get salesOrgConfig =>
      throw _privateConstructorUsedError;
  OrderHistory get orderHistory => throw _privateConstructorUsedError;
  List<OrderHistoryItem> get orderHistorySelectedItems =>
      throw _privateConstructorUsedError;
  List<OrderStatusTracker> get orderHistoryStatuses =>
      throw _privateConstructorUsedError;
  bool get isStatusLoading => throw _privateConstructorUsedError;
  bool get isInvoiceLoading => throw _privateConstructorUsedError;
  bool get isDetailsLoading => throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  InvoiceDetailResponse get invoiceDetail => throw _privateConstructorUsedError;
  bool get canLoadMoreInvoices => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByItemDetailsStateCopyWith<ViewByItemDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByItemDetailsStateCopyWith<$Res> {
  factory $ViewByItemDetailsStateCopyWith(ViewByItemDetailsState value,
          $Res Function(ViewByItemDetailsState) then) =
      _$ViewByItemDetailsStateCopyWithImpl<$Res, ViewByItemDetailsState>;
  @useResult
  $Res call(
      {CustomerCodeInfo customerCodeInfo,
      User user,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrgConfig,
      OrderHistory orderHistory,
      List<OrderHistoryItem> orderHistorySelectedItems,
      List<OrderStatusTracker> orderHistoryStatuses,
      bool isStatusLoading,
      bool isInvoiceLoading,
      bool isDetailsLoading,
      bool isExpanded,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      ShipToInfo shipToInfo,
      InvoiceDetailResponse invoiceDetail,
      bool canLoadMoreInvoices});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig;
  $OrderHistoryCopyWith<$Res> get orderHistory;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $InvoiceDetailResponseCopyWith<$Res> get invoiceDetail;
}

/// @nodoc
class _$ViewByItemDetailsStateCopyWithImpl<$Res,
        $Val extends ViewByItemDetailsState>
    implements $ViewByItemDetailsStateCopyWith<$Res> {
  _$ViewByItemDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? user = null,
    Object? salesOrganisation = null,
    Object? salesOrgConfig = null,
    Object? orderHistory = null,
    Object? orderHistorySelectedItems = null,
    Object? orderHistoryStatuses = null,
    Object? isStatusLoading = null,
    Object? isInvoiceLoading = null,
    Object? isDetailsLoading = null,
    Object? isExpanded = null,
    Object? failureOrSuccessOption = null,
    Object? shipToInfo = null,
    Object? invoiceDetail = null,
    Object? canLoadMoreInvoices = null,
  }) {
    return _then(_value.copyWith(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrgConfig: null == salesOrgConfig
          ? _value.salesOrgConfig
          : salesOrgConfig // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      orderHistory: null == orderHistory
          ? _value.orderHistory
          : orderHistory // ignore: cast_nullable_to_non_nullable
              as OrderHistory,
      orderHistorySelectedItems: null == orderHistorySelectedItems
          ? _value.orderHistorySelectedItems
          : orderHistorySelectedItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryItem>,
      orderHistoryStatuses: null == orderHistoryStatuses
          ? _value.orderHistoryStatuses
          : orderHistoryStatuses // ignore: cast_nullable_to_non_nullable
              as List<OrderStatusTracker>,
      isStatusLoading: null == isStatusLoading
          ? _value.isStatusLoading
          : isStatusLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isInvoiceLoading: null == isInvoiceLoading
          ? _value.isInvoiceLoading
          : isInvoiceLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDetailsLoading: null == isDetailsLoading
          ? _value.isDetailsLoading
          : isDetailsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      invoiceDetail: null == invoiceDetail
          ? _value.invoiceDetail
          : invoiceDetail // ignore: cast_nullable_to_non_nullable
              as InvoiceDetailResponse,
      canLoadMoreInvoices: null == canLoadMoreInvoices
          ? _value.canLoadMoreInvoices
          : canLoadMoreInvoices // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfig,
        (value) {
      return _then(_value.copyWith(salesOrgConfig: value) as $Val);
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InvoiceDetailResponseCopyWith<$Res> get invoiceDetail {
    return $InvoiceDetailResponseCopyWith<$Res>(_value.invoiceDetail, (value) {
      return _then(_value.copyWith(invoiceDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViewByItemDetailsStateImplCopyWith<$Res>
    implements $ViewByItemDetailsStateCopyWith<$Res> {
  factory _$$ViewByItemDetailsStateImplCopyWith(
          _$ViewByItemDetailsStateImpl value,
          $Res Function(_$ViewByItemDetailsStateImpl) then) =
      __$$ViewByItemDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomerCodeInfo customerCodeInfo,
      User user,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrgConfig,
      OrderHistory orderHistory,
      List<OrderHistoryItem> orderHistorySelectedItems,
      List<OrderStatusTracker> orderHistoryStatuses,
      bool isStatusLoading,
      bool isInvoiceLoading,
      bool isDetailsLoading,
      bool isExpanded,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      ShipToInfo shipToInfo,
      InvoiceDetailResponse invoiceDetail,
      bool canLoadMoreInvoices});

  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig;
  @override
  $OrderHistoryCopyWith<$Res> get orderHistory;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $InvoiceDetailResponseCopyWith<$Res> get invoiceDetail;
}

/// @nodoc
class __$$ViewByItemDetailsStateImplCopyWithImpl<$Res>
    extends _$ViewByItemDetailsStateCopyWithImpl<$Res,
        _$ViewByItemDetailsStateImpl>
    implements _$$ViewByItemDetailsStateImplCopyWith<$Res> {
  __$$ViewByItemDetailsStateImplCopyWithImpl(
      _$ViewByItemDetailsStateImpl _value,
      $Res Function(_$ViewByItemDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? user = null,
    Object? salesOrganisation = null,
    Object? salesOrgConfig = null,
    Object? orderHistory = null,
    Object? orderHistorySelectedItems = null,
    Object? orderHistoryStatuses = null,
    Object? isStatusLoading = null,
    Object? isInvoiceLoading = null,
    Object? isDetailsLoading = null,
    Object? isExpanded = null,
    Object? failureOrSuccessOption = null,
    Object? shipToInfo = null,
    Object? invoiceDetail = null,
    Object? canLoadMoreInvoices = null,
  }) {
    return _then(_$ViewByItemDetailsStateImpl(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrgConfig: null == salesOrgConfig
          ? _value.salesOrgConfig
          : salesOrgConfig // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      orderHistory: null == orderHistory
          ? _value.orderHistory
          : orderHistory // ignore: cast_nullable_to_non_nullable
              as OrderHistory,
      orderHistorySelectedItems: null == orderHistorySelectedItems
          ? _value._orderHistorySelectedItems
          : orderHistorySelectedItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryItem>,
      orderHistoryStatuses: null == orderHistoryStatuses
          ? _value._orderHistoryStatuses
          : orderHistoryStatuses // ignore: cast_nullable_to_non_nullable
              as List<OrderStatusTracker>,
      isStatusLoading: null == isStatusLoading
          ? _value.isStatusLoading
          : isStatusLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isInvoiceLoading: null == isInvoiceLoading
          ? _value.isInvoiceLoading
          : isInvoiceLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDetailsLoading: null == isDetailsLoading
          ? _value.isDetailsLoading
          : isDetailsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      invoiceDetail: null == invoiceDetail
          ? _value.invoiceDetail
          : invoiceDetail // ignore: cast_nullable_to_non_nullable
              as InvoiceDetailResponse,
      canLoadMoreInvoices: null == canLoadMoreInvoices
          ? _value.canLoadMoreInvoices
          : canLoadMoreInvoices // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ViewByItemDetailsStateImpl extends _ViewByItemDetailsState {
  const _$ViewByItemDetailsStateImpl(
      {required this.customerCodeInfo,
      required this.user,
      required this.salesOrganisation,
      required this.salesOrgConfig,
      required this.orderHistory,
      required final List<OrderHistoryItem> orderHistorySelectedItems,
      required final List<OrderStatusTracker> orderHistoryStatuses,
      required this.isStatusLoading,
      required this.isInvoiceLoading,
      required this.isDetailsLoading,
      required this.isExpanded,
      required this.failureOrSuccessOption,
      required this.shipToInfo,
      required this.invoiceDetail,
      required this.canLoadMoreInvoices})
      : _orderHistorySelectedItems = orderHistorySelectedItems,
        _orderHistoryStatuses = orderHistoryStatuses,
        super._();

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesOrgConfig;
  @override
  final OrderHistory orderHistory;
  final List<OrderHistoryItem> _orderHistorySelectedItems;
  @override
  List<OrderHistoryItem> get orderHistorySelectedItems {
    if (_orderHistorySelectedItems is EqualUnmodifiableListView)
      return _orderHistorySelectedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistorySelectedItems);
  }

  final List<OrderStatusTracker> _orderHistoryStatuses;
  @override
  List<OrderStatusTracker> get orderHistoryStatuses {
    if (_orderHistoryStatuses is EqualUnmodifiableListView)
      return _orderHistoryStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryStatuses);
  }

  @override
  final bool isStatusLoading;
  @override
  final bool isInvoiceLoading;
  @override
  final bool isDetailsLoading;
  @override
  final bool isExpanded;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final ShipToInfo shipToInfo;
  @override
  final InvoiceDetailResponse invoiceDetail;
  @override
  final bool canLoadMoreInvoices;

  @override
  String toString() {
    return 'ViewByItemDetailsState(customerCodeInfo: $customerCodeInfo, user: $user, salesOrganisation: $salesOrganisation, salesOrgConfig: $salesOrgConfig, orderHistory: $orderHistory, orderHistorySelectedItems: $orderHistorySelectedItems, orderHistoryStatuses: $orderHistoryStatuses, isStatusLoading: $isStatusLoading, isInvoiceLoading: $isInvoiceLoading, isDetailsLoading: $isDetailsLoading, isExpanded: $isExpanded, failureOrSuccessOption: $failureOrSuccessOption, shipToInfo: $shipToInfo, invoiceDetail: $invoiceDetail, canLoadMoreInvoices: $canLoadMoreInvoices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewByItemDetailsStateImpl &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.salesOrgConfig, salesOrgConfig) ||
                other.salesOrgConfig == salesOrgConfig) &&
            (identical(other.orderHistory, orderHistory) ||
                other.orderHistory == orderHistory) &&
            const DeepCollectionEquality().equals(
                other._orderHistorySelectedItems, _orderHistorySelectedItems) &&
            const DeepCollectionEquality()
                .equals(other._orderHistoryStatuses, _orderHistoryStatuses) &&
            (identical(other.isStatusLoading, isStatusLoading) ||
                other.isStatusLoading == isStatusLoading) &&
            (identical(other.isInvoiceLoading, isInvoiceLoading) ||
                other.isInvoiceLoading == isInvoiceLoading) &&
            (identical(other.isDetailsLoading, isDetailsLoading) ||
                other.isDetailsLoading == isDetailsLoading) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.invoiceDetail, invoiceDetail) ||
                other.invoiceDetail == invoiceDetail) &&
            (identical(other.canLoadMoreInvoices, canLoadMoreInvoices) ||
                other.canLoadMoreInvoices == canLoadMoreInvoices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerCodeInfo,
      user,
      salesOrganisation,
      salesOrgConfig,
      orderHistory,
      const DeepCollectionEquality().hash(_orderHistorySelectedItems),
      const DeepCollectionEquality().hash(_orderHistoryStatuses),
      isStatusLoading,
      isInvoiceLoading,
      isDetailsLoading,
      isExpanded,
      failureOrSuccessOption,
      shipToInfo,
      invoiceDetail,
      canLoadMoreInvoices);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewByItemDetailsStateImplCopyWith<_$ViewByItemDetailsStateImpl>
      get copyWith => __$$ViewByItemDetailsStateImplCopyWithImpl<
          _$ViewByItemDetailsStateImpl>(this, _$identity);
}

abstract class _ViewByItemDetailsState extends ViewByItemDetailsState {
  const factory _ViewByItemDetailsState(
      {required final CustomerCodeInfo customerCodeInfo,
      required final User user,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesOrgConfig,
      required final OrderHistory orderHistory,
      required final List<OrderHistoryItem> orderHistorySelectedItems,
      required final List<OrderStatusTracker> orderHistoryStatuses,
      required final bool isStatusLoading,
      required final bool isInvoiceLoading,
      required final bool isDetailsLoading,
      required final bool isExpanded,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final ShipToInfo shipToInfo,
      required final InvoiceDetailResponse invoiceDetail,
      required final bool canLoadMoreInvoices}) = _$ViewByItemDetailsStateImpl;
  const _ViewByItemDetailsState._() : super._();

  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  User get user;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  SalesOrganisationConfigs get salesOrgConfig;
  @override
  OrderHistory get orderHistory;
  @override
  List<OrderHistoryItem> get orderHistorySelectedItems;
  @override
  List<OrderStatusTracker> get orderHistoryStatuses;
  @override
  bool get isStatusLoading;
  @override
  bool get isInvoiceLoading;
  @override
  bool get isDetailsLoading;
  @override
  bool get isExpanded;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  ShipToInfo get shipToInfo;
  @override
  InvoiceDetailResponse get invoiceDetail;
  @override
  bool get canLoadMoreInvoices;
  @override
  @JsonKey(ignore: true)
  _$$ViewByItemDetailsStateImplCopyWith<_$ViewByItemDetailsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
