// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_summary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderSummaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)
        submitOrder,
    required TResult Function(List<PriceAggregate> priceAggregate)
        orderConfirmationDetail,
    required TResult Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)
        confirmedOrderStockInfo,
    required TResult Function(bool isExpanded) updateIsExpanded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)?
        submitOrder,
    TResult? Function(List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult? Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    TResult? Function(bool isExpanded)? updateIsExpanded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)?
        submitOrder,
    TResult Function(List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    TResult Function(bool isExpanded)? updateIsExpanded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubmitOrder value) submitOrder,
    required TResult Function(_OrderConfirmationDetail value)
        orderConfirmationDetail,
    required TResult Function(_ConfirmedOrderStockInfo value)
        confirmedOrderStockInfo,
    required TResult Function(_updateIsExpanded value) updateIsExpanded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubmitOrder value)? submitOrder,
    TResult? Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult? Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    TResult? Function(_updateIsExpanded value)? updateIsExpanded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubmitOrder value)? submitOrder,
    TResult Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    TResult Function(_updateIsExpanded value)? updateIsExpanded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSummaryEventCopyWith<$Res> {
  factory $OrderSummaryEventCopyWith(
          OrderSummaryEvent value, $Res Function(OrderSummaryEvent) then) =
      _$OrderSummaryEventCopyWithImpl<$Res, OrderSummaryEvent>;
}

/// @nodoc
class _$OrderSummaryEventCopyWithImpl<$Res, $Val extends OrderSummaryEvent>
    implements $OrderSummaryEventCopyWith<$Res> {
  _$OrderSummaryEventCopyWithImpl(this._value, this._then);

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
      ShipToInfo shipToInfo,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisationConfigs salesOrgConfig,
      SalesOrganisation salesOrganisation});

  $UserCopyWith<$Res> get user;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$OrderSummaryEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? shipToInfo = null,
    Object? customerCodeInfo = null,
    Object? salesOrgConfig = null,
    Object? salesOrganisation = null,
  }) {
    return _then(_$InitializedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrgConfig: null == salesOrgConfig
          ? _value.salesOrgConfig
          : salesOrgConfig // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
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

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(
      {required this.user,
      required this.shipToInfo,
      required this.customerCodeInfo,
      required this.salesOrgConfig,
      required this.salesOrganisation});

  @override
  final User user;
  @override
  final ShipToInfo shipToInfo;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisationConfigs salesOrgConfig;
  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'OrderSummaryEvent.initialized(user: $user, shipToInfo: $shipToInfo, customerCodeInfo: $customerCodeInfo, salesOrgConfig: $salesOrgConfig, salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrgConfig, salesOrgConfig) ||
                other.salesOrgConfig == salesOrgConfig) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, shipToInfo,
      customerCodeInfo, salesOrgConfig, salesOrganisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)
        submitOrder,
    required TResult Function(List<PriceAggregate> priceAggregate)
        orderConfirmationDetail,
    required TResult Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)
        confirmedOrderStockInfo,
    required TResult Function(bool isExpanded) updateIsExpanded,
  }) {
    return initialized(
        user, shipToInfo, customerCodeInfo, salesOrgConfig, salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)?
        submitOrder,
    TResult? Function(List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult? Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    TResult? Function(bool isExpanded)? updateIsExpanded,
  }) {
    return initialized?.call(
        user, shipToInfo, customerCodeInfo, salesOrgConfig, salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)?
        submitOrder,
    TResult Function(List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    TResult Function(bool isExpanded)? updateIsExpanded,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(user, shipToInfo, customerCodeInfo, salesOrgConfig,
          salesOrganisation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubmitOrder value) submitOrder,
    required TResult Function(_OrderConfirmationDetail value)
        orderConfirmationDetail,
    required TResult Function(_ConfirmedOrderStockInfo value)
        confirmedOrderStockInfo,
    required TResult Function(_updateIsExpanded value) updateIsExpanded,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubmitOrder value)? submitOrder,
    TResult? Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult? Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    TResult? Function(_updateIsExpanded value)? updateIsExpanded,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubmitOrder value)? submitOrder,
    TResult Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    TResult Function(_updateIsExpanded value)? updateIsExpanded,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements OrderSummaryEvent {
  const factory _Initialized(
      {required final User user,
      required final ShipToInfo shipToInfo,
      required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisationConfigs salesOrgConfig,
      required final SalesOrganisation salesOrganisation}) = _$InitializedImpl;

  User get user;
  ShipToInfo get shipToInfo;
  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisationConfigs get salesOrgConfig;
  SalesOrganisation get salesOrganisation;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitOrderImplCopyWith<$Res> {
  factory _$$SubmitOrderImplCopyWith(
          _$SubmitOrderImpl value, $Res Function(_$SubmitOrderImpl) then) =
      __$$SubmitOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<PriceAggregate> cartProducts,
      double grandTotal,
      double orderValue,
      double aplSmallOrderFee,
      double zpSmallOrderFee,
      double mpSmallOrderFee,
      double totalTax,
      DeliveryInfoData data,
      SalesRepAuthorizedDetails salesRepAuthorizedDetails,
      String deliveryOption});

  $DeliveryInfoDataCopyWith<$Res> get data;
  $SalesRepAuthorizedDetailsCopyWith<$Res> get salesRepAuthorizedDetails;
}

