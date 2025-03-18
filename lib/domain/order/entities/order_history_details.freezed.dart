// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderHistoryDetails {
  double get totalTax => throw _privateConstructorUsedError;
  double get orderValue => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get manualFee => throw _privateConstructorUsedError;
  double get totalValue => throw _privateConstructorUsedError;
  double get totalDiscount => throw _privateConstructorUsedError;
  OrderStepValue get processingStatus => throw _privateConstructorUsedError;
  DateTimeStringValue get requestedDeliveryDate =>
      throw _privateConstructorUsedError;
  DateTimeStringValue get expectedDeliveryDate =>
      throw _privateConstructorUsedError;
  DocumentType get type => throw _privateConstructorUsedError;
  PhoneNumber get telephoneNumber => throw _privateConstructorUsedError;
  DateTimeStringValue get createdDate => throw _privateConstructorUsedError;
  String get eZRXNumber => throw _privateConstructorUsedError;
  StringValue get orderBy => throw _privateConstructorUsedError;
  StringValue get referenceNotes => throw _privateConstructorUsedError;
  OrderNumber get orderNumber =>
      throw _privateConstructorUsedError; //used for orderHistory api in view vy order section
  String get soldTo => throw _privateConstructorUsedError;
  String get shipTo => throw _privateConstructorUsedError;
  CompanyName get companyName => throw _privateConstructorUsedError;
  StringValue get poReference => throw _privateConstructorUsedError;
  String get shipToAddress => throw _privateConstructorUsedError;
  String get soldToAddress => throw _privateConstructorUsedError;
  StringValue get invoiceNumber => throw _privateConstructorUsedError;
  String get orderReason => throw _privateConstructorUsedError;
  int get itemCount => throw _privateConstructorUsedError;
  List<OrderHistoryDetailsOrderItem> get orderHistoryDetailsOrderItem =>
      throw _privateConstructorUsedError;
  OrderHistoryDetailsPaymentTerm get orderHistoryDetailsPaymentTerm =>
      throw _privateConstructorUsedError;
  StringValue get orderHistoryDetailsSpecialInstructions =>
      throw _privateConstructorUsedError;
  List<PoDocuments> get orderHistoryDetailsPoDocuments =>
      throw _privateConstructorUsedError;
  bool get isMarketPlace => throw _privateConstructorUsedError;
  double get taxRate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryDetailsCopyWith<OrderHistoryDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsCopyWith<$Res> {
  factory $OrderHistoryDetailsCopyWith(
          OrderHistoryDetails value, $Res Function(OrderHistoryDetails) then) =
      _$OrderHistoryDetailsCopyWithImpl<$Res, OrderHistoryDetails>;
  @useResult
  $Res call(
      {double totalTax,
      double orderValue,
      double deliveryFee,
      double manualFee,
      double totalValue,
      double totalDiscount,
      OrderStepValue processingStatus,
      DateTimeStringValue requestedDeliveryDate,
      DateTimeStringValue expectedDeliveryDate,
      DocumentType type,
      PhoneNumber telephoneNumber,
      DateTimeStringValue createdDate,
      String eZRXNumber,
      StringValue orderBy,
      StringValue referenceNotes,
      OrderNumber orderNumber,
      String soldTo,
      String shipTo,
      CompanyName companyName,
      StringValue poReference,
      String shipToAddress,
      String soldToAddress,
      StringValue invoiceNumber,
      String orderReason,
      int itemCount,
      List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItem,
      OrderHistoryDetailsPaymentTerm orderHistoryDetailsPaymentTerm,
      StringValue orderHistoryDetailsSpecialInstructions,
      List<PoDocuments> orderHistoryDetailsPoDocuments,
      bool isMarketPlace,
      double taxRate});

  $OrderHistoryDetailsPaymentTermCopyWith<$Res>
      get orderHistoryDetailsPaymentTerm;
}

