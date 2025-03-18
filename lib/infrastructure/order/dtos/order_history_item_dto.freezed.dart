// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderHistoryItemDto _$OrderHistoryItemDtoFromJson(Map<String, dynamic> json) {
  return _OrderHistoryItemDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryItemDto {
  @JsonKey(name: 'materialCode', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty', defaultValue: 0)
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'unitPrice', defaultValue: 0.0)
  double get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'mrp', defaultValue: 0.0)
  double get originPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPrice', defaultValue: 0.0)
  double get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: '')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryDate', defaultValue: '')
  String get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNumber', defaultValue: '')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
  String get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderBy', defaultValue: '')
  String get orderBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderType', defaultValue: '')
  String get orderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'isBonusMaterial', defaultValue: false)
  bool get isBonusMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'telephoneNumber', defaultValue: '')
  String get telephoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoiceNumber', defaultValue: '')
  String get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'pOReference', defaultValue: '')
  String get pOReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'manufactureName', defaultValue: '')
  String get manufactureName => throw _privateConstructorUsedError;
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
  String get requestedDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'specialInstructions', defaultValue: '')
  String get specialInstruction => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax', defaultValue: 0.0)
  double get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'eZRXNumber', defaultValue: '')
  String get eZRXNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
  List<PoDocumentsDto> get orderHistoryItemPoAttachments =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'promoStatus', defaultValue: false)
  bool get promoStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'isCounterOffer', defaultValue: false)
  bool get isCounterOffer => throw _privateConstructorUsedError;
  @JsonKey(name: 'isBundle', defaultValue: false)
  bool get isBundle => throw _privateConstructorUsedError;
  @JsonKey(name: 'lineNumber', defaultValue: '')
  String get lineNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'referenceNotes', defaultValue: '')
  String get referenceNotes => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenderContractNumber', defaultValue: '')
  String get tenderContractNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenderContractReference', defaultValue: '')
  String get tenderContractReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenderOrderReason', defaultValue: '')
  String get tenderOrderReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenderPriceUnit', defaultValue: 0)
  int get tenderPriceUnit => throw _privateConstructorUsedError;
  @StringToDoubleConverter()
  @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
  double get tenderPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'isTenderExpire', defaultValue: false)
  bool get isTenderExpired => throw _privateConstructorUsedError;
  @JsonKey(name: 'isCovid', defaultValue: false)
  bool get isCovid => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalUnitPrice', defaultValue: 0.0)
  double get totalUnitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalTax', defaultValue: 0.0)
  double get totalTax => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
  double get taxRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
  List<BatchesDto> get batches => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryItemDtoCopyWith<OrderHistoryItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryItemDtoCopyWith<$Res> {
  factory $OrderHistoryItemDtoCopyWith(
          OrderHistoryItemDto value, $Res Function(OrderHistoryItemDto) then) =
      _$OrderHistoryItemDtoCopyWithImpl<$Res, OrderHistoryItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'materialCode', defaultValue: '') String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'qty', defaultValue: 0) int qty,
      @JsonKey(name: 'unitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'mrp', defaultValue: 0.0) double originPrice,
      @JsonKey(name: 'totalPrice', defaultValue: 0.0) double totalPrice,
      @JsonKey(name: 'status', defaultValue: '') String status,
      @JsonKey(name: 'deliveryDate', defaultValue: '') String deliveryDate,
      @JsonKey(name: 'orderNumber', defaultValue: '') String orderNumber,
      @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
      String createdDate,
      @JsonKey(name: 'orderBy', defaultValue: '') String orderBy,
      @JsonKey(name: 'orderType', defaultValue: '') String orderType,
      @JsonKey(name: 'isBonusMaterial', defaultValue: false)
      bool isBonusMaterial,
      @JsonKey(name: 'telephoneNumber', defaultValue: '')
      String telephoneNumber,
      @JsonKey(name: 'invoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'pOReference', defaultValue: '') String pOReference,
      @JsonKey(name: 'manufactureName', defaultValue: '')
      String manufactureName,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      String itemRegistrationNumber,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
      String requestedDeliveryDate,
      @JsonKey(name: 'specialInstructions', defaultValue: '')
      String specialInstruction,
      @JsonKey(name: 'tax', defaultValue: 0.0) double tax,
      @JsonKey(name: 'eZRXNumber', defaultValue: '') String eZRXNumber,
      @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
      List<PoDocumentsDto> orderHistoryItemPoAttachments,
      @JsonKey(name: 'promoStatus', defaultValue: false) bool promoStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false) bool isCounterOffer,
      @JsonKey(name: 'isBundle', defaultValue: false) bool isBundle,
      @JsonKey(name: 'lineNumber', defaultValue: '') String lineNumber,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'hidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(name: 'referenceNotes', defaultValue: '') String referenceNotes,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'tenderContractNumber', defaultValue: '')
      String tenderContractNumber,
      @JsonKey(name: 'tenderContractReference', defaultValue: '')
      String tenderContractReference,
      @JsonKey(name: 'tenderOrderReason', defaultValue: '')
      String tenderOrderReason,
      @JsonKey(name: 'tenderPriceUnit', defaultValue: 0) int tenderPriceUnit,
      @StringToDoubleConverter()
      @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
      double tenderPrice,
      @JsonKey(name: 'isTenderExpire', defaultValue: false)
      bool isTenderExpired,
      @JsonKey(name: 'isCovid', defaultValue: false) bool isCovid,
      @JsonKey(name: 'totalUnitPrice', defaultValue: 0.0) double totalUnitPrice,
      @JsonKey(name: 'totalTax', defaultValue: 0.0) double totalTax,
      @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
      double taxRate,
      @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
      List<BatchesDto> batches});
}