/// @nodoc
class __$$SubmitOrderImplCopyWithImpl<$Res>
    extends _$OrderSummaryEventCopyWithImpl<$Res, _$SubmitOrderImpl>
    implements _$$SubmitOrderImplCopyWith<$Res> {
  __$$SubmitOrderImplCopyWithImpl(
      _$SubmitOrderImpl _value, $Res Function(_$SubmitOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartProducts = null,
    Object? grandTotal = null,
    Object? orderValue = null,
    Object? aplSmallOrderFee = null,
    Object? zpSmallOrderFee = null,
    Object? mpSmallOrderFee = null,
    Object? totalTax = null,
    Object? data = null,
    Object? salesRepAuthorizedDetails = null,
    Object? deliveryOption = null,
  }) {
    return _then(_$SubmitOrderImpl(
      cartProducts: null == cartProducts
          ? _value._cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      aplSmallOrderFee: null == aplSmallOrderFee
          ? _value.aplSmallOrderFee
          : aplSmallOrderFee // ignore: cast_nullable_to_non_nullable
              as double,
      zpSmallOrderFee: null == zpSmallOrderFee
          ? _value.zpSmallOrderFee
          : zpSmallOrderFee // ignore: cast_nullable_to_non_nullable
              as double,
      mpSmallOrderFee: null == mpSmallOrderFee
          ? _value.mpSmallOrderFee
          : mpSmallOrderFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DeliveryInfoData,
      salesRepAuthorizedDetails: null == salesRepAuthorizedDetails
          ? _value.salesRepAuthorizedDetails
          : salesRepAuthorizedDetails // ignore: cast_nullable_to_non_nullable
              as SalesRepAuthorizedDetails,
      deliveryOption: null == deliveryOption
          ? _value.deliveryOption
          : deliveryOption // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DeliveryInfoDataCopyWith<$Res> get data {
    return $DeliveryInfoDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesRepAuthorizedDetailsCopyWith<$Res> get salesRepAuthorizedDetails {
    return $SalesRepAuthorizedDetailsCopyWith<$Res>(
        _value.salesRepAuthorizedDetails, (value) {
      return _then(_value.copyWith(salesRepAuthorizedDetails: value));
    });
  }
}

/// @nodoc

class _$SubmitOrderImpl implements _SubmitOrder {
  const _$SubmitOrderImpl(
      {required final List<PriceAggregate> cartProducts,
      required this.grandTotal,
      required this.orderValue,
      required this.aplSmallOrderFee,
      required this.zpSmallOrderFee,
      required this.mpSmallOrderFee,
      required this.totalTax,
      required this.data,
      required this.salesRepAuthorizedDetails,
      required this.deliveryOption})
      : _cartProducts = cartProducts;

  final List<PriceAggregate> _cartProducts;
  @override
  List<PriceAggregate> get cartProducts {
    if (_cartProducts is EqualUnmodifiableListView) return _cartProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartProducts);
  }

  @override
  final double grandTotal;
  @override
  final double orderValue;
  @override
  final double aplSmallOrderFee;
  @override
  final double zpSmallOrderFee;
  @override
  final double mpSmallOrderFee;
  @override
  final double totalTax;
  @override
  final DeliveryInfoData data;
  @override
  final SalesRepAuthorizedDetails salesRepAuthorizedDetails;
  @override
  final String deliveryOption;

  @override
  String toString() {
    return 'OrderSummaryEvent.submitOrder(cartProducts: $cartProducts, grandTotal: $grandTotal, orderValue: $orderValue, aplSmallOrderFee: $aplSmallOrderFee, zpSmallOrderFee: $zpSmallOrderFee, mpSmallOrderFee: $mpSmallOrderFee, totalTax: $totalTax, data: $data, salesRepAuthorizedDetails: $salesRepAuthorizedDetails, deliveryOption: $deliveryOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitOrderImpl &&
            const DeepCollectionEquality()
                .equals(other._cartProducts, _cartProducts) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.orderValue, orderValue) ||
                other.orderValue == orderValue) &&
            (identical(other.aplSmallOrderFee, aplSmallOrderFee) ||
                other.aplSmallOrderFee == aplSmallOrderFee) &&
            (identical(other.zpSmallOrderFee, zpSmallOrderFee) ||
                other.zpSmallOrderFee == zpSmallOrderFee) &&
            (identical(other.mpSmallOrderFee, mpSmallOrderFee) ||
                other.mpSmallOrderFee == mpSmallOrderFee) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.salesRepAuthorizedDetails,
                    salesRepAuthorizedDetails) ||
                other.salesRepAuthorizedDetails == salesRepAuthorizedDetails) &&
            (identical(other.deliveryOption, deliveryOption) ||
                other.deliveryOption == deliveryOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartProducts),
      grandTotal,
      orderValue,
      aplSmallOrderFee,
      zpSmallOrderFee,
      mpSmallOrderFee,
      totalTax,
      data,
      salesRepAuthorizedDetails,
      deliveryOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitOrderImplCopyWith<_$SubmitOrderImpl> get copyWith =>
      __$$SubmitOrderImplCopyWithImpl<_$SubmitOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)
        submitOrder,
    required TResult Function(List<PriceAggregate> priceAggregate)
        orderConfirmationDetail,
    required TResult Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)
        confirmedOrderStockInfo,
    required TResult Function(bool isExpanded) updateIsExpanded,
  }) {
    return submitOrder(
        cartProducts,
        grandTotal,
        orderValue,
        aplSmallOrderFee,
        zpSmallOrderFee,
        mpSmallOrderFee,
        totalTax,
        data,
        salesRepAuthorizedDetails,
        deliveryOption);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)?
        submitOrder,
    TResult? Function(List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult? Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    TResult? Function(bool isExpanded)? updateIsExpanded,
  }) {
    return submitOrder?.call(
        cartProducts,
        grandTotal,
        orderValue,
        aplSmallOrderFee,
        zpSmallOrderFee,
        mpSmallOrderFee,
        totalTax,
        data,
        salesRepAuthorizedDetails,
        deliveryOption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)?
        submitOrder,
    TResult Function(List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    TResult Function(bool isExpanded)? updateIsExpanded,
    required TResult orElse(),
  }) {
    if (submitOrder != null) {
      return submitOrder(
          cartProducts,
          grandTotal,
          orderValue,
          aplSmallOrderFee,
          zpSmallOrderFee,
          mpSmallOrderFee,
          totalTax,
          data,
          salesRepAuthorizedDetails,
          deliveryOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubmitOrder value) submitOrder,
    required TResult Function(_OrderConfirmationDetail value)
        orderConfirmationDetail,
    required TResult Function(_ConfirmedOrderStockInfo value)
        confirmedOrderStockInfo,
    required TResult Function(_updateIsExpanded value) updateIsExpanded,
  }) {
    return submitOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubmitOrder value)? submitOrder,
    TResult? Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult? Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    TResult? Function(_updateIsExpanded value)? updateIsExpanded,
  }) {
    return submitOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubmitOrder value)? submitOrder,
    TResult Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    TResult Function(_updateIsExpanded value)? updateIsExpanded,
    required TResult orElse(),
  }) {
    if (submitOrder != null) {
      return submitOrder(this);
    }
    return orElse();
  }
}

