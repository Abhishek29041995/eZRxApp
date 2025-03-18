// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_order_items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderHistoryDetailsOrderItem {
  OrderItemType get type => throw _privateConstructorUsedError;
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  String get materialDescription => throw _privateConstructorUsedError;
  String get defaultMaterialDescription => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;
  double get originPrice => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  OrderStepValue get sAPStatus => throw _privateConstructorUsedError;
  DateTimeStringValue get plannedDeliveryDate =>
      throw _privateConstructorUsedError;
  int get pickedQuantity => throw _privateConstructorUsedError;
  Remarks get lineReferenceNotes => throw _privateConstructorUsedError;
  LineNumber get lineNumber => throw _privateConstructorUsedError;
  bool get isTenderContractMaterial => throw _privateConstructorUsedError;
  List<OrderHistoryDetailsOrderItemDetails> get details =>
      throw _privateConstructorUsedError;
  OrderHistoryDetailsTenderContract get tenderContractDetails =>
      throw _privateConstructorUsedError;
  PrincipalData get principalData => throw _privateConstructorUsedError;
  ProductImages get productImages => throw _privateConstructorUsedError;
  String get governmentMaterialCode => throw _privateConstructorUsedError;
  MaterialStockInfo get materialStockInfo => throw _privateConstructorUsedError;
  PriceAggregate get priceAggregate => throw _privateConstructorUsedError;
  MaterialInfoType get productType => throw _privateConstructorUsedError;
  String get parentId => throw _privateConstructorUsedError;
  MaterialInfo get material => throw _privateConstructorUsedError;
  bool get promoStatus => throw _privateConstructorUsedError;
  bool get isCounterOffer => throw _privateConstructorUsedError;
  bool get hidePrice => throw _privateConstructorUsedError;
  bool get isMarketPlace => throw _privateConstructorUsedError;
  bool get isCovid => throw _privateConstructorUsedError;
  StringValue get invoiceNumber => throw _privateConstructorUsedError;
  ItemRegistrationNumber get itemRegistrationNumber =>
      throw _privateConstructorUsedError;
  double get totalUnitPrice => throw _privateConstructorUsedError;
  double get totalTax => throw _privateConstructorUsedError;
  double get taxRate => throw _privateConstructorUsedError;
  List<Batches> get batches => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryDetailsOrderItemCopyWith<OrderHistoryDetailsOrderItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsOrderItemCopyWith<$Res> {
  factory $OrderHistoryDetailsOrderItemCopyWith(
          OrderHistoryDetailsOrderItem value,
          $Res Function(OrderHistoryDetailsOrderItem) then) =
      _$OrderHistoryDetailsOrderItemCopyWithImpl<$Res,
          OrderHistoryDetailsOrderItem>;
  @useResult
  $Res call(
      {OrderItemType type,
      MaterialNumber materialNumber,
      String materialDescription,
      String defaultMaterialDescription,
      int qty,
      double unitPrice,
      double originPrice,
      double totalPrice,
      double tax,
      OrderStepValue sAPStatus,
      DateTimeStringValue plannedDeliveryDate,
      int pickedQuantity,
      Remarks lineReferenceNotes,
      LineNumber lineNumber,
      bool isTenderContractMaterial,
      List<OrderHistoryDetailsOrderItemDetails> details,
      OrderHistoryDetailsTenderContract tenderContractDetails,
      PrincipalData principalData,
      ProductImages productImages,
      String governmentMaterialCode,
      MaterialStockInfo materialStockInfo,
      PriceAggregate priceAggregate,
      MaterialInfoType productType,
      String parentId,
      MaterialInfo material,
      bool promoStatus,
      bool isCounterOffer,
      bool hidePrice,
      bool isMarketPlace,
      bool isCovid,
      StringValue invoiceNumber,
      ItemRegistrationNumber itemRegistrationNumber,
      double totalUnitPrice,
      double totalTax,
      double taxRate,
      List<Batches> batches});

  $OrderHistoryDetailsTenderContractCopyWith<$Res> get tenderContractDetails;
  $PrincipalDataCopyWith<$Res> get principalData;
  $ProductImagesCopyWith<$Res> get productImages;
  $MaterialStockInfoCopyWith<$Res> get materialStockInfo;
  $PriceAggregateCopyWith<$Res> get priceAggregate;
  $MaterialInfoCopyWith<$Res> get material;
}

