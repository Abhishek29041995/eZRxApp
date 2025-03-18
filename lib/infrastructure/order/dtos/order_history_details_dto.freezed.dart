// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderHistoryDetailsDto _$OrderHistoryDetailsDtoFromJson(
    Map<String, dynamic> json) {
  return _OrderHistoryDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDetailsDto {
  @JsonKey(name: 'orderValue', defaultValue: 0.0)
  double get orderValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalTax', defaultValue: 0)
  double get totalTax => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryFee', defaultValue: 0)
  double get deliveryFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'manualFee', defaultValue: 0)
  double get manualFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalValue', defaultValue: 0)
  double get totalValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalDiscount', defaultValue: 0)
  double get totalDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'processingStatus', defaultValue: '')
  String get processingStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
  String get requestedDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expectedDeliveryDate', defaultValue: '')
  String get expectedDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'telephoneNumber', defaultValue: '')
  String get telephoneNumber => throw _privateConstructorUsedError;
  @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
  String get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'eZRXNumber', defaultValue: '')
  String get eZRXNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderBy', defaultValue: '')
  String get orderBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'referenceNotes', defaultValue: '')
  String get referenceNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'companyName', defaultValue: '')
  String get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNumber', defaultValue: '')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'pOReference', defaultValue: '')
  String get pOReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipTo', defaultValue: '')
  String get shipTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'soldTo', defaultValue: '')
  String get soldTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipToAddres', defaultValue: '')
  String get shipToAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'soldToAddress', defaultValue: '')
  String get soldToAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoiceNumber', defaultValue: '')
  String get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderReason', defaultValue: '')
  String get orderReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderItems', readValue: JsonReadValueHelper.readList)
  List<OrderHistoryDetailsOrderItemDto> get orderHistoryDetailsOrderItem =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'paymentTerm', readValue: JsonReadValueHelper.readValueMapDynamic)
  OrderHistoryDetailsPaymentTermDto get orderHistoryDetailsPaymentTerm =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'specialInstructions', readValue: JsonReadValueHelper.readString)
  String get orderHistoryDetailsSpecialInstructions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'pODocuments', readValue: JsonReadValueHelper.readList)
  List<PoDocumentsDto> get orderHistoryDetailsPoDocuments =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'itmCount', defaultValue: 0)
  int get itemCount => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
  double get taxRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryDetailsDtoCopyWith<OrderHistoryDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsDtoCopyWith<$Res> {
  factory $OrderHistoryDetailsDtoCopyWith(OrderHistoryDetailsDto value,
          $Res Function(OrderHistoryDetailsDto) then) =
      _$OrderHistoryDetailsDtoCopyWithImpl<$Res, OrderHistoryDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'orderValue', defaultValue: 0.0) double orderValue,
      @JsonKey(name: 'totalTax', defaultValue: 0) double totalTax,
      @JsonKey(name: 'deliveryFee', defaultValue: 0) double deliveryFee,
      @JsonKey(name: 'manualFee', defaultValue: 0) double manualFee,
      @JsonKey(name: 'totalValue', defaultValue: 0) double totalValue,
      @JsonKey(name: 'totalDiscount', defaultValue: 0) double totalDiscount,
      @JsonKey(name: 'processingStatus', defaultValue: '')
      String processingStatus,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
      String requestedDeliveryDate,
      @JsonKey(name: 'expectedDeliveryDate', defaultValue: '')
      String expectedDeliveryDate,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'telephoneNumber', defaultValue: '')
      String telephoneNumber,
      @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
      String createdDate,
      @JsonKey(name: 'eZRXNumber', defaultValue: '') String eZRXNumber,
      @JsonKey(name: 'orderBy', defaultValue: '') String orderBy,
      @JsonKey(name: 'referenceNotes', defaultValue: '') String referenceNotes,
      @JsonKey(name: 'companyName', defaultValue: '') String companyName,
      @JsonKey(name: 'orderNumber', defaultValue: '') String orderNumber,
      @JsonKey(name: 'pOReference', defaultValue: '') String pOReference,
      @JsonKey(name: 'shipTo', defaultValue: '') String shipTo,
      @JsonKey(name: 'soldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'shipToAddres', defaultValue: '') String shipToAddress,
      @JsonKey(name: 'soldToAddress', defaultValue: '') String soldToAddress,
      @JsonKey(name: 'invoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'orderReason', defaultValue: '') String orderReason,
      @JsonKey(name: 'orderItems', readValue: JsonReadValueHelper.readList)
      List<OrderHistoryDetailsOrderItemDto> orderHistoryDetailsOrderItem,
      @JsonKey(
          name: 'paymentTerm',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      OrderHistoryDetailsPaymentTermDto orderHistoryDetailsPaymentTerm,
      @JsonKey(
          name: 'specialInstructions',
          readValue: JsonReadValueHelper.readString)
      String orderHistoryDetailsSpecialInstructions,
      @JsonKey(name: 'pODocuments', readValue: JsonReadValueHelper.readList)
      List<PoDocumentsDto> orderHistoryDetailsPoDocuments,
      @JsonKey(name: 'itmCount', defaultValue: 0) int itemCount,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
      double taxRate});

  $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res>
      get orderHistoryDetailsPaymentTerm;
}