/// @nodoc
class _$OrderHistoryItemDtoCopyWithImpl<$Res, $Val extends OrderHistoryItemDto>
    implements $OrderHistoryItemDtoCopyWith<$Res> {
  _$OrderHistoryItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? originPrice = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? deliveryDate = null,
    Object? orderNumber = null,
    Object? createdDate = null,
    Object? orderBy = null,
    Object? orderType = null,
    Object? isBonusMaterial = null,
    Object? telephoneNumber = null,
    Object? invoiceNumber = null,
    Object? pOReference = null,
    Object? manufactureName = null,
    Object? governmentMaterialCode = null,
    Object? itemRegistrationNumber = null,
    Object? requestedDeliveryDate = null,
    Object? specialInstruction = null,
    Object? tax = null,
    Object? eZRXNumber = null,
    Object? orderHistoryItemPoAttachments = null,
    Object? promoStatus = null,
    Object? isCounterOffer = null,
    Object? isBundle = null,
    Object? lineNumber = null,
    Object? principalCode = null,
    Object? hidePrice = null,
    Object? referenceNotes = null,
    Object? isMarketPlace = null,
    Object? tenderContractNumber = null,
    Object? tenderContractReference = null,
    Object? tenderOrderReason = null,
    Object? tenderPriceUnit = null,
    Object? tenderPrice = null,
    Object? isTenderExpired = null,
    Object? isCovid = null,
    Object? totalUnitPrice = null,
    Object? totalTax = null,
    Object? taxRate = null,
    Object? batches = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      originPrice: null == originPrice
          ? _value.originPrice
          : originPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      isBonusMaterial: null == isBonusMaterial
          ? _value.isBonusMaterial
          : isBonusMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      pOReference: null == pOReference
          ? _value.pOReference
          : pOReference // ignore: cast_nullable_to_non_nullable
              as String,
      manufactureName: null == manufactureName
          ? _value.manufactureName
          : manufactureName // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstruction: null == specialInstruction
          ? _value.specialInstruction
          : specialInstruction // ignore: cast_nullable_to_non_nullable
              as String,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      eZRXNumber: null == eZRXNumber
          ? _value.eZRXNumber
          : eZRXNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderHistoryItemPoAttachments: null == orderHistoryItemPoAttachments
          ? _value.orderHistoryItemPoAttachments
          : orderHistoryItemPoAttachments // ignore: cast_nullable_to_non_nullable
              as List<PoDocumentsDto>,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isCounterOffer: null == isCounterOffer
          ? _value.isCounterOffer
          : isCounterOffer // ignore: cast_nullable_to_non_nullable
              as bool,
      isBundle: null == isBundle
          ? _value.isBundle
          : isBundle // ignore: cast_nullable_to_non_nullable
              as bool,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      referenceNotes: null == referenceNotes
          ? _value.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      tenderContractNumber: null == tenderContractNumber
          ? _value.tenderContractNumber
          : tenderContractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tenderContractReference: null == tenderContractReference
          ? _value.tenderContractReference
          : tenderContractReference // ignore: cast_nullable_to_non_nullable
              as String,
      tenderOrderReason: null == tenderOrderReason
          ? _value.tenderOrderReason
          : tenderOrderReason // ignore: cast_nullable_to_non_nullable
              as String,
      tenderPriceUnit: null == tenderPriceUnit
          ? _value.tenderPriceUnit
          : tenderPriceUnit // ignore: cast_nullable_to_non_nullable
              as int,
      tenderPrice: null == tenderPrice
          ? _value.tenderPrice
          : tenderPrice // ignore: cast_nullable_to_non_nullable
              as double,
      isTenderExpired: null == isTenderExpired
          ? _value.isTenderExpired
          : isTenderExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      isCovid: null == isCovid
          ? _value.isCovid
          : isCovid // ignore: cast_nullable_to_non_nullable
              as bool,
      totalUnitPrice: null == totalUnitPrice
          ? _value.totalUnitPrice
          : totalUnitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      taxRate: null == taxRate
          ? _value.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as double,
      batches: null == batches
          ? _value.batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<BatchesDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderHistoryItemDtoImplCopyWith<$Res>
    implements $OrderHistoryItemDtoCopyWith<$Res> {
  factory _$$OrderHistoryItemDtoImplCopyWith(_$OrderHistoryItemDtoImpl value,
          $Res Function(_$OrderHistoryItemDtoImpl) then) =
      __$$OrderHistoryItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'materialCode', defaultValue: '') String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'qty', defaultValue: 0) int qty,
      @JsonKey(name: 'unitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'mrp', defaultValue: 0.0) double originPrice,
      @JsonKey(name: 'totalPrice', defaultValue: 0.0) double totalPrice,
      @JsonKey(name: 'status', defaultValue: '') String status,
      @JsonKey(name: 'deliveryDate', defaultValue: '') String deliveryDate,
      @JsonKey(name: 'orderNumber', defaultValue: '') String orderNumber,
      @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
      String createdDate,
      @JsonKey(name: 'orderBy', defaultValue: '') String orderBy,
      @JsonKey(name: 'orderType', defaultValue: '') String orderType,
      @JsonKey(name: 'isBonusMaterial', defaultValue: false)
      bool isBonusMaterial,
      @JsonKey(name: 'telephoneNumber', defaultValue: '')
      String telephoneNumber,
      @JsonKey(name: 'invoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'pOReference', defaultValue: '') String pOReference,
      @JsonKey(name: 'manufactureName', defaultValue: '')
      String manufactureName,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      String itemRegistrationNumber,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
      String requestedDeliveryDate,
      @JsonKey(name: 'specialInstructions', defaultValue: '')
      String specialInstruction,
      @JsonKey(name: 'tax', defaultValue: 0.0) double tax,
      @JsonKey(name: 'eZRXNumber', defaultValue: '') String eZRXNumber,
      @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
      List<PoDocumentsDto> orderHistoryItemPoAttachments,
      @JsonKey(name: 'promoStatus', defaultValue: false) bool promoStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false) bool isCounterOffer,
      @JsonKey(name: 'isBundle', defaultValue: false) bool isBundle,
      @JsonKey(name: 'lineNumber', defaultValue: '') String lineNumber,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'hidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(name: 'referenceNotes', defaultValue: '') String referenceNotes,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'tenderContractNumber', defaultValue: '')
      String tenderContractNumber,
      @JsonKey(name: 'tenderContractReference', defaultValue: '')
      String tenderContractReference,
      @JsonKey(name: 'tenderOrderReason', defaultValue: '')
      String tenderOrderReason,
      @JsonKey(name: 'tenderPriceUnit', defaultValue: 0) int tenderPriceUnit,
      @StringToDoubleConverter()
      @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
      double tenderPrice,
      @JsonKey(name: 'isTenderExpire', defaultValue: false)
      bool isTenderExpired,
      @JsonKey(name: 'isCovid', defaultValue: false) bool isCovid,
      @JsonKey(name: 'totalUnitPrice', defaultValue: 0.0) double totalUnitPrice,
      @JsonKey(name: 'totalTax', defaultValue: 0.0) double totalTax,
      @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
      double taxRate,
      @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
      List<BatchesDto> batches});
}