/// @nodoc
class _$OrderHistoryDetailsOrderItemCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsOrderItem>
    implements $OrderHistoryDetailsOrderItemCopyWith<$Res> {
  _$OrderHistoryDetailsOrderItemCopyWithImpl(this._value, this._then);

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
    Object? details = null,
    Object? tenderContractDetails = null,
    Object? principalData = null,
    Object? productImages = null,
    Object? governmentMaterialCode = null,
    Object? materialStockInfo = null,
    Object? priceAggregate = null,
    Object? productType = null,
    Object? parentId = null,
    Object? material = null,
    Object? promoStatus = null,
    Object? isCounterOffer = null,
    Object? hidePrice = null,
    Object? isMarketPlace = null,
    Object? isCovid = null,
    Object? invoiceNumber = null,
    Object? itemRegistrationNumber = null,
    Object? totalUnitPrice = null,
    Object? totalTax = null,
    Object? taxRate = null,
    Object? batches = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as OrderItemType,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
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
              as OrderStepValue,
      plannedDeliveryDate: null == plannedDeliveryDate
          ? _value.plannedDeliveryDate
          : plannedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      pickedQuantity: null == pickedQuantity
          ? _value.pickedQuantity
          : pickedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      lineReferenceNotes: null == lineReferenceNotes
          ? _value.lineReferenceNotes
          : lineReferenceNotes // ignore: cast_nullable_to_non_nullable
              as Remarks,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as LineNumber,
      isTenderContractMaterial: null == isTenderContractMaterial
          ? _value.isTenderContractMaterial
          : isTenderContractMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDetails>,
      tenderContractDetails: null == tenderContractDetails
          ? _value.tenderContractDetails
          : tenderContractDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsTenderContract,
      principalData: null == principalData
          ? _value.principalData
          : principalData // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
      productImages: null == productImages
          ? _value.productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as ProductImages,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      materialStockInfo: null == materialStockInfo
          ? _value.materialStockInfo
          : materialStockInfo // ignore: cast_nullable_to_non_nullable
              as MaterialStockInfo,
      priceAggregate: null == priceAggregate
          ? _value.priceAggregate
          : priceAggregate // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as MaterialInfoType,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
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
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as ItemRegistrationNumber,
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
              as List<Batches>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsTenderContractCopyWith<$Res> get tenderContractDetails {
    return $OrderHistoryDetailsTenderContractCopyWith<$Res>(
        _value.tenderContractDetails, (value) {
      return _then(_value.copyWith(tenderContractDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PrincipalDataCopyWith<$Res> get principalData {
    return $PrincipalDataCopyWith<$Res>(_value.principalData, (value) {
      return _then(_value.copyWith(principalData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductImagesCopyWith<$Res> get productImages {
    return $ProductImagesCopyWith<$Res>(_value.productImages, (value) {
      return _then(_value.copyWith(productImages: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialStockInfoCopyWith<$Res> get materialStockInfo {
    return $MaterialStockInfoCopyWith<$Res>(_value.materialStockInfo, (value) {
      return _then(_value.copyWith(materialStockInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get priceAggregate {
    return $PriceAggregateCopyWith<$Res>(_value.priceAggregate, (value) {
      return _then(_value.copyWith(priceAggregate: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get material {
    return $MaterialInfoCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderHistoryDetailsOrderItemImplCopyWith<$Res>
    implements $OrderHistoryDetailsOrderItemCopyWith<$Res> {
  factory _$$OrderHistoryDetailsOrderItemImplCopyWith(
          _$OrderHistoryDetailsOrderItemImpl value,
          $Res Function(_$OrderHistoryDetailsOrderItemImpl) then) =
      __$$OrderHistoryDetailsOrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderItemType type,
      MaterialNumber materialNumber,
      String materialDescription,
      String defaultMaterialDescription,
      int qty,
      double unitPrice,
      double originPrice,
      double totalPrice,
      double tax,
      OrderStepValue sAPStatus,
      DateTimeStringValue plannedDeliveryDate,
      int pickedQuantity,
      Remarks lineReferenceNotes,
      LineNumber lineNumber,
      bool isTenderContractMaterial,
      List<OrderHistoryDetailsOrderItemDetails> details,
      OrderHistoryDetailsTenderContract tenderContractDetails,
      PrincipalData principalData,
      ProductImages productImages,
      String governmentMaterialCode,
      MaterialStockInfo materialStockInfo,
      PriceAggregate priceAggregate,
      MaterialInfoType productType,
      String parentId,
      MaterialInfo material,
      bool promoStatus,
      bool isCounterOffer,
      bool hidePrice,
      bool isMarketPlace,
      bool isCovid,
      StringValue invoiceNumber,
      ItemRegistrationNumber itemRegistrationNumber,
      double totalUnitPrice,
      double totalTax,
      double taxRate,
      List<Batches> batches});

  @override
  $OrderHistoryDetailsTenderContractCopyWith<$Res> get tenderContractDetails;
  @override
  $PrincipalDataCopyWith<$Res> get principalData;
  @override
  $ProductImagesCopyWith<$Res> get productImages;
  @override
  $MaterialStockInfoCopyWith<$Res> get materialStockInfo;
  @override
  $PriceAggregateCopyWith<$Res> get priceAggregate;
  @override
  $MaterialInfoCopyWith<$Res> get material;
}

/// @nodoc
class __$$OrderHistoryDetailsOrderItemImplCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsOrderItemCopyWithImpl<$Res,
        _$OrderHistoryDetailsOrderItemImpl>
    implements _$$OrderHistoryDetailsOrderItemImplCopyWith<$Res> {
  __$$OrderHistoryDetailsOrderItemImplCopyWithImpl(
      _$OrderHistoryDetailsOrderItemImpl _value,
      $Res Function(_$OrderHistoryDetailsOrderItemImpl) _then)
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
    Object? details = null,
    Object? tenderContractDetails = null,
    Object? principalData = null,
    Object? productImages = null,
    Object? governmentMaterialCode = null,
    Object? materialStockInfo = null,
    Object? priceAggregate = null,
    Object? productType = null,
    Object? parentId = null,
    Object? material = null,
    Object? promoStatus = null,
    Object? isCounterOffer = null,
    Object? hidePrice = null,
    Object? isMarketPlace = null,
    Object? isCovid = null,
    Object? invoiceNumber = null,
    Object? itemRegistrationNumber = null,
    Object? totalUnitPrice = null,
    Object? totalTax = null,
    Object? taxRate = null,
    Object? batches = null,
  }) {
    return _then(_$OrderHistoryDetailsOrderItemImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as OrderItemType,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
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
              as OrderStepValue,
      plannedDeliveryDate: null == plannedDeliveryDate
          ? _value.plannedDeliveryDate
          : plannedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      pickedQuantity: null == pickedQuantity
          ? _value.pickedQuantity
          : pickedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      lineReferenceNotes: null == lineReferenceNotes
          ? _value.lineReferenceNotes
          : lineReferenceNotes // ignore: cast_nullable_to_non_nullable
              as Remarks,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as LineNumber,
      isTenderContractMaterial: null == isTenderContractMaterial
          ? _value.isTenderContractMaterial
          : isTenderContractMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDetails>,
      tenderContractDetails: null == tenderContractDetails
          ? _value.tenderContractDetails
          : tenderContractDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsTenderContract,
      principalData: null == principalData
          ? _value.principalData
          : principalData // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
      productImages: null == productImages
          ? _value.productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as ProductImages,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      materialStockInfo: null == materialStockInfo
          ? _value.materialStockInfo
          : materialStockInfo // ignore: cast_nullable_to_non_nullable
              as MaterialStockInfo,
      priceAggregate: null == priceAggregate
          ? _value.priceAggregate
          : priceAggregate // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as MaterialInfoType,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
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
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as ItemRegistrationNumber,
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
              as List<Batches>,
    ));
  }
}

/// @nodoc

class _$OrderHistoryDetailsOrderItemImpl extends _OrderHistoryDetailsOrderItem {
  _$OrderHistoryDetailsOrderItemImpl(
      {required this.type,
      required this.materialNumber,
      required this.materialDescription,
      required this.defaultMaterialDescription,
      required this.qty,
      required this.unitPrice,
      required this.originPrice,
      required this.totalPrice,
      required this.tax,
      required this.sAPStatus,
      required this.plannedDeliveryDate,
      required this.pickedQuantity,
      required this.lineReferenceNotes,
      required this.lineNumber,
      required this.isTenderContractMaterial,
      required final List<OrderHistoryDetailsOrderItemDetails> details,
      required this.tenderContractDetails,
      required this.principalData,
      required this.productImages,
      required this.governmentMaterialCode,
      required this.materialStockInfo,
      required this.priceAggregate,
      required this.productType,
      required this.parentId,
      required this.material,
      required this.promoStatus,
      required this.isCounterOffer,
      required this.hidePrice,
      required this.isMarketPlace,
      required this.isCovid,
      required this.invoiceNumber,
      required this.itemRegistrationNumber,
      required this.totalUnitPrice,
      required this.totalTax,
      required this.taxRate,
      required final List<Batches> batches})
      : _details = details,
        _batches = batches,
        super._();

  @override
  final OrderItemType type;
  @override
  final MaterialNumber materialNumber;
  @override
  final String materialDescription;
  @override
  final String defaultMaterialDescription;
  @override
  final int qty;
  @override
  final double unitPrice;
  @override
  final double originPrice;
  @override
  final double totalPrice;
  @override
  final double tax;
  @override
  final OrderStepValue sAPStatus;
  @override
  final DateTimeStringValue plannedDeliveryDate;
  @override
  final int pickedQuantity;
  @override
  final Remarks lineReferenceNotes;
  @override
  final LineNumber lineNumber;
  @override
  final bool isTenderContractMaterial;
  final List<OrderHistoryDetailsOrderItemDetails> _details;
  @override
  List<OrderHistoryDetailsOrderItemDetails> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  final OrderHistoryDetailsTenderContract tenderContractDetails;
  @override
  final PrincipalData principalData;
  @override
  final ProductImages productImages;
  @override
  final String governmentMaterialCode;
  @override
  final MaterialStockInfo materialStockInfo;
  @override
  final PriceAggregate priceAggregate;
  @override
  final MaterialInfoType productType;
  @override
  final String parentId;
  @override
  final MaterialInfo material;
  @override
  final bool promoStatus;
  @override
  final bool isCounterOffer;
  @override
  final bool hidePrice;
  @override
  final bool isMarketPlace;
  @override
  final bool isCovid;
  @override
  final StringValue invoiceNumber;
  @override
  final ItemRegistrationNumber itemRegistrationNumber;
  @override
  final double totalUnitPrice;
  @override
  final double totalTax;
  @override
  final double taxRate;
  final List<Batches> _batches;
  @override
  List<Batches> get batches {
    if (_batches is EqualUnmodifiableListView) return _batches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_batches);
  }

  @override
  String toString() {
    return 'OrderHistoryDetailsOrderItem(type: $type, materialNumber: $materialNumber, materialDescription: $materialDescription, defaultMaterialDescription: $defaultMaterialDescription, qty: $qty, unitPrice: $unitPrice, originPrice: $originPrice, totalPrice: $totalPrice, tax: $tax, sAPStatus: $sAPStatus, plannedDeliveryDate: $plannedDeliveryDate, pickedQuantity: $pickedQuantity, lineReferenceNotes: $lineReferenceNotes, lineNumber: $lineNumber, isTenderContractMaterial: $isTenderContractMaterial, details: $details, tenderContractDetails: $tenderContractDetails, principalData: $principalData, productImages: $productImages, governmentMaterialCode: $governmentMaterialCode, materialStockInfo: $materialStockInfo, priceAggregate: $priceAggregate, productType: $productType, parentId: $parentId, material: $material, promoStatus: $promoStatus, isCounterOffer: $isCounterOffer, hidePrice: $hidePrice, isMarketPlace: $isMarketPlace, isCovid: $isCovid, invoiceNumber: $invoiceNumber, itemRegistrationNumber: $itemRegistrationNumber, totalUnitPrice: $totalUnitPrice, totalTax: $totalTax, taxRate: $taxRate, batches: $batches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryDetailsOrderItemImpl &&
            (identical(other.type, type) || other.type == type) &&
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
            (identical(other.isTenderContractMaterial, isTenderContractMaterial) ||
                other.isTenderContractMaterial == isTenderContractMaterial) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.tenderContractDetails, tenderContractDetails) ||
                other.tenderContractDetails == tenderContractDetails) &&
            (identical(other.principalData, principalData) ||
                other.principalData == principalData) &&
            (identical(other.productImages, productImages) ||
                other.productImages == productImages) &&
            (identical(other.governmentMaterialCode, governmentMaterialCode) ||
                other.governmentMaterialCode == governmentMaterialCode) &&
            (identical(other.materialStockInfo, materialStockInfo) ||
                other.materialStockInfo == materialStockInfo) &&
            (identical(other.priceAggregate, priceAggregate) ||
                other.priceAggregate == priceAggregate) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.promoStatus, promoStatus) ||
                other.promoStatus == promoStatus) &&
            (identical(other.isCounterOffer, isCounterOffer) ||
                other.isCounterOffer == isCounterOffer) &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace) &&
            (identical(other.isCovid, isCovid) || other.isCovid == isCovid) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.itemRegistrationNumber, itemRegistrationNumber) ||
                other.itemRegistrationNumber == itemRegistrationNumber) &&
            (identical(other.totalUnitPrice, totalUnitPrice) ||
                other.totalUnitPrice == totalUnitPrice) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.taxRate, taxRate) || other.taxRate == taxRate) &&
            const DeepCollectionEquality().equals(other._batches, _batches));
  }

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
        const DeepCollectionEquality().hash(_details),
        tenderContractDetails,
        principalData,
        productImages,
        governmentMaterialCode,
        materialStockInfo,
        priceAggregate,
        productType,
        parentId,
        material,
        promoStatus,
        isCounterOffer,
        hidePrice,
        isMarketPlace,
        isCovid,
        invoiceNumber,
        itemRegistrationNumber,
        totalUnitPrice,
        totalTax,
        taxRate,
        const DeepCollectionEquality().hash(_batches)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryDetailsOrderItemImplCopyWith<
          _$OrderHistoryDetailsOrderItemImpl>
      get copyWith => __$$OrderHistoryDetailsOrderItemImplCopyWithImpl<
          _$OrderHistoryDetailsOrderItemImpl>(this, _$identity);
}

abstract class _OrderHistoryDetailsOrderItem
    extends OrderHistoryDetailsOrderItem {
  factory _OrderHistoryDetailsOrderItem(
      {required final OrderItemType type,
      required final MaterialNumber materialNumber,
      required final String materialDescription,
      required final String defaultMaterialDescription,
      required final int qty,
      required final double unitPrice,
      required final double originPrice,
      required final double totalPrice,
      required final double tax,
      required final OrderStepValue sAPStatus,
      required final DateTimeStringValue plannedDeliveryDate,
      required final int pickedQuantity,
      required final Remarks lineReferenceNotes,
      required final LineNumber lineNumber,
      required final bool isTenderContractMaterial,
      required final List<OrderHistoryDetailsOrderItemDetails> details,
      required final OrderHistoryDetailsTenderContract tenderContractDetails,
      required final PrincipalData principalData,
      required final ProductImages productImages,
      required final String governmentMaterialCode,
      required final MaterialStockInfo materialStockInfo,
      required final PriceAggregate priceAggregate,
      required final MaterialInfoType productType,
      required final String parentId,
      required final MaterialInfo material,
      required final bool promoStatus,
      required final bool isCounterOffer,
      required final bool hidePrice,
      required final bool isMarketPlace,
      required final bool isCovid,
      required final StringValue invoiceNumber,
      required final ItemRegistrationNumber itemRegistrationNumber,
      required final double totalUnitPrice,
      required final double totalTax,
      required final double taxRate,
      required final List<Batches>
          batches}) = _$OrderHistoryDetailsOrderItemImpl;
  _OrderHistoryDetailsOrderItem._() : super._();

  @override
  OrderItemType get type;
  @override
  MaterialNumber get materialNumber;
  @override
  String get materialDescription;
  @override
  String get defaultMaterialDescription;
  @override
  int get qty;
  @override
  double get unitPrice;
  @override
  double get originPrice;
  @override
  double get totalPrice;
  @override
  double get tax;
  @override
  OrderStepValue get sAPStatus;
  @override
  DateTimeStringValue get plannedDeliveryDate;
  @override
  int get pickedQuantity;
  @override
  Remarks get lineReferenceNotes;
  @override
  LineNumber get lineNumber;
  @override
  bool get isTenderContractMaterial;
  @override
  List<OrderHistoryDetailsOrderItemDetails> get details;
  @override
  OrderHistoryDetailsTenderContract get tenderContractDetails;
  @override
  PrincipalData get principalData;
  @override
  ProductImages get productImages;
  @override
  String get governmentMaterialCode;
  @override
  MaterialStockInfo get materialStockInfo;
  @override
  PriceAggregate get priceAggregate;
  @override
  MaterialInfoType get productType;
  @override
  String get parentId;
  @override
  MaterialInfo get material;
  @override
  bool get promoStatus;
  @override
  bool get isCounterOffer;
  @override
  bool get hidePrice;
  @override
  bool get isMarketPlace;
  @override
  bool get isCovid;
  @override
  StringValue get invoiceNumber;
  @override
  ItemRegistrationNumber get itemRegistrationNumber;
  @override
  double get totalUnitPrice;
  @override
  double get totalTax;
  @override
  double get taxRate;
  @override
  List<Batches> get batches;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryDetailsOrderItemImplCopyWith<
          _$OrderHistoryDetailsOrderItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