/// @nodoc
class _$OrderHistoryDetailsCopyWithImpl<$Res, $Val extends OrderHistoryDetails>
    implements $OrderHistoryDetailsCopyWith<$Res> {
  _$OrderHistoryDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTax = null,
    Object? orderValue = null,
    Object? deliveryFee = null,
    Object? manualFee = null,
    Object? totalValue = null,
    Object? totalDiscount = null,
    Object? processingStatus = null,
    Object? requestedDeliveryDate = null,
    Object? expectedDeliveryDate = null,
    Object? type = null,
    Object? telephoneNumber = null,
    Object? createdDate = null,
    Object? eZRXNumber = null,
    Object? orderBy = null,
    Object? referenceNotes = null,
    Object? orderNumber = null,
    Object? soldTo = null,
    Object? shipTo = null,
    Object? companyName = null,
    Object? poReference = null,
    Object? shipToAddress = null,
    Object? soldToAddress = null,
    Object? invoiceNumber = null,
    Object? orderReason = null,
    Object? itemCount = null,
    Object? orderHistoryDetailsOrderItem = null,
    Object? orderHistoryDetailsPaymentTerm = null,
    Object? orderHistoryDetailsSpecialInstructions = null,
    Object? orderHistoryDetailsPoDocuments = null,
    Object? isMarketPlace = null,
    Object? taxRate = null,
  }) {
    return _then(_value.copyWith(
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      manualFee: null == manualFee
          ? _value.manualFee
          : manualFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalDiscount: null == totalDiscount
          ? _value.totalDiscount
          : totalDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      processingStatus: null == processingStatus
          ? _value.processingStatus
          : processingStatus // ignore: cast_nullable_to_non_nullable
              as OrderStepValue,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      expectedDeliveryDate: null == expectedDeliveryDate
          ? _value.expectedDeliveryDate
          : expectedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      eZRXNumber: null == eZRXNumber
          ? _value.eZRXNumber
          : eZRXNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as StringValue,
      referenceNotes: null == referenceNotes
          ? _value.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as StringValue,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as CompanyName,
      poReference: null == poReference
          ? _value.poReference
          : poReference // ignore: cast_nullable_to_non_nullable
              as StringValue,
      shipToAddress: null == shipToAddress
          ? _value.shipToAddress
          : shipToAddress // ignore: cast_nullable_to_non_nullable
              as String,
      soldToAddress: null == soldToAddress
          ? _value.soldToAddress
          : soldToAddress // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      orderHistoryDetailsOrderItem: null == orderHistoryDetailsOrderItem
          ? _value.orderHistoryDetailsOrderItem
          : orderHistoryDetailsOrderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItem>,
      orderHistoryDetailsPaymentTerm: null == orderHistoryDetailsPaymentTerm
          ? _value.orderHistoryDetailsPaymentTerm
          : orderHistoryDetailsPaymentTerm // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsPaymentTerm,
      orderHistoryDetailsSpecialInstructions: null ==
              orderHistoryDetailsSpecialInstructions
          ? _value.orderHistoryDetailsSpecialInstructions
          : orderHistoryDetailsSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as StringValue,
      orderHistoryDetailsPoDocuments: null == orderHistoryDetailsPoDocuments
          ? _value.orderHistoryDetailsPoDocuments
          : orderHistoryDetailsPoDocuments // ignore: cast_nullable_to_non_nullable
              as List<PoDocuments>,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      taxRate: null == taxRate
          ? _value.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsPaymentTermCopyWith<$Res>
      get orderHistoryDetailsPaymentTerm {
    return $OrderHistoryDetailsPaymentTermCopyWith<$Res>(
        _value.orderHistoryDetailsPaymentTerm, (value) {
      return _then(
          _value.copyWith(orderHistoryDetailsPaymentTerm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderHistoryDetailsImplCopyWith<$Res>
    implements $OrderHistoryDetailsCopyWith<$Res> {
  factory _$$OrderHistoryDetailsImplCopyWith(_$OrderHistoryDetailsImpl value,
          $Res Function(_$OrderHistoryDetailsImpl) then) =
      __$$OrderHistoryDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalTax,
      double orderValue,
      double deliveryFee,
      double manualFee,
      double totalValue,
      double totalDiscount,
      OrderStepValue processingStatus,
      DateTimeStringValue requestedDeliveryDate,
      DateTimeStringValue expectedDeliveryDate,
      DocumentType type,
      PhoneNumber telephoneNumber,
      DateTimeStringValue createdDate,
      String eZRXNumber,
      StringValue orderBy,
      StringValue referenceNotes,
      OrderNumber orderNumber,
      String soldTo,
      String shipTo,
      CompanyName companyName,
      StringValue poReference,
      String shipToAddress,
      String soldToAddress,
      StringValue invoiceNumber,
      String orderReason,
      int itemCount,
      List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItem,
      OrderHistoryDetailsPaymentTerm orderHistoryDetailsPaymentTerm,
      StringValue orderHistoryDetailsSpecialInstructions,
      List<PoDocuments> orderHistoryDetailsPoDocuments,
      bool isMarketPlace,
      double taxRate});

  @override
  $OrderHistoryDetailsPaymentTermCopyWith<$Res>
      get orderHistoryDetailsPaymentTerm;
}

/// @nodoc
class __$$OrderHistoryDetailsImplCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsCopyWithImpl<$Res, _$OrderHistoryDetailsImpl>
    implements _$$OrderHistoryDetailsImplCopyWith<$Res> {
  __$$OrderHistoryDetailsImplCopyWithImpl(_$OrderHistoryDetailsImpl _value,
      $Res Function(_$OrderHistoryDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTax = null,
    Object? orderValue = null,
    Object? deliveryFee = null,
    Object? manualFee = null,
    Object? totalValue = null,
    Object? totalDiscount = null,
    Object? processingStatus = null,
    Object? requestedDeliveryDate = null,
    Object? expectedDeliveryDate = null,
    Object? type = null,
    Object? telephoneNumber = null,
    Object? createdDate = null,
    Object? eZRXNumber = null,
    Object? orderBy = null,
    Object? referenceNotes = null,
    Object? orderNumber = null,
    Object? soldTo = null,
    Object? shipTo = null,
    Object? companyName = null,
    Object? poReference = null,
    Object? shipToAddress = null,
    Object? soldToAddress = null,
    Object? invoiceNumber = null,
    Object? orderReason = null,
    Object? itemCount = null,
    Object? orderHistoryDetailsOrderItem = null,
    Object? orderHistoryDetailsPaymentTerm = null,
    Object? orderHistoryDetailsSpecialInstructions = null,
    Object? orderHistoryDetailsPoDocuments = null,
    Object? isMarketPlace = null,
    Object? taxRate = null,
  }) {
    return _then(_$OrderHistoryDetailsImpl(
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      manualFee: null == manualFee
          ? _value.manualFee
          : manualFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalDiscount: null == totalDiscount
          ? _value.totalDiscount
          : totalDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      processingStatus: null == processingStatus
          ? _value.processingStatus
          : processingStatus // ignore: cast_nullable_to_non_nullable
              as OrderStepValue,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      expectedDeliveryDate: null == expectedDeliveryDate
          ? _value.expectedDeliveryDate
          : expectedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      eZRXNumber: null == eZRXNumber
          ? _value.eZRXNumber
          : eZRXNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as StringValue,
      referenceNotes: null == referenceNotes
          ? _value.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as StringValue,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as CompanyName,
      poReference: null == poReference
          ? _value.poReference
          : poReference // ignore: cast_nullable_to_non_nullable
              as StringValue,
      shipToAddress: null == shipToAddress
          ? _value.shipToAddress
          : shipToAddress // ignore: cast_nullable_to_non_nullable
              as String,
      soldToAddress: null == soldToAddress
          ? _value.soldToAddress
          : soldToAddress // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      orderHistoryDetailsOrderItem: null == orderHistoryDetailsOrderItem
          ? _value._orderHistoryDetailsOrderItem
          : orderHistoryDetailsOrderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItem>,
      orderHistoryDetailsPaymentTerm: null == orderHistoryDetailsPaymentTerm
          ? _value.orderHistoryDetailsPaymentTerm
          : orderHistoryDetailsPaymentTerm // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsPaymentTerm,
      orderHistoryDetailsSpecialInstructions: null ==
              orderHistoryDetailsSpecialInstructions
          ? _value.orderHistoryDetailsSpecialInstructions
          : orderHistoryDetailsSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as StringValue,
      orderHistoryDetailsPoDocuments: null == orderHistoryDetailsPoDocuments
          ? _value._orderHistoryDetailsPoDocuments
          : orderHistoryDetailsPoDocuments // ignore: cast_nullable_to_non_nullable
              as List<PoDocuments>,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      taxRate: null == taxRate
          ? _value.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$OrderHistoryDetailsImpl extends _OrderHistoryDetails {
  _$OrderHistoryDetailsImpl(
      {required this.totalTax,
      required this.orderValue,
      required this.deliveryFee,
      required this.manualFee,
      required this.totalValue,
      required this.totalDiscount,
      required this.processingStatus,
      required this.requestedDeliveryDate,
      required this.expectedDeliveryDate,
      required this.type,
      required this.telephoneNumber,
      required this.createdDate,
      required this.eZRXNumber,
      required this.orderBy,
      required this.referenceNotes,
      required this.orderNumber,
      required this.soldTo,
      required this.shipTo,
      required this.companyName,
      required this.poReference,
      required this.shipToAddress,
      required this.soldToAddress,
      required this.invoiceNumber,
      required this.orderReason,
      required this.itemCount,
      required final List<OrderHistoryDetailsOrderItem>
          orderHistoryDetailsOrderItem,
      required this.orderHistoryDetailsPaymentTerm,
      required this.orderHistoryDetailsSpecialInstructions,
      required final List<PoDocuments> orderHistoryDetailsPoDocuments,
      required this.isMarketPlace,
      required this.taxRate})
      : _orderHistoryDetailsOrderItem = orderHistoryDetailsOrderItem,
        _orderHistoryDetailsPoDocuments = orderHistoryDetailsPoDocuments,
        super._();

  @override
  final double totalTax;
  @override
  final double orderValue;
  @override
  final double deliveryFee;
  @override
  final double manualFee;
  @override
  final double totalValue;
  @override
  final double totalDiscount;
  @override
  final OrderStepValue processingStatus;
  @override
  final DateTimeStringValue requestedDeliveryDate;
  @override
  final DateTimeStringValue expectedDeliveryDate;
  @override
  final DocumentType type;
  @override
  final PhoneNumber telephoneNumber;
  @override
  final DateTimeStringValue createdDate;
  @override
  final String eZRXNumber;
  @override
  final StringValue orderBy;
  @override
  final StringValue referenceNotes;
  @override
  final OrderNumber orderNumber;
//used for orderHistory api in view vy order section
  @override
  final String soldTo;
  @override
  final String shipTo;
  @override
  final CompanyName companyName;
  @override
  final StringValue poReference;
  @override
  final String shipToAddress;
  @override
  final String soldToAddress;
  @override
  final StringValue invoiceNumber;
  @override
  final String orderReason;
  @override
  final int itemCount;
  final List<OrderHistoryDetailsOrderItem> _orderHistoryDetailsOrderItem;
  @override
  List<OrderHistoryDetailsOrderItem> get orderHistoryDetailsOrderItem {
    if (_orderHistoryDetailsOrderItem is EqualUnmodifiableListView)
      return _orderHistoryDetailsOrderItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryDetailsOrderItem);
  }

  @override
  final OrderHistoryDetailsPaymentTerm orderHistoryDetailsPaymentTerm;
  @override
  final StringValue orderHistoryDetailsSpecialInstructions;
  final List<PoDocuments> _orderHistoryDetailsPoDocuments;
  @override
  List<PoDocuments> get orderHistoryDetailsPoDocuments {
    if (_orderHistoryDetailsPoDocuments is EqualUnmodifiableListView)
      return _orderHistoryDetailsPoDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryDetailsPoDocuments);
  }

  @override
  final bool isMarketPlace;
  @override
  final double taxRate;

  @override
  String toString() {
    return 'OrderHistoryDetails(totalTax: $totalTax, orderValue: $orderValue, deliveryFee: $deliveryFee, manualFee: $manualFee, totalValue: $totalValue, totalDiscount: $totalDiscount, processingStatus: $processingStatus, requestedDeliveryDate: $requestedDeliveryDate, expectedDeliveryDate: $expectedDeliveryDate, type: $type, telephoneNumber: $telephoneNumber, createdDate: $createdDate, eZRXNumber: $eZRXNumber, orderBy: $orderBy, referenceNotes: $referenceNotes, orderNumber: $orderNumber, soldTo: $soldTo, shipTo: $shipTo, companyName: $companyName, poReference: $poReference, shipToAddress: $shipToAddress, soldToAddress: $soldToAddress, invoiceNumber: $invoiceNumber, orderReason: $orderReason, itemCount: $itemCount, orderHistoryDetailsOrderItem: $orderHistoryDetailsOrderItem, orderHistoryDetailsPaymentTerm: $orderHistoryDetailsPaymentTerm, orderHistoryDetailsSpecialInstructions: $orderHistoryDetailsSpecialInstructions, orderHistoryDetailsPoDocuments: $orderHistoryDetailsPoDocuments, isMarketPlace: $isMarketPlace, taxRate: $taxRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryDetailsImpl &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.orderValue, orderValue) ||
                other.orderValue == orderValue) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.manualFee, manualFee) ||
                other.manualFee == manualFee) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.totalDiscount, totalDiscount) ||
                other.totalDiscount == totalDiscount) &&
            (identical(other.processingStatus, processingStatus) ||
                other.processingStatus == processingStatus) &&
            (identical(other.requestedDeliveryDate, requestedDeliveryDate) ||
                other.requestedDeliveryDate == requestedDeliveryDate) &&
            (identical(other.expectedDeliveryDate, expectedDeliveryDate) ||
                other.expectedDeliveryDate == expectedDeliveryDate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.telephoneNumber, telephoneNumber) ||
                other.telephoneNumber == telephoneNumber) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.eZRXNumber, eZRXNumber) ||
                other.eZRXNumber == eZRXNumber) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy) &&
            (identical(other.referenceNotes, referenceNotes) ||
                other.referenceNotes == referenceNotes) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.shipTo, shipTo) || other.shipTo == shipTo) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.poReference, poReference) ||
                other.poReference == poReference) &&
            (identical(other.shipToAddress, shipToAddress) ||
                other.shipToAddress == shipToAddress) &&
            (identical(other.soldToAddress, soldToAddress) ||
                other.soldToAddress == soldToAddress) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.orderReason, orderReason) ||
                other.orderReason == orderReason) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            const DeepCollectionEquality().equals(
                other._orderHistoryDetailsOrderItem,
                _orderHistoryDetailsOrderItem) &&
            (identical(other.orderHistoryDetailsPaymentTerm,
                    orderHistoryDetailsPaymentTerm) ||
                other.orderHistoryDetailsPaymentTerm ==
                    orderHistoryDetailsPaymentTerm) &&
            (identical(other.orderHistoryDetailsSpecialInstructions,
                    orderHistoryDetailsSpecialInstructions) ||
                other.orderHistoryDetailsSpecialInstructions ==
                    orderHistoryDetailsSpecialInstructions) &&
            const DeepCollectionEquality().equals(
                other._orderHistoryDetailsPoDocuments,
                _orderHistoryDetailsPoDocuments) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace) &&
            (identical(other.taxRate, taxRate) || other.taxRate == taxRate));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        totalTax,
        orderValue,
        deliveryFee,
        manualFee,
        totalValue,
        totalDiscount,
        processingStatus,
        requestedDeliveryDate,
        expectedDeliveryDate,
        type,
        telephoneNumber,
        createdDate,
        eZRXNumber,
        orderBy,
        referenceNotes,
        orderNumber,
        soldTo,
        shipTo,
        companyName,
        poReference,
        shipToAddress,
        soldToAddress,
        invoiceNumber,
        orderReason,
        itemCount,
        const DeepCollectionEquality().hash(_orderHistoryDetailsOrderItem),
        orderHistoryDetailsPaymentTerm,
        orderHistoryDetailsSpecialInstructions,
        const DeepCollectionEquality().hash(_orderHistoryDetailsPoDocuments),
        isMarketPlace,
        taxRate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryDetailsImplCopyWith<_$OrderHistoryDetailsImpl> get copyWith =>
      __$$OrderHistoryDetailsImplCopyWithImpl<_$OrderHistoryDetailsImpl>(
          this, _$identity);
}