abstract class _SubmitOrder implements OrderSummaryEvent {
  const factory _SubmitOrder(
      {required final List<PriceAggregate> cartProducts,
      required final double grandTotal,
      required final double orderValue,
      required final double aplSmallOrderFee,
      required final double zpSmallOrderFee,
      required final double mpSmallOrderFee,
      required final double totalTax,
      required final DeliveryInfoData data,
      required final SalesRepAuthorizedDetails salesRepAuthorizedDetails,
      required final String deliveryOption}) = _$SubmitOrderImpl;

  List<PriceAggregate> get cartProducts;
  double get grandTotal;
  double get orderValue;
  double get aplSmallOrderFee;
  double get zpSmallOrderFee;
  double get mpSmallOrderFee;
  double get totalTax;
  DeliveryInfoData get data;
  SalesRepAuthorizedDetails get salesRepAuthorizedDetails;
  String get deliveryOption;
  @JsonKey(ignore: true)
  _$$SubmitOrderImplCopyWith<_$SubmitOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderConfirmationDetailImplCopyWith<$Res> {
  factory _$$OrderConfirmationDetailImplCopyWith(
          _$OrderConfirmationDetailImpl value,
          $Res Function(_$OrderConfirmationDetailImpl) then) =
      __$$OrderConfirmationDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PriceAggregate> priceAggregate});
}

