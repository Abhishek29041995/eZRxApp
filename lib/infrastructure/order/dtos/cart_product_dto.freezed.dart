// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartProductDto _$CartProductDtoFromJson(Map<String, dynamic> json) {
  return _CartProductDto.fromJson(json);
}

/// @nodoc
mixin _$CartProductDto {
  @JsonKey(name: 'productID', defaultValue: '')
  String get productID => throw _privateConstructorUsedError;
  @JsonKey(name: 'parentID', defaultValue: '')
  String get parentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity', defaultValue: 0)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'therapeuticClass', defaultValue: '')
  String get therapeuticClass => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxClassification', defaultValue: '')
  String get taxClassification => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFOCMaterial', defaultValue: false)
  bool get isFOCMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'genericMaterialName', defaultValue: '')
  String get genericMaterialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
  double get counterOfferPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
  double get counterOfferDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
  String get counterOfferCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment', defaultValue: '')
  String get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleDetails')
  BundleDetailsDto get bundleDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
  List<MaterialDto> get bundleMaterials => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
  List<BonusSampleItemDto> get bonusMaterials =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
  double get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'suspensionStatus', defaultValue: false)
  bool get isSuspended => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
  bool get isPrincipalSuspended => throw _privateConstructorUsedError;
  @JsonKey(name: 'comboDeals')
  PriceComboDealDto get comboDeal => throw _privateConstructorUsedError;
  @JsonKey(name: 'comboMaterials', defaultValue: [])
  List<ComboMaterialItemDto> get comboMaterials =>
      throw _privateConstructorUsedError; //maximumQty auto set to maximum limit if we get null from response
  @JsonKey(name: 'maximumQty', defaultValue: 99999)
  int get maximumQty => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialGroup4', defaultValue: '')
  String get materialGroup4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialGroup2', defaultValue: '')
  String get materialGroup2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'is26SeriesMaterial', defaultValue: false)
  bool get is26SeriesMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'isGimmick', defaultValue: false)
  bool get isGimmick => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPoison', defaultValue: false)
  bool get isPoison => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSample', defaultValue: false)
  bool get isSample => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenderContractNumber', defaultValue: '')
  String get tenderContractNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenderOrderReason', defaultValue: '')
  String get tenderOrderReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  bool get hasValidTenderContract => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
  bool get hasMandatoryTenderContract => throw _privateConstructorUsedError;
  @JsonKey(name: 'isCovid', defaultValue: false)
  bool get isCovid => throw _privateConstructorUsedError;
  @JsonKey(name: 'isTenderExpired', defaultValue: false)
  bool get isTenderExpired => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartProductDtoCopyWith<CartProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartProductDtoCopyWith<$Res> {
  factory $CartProductDtoCopyWith(
          CartProductDto value, $Res Function(CartProductDto) then) =
      _$CartProductDtoCopyWithImpl<$Res, CartProductDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'productID', defaultValue: '') String productID,
      @JsonKey(name: 'parentID', defaultValue: '') String parentID,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'quantity', defaultValue: 0) int quantity,
      @JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      String therapeuticClass,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      String taxClassification,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false) bool isFOCMaterial,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      String itemRegistrationNumber,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      String genericMaterialName,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
      double counterOfferPrice,
      @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
      double counterOfferDiscount,
      @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
      String counterOfferCurrency,
      @JsonKey(name: 'comment', defaultValue: '') String remarks,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'bundleDetails') BundleDetailsDto bundleDetails,
      @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
      List<MaterialDto> bundleMaterials,
      @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
      List<BonusSampleItemDto> bonusMaterials,
      @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
      double tax,
      @JsonKey(name: 'hidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(name: 'suspensionStatus', defaultValue: false) bool isSuspended,
      @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
      bool isPrincipalSuspended,
      @JsonKey(name: 'comboDeals') PriceComboDealDto comboDeal,
      @JsonKey(name: 'comboMaterials', defaultValue: [])
      List<ComboMaterialItemDto> comboMaterials,
      @JsonKey(name: 'maximumQty', defaultValue: 99999) int maximumQty,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'materialGroup4', defaultValue: '') String materialGroup4,
      @JsonKey(name: 'materialGroup2', defaultValue: '') String materialGroup2,
      @JsonKey(name: 'is26SeriesMaterial', defaultValue: false)
      bool is26SeriesMaterial,
      @JsonKey(name: 'isGimmick', defaultValue: false) bool isGimmick,
      @JsonKey(name: 'isPoison', defaultValue: false) bool isPoison,
      @JsonKey(name: 'isSample', defaultValue: false) bool isSample,
      @JsonKey(name: 'tenderContractNumber', defaultValue: '')
      String tenderContractNumber,
      @JsonKey(name: 'tenderOrderReason', defaultValue: '')
      String tenderOrderReason,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      bool hasValidTenderContract,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      bool hasMandatoryTenderContract,
      @JsonKey(name: 'isCovid', defaultValue: false) bool isCovid,
      @JsonKey(name: 'isTenderExpired', defaultValue: false)
      bool isTenderExpired});

  $BundleDetailsDtoCopyWith<$Res> get bundleDetails;
  $PriceComboDealDtoCopyWith<$Res> get comboDeal;
}

