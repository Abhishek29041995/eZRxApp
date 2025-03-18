// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_order_items_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderHistoryDetailsOrderItemDto _$OrderHistoryDetailsOrderItemDtoFromJson(
    Map<String, dynamic> json) {
  return _OrderHistoryDetailsOrderItemDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDetailsOrderItemDto {
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialCode')
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
  @JsonKey(name: 'tax', defaultValue: 0.0)
  double get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'sAPStatus', defaultValue: '')
  String get sAPStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'plannedDeliveryDate', defaultValue: '')
  String get plannedDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickedQuantity', defaultValue: 0)
  int get pickedQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'lineReferenceNotes', defaultValue: '')
  String get lineReferenceNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'lineNumber', defaultValue: '')
  String get lineNumber => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'isTenderContractMaterial',
      defaultValue: false,
      readValue: JsonReadValueHelper.readBoolStringFormat)
  bool get isTenderContractMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'parentID', defaultValue: '')
  String get parentId => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'details', defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[])
  List<OrderHistoryDetailsOrderItemDetailsDto> get details =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'tenderContractDetails',
      readValue: JsonReadValueHelper.readValueMapDynamic)
  OrderHistoryDetailsTenderContractDto get tenderContractDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'productType', readValue: JsonReadValueHelper.readProductType)
  String get productType => throw _privateConstructorUsedError;
  @JsonKey(name: 'promoStatus', defaultValue: false)
  bool get promosStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'isCounterOffer', defaultValue: false)
  bool get isCounterOffer => throw _privateConstructorUsedError;
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace => throw _privateConstructorUsedError;
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
  $OrderHistoryDetailsOrderItemDtoCopyWith<OrderHistoryDetailsOrderItemDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsOrderItemDtoCopyWith<$Res> {
  factory $OrderHistoryDetailsOrderItemDtoCopyWith(
          OrderHistoryDetailsOrderItemDto value,
          $Res Function(OrderHistoryDetailsOrderItemDto) then) =
      _$OrderHistoryDetailsOrderItemDtoCopyWithImpl<$Res,
          OrderHistoryDetailsOrderItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'materialCode') String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'qty', defaultValue: 0) int qty,
      @JsonKey(name: 'unitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'mrp', defaultValue: 0.0) double originPrice,
      @JsonKey(name: 'totalPrice', defaultValue: 0.0) double totalPrice,
      @JsonKey(name: 'tax', defaultValue: 0.0) double tax,
      @JsonKey(name: 'sAPStatus', defaultValue: '') String sAPStatus,
      @JsonKey(name: 'plannedDeliveryDate', defaultValue: '')
      String plannedDeliveryDate,
      @JsonKey(name: 'pickedQuantity', defaultValue: 0) int pickedQuantity,
      @JsonKey(name: 'lineReferenceNotes', defaultValue: '')
      String lineReferenceNotes,
      @JsonKey(name: 'lineNumber', defaultValue: '') String lineNumber,
      @JsonKey(
          name: 'isTenderContractMaterial',
          defaultValue: false,
          readValue: JsonReadValueHelper.readBoolStringFormat)
      bool isTenderContractMaterial,
      @JsonKey(name: 'parentID', defaultValue: '') String parentId,
      @JsonKey(
          name: 'details',
          defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[])
      List<OrderHistoryDetailsOrderItemDetailsDto> details,
      @JsonKey(
          name: 'tenderContractDetails',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      OrderHistoryDetailsTenderContractDto tenderContractDetails,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      String itemRegistrationNumber,
      @JsonKey(
          name: 'productType', readValue: JsonReadValueHelper.readProductType)
      String productType,
      @JsonKey(name: 'promoStatus', defaultValue: false) bool promosStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false) bool isCounterOffer,
      @JsonKey(name: 'hidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'isCovid', defaultValue: false) bool isCovid,
      @JsonKey(name: 'totalUnitPrice', defaultValue: 0.0) double totalUnitPrice,
      @JsonKey(name: 'totalTax', defaultValue: 0.0) double totalTax,
      @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
      double taxRate,
      @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
      List<BatchesDto> batches});

  $OrderHistoryDetailsTenderContractDtoCopyWith<$Res> get tenderContractDetails;
}