/// @nodoc
class __$$OrderConfirmationDetailImplCopyWithImpl<$Res>
    extends _$OrderSummaryEventCopyWithImpl<$Res, _$OrderConfirmationDetailImpl>
    implements _$$OrderConfirmationDetailImplCopyWith<$Res> {
  __$$OrderConfirmationDetailImplCopyWithImpl(
      _$OrderConfirmationDetailImpl _value,
      $Res Function(_$OrderConfirmationDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceAggregate = null,
  }) {
    return _then(_$OrderConfirmationDetailImpl(
      priceAggregate: null == priceAggregate
          ? _value._priceAggregate
          : priceAggregate // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
    ));
  }
}

/// @nodoc

class _$OrderConfirmationDetailImpl implements _OrderConfirmationDetail {
  const _$OrderConfirmationDetailImpl(
      {required final List<PriceAggregate> priceAggregate})
      : _priceAggregate = priceAggregate;

  final List<PriceAggregate> _priceAggregate;
  @override
  List<PriceAggregate> get priceAggregate {
    if (_priceAggregate is EqualUnmodifiableListView) return _priceAggregate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceAggregate);
  }

  @override
  String toString() {
    return 'OrderSummaryEvent.orderConfirmationDetail(priceAggregate: $priceAggregate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderConfirmationDetailImpl &&
            const DeepCollectionEquality()
                .equals(other._priceAggregate, _priceAggregate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_priceAggregate));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderConfirmationDetailImplCopyWith<_$OrderConfirmationDetailImpl>
      get copyWith => __$$OrderConfirmationDetailImplCopyWithImpl<
          _$OrderConfirmationDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)
        submitOrder,
    required TResult Function(List<PriceAggregate> priceAggregate)
        orderConfirmationDetail,
    required TResult Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)
        confirmedOrderStockInfo,
    required TResult Function(bool isExpanded) updateIsExpanded,
  }) {
    return orderConfirmationDetail(priceAggregate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)?
        submitOrder,
    TResult? Function(List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult? Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    TResult? Function(bool isExpanded)? updateIsExpanded,
  }) {
    return orderConfirmationDetail?.call(priceAggregate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)?
        submitOrder,
    TResult Function(List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    TResult Function(bool isExpanded)? updateIsExpanded,
    required TResult orElse(),
  }) {
    if (orderConfirmationDetail != null) {
      return orderConfirmationDetail(priceAggregate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubmitOrder value) submitOrder,
    required TResult Function(_OrderConfirmationDetail value)
        orderConfirmationDetail,
    required TResult Function(_ConfirmedOrderStockInfo value)
        confirmedOrderStockInfo,
    required TResult Function(_updateIsExpanded value) updateIsExpanded,
  }) {
    return orderConfirmationDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubmitOrder value)? submitOrder,
    TResult? Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult? Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    TResult? Function(_updateIsExpanded value)? updateIsExpanded,
  }) {
    return orderConfirmationDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubmitOrder value)? submitOrder,
    TResult Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    TResult Function(_updateIsExpanded value)? updateIsExpanded,
    required TResult orElse(),
  }) {
    if (orderConfirmationDetail != null) {
      return orderConfirmationDetail(this);
    }
    return orElse();
  }
}

abstract class _OrderConfirmationDetail implements OrderSummaryEvent {
  const factory _OrderConfirmationDetail(
          {required final List<PriceAggregate> priceAggregate}) =
      _$OrderConfirmationDetailImpl;