/// @nodoc
class _$CartProductDtoCopyWithImpl<$Res, $Val extends CartProductDto>
    implements $CartProductDtoCopyWith<$Res> {
  _$CartProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = null,
    Object? parentID = null,
    Object? type = null,
    Object? quantity = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? therapeuticClass = null,
    Object? taxClassification = null,
    Object? isFOCMaterial = null,
    Object? itemRegistrationNumber = null,
    Object? genericMaterialName = null,
    Object? principalName = null,
    Object? principalCode = null,
    Object? counterOfferPrice = null,
    Object? counterOfferDiscount = null,
    Object? counterOfferCurrency = null,
    Object? remarks = null,
    Object? governmentMaterialCode = null,
    Object? bundleDetails = null,
    Object? bundleMaterials = null,
    Object? bonusMaterials = null,
    Object? tax = null,
    Object? hidePrice = null,
    Object? isSuspended = null,
    Object? isPrincipalSuspended = null,
    Object? comboDeal = null,
    Object? comboMaterials = null,
    Object? maximumQty = null,
    Object? isMarketPlace = null,
    Object? defaultMaterialDescription = null,
    Object? materialGroup4 = null,
    Object? materialGroup2 = null,
    Object? is26SeriesMaterial = null,
    Object? isGimmick = null,
    Object? isPoison = null,
    Object? isSample = null,
    Object? tenderContractNumber = null,
    Object? tenderOrderReason = null,
    Object? hasValidTenderContract = null,
    Object? hasMandatoryTenderContract = null,
    Object? isCovid = null,
    Object? isTenderExpired = null,
  }) {
    return _then(_value.copyWith(
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      parentID: null == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      therapeuticClass: null == therapeuticClass
          ? _value.therapeuticClass
          : therapeuticClass // ignore: cast_nullable_to_non_nullable
              as String,
      taxClassification: null == taxClassification
          ? _value.taxClassification
          : taxClassification // ignore: cast_nullable_to_non_nullable
              as String,
      isFOCMaterial: null == isFOCMaterial
          ? _value.isFOCMaterial
          : isFOCMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      genericMaterialName: null == genericMaterialName
          ? _value.genericMaterialName
          : genericMaterialName // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      counterOfferPrice: null == counterOfferPrice
          ? _value.counterOfferPrice
          : counterOfferPrice // ignore: cast_nullable_to_non_nullable
              as double,
      counterOfferDiscount: null == counterOfferDiscount
          ? _value.counterOfferDiscount
          : counterOfferDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      counterOfferCurrency: null == counterOfferCurrency
          ? _value.counterOfferCurrency
          : counterOfferCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleDetails: null == bundleDetails
          ? _value.bundleDetails
          : bundleDetails // ignore: cast_nullable_to_non_nullable
              as BundleDetailsDto,
      bundleMaterials: null == bundleMaterials
          ? _value.bundleMaterials
          : bundleMaterials // ignore: cast_nullable_to_non_nullable
              as List<MaterialDto>,
      bonusMaterials: null == bonusMaterials
          ? _value.bonusMaterials
          : bonusMaterials // ignore: cast_nullable_to_non_nullable
              as List<BonusSampleItemDto>,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspended: null == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrincipalSuspended: null == isPrincipalSuspended
          ? _value.isPrincipalSuspended
          : isPrincipalSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as PriceComboDealDto,
      comboMaterials: null == comboMaterials
          ? _value.comboMaterials
          : comboMaterials // ignore: cast_nullable_to_non_nullable
              as List<ComboMaterialItemDto>,
      maximumQty: null == maximumQty
          ? _value.maximumQty
          : maximumQty // ignore: cast_nullable_to_non_nullable
              as int,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup4: null == materialGroup4
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup2: null == materialGroup2
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as String,
      is26SeriesMaterial: null == is26SeriesMaterial
          ? _value.is26SeriesMaterial
          : is26SeriesMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      isGimmick: null == isGimmick
          ? _value.isGimmick
          : isGimmick // ignore: cast_nullable_to_non_nullable
              as bool,
      isPoison: null == isPoison
          ? _value.isPoison
          : isPoison // ignore: cast_nullable_to_non_nullable
              as bool,
      isSample: null == isSample
          ? _value.isSample
          : isSample // ignore: cast_nullable_to_non_nullable
              as bool,
      tenderContractNumber: null == tenderContractNumber
          ? _value.tenderContractNumber
          : tenderContractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tenderOrderReason: null == tenderOrderReason
          ? _value.tenderOrderReason
          : tenderOrderReason // ignore: cast_nullable_to_non_nullable
              as String,
      hasValidTenderContract: null == hasValidTenderContract
          ? _value.hasValidTenderContract
          : hasValidTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMandatoryTenderContract: null == hasMandatoryTenderContract
          ? _value.hasMandatoryTenderContract
          : hasMandatoryTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      isCovid: null == isCovid
          ? _value.isCovid
          : isCovid // ignore: cast_nullable_to_non_nullable
              as bool,
      isTenderExpired: null == isTenderExpired
          ? _value.isTenderExpired
          : isTenderExpired // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BundleDetailsDtoCopyWith<$Res> get bundleDetails {
    return $BundleDetailsDtoCopyWith<$Res>(_value.bundleDetails, (value) {
      return _then(_value.copyWith(bundleDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceComboDealDtoCopyWith<$Res> get comboDeal {
    return $PriceComboDealDtoCopyWith<$Res>(_value.comboDeal, (value) {
      return _then(_value.copyWith(comboDeal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartProductDtoImplCopyWith<$Res>
    implements $CartProductDtoCopyWith<$Res> {
  factory _$$CartProductDtoImplCopyWith(_$CartProductDtoImpl value,
          $Res Function(_$CartProductDtoImpl) then) =
      __$$CartProductDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'productID', defaultValue: '') String productID,
      @JsonKey(name: 'parentID', defaultValue: '') String parentID,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'quantity', defaultValue: 0) int quantity,
      @JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      String therapeuticClass,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      String taxClassification,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false) bool isFOCMaterial,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      String itemRegistrationNumber,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      String genericMaterialName,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
      double counterOfferPrice,
      @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
      double counterOfferDiscount,
      @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
      String counterOfferCurrency,
      @JsonKey(name: 'comment', defaultValue: '') String remarks,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'bundleDetails') BundleDetailsDto bundleDetails,
      @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
      List<MaterialDto> bundleMaterials,
      @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
      List<BonusSampleItemDto> bonusMaterials,
      @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
      double tax,
      @JsonKey(name: 'hidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(name: 'suspensionStatus', defaultValue: false) bool isSuspended,
      @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
      bool isPrincipalSuspended,
      @JsonKey(name: 'comboDeals') PriceComboDealDto comboDeal,
      @JsonKey(name: 'comboMaterials', defaultValue: [])
      List<ComboMaterialItemDto> comboMaterials,
      @JsonKey(name: 'maximumQty', defaultValue: 99999) int maximumQty,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'materialGroup4', defaultValue: '') String materialGroup4,
      @JsonKey(name: 'materialGroup2', defaultValue: '') String materialGroup2,
      @JsonKey(name: 'is26SeriesMaterial', defaultValue: false)
      bool is26SeriesMaterial,
      @JsonKey(name: 'isGimmick', defaultValue: false) bool isGimmick,
      @JsonKey(name: 'isPoison', defaultValue: false) bool isPoison,
      @JsonKey(name: 'isSample', defaultValue: false) bool isSample,
      @JsonKey(name: 'tenderContractNumber', defaultValue: '')
      String tenderContractNumber,
      @JsonKey(name: 'tenderOrderReason', defaultValue: '')
      String tenderOrderReason,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      bool hasValidTenderContract,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      bool hasMandatoryTenderContract,
      @JsonKey(name: 'isCovid', defaultValue: false) bool isCovid,
      @JsonKey(name: 'isTenderExpired', defaultValue: false)
      bool isTenderExpired});

  @override
  $BundleDetailsDtoCopyWith<$Res> get bundleDetails;
  @override
  $PriceComboDealDtoCopyWith<$Res> get comboDeal;
}

/// @nodoc
class __$$CartProductDtoImplCopyWithImpl<$Res>
    extends _$CartProductDtoCopyWithImpl<$Res, _$CartProductDtoImpl>
    implements _$$CartProductDtoImplCopyWith<$Res> {
  __$$CartProductDtoImplCopyWithImpl(
      _$CartProductDtoImpl _value, $Res Function(_$CartProductDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = null,
    Object? parentID = null,
    Object? type = null,
    Object? quantity = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? therapeuticClass = null,
    Object? taxClassification = null,
    Object? isFOCMaterial = null,
    Object? itemRegistrationNumber = null,
    Object? genericMaterialName = null,
    Object? principalName = null,
    Object? principalCode = null,
    Object? counterOfferPrice = null,
    Object? counterOfferDiscount = null,
    Object? counterOfferCurrency = null,
    Object? remarks = null,
    Object? governmentMaterialCode = null,
    Object? bundleDetails = null,
    Object? bundleMaterials = null,
    Object? bonusMaterials = null,
    Object? tax = null,
    Object? hidePrice = null,
    Object? isSuspended = null,
    Object? isPrincipalSuspended = null,
    Object? comboDeal = null,
    Object? comboMaterials = null,
    Object? maximumQty = null,
    Object? isMarketPlace = null,
    Object? defaultMaterialDescription = null,
    Object? materialGroup4 = null,
    Object? materialGroup2 = null,
    Object? is26SeriesMaterial = null,
    Object? isGimmick = null,
    Object? isPoison = null,
    Object? isSample = null,
    Object? tenderContractNumber = null,
    Object? tenderOrderReason = null,
    Object? hasValidTenderContract = null,
    Object? hasMandatoryTenderContract = null,
    Object? isCovid = null,
    Object? isTenderExpired = null,
  }) {
    return _then(_$CartProductDtoImpl(
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      parentID: null == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      therapeuticClass: null == therapeuticClass
          ? _value.therapeuticClass
          : therapeuticClass // ignore: cast_nullable_to_non_nullable
              as String,
      taxClassification: null == taxClassification
          ? _value.taxClassification
          : taxClassification // ignore: cast_nullable_to_non_nullable
              as String,
      isFOCMaterial: null == isFOCMaterial
          ? _value.isFOCMaterial
          : isFOCMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      genericMaterialName: null == genericMaterialName
          ? _value.genericMaterialName
          : genericMaterialName // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      counterOfferPrice: null == counterOfferPrice
          ? _value.counterOfferPrice
          : counterOfferPrice // ignore: cast_nullable_to_non_nullable
              as double,
      counterOfferDiscount: null == counterOfferDiscount
          ? _value.counterOfferDiscount
          : counterOfferDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      counterOfferCurrency: null == counterOfferCurrency
          ? _value.counterOfferCurrency
          : counterOfferCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleDetails: null == bundleDetails
          ? _value.bundleDetails
          : bundleDetails // ignore: cast_nullable_to_non_nullable
              as BundleDetailsDto,
      bundleMaterials: null == bundleMaterials
          ? _value._bundleMaterials
          : bundleMaterials // ignore: cast_nullable_to_non_nullable
              as List<MaterialDto>,
      bonusMaterials: null == bonusMaterials
          ? _value._bonusMaterials
          : bonusMaterials // ignore: cast_nullable_to_non_nullable
              as List<BonusSampleItemDto>,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspended: null == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrincipalSuspended: null == isPrincipalSuspended
          ? _value.isPrincipalSuspended
          : isPrincipalSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as PriceComboDealDto,
      comboMaterials: null == comboMaterials
          ? _value._comboMaterials
          : comboMaterials // ignore: cast_nullable_to_non_nullable
              as List<ComboMaterialItemDto>,
      maximumQty: null == maximumQty
          ? _value.maximumQty
          : maximumQty // ignore: cast_nullable_to_non_nullable
              as int,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup4: null == materialGroup4
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup2: null == materialGroup2
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as String,
      is26SeriesMaterial: null == is26SeriesMaterial
          ? _value.is26SeriesMaterial
          : is26SeriesMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      isGimmick: null == isGimmick
          ? _value.isGimmick
          : isGimmick // ignore: cast_nullable_to_non_nullable
              as bool,
      isPoison: null == isPoison
          ? _value.isPoison
          : isPoison // ignore: cast_nullable_to_non_nullable
              as bool,
      isSample: null == isSample
          ? _value.isSample
          : isSample // ignore: cast_nullable_to_non_nullable
              as bool,
      tenderContractNumber: null == tenderContractNumber
          ? _value.tenderContractNumber
          : tenderContractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tenderOrderReason: null == tenderOrderReason
          ? _value.tenderOrderReason
          : tenderOrderReason // ignore: cast_nullable_to_non_nullable
              as String,
      hasValidTenderContract: null == hasValidTenderContract
          ? _value.hasValidTenderContract
          : hasValidTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMandatoryTenderContract: null == hasMandatoryTenderContract
          ? _value.hasMandatoryTenderContract
          : hasMandatoryTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      isCovid: null == isCovid
          ? _value.isCovid
          : isCovid // ignore: cast_nullable_to_non_nullable
              as bool,
      isTenderExpired: null == isTenderExpired
          ? _value.isTenderExpired
          : isTenderExpired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartProductDtoImpl extends _CartProductDto {
  const _$CartProductDtoImpl(
      {@JsonKey(name: 'productID', defaultValue: '') required this.productID,
      @JsonKey(name: 'parentID', defaultValue: '') required this.parentID,
      @JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'quantity', defaultValue: 0) required this.quantity,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      required this.materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      required this.materialDescription,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      required this.therapeuticClass,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      required this.taxClassification,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false)
      required this.isFOCMaterial,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      required this.itemRegistrationNumber,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      required this.genericMaterialName,
      @JsonKey(name: 'principalName', defaultValue: '')
      required this.principalName,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required this.principalCode,
      @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
      required this.counterOfferPrice,
      @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
      required this.counterOfferDiscount,
      @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
      required this.counterOfferCurrency,
      @JsonKey(name: 'comment', defaultValue: '') required this.remarks,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      required this.governmentMaterialCode,
      @JsonKey(name: 'bundleDetails')
      this.bundleDetails = BundleDetailsDto.empty,
      @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
      required final List<MaterialDto> bundleMaterials,
      @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
      required final List<BonusSampleItemDto> bonusMaterials,
      @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
      required this.tax,
      @JsonKey(name: 'hidePrice', defaultValue: false) required this.hidePrice,
      @JsonKey(name: 'suspensionStatus', defaultValue: false)
      required this.isSuspended,
      @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
      required this.isPrincipalSuspended,
      @JsonKey(name: 'comboDeals') this.comboDeal = PriceComboDealDto.empty,
      @JsonKey(name: 'comboMaterials', defaultValue: [])
      required final List<ComboMaterialItemDto> comboMaterials,
      @JsonKey(name: 'maximumQty', defaultValue: 99999)
      required this.maximumQty,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required this.isMarketPlace,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      required this.defaultMaterialDescription,
      @JsonKey(name: 'materialGroup4', defaultValue: '')
      required this.materialGroup4,
      @JsonKey(name: 'materialGroup2', defaultValue: '')
      required this.materialGroup2,
      @JsonKey(name: 'is26SeriesMaterial', defaultValue: false)
      required this.is26SeriesMaterial,
      @JsonKey(name: 'isGimmick', defaultValue: false) required this.isGimmick,
      @JsonKey(name: 'isPoison', defaultValue: false) required this.isPoison,
      @JsonKey(name: 'isSample', defaultValue: false) required this.isSample,
      @JsonKey(name: 'tenderContractNumber', defaultValue: '')
      required this.tenderContractNumber,
      @JsonKey(name: 'tenderOrderReason', defaultValue: '')
      required this.tenderOrderReason,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      required this.hasValidTenderContract,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      required this.hasMandatoryTenderContract,
      @JsonKey(name: 'isCovid', defaultValue: false) required this.isCovid,
      @JsonKey(name: 'isTenderExpired', defaultValue: false)
      required this.isTenderExpired})
      : _bundleMaterials = bundleMaterials,
        _bonusMaterials = bonusMaterials,
        _comboMaterials = comboMaterials,
        super._();

  factory _$CartProductDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartProductDtoImplFromJson(json);

  @override
  @JsonKey(name: 'productID', defaultValue: '')
  final String productID;
  @override
  @JsonKey(name: 'parentID', defaultValue: '')
  final String parentID;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'quantity', defaultValue: 0)
  final int quantity;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'therapeuticClass', defaultValue: '')
  final String therapeuticClass;
  @override
  @JsonKey(name: 'taxClassification', defaultValue: '')
  final String taxClassification;
  @override
  @JsonKey(name: 'isFOCMaterial', defaultValue: false)
  final bool isFOCMaterial;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  final String itemRegistrationNumber;
  @override
  @JsonKey(name: 'genericMaterialName', defaultValue: '')
  final String genericMaterialName;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  final String principalName;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  final String principalCode;
  @override
  @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
  final double counterOfferPrice;
  @override
  @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
  final double counterOfferDiscount;
  @override
  @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
  final String counterOfferCurrency;
  @override
  @JsonKey(name: 'comment', defaultValue: '')
  final String remarks;
  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  final String governmentMaterialCode;
  @override
  @JsonKey(name: 'bundleDetails')
  final BundleDetailsDto bundleDetails;
  final List<MaterialDto> _bundleMaterials;
  @override
  @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
  List<MaterialDto> get bundleMaterials {
    if (_bundleMaterials is EqualUnmodifiableListView) return _bundleMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundleMaterials);
  }

  final List<BonusSampleItemDto> _bonusMaterials;
  @override
  @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
  List<BonusSampleItemDto> get bonusMaterials {
    if (_bonusMaterials is EqualUnmodifiableListView) return _bonusMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonusMaterials);
  }

  @override
  @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
  final double tax;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  final bool hidePrice;
  @override
  @JsonKey(name: 'suspensionStatus', defaultValue: false)
  final bool isSuspended;
  @override
  @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
  final bool isPrincipalSuspended;
  @override
  @JsonKey(name: 'comboDeals')
  final PriceComboDealDto comboDeal;
  final List<ComboMaterialItemDto> _comboMaterials;
  @override
  @JsonKey(name: 'comboMaterials', defaultValue: [])
  List<ComboMaterialItemDto> get comboMaterials {
    if (_comboMaterials is EqualUnmodifiableListView) return _comboMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comboMaterials);
  }

//maximumQty auto set to maximum limit if we get null from response
  @override
  @JsonKey(name: 'maximumQty', defaultValue: 99999)
  final int maximumQty;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  final bool isMarketPlace;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  final String defaultMaterialDescription;
  @override
  @JsonKey(name: 'materialGroup4', defaultValue: '')
  final String materialGroup4;
  @override
  @JsonKey(name: 'materialGroup2', defaultValue: '')
  final String materialGroup2;
  @override
  @JsonKey(name: 'is26SeriesMaterial', defaultValue: false)
  final bool is26SeriesMaterial;
  @override
  @JsonKey(name: 'isGimmick', defaultValue: false)
  final bool isGimmick;
  @override
  @JsonKey(name: 'isPoison', defaultValue: false)
  final bool isPoison;
  @override
  @JsonKey(name: 'isSample', defaultValue: false)
  final bool isSample;
  @override
  @JsonKey(name: 'tenderContractNumber', defaultValue: '')
  final String tenderContractNumber;
  @override
  @JsonKey(name: 'tenderOrderReason', defaultValue: '')
  final String tenderOrderReason;
  @override
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  final bool hasValidTenderContract;
  @override
  @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
  final bool hasMandatoryTenderContract;
  @override
  @JsonKey(name: 'isCovid', defaultValue: false)
  final bool isCovid;
  @override
  @JsonKey(name: 'isTenderExpired', defaultValue: false)
  final bool isTenderExpired;

  @override
  String toString() {
    return 'CartProductDto(productID: $productID, parentID: $parentID, type: $type, quantity: $quantity, materialNumber: $materialNumber, materialDescription: $materialDescription, therapeuticClass: $therapeuticClass, taxClassification: $taxClassification, isFOCMaterial: $isFOCMaterial, itemRegistrationNumber: $itemRegistrationNumber, genericMaterialName: $genericMaterialName, principalName: $principalName, principalCode: $principalCode, counterOfferPrice: $counterOfferPrice, counterOfferDiscount: $counterOfferDiscount, counterOfferCurrency: $counterOfferCurrency, remarks: $remarks, governmentMaterialCode: $governmentMaterialCode, bundleDetails: $bundleDetails, bundleMaterials: $bundleMaterials, bonusMaterials: $bonusMaterials, tax: $tax, hidePrice: $hidePrice, isSuspended: $isSuspended, isPrincipalSuspended: $isPrincipalSuspended, comboDeal: $comboDeal, comboMaterials: $comboMaterials, maximumQty: $maximumQty, isMarketPlace: $isMarketPlace, defaultMaterialDescription: $defaultMaterialDescription, materialGroup4: $materialGroup4, materialGroup2: $materialGroup2, is26SeriesMaterial: $is26SeriesMaterial, isGimmick: $isGimmick, isPoison: $isPoison, isSample: $isSample, tenderContractNumber: $tenderContractNumber, tenderOrderReason: $tenderOrderReason, hasValidTenderContract: $hasValidTenderContract, hasMandatoryTenderContract: $hasMandatoryTenderContract, isCovid: $isCovid, isTenderExpired: $isTenderExpired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartProductDtoImpl &&
            (identical(other.productID, productID) ||
                other.productID == productID) &&
            (identical(other.parentID, parentID) ||
                other.parentID == parentID) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.therapeuticClass, therapeuticClass) ||
                other.therapeuticClass == therapeuticClass) &&
            (identical(other.taxClassification, taxClassification) ||
                other.taxClassification == taxClassification) &&
            (identical(other.isFOCMaterial, isFOCMaterial) ||
                other.isFOCMaterial == isFOCMaterial) &&
            (identical(other.itemRegistrationNumber, itemRegistrationNumber) ||
                other.itemRegistrationNumber == itemRegistrationNumber) &&
            (identical(other.genericMaterialName, genericMaterialName) ||
                other.genericMaterialName == genericMaterialName) &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode) &&
            (identical(other.counterOfferPrice, counterOfferPrice) ||
                other.counterOfferPrice == counterOfferPrice) &&
            (identical(other.counterOfferDiscount, counterOfferDiscount) ||
                other.counterOfferDiscount == counterOfferDiscount) &&
            (identical(other.counterOfferCurrency, counterOfferCurrency) ||
                other.counterOfferCurrency == counterOfferCurrency) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.governmentMaterialCode, governmentMaterialCode) ||
                other.governmentMaterialCode == governmentMaterialCode) &&
            (identical(other.bundleDetails, bundleDetails) ||
                other.bundleDetails == bundleDetails) &&
            const DeepCollectionEquality()
                .equals(other._bundleMaterials, _bundleMaterials) &&
            const DeepCollectionEquality()
                .equals(other._bonusMaterials, _bonusMaterials) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            (identical(other.isSuspended, isSuspended) ||
                other.isSuspended == isSuspended) &&
            (identical(other.isPrincipalSuspended, isPrincipalSuspended) ||
                other.isPrincipalSuspended == isPrincipalSuspended) &&
            (identical(other.comboDeal, comboDeal) ||
                other.comboDeal == comboDeal) &&
            const DeepCollectionEquality()
                .equals(other._comboMaterials, _comboMaterials) &&
            (identical(other.maximumQty, maximumQty) ||
                other.maximumQty == maximumQty) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace) &&
            (identical(other.defaultMaterialDescription, defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription) &&
            (identical(other.materialGroup4, materialGroup4) ||
                other.materialGroup4 == materialGroup4) &&
            (identical(other.materialGroup2, materialGroup2) ||
                other.materialGroup2 == materialGroup2) &&
            (identical(other.is26SeriesMaterial, is26SeriesMaterial) ||
                other.is26SeriesMaterial == is26SeriesMaterial) &&
            (identical(other.isGimmick, isGimmick) ||
                other.isGimmick == isGimmick) &&
            (identical(other.isPoison, isPoison) ||
                other.isPoison == isPoison) &&
            (identical(other.isSample, isSample) ||
                other.isSample == isSample) &&
            (identical(other.tenderContractNumber, tenderContractNumber) ||
                other.tenderContractNumber == tenderContractNumber) &&
            (identical(other.tenderOrderReason, tenderOrderReason) ||
                other.tenderOrderReason == tenderOrderReason) &&
            (identical(other.hasValidTenderContract, hasValidTenderContract) ||
                other.hasValidTenderContract == hasValidTenderContract) &&
            (identical(other.hasMandatoryTenderContract, hasMandatoryTenderContract) ||
                other.hasMandatoryTenderContract ==
                    hasMandatoryTenderContract) &&
            (identical(other.isCovid, isCovid) || other.isCovid == isCovid) &&
            (identical(other.isTenderExpired, isTenderExpired) ||
                other.isTenderExpired == isTenderExpired));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        productID,
        parentID,
        type,
        quantity,
        materialNumber,
        materialDescription,
        therapeuticClass,
        taxClassification,
        isFOCMaterial,
        itemRegistrationNumber,
        genericMaterialName,
        principalName,
        principalCode,
        counterOfferPrice,
        counterOfferDiscount,
        counterOfferCurrency,
        remarks,
        governmentMaterialCode,
        bundleDetails,
        const DeepCollectionEquality().hash(_bundleMaterials),
        const DeepCollectionEquality().hash(_bonusMaterials),
        tax,
        hidePrice,
        isSuspended,
        isPrincipalSuspended,
        comboDeal,
        const DeepCollectionEquality().hash(_comboMaterials),
        maximumQty,
        isMarketPlace,
        defaultMaterialDescription,
        materialGroup4,
        materialGroup2,
        is26SeriesMaterial,
        isGimmick,
        isPoison,
        isSample,
        tenderContractNumber,
        tenderOrderReason,
        hasValidTenderContract,
        hasMandatoryTenderContract,
        isCovid,
        isTenderExpired
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartProductDtoImplCopyWith<_$CartProductDtoImpl> get copyWith =>
      __$$CartProductDtoImplCopyWithImpl<_$CartProductDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartProductDtoImplToJson(
      this,
    );
  }
}