/// @nodoc
class _$OrderHistoryDetailsDtoCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsDto>
    implements $OrderHistoryDetailsDtoCopyWith<$Res> {
  _$OrderHistoryDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderValue = null,
    Object? totalTax = null,
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
    Object? companyName = null,
    Object? orderNumber = null,
    Object? pOReference = null,
    Object? shipTo = null,
    Object? soldTo = null,
    Object? shipToAddress = null,
    Object? soldToAddress = null,
    Object? invoiceNumber = null,
    Object? orderReason = null,
    Object? orderHistoryDetailsOrderItem = null,
    Object? orderHistoryDetailsPaymentTerm = null,
    Object? orderHistoryDetailsSpecialInstructions = null,
    Object? orderHistoryDetailsPoDocuments = null,
    Object? itemCount = null,
    Object? isMarketPlace = null,
    Object? taxRate = null,
  }) {
    return _then(_value.copyWith(
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
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
              as String,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      expectedDeliveryDate: null == expectedDeliveryDate
          ? _value.expectedDeliveryDate
          : expectedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      eZRXNumber: null == eZRXNumber
          ? _value.eZRXNumber
          : eZRXNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNotes: null == referenceNotes
          ? _value.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      pOReference: null == pOReference
          ? _value.pOReference
          : pOReference // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
      orderHistoryDetailsOrderItem: null == orderHistoryDetailsOrderItem
          ? _value.orderHistoryDetailsOrderItem
          : orderHistoryDetailsOrderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDto>,
      orderHistoryDetailsPaymentTerm: null == orderHistoryDetailsPaymentTerm
          ? _value.orderHistoryDetailsPaymentTerm
          : orderHistoryDetailsPaymentTerm // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsPaymentTermDto,
      orderHistoryDetailsSpecialInstructions: null ==
              orderHistoryDetailsSpecialInstructions
          ? _value.orderHistoryDetailsSpecialInstructions
          : orderHistoryDetailsSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      orderHistoryDetailsPoDocuments: null == orderHistoryDetailsPoDocuments
          ? _value.orderHistoryDetailsPoDocuments
          : orderHistoryDetailsPoDocuments // ignore: cast_nullable_to_non_nullable
              as List<PoDocumentsDto>,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
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
  $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res>
      get orderHistoryDetailsPaymentTerm {
    return $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res>(
        _value.orderHistoryDetailsPaymentTerm, (value) {
      return _then(
          _value.copyWith(orderHistoryDetailsPaymentTerm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderHistoryDetailsDtoImplCopyWith<$Res>
    implements $OrderHistoryDetailsDtoCopyWith<$Res> {
  factory _$$OrderHistoryDetailsDtoImplCopyWith(
          _$OrderHistoryDetailsDtoImpl value,
          $Res Function(_$OrderHistoryDetailsDtoImpl) then) =
      __$$OrderHistoryDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'orderValue', defaultValue: 0.0) double orderValue,
      @JsonKey(name: 'totalTax', defaultValue: 0) double totalTax,
      @JsonKey(name: 'deliveryFee', defaultValue: 0) double deliveryFee,
      @JsonKey(name: 'manualFee', defaultValue: 0) double manualFee,
      @JsonKey(name: 'totalValue', defaultValue: 0) double totalValue,
      @JsonKey(name: 'totalDiscount', defaultValue: 0) double totalDiscount,
      @JsonKey(name: 'processingStatus', defaultValue: '')
      String processingStatus,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
      String requestedDeliveryDate,
      @JsonKey(name: 'expectedDeliveryDate', defaultValue: '')
      String expectedDeliveryDate,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'telephoneNumber', defaultValue: '')
      String telephoneNumber,
      @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
      String createdDate,
      @JsonKey(name: 'eZRXNumber', defaultValue: '') String eZRXNumber,
      @JsonKey(name: 'orderBy', defaultValue: '') String orderBy,
      @JsonKey(name: 'referenceNotes', defaultValue: '') String referenceNotes,
      @JsonKey(name: 'companyName', defaultValue: '') String companyName,
      @JsonKey(name: 'orderNumber', defaultValue: '') String orderNumber,
      @JsonKey(name: 'pOReference', defaultValue: '') String pOReference,
      @JsonKey(name: 'shipTo', defaultValue: '') String shipTo,
      @JsonKey(name: 'soldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'shipToAddres', defaultValue: '') String shipToAddress,
      @JsonKey(name: 'soldToAddress', defaultValue: '') String soldToAddress,
      @JsonKey(name: 'invoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'orderReason', defaultValue: '') String orderReason,
      @JsonKey(name: 'orderItems', readValue: JsonReadValueHelper.readList)
      List<OrderHistoryDetailsOrderItemDto> orderHistoryDetailsOrderItem,
      @JsonKey(
          name: 'paymentTerm',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      OrderHistoryDetailsPaymentTermDto orderHistoryDetailsPaymentTerm,
      @JsonKey(
          name: 'specialInstructions',
          readValue: JsonReadValueHelper.readString)
      String orderHistoryDetailsSpecialInstructions,
      @JsonKey(name: 'pODocuments', readValue: JsonReadValueHelper.readList)
      List<PoDocumentsDto> orderHistoryDetailsPoDocuments,
      @JsonKey(name: 'itmCount', defaultValue: 0) int itemCount,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
      double taxRate});

  @override
  $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res>
      get orderHistoryDetailsPaymentTerm;
}

/// @nodoc
class __$$OrderHistoryDetailsDtoImplCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsDtoCopyWithImpl<$Res,
        _$OrderHistoryDetailsDtoImpl>
    implements _$$OrderHistoryDetailsDtoImplCopyWith<$Res> {
  __$$OrderHistoryDetailsDtoImplCopyWithImpl(
      _$OrderHistoryDetailsDtoImpl _value,
      $Res Function(_$OrderHistoryDetailsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderValue = null,
    Object? totalTax = null,
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
    Object? companyName = null,
    Object? orderNumber = null,
    Object? pOReference = null,
    Object? shipTo = null,
    Object? soldTo = null,
    Object? shipToAddress = null,
    Object? soldToAddress = null,
    Object? invoiceNumber = null,
    Object? orderReason = null,
    Object? orderHistoryDetailsOrderItem = null,
    Object? orderHistoryDetailsPaymentTerm = null,
    Object? orderHistoryDetailsSpecialInstructions = null,
    Object? orderHistoryDetailsPoDocuments = null,
    Object? itemCount = null,
    Object? isMarketPlace = null,
    Object? taxRate = null,
  }) {
    return _then(_$OrderHistoryDetailsDtoImpl(
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
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
              as String,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      expectedDeliveryDate: null == expectedDeliveryDate
          ? _value.expectedDeliveryDate
          : expectedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      eZRXNumber: null == eZRXNumber
          ? _value.eZRXNumber
          : eZRXNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNotes: null == referenceNotes
          ? _value.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      pOReference: null == pOReference
          ? _value.pOReference
          : pOReference // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
      orderHistoryDetailsOrderItem: null == orderHistoryDetailsOrderItem
          ? _value._orderHistoryDetailsOrderItem
          : orderHistoryDetailsOrderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDto>,
      orderHistoryDetailsPaymentTerm: null == orderHistoryDetailsPaymentTerm
          ? _value.orderHistoryDetailsPaymentTerm
          : orderHistoryDetailsPaymentTerm // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsPaymentTermDto,
      orderHistoryDetailsSpecialInstructions: null ==
              orderHistoryDetailsSpecialInstructions
          ? _value.orderHistoryDetailsSpecialInstructions
          : orderHistoryDetailsSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      orderHistoryDetailsPoDocuments: null == orderHistoryDetailsPoDocuments
          ? _value._orderHistoryDetailsPoDocuments
          : orderHistoryDetailsPoDocuments // ignore: cast_nullable_to_non_nullable
              as List<PoDocumentsDto>,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
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
@JsonSerializable()
class _$OrderHistoryDetailsDtoImpl extends _OrderHistoryDetailsDto {
  const _$OrderHistoryDetailsDtoImpl(
      {@JsonKey(name: 'orderValue', defaultValue: 0.0) required this.orderValue,
      @JsonKey(name: 'totalTax', defaultValue: 0) required this.totalTax,
      @JsonKey(name: 'deliveryFee', defaultValue: 0) required this.deliveryFee,
      @JsonKey(name: 'manualFee', defaultValue: 0) required this.manualFee,
      @JsonKey(name: 'totalValue', defaultValue: 0) required this.totalValue,
      @JsonKey(name: 'totalDiscount', defaultValue: 0)
      required this.totalDiscount,
      @JsonKey(name: 'processingStatus', defaultValue: '')
      required this.processingStatus,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
      required this.requestedDeliveryDate,
      @JsonKey(name: 'expectedDeliveryDate', defaultValue: '')
      required this.expectedDeliveryDate,
      @JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'telephoneNumber', defaultValue: '')
      required this.telephoneNumber,
      @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
      required this.createdDate,
      @JsonKey(name: 'eZRXNumber', defaultValue: '') required this.eZRXNumber,
      @JsonKey(name: 'orderBy', defaultValue: '') required this.orderBy,
      @JsonKey(name: 'referenceNotes', defaultValue: '')
      required this.referenceNotes,
      @JsonKey(name: 'companyName', defaultValue: '') required this.companyName,
      @JsonKey(name: 'orderNumber', defaultValue: '') required this.orderNumber,
      @JsonKey(name: 'pOReference', defaultValue: '') required this.pOReference,
      @JsonKey(name: 'shipTo', defaultValue: '') required this.shipTo,
      @JsonKey(name: 'soldTo', defaultValue: '') required this.soldTo,
      @JsonKey(name: 'shipToAddres', defaultValue: '')
      required this.shipToAddress,
      @JsonKey(name: 'soldToAddress', defaultValue: '')
      required this.soldToAddress,
      @JsonKey(name: 'invoiceNumber', defaultValue: '')
      required this.invoiceNumber,
      @JsonKey(name: 'orderReason', defaultValue: '') required this.orderReason,
      @JsonKey(name: 'orderItems', readValue: JsonReadValueHelper.readList)
      required final List<OrderHistoryDetailsOrderItemDto>
          orderHistoryDetailsOrderItem,
      @JsonKey(
          name: 'paymentTerm',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.orderHistoryDetailsPaymentTerm,
      @JsonKey(
          name: 'specialInstructions',
          readValue: JsonReadValueHelper.readString)
      required this.orderHistoryDetailsSpecialInstructions,
      @JsonKey(name: 'pODocuments', readValue: JsonReadValueHelper.readList)
      required final List<PoDocumentsDto> orderHistoryDetailsPoDocuments,
      @JsonKey(name: 'itmCount', defaultValue: 0) required this.itemCount,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required this.isMarketPlace,
      @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
      required this.taxRate})
      : _orderHistoryDetailsOrderItem = orderHistoryDetailsOrderItem,
        _orderHistoryDetailsPoDocuments = orderHistoryDetailsPoDocuments,
        super._();

  factory _$OrderHistoryDetailsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderHistoryDetailsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'orderValue', defaultValue: 0.0)
  final double orderValue;
  @override
  @JsonKey(name: 'totalTax', defaultValue: 0)
  final double totalTax;
  @override
  @JsonKey(name: 'deliveryFee', defaultValue: 0)
  final double deliveryFee;
  @override
  @JsonKey(name: 'manualFee', defaultValue: 0)
  final double manualFee;
  @override
  @JsonKey(name: 'totalValue', defaultValue: 0)
  final double totalValue;
  @override
  @JsonKey(name: 'totalDiscount', defaultValue: 0)
  final double totalDiscount;
  @override
  @JsonKey(name: 'processingStatus', defaultValue: '')
  final String processingStatus;
  @override
  @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
  final String requestedDeliveryDate;
  @override
  @JsonKey(name: 'expectedDeliveryDate', defaultValue: '')
  final String expectedDeliveryDate;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'telephoneNumber', defaultValue: '')
  final String telephoneNumber;
  @override
  @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
  final String createdDate;
  @override
  @JsonKey(name: 'eZRXNumber', defaultValue: '')
  final String eZRXNumber;
  @override
  @JsonKey(name: 'orderBy', defaultValue: '')
  final String orderBy;
  @override
  @JsonKey(name: 'referenceNotes', defaultValue: '')
  final String referenceNotes;
  @override
  @JsonKey(name: 'companyName', defaultValue: '')
  final String companyName;
  @override
  @JsonKey(name: 'orderNumber', defaultValue: '')
  final String orderNumber;
  @override
  @JsonKey(name: 'pOReference', defaultValue: '')
  final String pOReference;
  @override
  @JsonKey(name: 'shipTo', defaultValue: '')
  final String shipTo;
  @override
  @JsonKey(name: 'soldTo', defaultValue: '')
  final String soldTo;
  @override
  @JsonKey(name: 'shipToAddres', defaultValue: '')
  final String shipToAddress;
  @override
  @JsonKey(name: 'soldToAddress', defaultValue: '')
  final String soldToAddress;
  @override
  @JsonKey(name: 'invoiceNumber', defaultValue: '')
  final String invoiceNumber;
  @override
  @JsonKey(name: 'orderReason', defaultValue: '')
  final String orderReason;
  final List<OrderHistoryDetailsOrderItemDto> _orderHistoryDetailsOrderItem;
  @override
  @JsonKey(name: 'orderItems', readValue: JsonReadValueHelper.readList)
  List<OrderHistoryDetailsOrderItemDto> get orderHistoryDetailsOrderItem {
    if (_orderHistoryDetailsOrderItem is EqualUnmodifiableListView)
      return _orderHistoryDetailsOrderItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryDetailsOrderItem);
  }

  @override
  @JsonKey(
      name: 'paymentTerm', readValue: JsonReadValueHelper.readValueMapDynamic)
  final OrderHistoryDetailsPaymentTermDto orderHistoryDetailsPaymentTerm;
  @override
  @JsonKey(
      name: 'specialInstructions', readValue: JsonReadValueHelper.readString)
  final String orderHistoryDetailsSpecialInstructions;
  final List<PoDocumentsDto> _orderHistoryDetailsPoDocuments;
  @override
  @JsonKey(name: 'pODocuments', readValue: JsonReadValueHelper.readList)
  List<PoDocumentsDto> get orderHistoryDetailsPoDocuments {
    if (_orderHistoryDetailsPoDocuments is EqualUnmodifiableListView)
      return _orderHistoryDetailsPoDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryDetailsPoDocuments);
  }

  @override
  @JsonKey(name: 'itmCount', defaultValue: 0)
  final int itemCount;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  final bool isMarketPlace;
  @override
  @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
  final double taxRate;

  @override
  String toString() {
    return 'OrderHistoryDetailsDto(orderValue: $orderValue, totalTax: $totalTax, deliveryFee: $deliveryFee, manualFee: $manualFee, totalValue: $totalValue, totalDiscount: $totalDiscount, processingStatus: $processingStatus, requestedDeliveryDate: $requestedDeliveryDate, expectedDeliveryDate: $expectedDeliveryDate, type: $type, telephoneNumber: $telephoneNumber, createdDate: $createdDate, eZRXNumber: $eZRXNumber, orderBy: $orderBy, referenceNotes: $referenceNotes, companyName: $companyName, orderNumber: $orderNumber, pOReference: $pOReference, shipTo: $shipTo, soldTo: $soldTo, shipToAddress: $shipToAddress, soldToAddress: $soldToAddress, invoiceNumber: $invoiceNumber, orderReason: $orderReason, orderHistoryDetailsOrderItem: $orderHistoryDetailsOrderItem, orderHistoryDetailsPaymentTerm: $orderHistoryDetailsPaymentTerm, orderHistoryDetailsSpecialInstructions: $orderHistoryDetailsSpecialInstructions, orderHistoryDetailsPoDocuments: $orderHistoryDetailsPoDocuments, itemCount: $itemCount, isMarketPlace: $isMarketPlace, taxRate: $taxRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryDetailsDtoImpl &&
            (identical(other.orderValue, orderValue) ||
                other.orderValue == orderValue) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
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
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.pOReference, pOReference) ||
                other.pOReference == pOReference) &&
            (identical(other.shipTo, shipTo) || other.shipTo == shipTo) &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.shipToAddress, shipToAddress) ||
                other.shipToAddress == shipToAddress) &&
            (identical(other.soldToAddress, soldToAddress) ||
                other.soldToAddress == soldToAddress) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.orderReason, orderReason) ||
                other.orderReason == orderReason) &&
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
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace) &&
            (identical(other.taxRate, taxRate) || other.taxRate == taxRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        orderValue,
        totalTax,
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
        companyName,
        orderNumber,
        pOReference,
        shipTo,
        soldTo,
        shipToAddress,
        soldToAddress,
        invoiceNumber,
        orderReason,
        const DeepCollectionEquality().hash(_orderHistoryDetailsOrderItem),
        orderHistoryDetailsPaymentTerm,
        orderHistoryDetailsSpecialInstructions,
        const DeepCollectionEquality().hash(_orderHistoryDetailsPoDocuments),
        itemCount,
        isMarketPlace,
        taxRate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryDetailsDtoImplCopyWith<_$OrderHistoryDetailsDtoImpl>
      get copyWith => __$$OrderHistoryDetailsDtoImplCopyWithImpl<
          _$OrderHistoryDetailsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _OrderHistoryDetailsDto extends OrderHistoryDetailsDto {
  const factory _OrderHistoryDetailsDto(
      {@JsonKey(name: 'orderValue', defaultValue: 0.0)
      required final double orderValue,
      @JsonKey(name: 'totalTax', defaultValue: 0)
      required final double totalTax,
      @JsonKey(name: 'deliveryFee', defaultValue: 0)
      required final double deliveryFee,
      @JsonKey(name: 'manualFee', defaultValue: 0)
      required final double manualFee,
      @JsonKey(name: 'totalValue', defaultValue: 0)
      required final double totalValue,
      @JsonKey(name: 'totalDiscount', defaultValue: 0)
      required final double totalDiscount,
      @JsonKey(name: 'processingStatus', defaultValue: '')
      required final String processingStatus,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
      required final String requestedDeliveryDate,
      @JsonKey(name: 'expectedDeliveryDate', defaultValue: '')
      required final String expectedDeliveryDate,
      @JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'telephoneNumber', defaultValue: '')
      required final String telephoneNumber,
      @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
      required final String createdDate,
      @JsonKey(name: 'eZRXNumber', defaultValue: '')
      required final String eZRXNumber,
      @JsonKey(name: 'orderBy', defaultValue: '') required final String orderBy,
      @JsonKey(name: 'referenceNotes', defaultValue: '')
      required final String referenceNotes,
      @JsonKey(name: 'companyName', defaultValue: '')
      required final String companyName,
      @JsonKey(name: 'orderNumber', defaultValue: '')
      required final String orderNumber,
      @JsonKey(name: 'pOReference', defaultValue: '')
      required final String pOReference,
      @JsonKey(name: 'shipTo', defaultValue: '') required final String shipTo,
      @JsonKey(name: 'soldTo', defaultValue: '') required final String soldTo,
      @JsonKey(name: 'shipToAddres', defaultValue: '')
      required final String shipToAddress,
      @JsonKey(name: 'soldToAddress', defaultValue: '')
      required final String soldToAddress,
      @JsonKey(name: 'invoiceNumber', defaultValue: '')
      required final String invoiceNumber,
      @JsonKey(name: 'orderReason', defaultValue: '')
      required final String orderReason,
      @JsonKey(name: 'orderItems', readValue: JsonReadValueHelper.readList)
      required final List<OrderHistoryDetailsOrderItemDto>
          orderHistoryDetailsOrderItem,
      @JsonKey(
          name: 'paymentTerm',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      required final OrderHistoryDetailsPaymentTermDto
          orderHistoryDetailsPaymentTerm,
      @JsonKey(
          name: 'specialInstructions',
          readValue: JsonReadValueHelper.readString)
      required final String orderHistoryDetailsSpecialInstructions,
      @JsonKey(name: 'pODocuments', readValue: JsonReadValueHelper.readList)
      required final List<PoDocumentsDto> orderHistoryDetailsPoDocuments,
      @JsonKey(name: 'itmCount', defaultValue: 0) required final int itemCount,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required final bool isMarketPlace,
      @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
      required final double taxRate}) = _$OrderHistoryDetailsDtoImpl;
  const _OrderHistoryDetailsDto._() : super._();

  factory _OrderHistoryDetailsDto.fromJson(Map<String, dynamic> json) =
      _$OrderHistoryDetailsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'orderValue', defaultValue: 0.0)
  double get orderValue;
  @override
  @JsonKey(name: 'totalTax', defaultValue: 0)
  double get totalTax;
  @override
  @JsonKey(name: 'deliveryFee', defaultValue: 0)
  double get deliveryFee;
  @override
  @JsonKey(name: 'manualFee', defaultValue: 0)
  double get manualFee;
  @override
  @JsonKey(name: 'totalValue', defaultValue: 0)
  double get totalValue;
  @override
  @JsonKey(name: 'totalDiscount', defaultValue: 0)
  double get totalDiscount;
  @override
  @JsonKey(name: 'processingStatus', defaultValue: '')
  String get processingStatus;
  @override
  @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
  String get requestedDeliveryDate;
  @override
  @JsonKey(name: 'expectedDeliveryDate', defaultValue: '')
  String get expectedDeliveryDate;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'telephoneNumber', defaultValue: '')
  String get telephoneNumber;
  @override
  @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
  String get createdDate;
  @override
  @JsonKey(name: 'eZRXNumber', defaultValue: '')
  String get eZRXNumber;
  @override
  @JsonKey(name: 'orderBy', defaultValue: '')
  String get orderBy;
  @override
  @JsonKey(name: 'referenceNotes', defaultValue: '')
  String get referenceNotes;
  @override
  @JsonKey(name: 'companyName', defaultValue: '')
  String get companyName;
  @override
  @JsonKey(name: 'orderNumber', defaultValue: '')
  String get orderNumber;
  @override
  @JsonKey(name: 'pOReference', defaultValue: '')
  String get pOReference;
  @override
  @JsonKey(name: 'shipTo', defaultValue: '')
  String get shipTo;
  @override
  @JsonKey(name: 'soldTo', defaultValue: '')
  String get soldTo;
  @override
  @JsonKey(name: 'shipToAddres', defaultValue: '')
  String get shipToAddress;
  @override
  @JsonKey(name: 'soldToAddress', defaultValue: '')
  String get soldToAddress;
  @override
  @JsonKey(name: 'invoiceNumber', defaultValue: '')
  String get invoiceNumber;
  @override
  @JsonKey(name: 'orderReason', defaultValue: '')
  String get orderReason;
  @override
  @JsonKey(name: 'orderItems', readValue: JsonReadValueHelper.readList)
  List<OrderHistoryDetailsOrderItemDto> get orderHistoryDetailsOrderItem;
  @override
  @JsonKey(
      name: 'paymentTerm', readValue: JsonReadValueHelper.readValueMapDynamic)
  OrderHistoryDetailsPaymentTermDto get orderHistoryDetailsPaymentTerm;
  @override
  @JsonKey(
      name: 'specialInstructions', readValue: JsonReadValueHelper.readString)
  String get orderHistoryDetailsSpecialInstructions;
  @override
  @JsonKey(name: 'pODocuments', readValue: JsonReadValueHelper.readList)
  List<PoDocumentsDto> get orderHistoryDetailsPoDocuments;
  @override
  @JsonKey(name: 'itmCount', defaultValue: 0)
  int get itemCount;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace;
  @override
  @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
  double get taxRate;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryDetailsDtoImplCopyWith<_$OrderHistoryDetailsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