/// @nodoc
class __$$OrderHistoryItemDtoImplCopyWithImpl<$Res>
    extends _$OrderHistoryItemDtoCopyWithImpl<$Res, _$OrderHistoryItemDtoImpl>
    implements _$$OrderHistoryItemDtoImplCopyWith<$Res> {
  __$$OrderHistoryItemDtoImplCopyWithImpl(_$OrderHistoryItemDtoImpl _value,
      $Res Function(_$OrderHistoryItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? originPrice = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? deliveryDate = null,
    Object? orderNumber = null,
    Object? createdDate = null,
    Object? orderBy = null,
    Object? orderType = null,
    Object? isBonusMaterial = null,
    Object? telephoneNumber = null,
    Object? invoiceNumber = null,
    Object? pOReference = null,
    Object? manufactureName = null,
    Object? governmentMaterialCode = null,
    Object? itemRegistrationNumber = null,
    Object? requestedDeliveryDate = null,
    Object? specialInstruction = null,
    Object? tax = null,
    Object? eZRXNumber = null,
    Object? orderHistoryItemPoAttachments = null,
    Object? promoStatus = null,
    Object? isCounterOffer = null,
    Object? isBundle = null,
    Object? lineNumber = null,
    Object? principalCode = null,
    Object? hidePrice = null,
    Object? referenceNotes = null,
    Object? isMarketPlace = null,
    Object? tenderContractNumber = null,
    Object? tenderContractReference = null,
    Object? tenderOrderReason = null,
    Object? tenderPriceUnit = null,
    Object? tenderPrice = null,
    Object? isTenderExpired = null,
    Object? isCovid = null,
    Object? totalUnitPrice = null,
    Object? totalTax = null,
    Object? taxRate = null,
    Object? batches = null,
  }) {
    return _then(_$OrderHistoryItemDtoImpl(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      originPrice: null == originPrice
          ? _value.originPrice
          : originPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      isBonusMaterial: null == isBonusMaterial
          ? _value.isBonusMaterial
          : isBonusMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      pOReference: null == pOReference
          ? _value.pOReference
          : pOReference // ignore: cast_nullable_to_non_nullable
              as String,
      manufactureName: null == manufactureName
          ? _value.manufactureName
          : manufactureName // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstruction: null == specialInstruction
          ? _value.specialInstruction
          : specialInstruction // ignore: cast_nullable_to_non_nullable
              as String,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      eZRXNumber: null == eZRXNumber
          ? _value.eZRXNumber
          : eZRXNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderHistoryItemPoAttachments: null == orderHistoryItemPoAttachments
          ? _value._orderHistoryItemPoAttachments
          : orderHistoryItemPoAttachments // ignore: cast_nullable_to_non_nullable
              as List<PoDocumentsDto>,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isCounterOffer: null == isCounterOffer
          ? _value.isCounterOffer
          : isCounterOffer // ignore: cast_nullable_to_non_nullable
              as bool,
      isBundle: null == isBundle
          ? _value.isBundle
          : isBundle // ignore: cast_nullable_to_non_nullable
              as bool,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      referenceNotes: null == referenceNotes
          ? _value.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      tenderContractNumber: null == tenderContractNumber
          ? _value.tenderContractNumber
          : tenderContractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tenderContractReference: null == tenderContractReference
          ? _value.tenderContractReference
          : tenderContractReference // ignore: cast_nullable_to_non_nullable
              as String,
      tenderOrderReason: null == tenderOrderReason
          ? _value.tenderOrderReason
          : tenderOrderReason // ignore: cast_nullable_to_non_nullable
              as String,
      tenderPriceUnit: null == tenderPriceUnit
          ? _value.tenderPriceUnit
          : tenderPriceUnit // ignore: cast_nullable_to_non_nullable
              as int,
      tenderPrice: null == tenderPrice
          ? _value.tenderPrice
          : tenderPrice // ignore: cast_nullable_to_non_nullable
              as double,
      isTenderExpired: null == isTenderExpired
          ? _value.isTenderExpired
          : isTenderExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      isCovid: null == isCovid
          ? _value.isCovid
          : isCovid // ignore: cast_nullable_to_non_nullable
              as bool,
      totalUnitPrice: null == totalUnitPrice
          ? _value.totalUnitPrice
          : totalUnitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      taxRate: null == taxRate
          ? _value.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as double,
      batches: null == batches
          ? _value._batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<BatchesDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderHistoryItemDtoImpl extends _OrderHistoryItemDto {
  const _$OrderHistoryItemDtoImpl(
      {@JsonKey(name: 'materialCode', defaultValue: '')
      required this.materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      required this.materialDescription,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      required this.defaultMaterialDescription,
      @JsonKey(name: 'qty', defaultValue: 0) required this.qty,
      @JsonKey(name: 'unitPrice', defaultValue: 0.0) required this.unitPrice,
      @JsonKey(name: 'mrp', defaultValue: 0.0) required this.originPrice,
      @JsonKey(name: 'totalPrice', defaultValue: 0.0) required this.totalPrice,
      @JsonKey(name: 'status', defaultValue: '') required this.status,
      @JsonKey(name: 'deliveryDate', defaultValue: '')
      required this.deliveryDate,
      @JsonKey(name: 'orderNumber', defaultValue: '') required this.orderNumber,
      @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
      required this.createdDate,
      @JsonKey(name: 'orderBy', defaultValue: '') required this.orderBy,
      @JsonKey(name: 'orderType', defaultValue: '') required this.orderType,
      @JsonKey(name: 'isBonusMaterial', defaultValue: false)
      required this.isBonusMaterial,
      @JsonKey(name: 'telephoneNumber', defaultValue: '')
      required this.telephoneNumber,
      @JsonKey(name: 'invoiceNumber', defaultValue: '')
      required this.invoiceNumber,
      @JsonKey(name: 'pOReference', defaultValue: '') required this.pOReference,
      @JsonKey(name: 'manufactureName', defaultValue: '')
      required this.manufactureName,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      required this.governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      required this.itemRegistrationNumber,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
      required this.requestedDeliveryDate,
      @JsonKey(name: 'specialInstructions', defaultValue: '')
      required this.specialInstruction,
      @JsonKey(name: 'tax', defaultValue: 0.0) required this.tax,
      @JsonKey(name: 'eZRXNumber', defaultValue: '') required this.eZRXNumber,
      @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
      required final List<PoDocumentsDto> orderHistoryItemPoAttachments,
      @JsonKey(name: 'promoStatus', defaultValue: false)
      required this.promoStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false)
      required this.isCounterOffer,
      @JsonKey(name: 'isBundle', defaultValue: false) required this.isBundle,
      @JsonKey(name: 'lineNumber', defaultValue: '') required this.lineNumber,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required this.principalCode,
      @JsonKey(name: 'hidePrice', defaultValue: false) required this.hidePrice,
      @JsonKey(name: 'referenceNotes', defaultValue: '')
      required this.referenceNotes,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required this.isMarketPlace,
      @JsonKey(name: 'tenderContractNumber', defaultValue: '')
      required this.tenderContractNumber,
      @JsonKey(name: 'tenderContractReference', defaultValue: '')
      required this.tenderContractReference,
      @JsonKey(name: 'tenderOrderReason', defaultValue: '')
      required this.tenderOrderReason,
      @JsonKey(name: 'tenderPriceUnit', defaultValue: 0)
      required this.tenderPriceUnit,
      @StringToDoubleConverter()
      @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
      required this.tenderPrice,
      @JsonKey(name: 'isTenderExpire', defaultValue: false)
      required this.isTenderExpired,
      @JsonKey(name: 'isCovid', defaultValue: false) required this.isCovid,
      @JsonKey(name: 'totalUnitPrice', defaultValue: 0.0)
      required this.totalUnitPrice,
      @JsonKey(name: 'totalTax', defaultValue: 0.0) required this.totalTax,
      @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
      required this.taxRate,
      @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
      required final List<BatchesDto> batches})
      : _orderHistoryItemPoAttachments = orderHistoryItemPoAttachments,
        _batches = batches,
        super._();

  factory _$OrderHistoryItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderHistoryItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'materialCode', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  final String defaultMaterialDescription;
  @override
  @JsonKey(name: 'qty', defaultValue: 0)
  final int qty;
  @override
  @JsonKey(name: 'unitPrice', defaultValue: 0.0)
  final double unitPrice;
  @override
  @JsonKey(name: 'mrp', defaultValue: 0.0)
  final double originPrice;
  @override
  @JsonKey(name: 'totalPrice', defaultValue: 0.0)
  final double totalPrice;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  final String status;
  @override
  @JsonKey(name: 'deliveryDate', defaultValue: '')
  final String deliveryDate;
  @override
  @JsonKey(name: 'orderNumber', defaultValue: '')
  final String orderNumber;
  @override
  @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
  final String createdDate;
  @override
  @JsonKey(name: 'orderBy', defaultValue: '')
  final String orderBy;
  @override
  @JsonKey(name: 'orderType', defaultValue: '')
  final String orderType;
  @override
  @JsonKey(name: 'isBonusMaterial', defaultValue: false)
  final bool isBonusMaterial;
  @override
  @JsonKey(name: 'telephoneNumber', defaultValue: '')
  final String telephoneNumber;
  @override
  @JsonKey(name: 'invoiceNumber', defaultValue: '')
  final String invoiceNumber;
  @override
  @JsonKey(name: 'pOReference', defaultValue: '')
  final String pOReference;
  @override
  @JsonKey(name: 'manufactureName', defaultValue: '')
  final String manufactureName;
  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  final String governmentMaterialCode;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  final String itemRegistrationNumber;
  @override
  @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
  final String requestedDeliveryDate;
  @override
  @JsonKey(name: 'specialInstructions', defaultValue: '')
  final String specialInstruction;
  @override
  @JsonKey(name: 'tax', defaultValue: 0.0)
  final double tax;
  @override
  @JsonKey(name: 'eZRXNumber', defaultValue: '')
  final String eZRXNumber;
  final List<PoDocumentsDto> _orderHistoryItemPoAttachments;
  @override
  @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
  List<PoDocumentsDto> get orderHistoryItemPoAttachments {
    if (_orderHistoryItemPoAttachments is EqualUnmodifiableListView)
      return _orderHistoryItemPoAttachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryItemPoAttachments);
  }

  @override
  @JsonKey(name: 'promoStatus', defaultValue: false)
  final bool promoStatus;
  @override
  @JsonKey(name: 'isCounterOffer', defaultValue: false)
  final bool isCounterOffer;
  @override
  @JsonKey(name: 'isBundle', defaultValue: false)
  final bool isBundle;
  @override
  @JsonKey(name: 'lineNumber', defaultValue: '')
  final String lineNumber;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  final String principalCode;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  final bool hidePrice;
  @override
  @JsonKey(name: 'referenceNotes', defaultValue: '')
  final String referenceNotes;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  final bool isMarketPlace;
  @override
  @JsonKey(name: 'tenderContractNumber', defaultValue: '')
  final String tenderContractNumber;
  @override
  @JsonKey(name: 'tenderContractReference', defaultValue: '')
  final String tenderContractReference;
  @override
  @JsonKey(name: 'tenderOrderReason', defaultValue: '')
  final String tenderOrderReason;
  @override
  @JsonKey(name: 'tenderPriceUnit', defaultValue: 0)
  final int tenderPriceUnit;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
  final double tenderPrice;
  @override
  @JsonKey(name: 'isTenderExpire', defaultValue: false)
  final bool isTenderExpired;
  @override
  @JsonKey(name: 'isCovid', defaultValue: false)
  final bool isCovid;
  @override
  @JsonKey(name: 'totalUnitPrice', defaultValue: 0.0)
  final double totalUnitPrice;
  @override
  @JsonKey(name: 'totalTax', defaultValue: 0.0)
  final double totalTax;
  @override
  @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
  final double taxRate;
  final List<BatchesDto> _batches;
  @override
  @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
  List<BatchesDto> get batches {
    if (_batches is EqualUnmodifiableListView) return _batches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_batches);
  }

  @override
  String toString() {
    return 'OrderHistoryItemDto(materialNumber: $materialNumber, materialDescription: $materialDescription, defaultMaterialDescription: $defaultMaterialDescription, qty: $qty, unitPrice: $unitPrice, originPrice: $originPrice, totalPrice: $totalPrice, status: $status, deliveryDate: $deliveryDate, orderNumber: $orderNumber, createdDate: $createdDate, orderBy: $orderBy, orderType: $orderType, isBonusMaterial: $isBonusMaterial, telephoneNumber: $telephoneNumber, invoiceNumber: $invoiceNumber, pOReference: $pOReference, manufactureName: $manufactureName, governmentMaterialCode: $governmentMaterialCode, itemRegistrationNumber: $itemRegistrationNumber, requestedDeliveryDate: $requestedDeliveryDate, specialInstruction: $specialInstruction, tax: $tax, eZRXNumber: $eZRXNumber, orderHistoryItemPoAttachments: $orderHistoryItemPoAttachments, promoStatus: $promoStatus, isCounterOffer: $isCounterOffer, isBundle: $isBundle, lineNumber: $lineNumber, principalCode: $principalCode, hidePrice: $hidePrice, referenceNotes: $referenceNotes, isMarketPlace: $isMarketPlace, tenderContractNumber: $tenderContractNumber, tenderContractReference: $tenderContractReference, tenderOrderReason: $tenderOrderReason, tenderPriceUnit: $tenderPriceUnit, tenderPrice: $tenderPrice, isTenderExpired: $isTenderExpired, isCovid: $isCovid, totalUnitPrice: $totalUnitPrice, totalTax: $totalTax, taxRate: $taxRate, batches: $batches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryItemDtoImpl &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.defaultMaterialDescription, defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.originPrice, originPrice) ||
                other.originPrice == originPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.isBonusMaterial, isBonusMaterial) ||
                other.isBonusMaterial == isBonusMaterial) &&
            (identical(other.telephoneNumber, telephoneNumber) ||
                other.telephoneNumber == telephoneNumber) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.pOReference, pOReference) ||
                other.pOReference == pOReference) &&
            (identical(other.manufactureName, manufactureName) ||
                other.manufactureName == manufactureName) &&
            (identical(other.governmentMaterialCode, governmentMaterialCode) ||
                other.governmentMaterialCode == governmentMaterialCode) &&
            (identical(other.itemRegistrationNumber, itemRegistrationNumber) ||
                other.itemRegistrationNumber == itemRegistrationNumber) &&
            (identical(other.requestedDeliveryDate, requestedDeliveryDate) ||
                other.requestedDeliveryDate == requestedDeliveryDate) &&
            (identical(other.specialInstruction, specialInstruction) ||
                other.specialInstruction == specialInstruction) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.eZRXNumber, eZRXNumber) ||
                other.eZRXNumber == eZRXNumber) &&
            const DeepCollectionEquality().equals(
                other._orderHistoryItemPoAttachments,
                _orderHistoryItemPoAttachments) &&
            (identical(other.promoStatus, promoStatus) ||
                other.promoStatus == promoStatus) &&
            (identical(other.isCounterOffer, isCounterOffer) ||
                other.isCounterOffer == isCounterOffer) &&
            (identical(other.isBundle, isBundle) ||
                other.isBundle == isBundle) &&
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode) &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            (identical(other.referenceNotes, referenceNotes) ||
                other.referenceNotes == referenceNotes) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace) &&
            (identical(other.tenderContractNumber, tenderContractNumber) ||
                other.tenderContractNumber == tenderContractNumber) &&
            (identical(other.tenderContractReference, tenderContractReference) ||
                other.tenderContractReference == tenderContractReference) &&
            (identical(other.tenderOrderReason, tenderOrderReason) || other.tenderOrderReason == tenderOrderReason) &&
            (identical(other.tenderPriceUnit, tenderPriceUnit) || other.tenderPriceUnit == tenderPriceUnit) &&
            (identical(other.tenderPrice, tenderPrice) || other.tenderPrice == tenderPrice) &&
            (identical(other.isTenderExpired, isTenderExpired) || other.isTenderExpired == isTenderExpired) &&
            (identical(other.isCovid, isCovid) || other.isCovid == isCovid) &&
            (identical(other.totalUnitPrice, totalUnitPrice) || other.totalUnitPrice == totalUnitPrice) &&
            (identical(other.totalTax, totalTax) || other.totalTax == totalTax) &&
            (identical(other.taxRate, taxRate) || other.taxRate == taxRate) &&
            const DeepCollectionEquality().equals(other._batches, _batches));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        materialNumber,
        materialDescription,
        defaultMaterialDescription,
        qty,
        unitPrice,
        originPrice,
        totalPrice,
        status,
        deliveryDate,
        orderNumber,
        createdDate,
        orderBy,
        orderType,
        isBonusMaterial,
        telephoneNumber,
        invoiceNumber,
        pOReference,
        manufactureName,
        governmentMaterialCode,
        itemRegistrationNumber,
        requestedDeliveryDate,
        specialInstruction,
        tax,
        eZRXNumber,
        const DeepCollectionEquality().hash(_orderHistoryItemPoAttachments),
        promoStatus,
        isCounterOffer,
        isBundle,
        lineNumber,
        principalCode,
        hidePrice,
        referenceNotes,
        isMarketPlace,
        tenderContractNumber,
        tenderContractReference,
        tenderOrderReason,
        tenderPriceUnit,
        tenderPrice,
        isTenderExpired,
        isCovid,
        totalUnitPrice,
        totalTax,
        taxRate,
        const DeepCollectionEquality().hash(_batches)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryItemDtoImplCopyWith<_$OrderHistoryItemDtoImpl> get copyWith =>
      __$$OrderHistoryItemDtoImplCopyWithImpl<_$OrderHistoryItemDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryItemDtoImplToJson(
      this,
    );
  }
}