abstract class _CartProductDto extends CartProductDto {
  const factory _CartProductDto(
      {@JsonKey(name: 'productID', defaultValue: '')
      required final String productID,
      @JsonKey(name: 'parentID', defaultValue: '')
      required final String parentID,
      @JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'quantity', defaultValue: 0) required final int quantity,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      required final String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      required final String materialDescription,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      required final String therapeuticClass,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      required final String taxClassification,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false)
      required final bool isFOCMaterial,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      required final String itemRegistrationNumber,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      required final String genericMaterialName,
      @JsonKey(name: 'principalName', defaultValue: '')
      required final String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required final String principalCode,
      @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
      required final double counterOfferPrice,
      @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
      required final double counterOfferDiscount,
      @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
      required final String counterOfferCurrency,
      @JsonKey(name: 'comment', defaultValue: '') required final String remarks,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      required final String governmentMaterialCode,
      @JsonKey(name: 'bundleDetails') final BundleDetailsDto bundleDetails,
      @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
      required final List<MaterialDto> bundleMaterials,
      @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
      required final List<BonusSampleItemDto> bonusMaterials,
      @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
      required final double tax,
      @JsonKey(name: 'hidePrice', defaultValue: false)
      required final bool hidePrice,
      @JsonKey(name: 'suspensionStatus', defaultValue: false)
      required final bool isSuspended,
      @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
      required final bool isPrincipalSuspended,
      @JsonKey(name: 'comboDeals') final PriceComboDealDto comboDeal,
      @JsonKey(name: 'comboMaterials', defaultValue: [])
      required final List<ComboMaterialItemDto> comboMaterials,
      @JsonKey(name: 'maximumQty', defaultValue: 99999)
      required final int maximumQty,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required final bool isMarketPlace,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      required final String defaultMaterialDescription,
      @JsonKey(name: 'materialGroup4', defaultValue: '')
      required final String materialGroup4,
      @JsonKey(name: 'materialGroup2', defaultValue: '')
      required final String materialGroup2,
      @JsonKey(name: 'is26SeriesMaterial', defaultValue: false)
      required final bool is26SeriesMaterial,
      @JsonKey(name: 'isGimmick', defaultValue: false)
      required final bool isGimmick,
      @JsonKey(name: 'isPoison', defaultValue: false)
      required final bool isPoison,
      @JsonKey(name: 'isSample', defaultValue: false)
      required final bool isSample,
      @JsonKey(name: 'tenderContractNumber', defaultValue: '')
      required final String tenderContractNumber,
      @JsonKey(name: 'tenderOrderReason', defaultValue: '')
      required final String tenderOrderReason,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      required final bool hasValidTenderContract,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      required final bool hasMandatoryTenderContract,
      @JsonKey(name: 'isCovid', defaultValue: false)
      required final bool isCovid,
      @JsonKey(name: 'isTenderExpired', defaultValue: false)
      required final bool isTenderExpired}) = _$CartProductDtoImpl;
  const _CartProductDto._() : super._();

  factory _CartProductDto.fromJson(Map<String, dynamic> json) =
      _$CartProductDtoImpl.fromJson;

  @override
  @JsonKey(name: 'productID', defaultValue: '')
  String get productID;
  @override
  @JsonKey(name: 'parentID', defaultValue: '')
  String get parentID;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'quantity', defaultValue: 0)
  int get quantity;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'therapeuticClass', defaultValue: '')
  String get therapeuticClass;
  @override
  @JsonKey(name: 'taxClassification', defaultValue: '')
  String get taxClassification;
  @override
  @JsonKey(name: 'isFOCMaterial', defaultValue: false)
  bool get isFOCMaterial;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber;
  @override
  @JsonKey(name: 'genericMaterialName', defaultValue: '')
  String get genericMaterialName;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode;
  @override
  @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
  double get counterOfferPrice;
  @override
  @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
  double get counterOfferDiscount;
  @override
  @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
  String get counterOfferCurrency;
  @override
  @JsonKey(name: 'comment', defaultValue: '')
  String get remarks;
  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode;
  @override
  @JsonKey(name: 'bundleDetails')
  BundleDetailsDto get bundleDetails;
  @override
  @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
  List<MaterialDto> get bundleMaterials;
  @override
  @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
  List<BonusSampleItemDto> get bonusMaterials;
  @override
  @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
  double get tax;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice;
  @override
  @JsonKey(name: 'suspensionStatus', defaultValue: false)
  bool get isSuspended;
  @override
  @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
  bool get isPrincipalSuspended;
  @override
  @JsonKey(name: 'comboDeals')
  PriceComboDealDto get comboDeal;
  @override
  @JsonKey(name: 'comboMaterials', defaultValue: [])
  List<ComboMaterialItemDto> get comboMaterials;
  @override //maximumQty auto set to maximum limit if we get null from response
  @JsonKey(name: 'maximumQty', defaultValue: 99999)
  int get maximumQty;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription;
  @override
  @JsonKey(name: 'materialGroup4', defaultValue: '')
  String get materialGroup4;
  @override
  @JsonKey(name: 'materialGroup2', defaultValue: '')
  String get materialGroup2;
  @override
  @JsonKey(name: 'is26SeriesMaterial', defaultValue: false)
  bool get is26SeriesMaterial;
  @override
  @JsonKey(name: 'isGimmick', defaultValue: false)
  bool get isGimmick;
  @override
  @JsonKey(name: 'isPoison', defaultValue: false)
  bool get isPoison;
  @override
  @JsonKey(name: 'isSample', defaultValue: false)
  bool get isSample;
  @override
  @JsonKey(name: 'tenderContractNumber', defaultValue: '')
  String get tenderContractNumber;
  @override
  @JsonKey(name: 'tenderOrderReason', defaultValue: '')
  String get tenderOrderReason;
  @override
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  bool get hasValidTenderContract;
  @override
  @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
  bool get hasMandatoryTenderContract;
  @override
  @JsonKey(name: 'isCovid', defaultValue: false)
  bool get isCovid;
  @override
  @JsonKey(name: 'isTenderExpired', defaultValue: false)
  bool get isTenderExpired;
  @override
  @JsonKey(ignore: true)
  _$$CartProductDtoImplCopyWith<_$CartProductDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BundleDetailsDto _$BundleDetailsDtoFromJson(Map<String, dynamic> json) {
  return _BundleDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$BundleDetailsDto {
  @JsonKey(name: 'bundleName', defaultValue: '')
  String get bundleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleCode', defaultValue: '')
  String get bundleCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
  List<BundleInfoDto> get bundleInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BundleDetailsDtoCopyWith<BundleDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleDetailsDtoCopyWith<$Res> {
  factory $BundleDetailsDtoCopyWith(
          BundleDetailsDto value, $Res Function(BundleDetailsDto) then) =
      _$BundleDetailsDtoCopyWithImpl<$Res, BundleDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bundleName', defaultValue: '') String bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '') String bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
      List<BundleInfoDto> bundleInfo});
}