  List<PriceAggregate> get priceAggregate;
  @JsonKey(ignore: true)
  _$$OrderConfirmationDetailImplCopyWith<_$OrderConfirmationDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmedOrderStockInfoImplCopyWith<$Res> {
  factory _$$ConfirmedOrderStockInfoImplCopyWith(
          _$ConfirmedOrderStockInfoImpl value,
          $Res Function(_$ConfirmedOrderStockInfoImpl) then) =
      __$$ConfirmedOrderStockInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<OrderHistoryDetails> orderHistoryDetailList,
      List<PriceAggregate> priceAggregate});
}

/// @nodoc
class __$$ConfirmedOrderStockInfoImplCopyWithImpl<$Res>
    extends _$OrderSummaryEventCopyWithImpl<$Res, _$ConfirmedOrderStockInfoImpl>
    implements _$$ConfirmedOrderStockInfoImplCopyWith<$Res> {
  __$$ConfirmedOrderStockInfoImplCopyWithImpl(
      _$ConfirmedOrderStockInfoImpl _value,
      $Res Function(_$ConfirmedOrderStockInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderHistoryDetailList = null,
    Object? priceAggregate = null,
  }) {
    return _then(_$ConfirmedOrderStockInfoImpl(
      orderHistoryDetailList: null == orderHistoryDetailList
          ? _value._orderHistoryDetailList
          : orderHistoryDetailList // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetails>,
      priceAggregate: null == priceAggregate
          ? _value._priceAggregate
          : priceAggregate // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
    ));
  }
}

/// @nodoc

class _$ConfirmedOrderStockInfoImpl implements _ConfirmedOrderStockInfo {
  const _$ConfirmedOrderStockInfoImpl(
      {required final List<OrderHistoryDetails> orderHistoryDetailList,
      required final List<PriceAggregate> priceAggregate})
      : _orderHistoryDetailList = orderHistoryDetailList,
        _priceAggregate = priceAggregate;

  final List<OrderHistoryDetails> _orderHistoryDetailList;
  @override
  List<OrderHistoryDetails> get orderHistoryDetailList {
    if (_orderHistoryDetailList is EqualUnmodifiableListView)
      return _orderHistoryDetailList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryDetailList);
  }

  final List<PriceAggregate> _priceAggregate;
  @override
  List<PriceAggregate> get priceAggregate {
    if (_priceAggregate is EqualUnmodifiableListView) return _priceAggregate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceAggregate);
  }

  @override
  String toString() {
    return 'OrderSummaryEvent.confirmedOrderStockInfo(orderHistoryDetailList: $orderHistoryDetailList, priceAggregate: $priceAggregate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmedOrderStockInfoImpl &&
            const DeepCollectionEquality().equals(
                other._orderHistoryDetailList, _orderHistoryDetailList) &&
            const DeepCollectionEquality()
                .equals(other._priceAggregate, _priceAggregate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_orderHistoryDetailList),
      const DeepCollectionEquality().hash(_priceAggregate));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmedOrderStockInfoImplCopyWith<_$ConfirmedOrderStockInfoImpl>
      get copyWith => __$$ConfirmedOrderStockInfoImplCopyWithImpl<
          _$ConfirmedOrderStockInfoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)
        submitOrder,
    required TResult Function(List<PriceAggregate> priceAggregate)
        orderConfirmationDetail,
    required TResult Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)
        confirmedOrderStockInfo,
    required TResult Function(bool isExpanded) updateIsExpanded,
  }) {
    return confirmedOrderStockInfo(orderHistoryDetailList, priceAggregate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)?
        submitOrder,
    TResult? Function(List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult? Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    TResult? Function(bool isExpanded)? updateIsExpanded,
  }) {
    return confirmedOrderStockInfo?.call(
        orderHistoryDetailList, priceAggregate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)?
        submitOrder,
    TResult Function(List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    TResult Function(bool isExpanded)? updateIsExpanded,
    required TResult orElse(),
  }) {
    if (confirmedOrderStockInfo != null) {
      return confirmedOrderStockInfo(orderHistoryDetailList, priceAggregate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubmitOrder value) submitOrder,
    required TResult Function(_OrderConfirmationDetail value)
        orderConfirmationDetail,
    required TResult Function(_ConfirmedOrderStockInfo value)
        confirmedOrderStockInfo,
    required TResult Function(_updateIsExpanded value) updateIsExpanded,
  }) {
    return confirmedOrderStockInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubmitOrder value)? submitOrder,
    TResult? Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult? Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    TResult? Function(_updateIsExpanded value)? updateIsExpanded,
  }) {
    return confirmedOrderStockInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubmitOrder value)? submitOrder,
    TResult Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    TResult Function(_updateIsExpanded value)? updateIsExpanded,
    required TResult orElse(),
  }) {
    if (confirmedOrderStockInfo != null) {
      return confirmedOrderStockInfo(this);
    }
    return orElse();
  }
}