abstract class _OrderHistoryDetails extends OrderHistoryDetails {
  factory _OrderHistoryDetails(
      {required final double totalTax,
      required final double orderValue,
      required final double deliveryFee,
      required final double manualFee,
      required final double totalValue,
      required final double totalDiscount,
      required final OrderStepValue processingStatus,
      required final DateTimeStringValue requestedDeliveryDate,
      required final DateTimeStringValue expectedDeliveryDate,
      required final DocumentType type,
      required final PhoneNumber telephoneNumber,
      required final DateTimeStringValue createdDate,
      required final String eZRXNumber,
      required final StringValue orderBy,
      required final StringValue referenceNotes,
      required final OrderNumber orderNumber,
      required final String soldTo,
      required final String shipTo,
      required final CompanyName companyName,
      required final StringValue poReference,
      required final String shipToAddress,
      required final String soldToAddress,
      required final StringValue invoiceNumber,
      required final String orderReason,
      required final int itemCount,
      required final List<OrderHistoryDetailsOrderItem>
          orderHistoryDetailsOrderItem,
      required final OrderHistoryDetailsPaymentTerm
          orderHistoryDetailsPaymentTerm,
      required final StringValue orderHistoryDetailsSpecialInstructions,
      required final List<PoDocuments> orderHistoryDetailsPoDocuments,
      required final bool isMarketPlace,
      required final double taxRate}) = _$OrderHistoryDetailsImpl;
  _OrderHistoryDetails._() : super._();