/// @nodoc
class _$BundleDetailsDtoCopyWithImpl<$Res, $Val extends BundleDetailsDto>
    implements $BundleDetailsDtoCopyWith<$Res> {
  _$BundleDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleName = null,
    Object? bundleCode = null,
    Object? bundleInfo = null,
  }) {
    return _then(_value.copyWith(
      bundleName: null == bundleName
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      bundleCode: null == bundleCode
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInfo: null == bundleInfo
          ? _value.bundleInfo
          : bundleInfo // ignore: cast_nullable_to_non_nullable
              as List<BundleInfoDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BundleDetailsDtoImplCopyWith<$Res>
    implements $BundleDetailsDtoCopyWith<$Res> {
  factory _$$BundleDetailsDtoImplCopyWith(_$BundleDetailsDtoImpl value,
          $Res Function(_$BundleDetailsDtoImpl) then) =
      __$$BundleDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bundleName', defaultValue: '') String bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '') String bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
      List<BundleInfoDto> bundleInfo});
}

/// @nodoc
class __$$BundleDetailsDtoImplCopyWithImpl<$Res>
    extends _$BundleDetailsDtoCopyWithImpl<$Res, _$BundleDetailsDtoImpl>
    implements _$$BundleDetailsDtoImplCopyWith<$Res> {
  __$$BundleDetailsDtoImplCopyWithImpl(_$BundleDetailsDtoImpl _value,
      $Res Function(_$BundleDetailsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleName = null,
    Object? bundleCode = null,
    Object? bundleInfo = null,
  }) {
    return _then(_$BundleDetailsDtoImpl(
      bundleName: null == bundleName
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      bundleCode: null == bundleCode
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInfo: null == bundleInfo
          ? _value._bundleInfo
          : bundleInfo // ignore: cast_nullable_to_non_nullable
              as List<BundleInfoDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BundleDetailsDtoImpl extends _BundleDetailsDto {
  const _$BundleDetailsDtoImpl(
      {@JsonKey(name: 'bundleName', defaultValue: '') required this.bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '') required this.bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
      required final List<BundleInfoDto> bundleInfo})
      : _bundleInfo = bundleInfo,
        super._();

  factory _$BundleDetailsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BundleDetailsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'bundleName', defaultValue: '')
  final String bundleName;
  @override
  @JsonKey(name: 'bundleCode', defaultValue: '')
  final String bundleCode;
  final List<BundleInfoDto> _bundleInfo;
  @override
  @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
  List<BundleInfoDto> get bundleInfo {
    if (_bundleInfo is EqualUnmodifiableListView) return _bundleInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundleInfo);
  }

  @override
  String toString() {
    return 'BundleDetailsDto(bundleName: $bundleName, bundleCode: $bundleCode, bundleInfo: $bundleInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BundleDetailsDtoImpl &&
            (identical(other.bundleName, bundleName) ||
                other.bundleName == bundleName) &&
            (identical(other.bundleCode, bundleCode) ||
                other.bundleCode == bundleCode) &&
            const DeepCollectionEquality()
                .equals(other._bundleInfo, _bundleInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bundleName, bundleCode,
      const DeepCollectionEquality().hash(_bundleInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BundleDetailsDtoImplCopyWith<_$BundleDetailsDtoImpl> get copyWith =>
      __$$BundleDetailsDtoImplCopyWithImpl<_$BundleDetailsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BundleDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _BundleDetailsDto extends BundleDetailsDto {
  const factory _BundleDetailsDto(
      {@JsonKey(name: 'bundleName', defaultValue: '')
      required final String bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '')
      required final String bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
      required final List<BundleInfoDto> bundleInfo}) = _$BundleDetailsDtoImpl;
  const _BundleDetailsDto._() : super._();

  factory _BundleDetailsDto.fromJson(Map<String, dynamic> json) =
      _$BundleDetailsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'bundleName', defaultValue: '')
  String get bundleName;
  @override
  @JsonKey(name: 'bundleCode', defaultValue: '')
  String get bundleCode;
  @override
  @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
  List<BundleInfoDto> get bundleInfo;
  @override
  @JsonKey(ignore: true)
  _$$BundleDetailsDtoImplCopyWith<_$BundleDetailsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