/// @nodoc
class _$OrderHistoryDetailsOrderItemDtoCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsOrderItemDto>
    implements $OrderHistoryDetailsOrderItemDtoCopyWith<$Res> {
  _$OrderHistoryDetailsOrderItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? originPrice = null,
    Object? totalPrice = null,
    Object? tax = null,
    Object? sAPStatus = null,
    Object? plannedDeliveryDate = null,
    Object? pickedQuantity = null,
    Object? lineReferenceNotes = null,
    Object? lineNumber = null,
    Object? isTenderContractMaterial = null,
    Object? parentId = null,
    Object? details = null,
    Object? tenderContractDetails = null,
    Object? principalName = null,
    Object? principalCode = null,
    Object? governmentMaterialCode = null,
    Object? itemRegistrationNumber = null,
    Object? productType = null,
    Object? promosStatus = null,
    Object? isCounterOffer = null,
    Object? hidePrice = null,
    Object? isMarketPlace = null,
    Object? isCovid = null,
    Object? totalUnitPrice = null,
    Object? totalTax = null,
    Object? taxRate = null,
    Object? batches = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
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
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      sAPStatus: null == sAPStatus
          ? _value.sAPStatus
          : sAPStatus // ignore: cast_nullable_to_non_nullable
              as String,
      plannedDeliveryDate: null == plannedDeliveryDate
          ? _value.plannedDeliveryDate
          : plannedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      pickedQuantity: null == pickedQuantity
          ? _value.pickedQuantity
          : pickedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      lineReferenceNotes: null == lineReferenceNotes
          ? _value.lineReferenceNotes
          : lineReferenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isTenderContractMaterial: null == isTenderContractMaterial
          ? _value.isTenderContractMaterial
          : isTenderContractMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDetailsDto>,
      tenderContractDetails: null == tenderContractDetails
          ? _value.tenderContractDetails
          : tenderContractDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsTenderContractDto,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      promosStatus: null == promosStatus
          ? _value.promosStatus
          : promosStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isCounterOffer: null == isCounterOffer
          ? _value.isCounterOffer
          : isCounterOffer // ignore: cast_nullable_to_non_nullable
              as bool,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsTenderContractDtoCopyWith<$Res>
      get tenderContractDetails {
    return $OrderHistoryDetailsTenderContractDtoCopyWith<$Res>(
        _value.tenderContractDetails, (value) {
      return _then(_value.copyWith(tenderContractDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderHistoryDetailsOrderItemDtoImplCopyWith<$Res>
    implements $OrderHistoryDetailsOrderItemDtoCopyWith<$Res> {
  factory _$$OrderHistoryDetailsOrderItemDtoImplCopyWith(
          _$OrderHistoryDetailsOrderItemDtoImpl value,
          $Res Function(_$OrderHistoryDetailsOrderItemDtoImpl) then) =
      __$$OrderHistoryDetailsOrderItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'materialCode') String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'qty', defaultValue: 0) int qty,
      @JsonKey(name: 'unitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'mrp', defaultValue: 0.0) double originPrice,
      @JsonKey(name: 'totalPrice', defaultValue: 0.0) double totalPrice,
      @JsonKey(name: 'tax', defaultValue: 0.0) double tax,
      @JsonKey(name: 'sAPStatus', defaultValue: '') String sAPStatus,
      @JsonKey(name: 'plannedDeliveryDate', defaultValue: '')
      String plannedDeliveryDate,
      @JsonKey(name: 'pickedQuantity', defaultValue: 0) int pickedQuantity,
      @JsonKey(name: 'lineReferenceNotes', defaultValue: '')
      String lineReferenceNotes,
      @JsonKey(name: 'lineNumber', defaultValue: '') String lineNumber,
      @JsonKey(
          name: 'isTenderContractMaterial',
          defaultValue: false,
          readValue: JsonReadValueHelper.readBoolStringFormat)
      bool isTenderContractMaterial,
      @JsonKey(name: 'parentID', defaultValue: '') String parentId,
      @JsonKey(
          name: 'details',
          defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[])
      List<OrderHistoryDetailsOrderItemDetailsDto> details,
      @JsonKey(
          name: 'tenderContractDetails',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      OrderHistoryDetailsTenderContractDto tenderContractDetails,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      String itemRegistrationNumber,
      @JsonKey(
          name: 'productType', readValue: JsonReadValueHelper.readProductType)
      String productType,
      @JsonKey(name: 'promoStatus', defaultValue: false) bool promosStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false) bool isCounterOffer,
      @JsonKey(name: 'hidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'isCovid', defaultValue: false) bool isCovid,
      @JsonKey(name: 'totalUnitPrice', defaultValue: 0.0) double totalUnitPrice,
      @JsonKey(name: 'totalTax', defaultValue: 0.0) double totalTax,
      @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
      double taxRate,
      @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
      List<BatchesDto> batches});

  @override
  $OrderHistoryDetailsTenderContractDtoCopyWith<$Res> get tenderContractDetails;
}

/// @nodoc
class __$$OrderHistoryDetailsOrderItemDtoImplCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsOrderItemDtoCopyWithImpl<$Res,
        _$OrderHistoryDetailsOrderItemDtoImpl>
    implements _$$OrderHistoryDetailsOrderItemDtoImplCopyWith<$Res> {
  __$$OrderHistoryDetailsOrderItemDtoImplCopyWithImpl(
      _$OrderHistoryDetailsOrderItemDtoImpl _value,
      $Res Function(_$OrderHistoryDetailsOrderItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? originPrice = null,
    Object? totalPrice = null,
    Object? tax = null,
    Object? sAPStatus = null,
    Object? plannedDeliveryDate = null,
    Object? pickedQuantity = null,
    Object? lineReferenceNotes = null,
    Object? lineNumber = null,
    Object? isTenderContractMaterial = null,
    Object? parentId = null,
    Object? details = null,
    Object? tenderContractDetails = null,
    Object? principalName = null,
    Object? principalCode = null,
    Object? governmentMaterialCode = null,
    Object? itemRegistrationNumber = null,
    Object? productType = null,
    Object? promosStatus = null,
    Object? isCounterOffer = null,
    Object? hidePrice = null,
    Object? isMarketPlace = null,
    Object? isCovid = null,
    Object? totalUnitPrice = null,
    Object? totalTax = null,
    Object? taxRate = null,
    Object? batches = null,
  }) {
    return _then(_$OrderHistoryDetailsOrderItemDtoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
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
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      sAPStatus: null == sAPStatus
          ? _value.sAPStatus
          : sAPStatus // ignore: cast_nullable_to_non_nullable
              as String,
      plannedDeliveryDate: null == plannedDeliveryDate
          ? _value.plannedDeliveryDate
          : plannedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      pickedQuantity: null == pickedQuantity
          ? _value.pickedQuantity
          : pickedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      lineReferenceNotes: null == lineReferenceNotes
          ? _value.lineReferenceNotes
          : lineReferenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isTenderContractMaterial: null == isTenderContractMaterial
          ? _value.isTenderContractMaterial
          : isTenderContractMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDetailsDto>,
      tenderContractDetails: null == tenderContractDetails
          ? _value.tenderContractDetails
          : tenderContractDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsTenderContractDto,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      promosStatus: null == promosStatus
          ? _value.promosStatus
          : promosStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isCounterOffer: null == isCounterOffer
          ? _value.isCounterOffer
          : isCounterOffer // ignore: cast_nullable_to_non_nullable
              as bool,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
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
class _$OrderHistoryDetailsOrderItemDtoImpl
    extends _OrderHistoryDetailsOrderItemDto {
  const _$OrderHistoryDetailsOrderItemDtoImpl(
      {@JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'materialCode') required this.materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      required this.materialDescription,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      required this.defaultMaterialDescription,
      @JsonKey(name: 'qty', defaultValue: 0) required this.qty,
      @JsonKey(name: 'unitPrice', defaultValue: 0.0) required this.unitPrice,
      @JsonKey(name: 'mrp', defaultValue: 0.0) required this.originPrice,
      @JsonKey(name: 'totalPrice', defaultValue: 0.0) required this.totalPrice,
      @JsonKey(name: 'tax', defaultValue: 0.0) required this.tax,
      @JsonKey(name: 'sAPStatus', defaultValue: '') required this.sAPStatus,
      @JsonKey(name: 'plannedDeliveryDate', defaultValue: '')
      required this.plannedDeliveryDate,
      @JsonKey(name: 'pickedQuantity', defaultValue: 0)
      required this.pickedQuantity,
      @JsonKey(name: 'lineReferenceNotes', defaultValue: '')
      required this.lineReferenceNotes,
      @JsonKey(name: 'lineNumber', defaultValue: '') required this.lineNumber,
      @JsonKey(
          name: 'isTenderContractMaterial',
          defaultValue: false,
          readValue: JsonReadValueHelper.readBoolStringFormat)
      required this.isTenderContractMaterial,
      @JsonKey(name: 'parentID', defaultValue: '') required this.parentId,
      @JsonKey(
          name: 'details',
          defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[])
      required final List<OrderHistoryDetailsOrderItemDetailsDto> details,
      @JsonKey(
          name: 'tenderContractDetails',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.tenderContractDetails,
      @JsonKey(
          name: 'principalName', defaultValue: '')
      required this.principalName,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required this.principalCode,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      required this.governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      required this.itemRegistrationNumber,
      @JsonKey(
          name: 'productType', readValue: JsonReadValueHelper.readProductType)
      required this.productType,
      @JsonKey(name: 'promoStatus', defaultValue: false)
      required this.promosStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false)
      required this.isCounterOffer,
      @JsonKey(name: 'hidePrice', defaultValue: false) required this.hidePrice,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required this.isMarketPlace,
      @JsonKey(name: 'isCovid', defaultValue: false) required this.isCovid,
      @JsonKey(name: 'totalUnitPrice', defaultValue: 0.0)
      required this.totalUnitPrice,
      @JsonKey(name: 'totalTax', defaultValue: 0.0) required this.totalTax,
      @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
      required this.taxRate,
      @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
      required final List<BatchesDto> batches})
      : _details = details,
        _batches = batches,
        super._();

  factory _$OrderHistoryDetailsOrderItemDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$OrderHistoryDetailsOrderItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'materialCode')
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
  @JsonKey(name: 'tax', defaultValue: 0.0)
  final double tax;
  @override
  @JsonKey(name: 'sAPStatus', defaultValue: '')
  final String sAPStatus;
  @override
  @JsonKey(name: 'plannedDeliveryDate', defaultValue: '')
  final String plannedDeliveryDate;
  @override
  @JsonKey(name: 'pickedQuantity', defaultValue: 0)
  final int pickedQuantity;
  @override
  @JsonKey(name: 'lineReferenceNotes', defaultValue: '')
  final String lineReferenceNotes;
  @override
  @JsonKey(name: 'lineNumber', defaultValue: '')
  final String lineNumber;
  @override
  @JsonKey(
      name: 'isTenderContractMaterial',
      defaultValue: false,
      readValue: JsonReadValueHelper.readBoolStringFormat)
  final bool isTenderContractMaterial;
  @override
  @JsonKey(name: 'parentID', defaultValue: '')
  final String parentId;
  final List<OrderHistoryDetailsOrderItemDetailsDto> _details;
  @override
  @JsonKey(
      name: 'details', defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[])
  List<OrderHistoryDetailsOrderItemDetailsDto> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  @JsonKey(
      name: 'tenderContractDetails',
      readValue: JsonReadValueHelper.readValueMapDynamic)
  final OrderHistoryDetailsTenderContractDto tenderContractDetails;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  final String principalName;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  final String principalCode;
  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  final String governmentMaterialCode;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  final String itemRegistrationNumber;
  @override
  @JsonKey(name: 'productType', readValue: JsonReadValueHelper.readProductType)
  final String productType;
  @override
  @JsonKey(name: 'promoStatus', defaultValue: false)
  final bool promosStatus;
  @override
  @JsonKey(name: 'isCounterOffer', defaultValue: false)
  final bool isCounterOffer;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  final bool hidePrice;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  final bool isMarketPlace;
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
    return 'OrderHistoryDetailsOrderItemDto(type: $type, materialNumber: $materialNumber, materialDescription: $materialDescription, defaultMaterialDescription: $defaultMaterialDescription, qty: $qty, unitPrice: $unitPrice, originPrice: $originPrice, totalPrice: $totalPrice, tax: $tax, sAPStatus: $sAPStatus, plannedDeliveryDate: $plannedDeliveryDate, pickedQuantity: $pickedQuantity, lineReferenceNotes: $lineReferenceNotes, lineNumber: $lineNumber, isTenderContractMaterial: $isTenderContractMaterial, parentId: $parentId, details: $details, tenderContractDetails: $tenderContractDetails, principalName: $principalName, principalCode: $principalCode, governmentMaterialCode: $governmentMaterialCode, itemRegistrationNumber: $itemRegistrationNumber, productType: $productType, promosStatus: $promosStatus, isCounterOffer: $isCounterOffer, hidePrice: $hidePrice, isMarketPlace: $isMarketPlace, isCovid: $isCovid, totalUnitPrice: $totalUnitPrice, totalTax: $totalTax, taxRate: $taxRate, batches: $batches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryDetailsOrderItemDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.defaultMaterialDescription,
                    defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.originPrice, originPrice) ||
                other.originPrice == originPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.sAPStatus, sAPStatus) ||
                other.sAPStatus == sAPStatus) &&
            (identical(other.plannedDeliveryDate, plannedDeliveryDate) ||
                other.plannedDeliveryDate == plannedDeliveryDate) &&
            (identical(other.pickedQuantity, pickedQuantity) ||
                other.pickedQuantity == pickedQuantity) &&
            (identical(other.lineReferenceNotes, lineReferenceNotes) ||
                other.lineReferenceNotes == lineReferenceNotes) &&
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber) &&
            (identical(
                    other.isTenderContractMaterial, isTenderContractMaterial) ||
                other.isTenderContractMaterial == isTenderContractMaterial) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.tenderContractDetails, tenderContractDetails) ||
                other.tenderContractDetails == tenderContractDetails) &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode) &&
            (identical(other.governmentMaterialCode, governmentMaterialCode) ||
                other.governmentMaterialCode == governmentMaterialCode) &&
            (identical(other.itemRegistrationNumber, itemRegistrationNumber) ||
                other.itemRegistrationNumber == itemRegistrationNumber) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.promosStatus, promosStatus) ||
                other.promosStatus == promosStatus) &&
            (identical(other.isCounterOffer, isCounterOffer) ||
                other.isCounterOffer == isCounterOffer) &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace) &&
            (identical(other.isCovid, isCovid) || other.isCovid == isCovid) &&
            (identical(other.totalUnitPrice, totalUnitPrice) ||
                other.totalUnitPrice == totalUnitPrice) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.taxRate, taxRate) || other.taxRate == taxRate) &&
            const DeepCollectionEquality().equals(other._batches, _batches));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        type,
        materialNumber,
        materialDescription,
        defaultMaterialDescription,
        qty,
        unitPrice,
        originPrice,
        totalPrice,
        tax,
        sAPStatus,
        plannedDeliveryDate,
        pickedQuantity,
        lineReferenceNotes,
        lineNumber,
        isTenderContractMaterial,
        parentId,
        const DeepCollectionEquality().hash(_details),
        tenderContractDetails,
        principalName,
        principalCode,
        governmentMaterialCode,
        itemRegistrationNumber,
        productType,
        promosStatus,
        isCounterOffer,
        hidePrice,
        isMarketPlace,
        isCovid,
        totalUnitPrice,
        totalTax,
        taxRate,
        const DeepCollectionEquality().hash(_batches)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryDetailsOrderItemDtoImplCopyWith<
          _$OrderHistoryDetailsOrderItemDtoImpl>
      get copyWith => __$$OrderHistoryDetailsOrderItemDtoImplCopyWithImpl<
          _$OrderHistoryDetailsOrderItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryDetailsOrderItemDtoImplToJson(
      this,
    );
  }
}