  @override
  double get totalTax;
  @override
  double get orderValue;
  @override
  double get deliveryFee;
  @override
  double get manualFee;
  @override
  double get totalValue;
  @override
  double get totalDiscount;
  @override
  OrderStepValue get processingStatus;
  @override
  DateTimeStringValue get requestedDeliveryDate;
  @override
  DateTimeStringValue get expectedDeliveryDate;
  @override
  DocumentType get type;
  @override
  PhoneNumber get telephoneNumber;
  @override
  DateTimeStringValue get createdDate;
  @override
  String get eZRXNumber;
  @override
  StringValue get orderBy;
  @override
  StringValue get referenceNotes;
  @override
  OrderNumber get orderNumber;
  @override //used for orderHistory api in view vy order section
  String get soldTo;
  @override
  String get shipTo;
  @override
  CompanyName get companyName;
  @override
  StringValue get poReference;
  @override
  String get shipToAddress;
  @override
  String get soldToAddress;
  @override
  StringValue get invoiceNumber;
  @override
  String get orderReason;
  @override
  int get itemCount;
  @override
  List<OrderHistoryDetailsOrderItem> get orderHistoryDetailsOrderItem;
  @override
  OrderHistoryDetailsPaymentTerm get orderHistoryDetailsPaymentTerm;
  @override
  StringValue get orderHistoryDetailsSpecialInstructions;
  @override
  List<PoDocuments> get orderHistoryDetailsPoDocuments;
  @override
  bool get isMarketPlace;
  @override
  double get taxRate;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryDetailsImplCopyWith<_$OrderHistoryDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