abstract class _ConfirmedOrderStockInfo implements OrderSummaryEvent {
  const factory _ConfirmedOrderStockInfo(
          {required final List<OrderHistoryDetails> orderHistoryDetailList,
          required final List<PriceAggregate> priceAggregate}) =
      _$ConfirmedOrderStockInfoImpl;

  List<OrderHistoryDetails> get orderHistoryDetailList;
  List<PriceAggregate> get priceAggregate;
  @JsonKey(ignore: true)
  _$$ConfirmedOrderStockInfoImplCopyWith<_$ConfirmedOrderStockInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
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
    extends _$OrderSummaryEventCopyWithImpl<$Res, _$updateIsExpandedImpl>
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
    return 'OrderSummaryEvent.updateIsExpanded(isExpanded: $isExpanded)';
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
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)
        submitOrder,
    required TResult Function(List<PriceAggregate> priceAggregate)
        orderConfirmationDetail,
    required TResult Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)
        confirmedOrderStockInfo,
    required TResult Function(bool isExpanded) updateIsExpanded,
  }) {
    return updateIsExpanded(isExpanded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)?
        submitOrder,
    TResult? Function(List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult? Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    TResult? Function(bool isExpanded)? updateIsExpanded,
  }) {
    return updateIsExpanded?.call(isExpanded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrgConfig,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(
            List<PriceAggregate> cartProducts,
            double grandTotal,
            double orderValue,
            double aplSmallOrderFee,
            double zpSmallOrderFee,
            double mpSmallOrderFee,
            double totalTax,
            DeliveryInfoData data,
            SalesRepAuthorizedDetails salesRepAuthorizedDetails,
            String deliveryOption)?
        submitOrder,
    TResult Function(List<PriceAggregate> priceAggregate)?
        orderConfirmationDetail,
    TResult Function(List<OrderHistoryDetails> orderHistoryDetailList,
            List<PriceAggregate> priceAggregate)?
        confirmedOrderStockInfo,
    TResult Function(bool isExpanded)? updateIsExpanded,
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
    required TResult Function(_SubmitOrder value) submitOrder,
    required TResult Function(_OrderConfirmationDetail value)
        orderConfirmationDetail,
    required TResult Function(_ConfirmedOrderStockInfo value)
        confirmedOrderStockInfo,
    required TResult Function(_updateIsExpanded value) updateIsExpanded,
  }) {
    return updateIsExpanded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubmitOrder value)? submitOrder,
    TResult? Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult? Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    TResult? Function(_updateIsExpanded value)? updateIsExpanded,
  }) {
    return updateIsExpanded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubmitOrder value)? submitOrder,
    TResult Function(_OrderConfirmationDetail value)? orderConfirmationDetail,
    TResult Function(_ConfirmedOrderStockInfo value)? confirmedOrderStockInfo,
    TResult Function(_updateIsExpanded value)? updateIsExpanded,
    required TResult orElse(),
  }) {
    if (updateIsExpanded != null) {
      return updateIsExpanded(this);
    }
    return orElse();
  }
}

abstract class _updateIsExpanded implements OrderSummaryEvent {
  const factory _updateIsExpanded({required final bool isExpanded}) =
      _$updateIsExpandedImpl;