abstract class _OrderHistoryDetailsOrderItemDto
    extends OrderHistoryDetailsOrderItemDto {
  const factory _OrderHistoryDetailsOrderItemDto(
      {@JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'materialCode') required final String materialNumber,
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
      @JsonKey(name: 'tax', defaultValue: 0.0) required final double tax,
      @JsonKey(name: 'sAPStatus', defaultValue: '')
      required final String sAPStatus,
      @JsonKey(name: 'plannedDeliveryDate', defaultValue: '')
      required final String plannedDeliveryDate,
      @JsonKey(name: 'pickedQuantity', defaultValue: 0)
      required final int pickedQuantity,
      @JsonKey(name: 'lineReferenceNotes', defaultValue: '')
      required final String lineReferenceNotes,
      @JsonKey(name: 'lineNumber', defaultValue: '')
      required final String lineNumber,
      @JsonKey(
          name: 'isTenderContractMaterial',
          defaultValue: false,
          readValue: JsonReadValueHelper.readBoolStringFormat)
      required final bool isTenderContractMaterial,
      @JsonKey(name: 'parentID', defaultValue: '')
      required final String parentId,
      @JsonKey(
          name: 'details',
          defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[])
      required final List<OrderHistoryDetailsOrderItemDetailsDto> details,
      @JsonKey(
          name: 'tenderContractDetails',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      required final OrderHistoryDetailsTenderContractDto tenderContractDetails,
      @JsonKey(name: 'principalName', defaultValue: '')
      required final String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required final String principalCode,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      required final String governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      required final String itemRegistrationNumber,
      @JsonKey(name: 'productType', readValue: JsonReadValueHelper.readProductType)
      required final String productType,
      @JsonKey(name: 'promoStatus', defaultValue: false)
      required final bool promosStatus,
      @JsonKey(name: 'isCounterOffer', defaultValue: false)
      required final bool isCounterOffer,
      @JsonKey(name: 'hidePrice', defaultValue: false)
      required final bool hidePrice,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required final bool isMarketPlace,
      @JsonKey(name: 'isCovid', defaultValue: false)
      required final bool isCovid,
      @JsonKey(name: 'totalUnitPrice', defaultValue: 0.0)
      required final double totalUnitPrice,
      @JsonKey(name: 'totalTax', defaultValue: 0.0)
      required final double totalTax,
      @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
      required final double taxRate,
      @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
      required final List<BatchesDto>
          batches}) = _$OrderHistoryDetailsOrderItemDtoImpl;
  const _OrderHistoryDetailsOrderItemDto._() : super._();

  factory _OrderHistoryDetailsOrderItemDto.fromJson(Map<String, dynamic> json) =
      _$OrderHistoryDetailsOrderItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'materialCode')
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
  @JsonKey(name: 'tax', defaultValue: 0.0)
  double get tax;
  @override
  @JsonKey(name: 'sAPStatus', defaultValue: '')
  String get sAPStatus;
  @override
  @JsonKey(name: 'plannedDeliveryDate', defaultValue: '')
  String get plannedDeliveryDate;
  @override
  @JsonKey(name: 'pickedQuantity', defaultValue: 0)
  int get pickedQuantity;
  @override
  @JsonKey(name: 'lineReferenceNotes', defaultValue: '')
  String get lineReferenceNotes;
  @override
  @JsonKey(name: 'lineNumber', defaultValue: '')
  String get lineNumber;
  @override
  @JsonKey(
      name: 'isTenderContractMaterial',
      defaultValue: false,
      readValue: JsonReadValueHelper.readBoolStringFormat)
  bool get isTenderContractMaterial;
  @override
  @JsonKey(name: 'parentID', defaultValue: '')
  String get parentId;
  @override
  @JsonKey(
      name: 'details', defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[])
  List<OrderHistoryDetailsOrderItemDetailsDto> get details;
  @override
  @JsonKey(
      name: 'tenderContractDetails',
      readValue: JsonReadValueHelper.readValueMapDynamic)
  OrderHistoryDetailsTenderContractDto get tenderContractDetails;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode;
  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber;
  @override
  @JsonKey(name: 'productType', readValue: JsonReadValueHelper.readProductType)
  String get productType;
  @override
  @JsonKey(name: 'promoStatus', defaultValue: false)
  bool get promosStatus;
  @override
  @JsonKey(name: 'isCounterOffer', defaultValue: false)
  bool get isCounterOffer;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace;
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
  _$$OrderHistoryDetailsOrderItemDtoImplCopyWith<
          _$OrderHistoryDetailsOrderItemDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