abstract class _OrderHistoryItemDto extends OrderHistoryItemDto {
  const factory _OrderHistoryItemDto(
      {@JsonKey(name: 'materialCode', defaultValue: '')
      required final String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      required final String materialDescription,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      required final String defaultMaterialDescription,
      @JsonKey(name: 'qty', defaultValue: 0) required final int qty,
      @JsonKey(name: 'unitPrice', defaultValue: 0.0)
      required final double unitPrice,
      @JsonKey(name: 'mrp', defaultValue: 0.0)
      required final double originPrice,
      @JsonKey(name: 'totalPrice', defaultValue: 0.0)
      required final double totalPrice,
      @JsonKey(name: 'status', defaultValue: '') required final String status,
      @JsonKey(name: 'deliveryDate', defaultValue: '')
      required final String deliveryDate,
      @JsonKey(name: 'orderNumber', defaultValue: '')
      required final String orderNumber,
      @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
      required final String createdDate,
      @JsonKey(name: 'orderBy', defaultValue: '') required final String orderBy,
      @JsonKey(name: 'orderType', defaultValue: '')
      required final String orderType,
      @JsonKey(name: 'isBonusMaterial', defaultValue: false)
      required final bool isBonusMaterial,
      @JsonKey(name: 'telephoneNumber', defaultValue: '')
      required final String telephoneNumber,
      @JsonKey(name: 'invoiceNumber', defaultValue: '')
      required final String invoiceNumber,
      @JsonKey(name: 'pOReference', defaultValue: '')
      required final String pOReference,
      @JsonKey(name: 'manufactureName', defaultValue: '')
      required final String manufactureName,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      required final String governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      required final String itemRegistrationNumber,
      @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
      required final String requestedDeliveryDate,
      @JsonKey(name: 'specialInstructions', defaultValue: '')
      required final String specialInstruction,
      @JsonKey(name: 'tax', defaultValue: 0.0) required final double tax,
      @JsonKey(name: 'eZRXNumber', defaultValue: '')
      required final String eZRXNumber,
      @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
      required final List<PoDocumentsDto> orderHistoryItemPoAttachments,
      @JsonKey(name: 'promoStatus', defaultValue: false)
      required final bool promoStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false)
      required final bool isCounterOffer,
      @JsonKey(name: 'isBundle', defaultValue: false)
      required final bool isBundle,
      @JsonKey(name: 'lineNumber', defaultValue: '')
      required final String lineNumber,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required final String principalCode,
      @JsonKey(name: 'hidePrice', defaultValue: false)
      required final bool hidePrice,
      @JsonKey(name: 'referenceNotes', defaultValue: '')
      required final String referenceNotes,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required final bool isMarketPlace,
      @JsonKey(name: 'tenderContractNumber', defaultValue: '')
      required final String tenderContractNumber,
      @JsonKey(name: 'tenderContractReference', defaultValue: '')
      required final String tenderContractReference,
      @JsonKey(name: 'tenderOrderReason', defaultValue: '')
      required final String tenderOrderReason,
      @JsonKey(name: 'tenderPriceUnit', defaultValue: 0)
      required final int tenderPriceUnit,
      @StringToDoubleConverter()
      @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
      required final double tenderPrice,
      @JsonKey(name: 'isTenderExpire', defaultValue: false)
      required final bool isTenderExpired,
      @JsonKey(name: 'isCovid', defaultValue: false)
      required final bool isCovid,
      @JsonKey(name: 'totalUnitPrice', defaultValue: 0.0)
      required final double totalUnitPrice,
      @JsonKey(name: 'totalTax', defaultValue: 0.0)
      required final double totalTax,
      @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
      required final double taxRate,
      @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
      required final List<BatchesDto> batches}) = _$OrderHistoryItemDtoImpl;
  const _OrderHistoryItemDto._() : super._();

  factory _OrderHistoryItemDto.fromJson(Map<String, dynamic> json) =
      _$OrderHistoryItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'materialCode', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription;
  @override
  @JsonKey(name: 'qty', defaultValue: 0)
  int get qty;
  @override
  @JsonKey(name: 'unitPrice', defaultValue: 0.0)
  double get unitPrice;
  @override
  @JsonKey(name: 'mrp', defaultValue: 0.0)
  double get originPrice;
  @override
  @JsonKey(name: 'totalPrice', defaultValue: 0.0)
  double get totalPrice;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  String get status;
  @override
  @JsonKey(name: 'deliveryDate', defaultValue: '')
  String get deliveryDate;
  @override
  @JsonKey(name: 'orderNumber', defaultValue: '')
  String get orderNumber;
  @override
  @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
  String get createdDate;
  @override
  @JsonKey(name: 'orderBy', defaultValue: '')
  String get orderBy;
  @override
  @JsonKey(name: 'orderType', defaultValue: '')
  String get orderType;
  @override
  @JsonKey(name: 'isBonusMaterial', defaultValue: false)
  bool get isBonusMaterial;
  @override
  @JsonKey(name: 'telephoneNumber', defaultValue: '')
  String get telephoneNumber;
  @override
  @JsonKey(name: 'invoiceNumber', defaultValue: '')
  String get invoiceNumber;
  @override
  @JsonKey(name: 'pOReference', defaultValue: '')
  String get pOReference;
  @override
  @JsonKey(name: 'manufactureName', defaultValue: '')
  String get manufactureName;
  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber;
  @override
  @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
  String get requestedDeliveryDate;
  @override
  @JsonKey(name: 'specialInstructions', defaultValue: '')
  String get specialInstruction;
  @override
  @JsonKey(name: 'tax', defaultValue: 0.0)
  double get tax;
  @override
  @JsonKey(name: 'eZRXNumber', defaultValue: '')
  String get eZRXNumber;
  @override
  @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
  List<PoDocumentsDto> get orderHistoryItemPoAttachments;
  @override
  @JsonKey(name: 'promoStatus', defaultValue: false)
  bool get promoStatus;
  @override
  @JsonKey(name: 'isCounterOffer', defaultValue: false)
  bool get isCounterOffer;
  @override
  @JsonKey(name: 'isBundle', defaultValue: false)
  bool get isBundle;
  @override
  @JsonKey(name: 'lineNumber', defaultValue: '')
  String get lineNumber;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice;
  @override
  @JsonKey(name: 'referenceNotes', defaultValue: '')
  String get referenceNotes;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace;
  @override
  @JsonKey(name: 'tenderContractNumber', defaultValue: '')
  String get tenderContractNumber;
  @override
  @JsonKey(name: 'tenderContractReference', defaultValue: '')
  String get tenderContractReference;
  @override
  @JsonKey(name: 'tenderOrderReason', defaultValue: '')
  String get tenderOrderReason;
  @override
  @JsonKey(name: 'tenderPriceUnit', defaultValue: 0)
  int get tenderPriceUnit;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
  double get tenderPrice;
  @override
  @JsonKey(name: 'isTenderExpire', defaultValue: false)
  bool get isTenderExpired;
  @override
  @JsonKey(name: 'isCovid', defaultValue: false)
  bool get isCovid;
  @override
  @JsonKey(name: 'totalUnitPrice', defaultValue: 0.0)
  double get totalUnitPrice;
  @override
  @JsonKey(name: 'totalTax', defaultValue: 0.0)
  double get totalTax;
  @override
  @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
  double get taxRate;
  @override
  @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
  List<BatchesDto> get batches;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryItemDtoImplCopyWith<_$OrderHistoryItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