  bool get isExpanded;
  @JsonKey(ignore: true)
  _$$updateIsExpandedImplCopyWith<_$updateIsExpandedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderSummaryState {
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isConfirming => throw _privateConstructorUsedError;
  SubmitOrderResponse get submitOrderResponse =>
      throw _privateConstructorUsedError;
  List<OrderHistoryDetails> get orderHistoryDetailsList =>
      throw _privateConstructorUsedError;
  List<PriceAggregate> get cartItems => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get salesOrgConfig =>
      throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderSummaryStateCopyWith<OrderSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSummaryStateCopyWith<$Res> {
  factory $OrderSummaryStateCopyWith(
          OrderSummaryState value, $Res Function(OrderSummaryState) then) =
      _$OrderSummaryStateCopyWithImpl<$Res, OrderSummaryState>;
  @useResult
  $Res call(
      {Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isSubmitting,
      bool isConfirming,
      SubmitOrderResponse submitOrderResponse,
      List<OrderHistoryDetails> orderHistoryDetailsList,
      List<PriceAggregate> cartItems,
      User user,
      ShipToInfo shipToInfo,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisationConfigs salesOrgConfig,
      SalesOrganisation salesOrganisation,
      bool isExpanded});

  $SubmitOrderResponseCopyWith<$Res> get submitOrderResponse;
  $UserCopyWith<$Res> get user;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class _$OrderSummaryStateCopyWithImpl<$Res, $Val extends OrderSummaryState>
    implements $OrderSummaryStateCopyWith<$Res> {
  _$OrderSummaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiFailureOrSuccessOption = null,
    Object? isSubmitting = null,
    Object? isConfirming = null,
    Object? submitOrderResponse = null,
    Object? orderHistoryDetailsList = null,
    Object? cartItems = null,
    Object? user = null,
    Object? shipToInfo = null,
    Object? customerCodeInfo = null,
    Object? salesOrgConfig = null,
    Object? salesOrganisation = null,
    Object? isExpanded = null,
  }) {
    return _then(_value.copyWith(
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirming: null == isConfirming
          ? _value.isConfirming
          : isConfirming // ignore: cast_nullable_to_non_nullable
              as bool,
      submitOrderResponse: null == submitOrderResponse
          ? _value.submitOrderResponse
          : submitOrderResponse // ignore: cast_nullable_to_non_nullable
              as SubmitOrderResponse,
      orderHistoryDetailsList: null == orderHistoryDetailsList
          ? _value.orderHistoryDetailsList
          : orderHistoryDetailsList // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetails>,
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrgConfig: null == salesOrgConfig
          ? _value.salesOrgConfig
          : salesOrgConfig // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubmitOrderResponseCopyWith<$Res> get submitOrderResponse {
    return $SubmitOrderResponseCopyWith<$Res>(_value.submitOrderResponse,
        (value) {
      return _then(_value.copyWith(submitOrderResponse: value) as $Val);
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfig,
        (value) {
      return _then(_value.copyWith(salesOrgConfig: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderSummaryStateImplCopyWith<$Res>
    implements $OrderSummaryStateCopyWith<$Res> {
  factory _$$OrderSummaryStateImplCopyWith(_$OrderSummaryStateImpl value,
          $Res Function(_$OrderSummaryStateImpl) then) =
      __$$OrderSummaryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isSubmitting,
      bool isConfirming,
      SubmitOrderResponse submitOrderResponse,
      List<OrderHistoryDetails> orderHistoryDetailsList,
      List<PriceAggregate> cartItems,
      User user,
      ShipToInfo shipToInfo,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisationConfigs salesOrgConfig,
      SalesOrganisation salesOrganisation,
      bool isExpanded});

  @override
  $SubmitOrderResponseCopyWith<$Res> get submitOrderResponse;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$OrderSummaryStateImplCopyWithImpl<$Res>
    extends _$OrderSummaryStateCopyWithImpl<$Res, _$OrderSummaryStateImpl>
    implements _$$OrderSummaryStateImplCopyWith<$Res> {
  __$$OrderSummaryStateImplCopyWithImpl(_$OrderSummaryStateImpl _value,
      $Res Function(_$OrderSummaryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiFailureOrSuccessOption = null,
    Object? isSubmitting = null,
    Object? isConfirming = null,
    Object? submitOrderResponse = null,
    Object? orderHistoryDetailsList = null,
    Object? cartItems = null,
    Object? user = null,
    Object? shipToInfo = null,
    Object? customerCodeInfo = null,
    Object? salesOrgConfig = null,
    Object? salesOrganisation = null,
    Object? isExpanded = null,
  }) {
    return _then(_$OrderSummaryStateImpl(
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirming: null == isConfirming
          ? _value.isConfirming
          : isConfirming // ignore: cast_nullable_to_non_nullable
              as bool,
      submitOrderResponse: null == submitOrderResponse
          ? _value.submitOrderResponse
          : submitOrderResponse // ignore: cast_nullable_to_non_nullable
              as SubmitOrderResponse,
      orderHistoryDetailsList: null == orderHistoryDetailsList
          ? _value._orderHistoryDetailsList
          : orderHistoryDetailsList // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetails>,
      cartItems: null == cartItems
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrgConfig: null == salesOrgConfig
          ? _value.salesOrgConfig
          : salesOrgConfig // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OrderSummaryStateImpl extends _OrderSummaryState {
  const _$OrderSummaryStateImpl(
      {required this.apiFailureOrSuccessOption,
      required this.isSubmitting,
      required this.isConfirming,
      required this.submitOrderResponse,
      required final List<OrderHistoryDetails> orderHistoryDetailsList,
      required final List<PriceAggregate> cartItems,
      required this.user,
      required this.shipToInfo,
      required this.customerCodeInfo,
      required this.salesOrgConfig,
      required this.salesOrganisation,
      required this.isExpanded})
      : _orderHistoryDetailsList = orderHistoryDetailsList,
        _cartItems = cartItems,
        super._();

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool isSubmitting;
  @override
  final bool isConfirming;
  @override
  final SubmitOrderResponse submitOrderResponse;
  final List<OrderHistoryDetails> _orderHistoryDetailsList;
  @override
  List<OrderHistoryDetails> get orderHistoryDetailsList {
    if (_orderHistoryDetailsList is EqualUnmodifiableListView)
      return _orderHistoryDetailsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryDetailsList);
  }

  final List<PriceAggregate> _cartItems;
  @override
  List<PriceAggregate> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  final User user;
  @override
  final ShipToInfo shipToInfo;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisationConfigs salesOrgConfig;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final bool isExpanded;

  @override
  String toString() {
    return 'OrderSummaryState(apiFailureOrSuccessOption: $apiFailureOrSuccessOption, isSubmitting: $isSubmitting, isConfirming: $isConfirming, submitOrderResponse: $submitOrderResponse, orderHistoryDetailsList: $orderHistoryDetailsList, cartItems: $cartItems, user: $user, shipToInfo: $shipToInfo, customerCodeInfo: $customerCodeInfo, salesOrgConfig: $salesOrgConfig, salesOrganisation: $salesOrganisation, isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSummaryStateImpl &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isConfirming, isConfirming) ||
                other.isConfirming == isConfirming) &&
            (identical(other.submitOrderResponse, submitOrderResponse) ||
                other.submitOrderResponse == submitOrderResponse) &&
            const DeepCollectionEquality().equals(
                other._orderHistoryDetailsList, _orderHistoryDetailsList) &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrgConfig, salesOrgConfig) ||
                other.salesOrgConfig == salesOrgConfig) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      apiFailureOrSuccessOption,
      isSubmitting,
      isConfirming,
      submitOrderResponse,
      const DeepCollectionEquality().hash(_orderHistoryDetailsList),
      const DeepCollectionEquality().hash(_cartItems),
      user,
      shipToInfo,
      customerCodeInfo,
      salesOrgConfig,
      salesOrganisation,
      isExpanded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSummaryStateImplCopyWith<_$OrderSummaryStateImpl> get copyWith =>
      __$$OrderSummaryStateImplCopyWithImpl<_$OrderSummaryStateImpl>(
          this, _$identity);
}

abstract class _OrderSummaryState extends OrderSummaryState {
  const factory _OrderSummaryState(
      {required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final bool isSubmitting,
      required final bool isConfirming,
      required final SubmitOrderResponse submitOrderResponse,
      required final List<OrderHistoryDetails> orderHistoryDetailsList,
      required final List<PriceAggregate> cartItems,
      required final User user,
      required final ShipToInfo shipToInfo,
      required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisationConfigs salesOrgConfig,
      required final SalesOrganisation salesOrganisation,
      required final bool isExpanded}) = _$OrderSummaryStateImpl;
  const _OrderSummaryState._() : super._();

  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get isSubmitting;
  @override
  bool get isConfirming;
  @override
  SubmitOrderResponse get submitOrderResponse;
  @override
  List<OrderHistoryDetails> get orderHistoryDetailsList;
  @override
  List<PriceAggregate> get cartItems;
  @override
  User get user;
  @override
  ShipToInfo get shipToInfo;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  SalesOrganisationConfigs get salesOrgConfig;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  bool get isExpanded;
  @override
  @JsonKey(ignore: true)
  _$$OrderSummaryStateImplCopyWith<_$OrderSummaryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
