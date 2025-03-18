// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductDetailDto _$ProductDetailDtoFromJson(Map<String, dynamic> json) {
  return _ProductDetailDto.fromJson(json);
}

/// @nodoc
mixin _$ProductDetailDto {
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
  String get unitOfMeasurement => throw _privateConstructorUsedError;
  @JsonKey(name: 'therapeuticClass', defaultValue: '')
  String get therapeuticClass => throw _privateConstructorUsedError;
  @JsonKey(name: 'genericMaterialName', defaultValue: '')
  String get genericMaterialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemBrand', defaultValue: '')
  String get itemBrand => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialBrand', defaultValue: '')
  String get materialBrand => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFavourite', defaultValue: false)
  bool get isFavourite => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFOCMaterial', defaultValue: false)
  bool get isFOCMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'country', defaultValue: '')
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'countryName', defaultValue: '')
  String get countryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'promoType', defaultValue: '')
  String get promoType => throw _privateConstructorUsedError;
  @JsonKey(name: 'promoStatus', defaultValue: false)
  bool get promoStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'suspensionStatus', defaultValue: false)
  bool get isSuspended => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
  bool get hasMandatoryTenderContract => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  bool get hasValidTenderContract => throw _privateConstructorUsedError;
  @JsonKey(name: 'isGimmick', defaultValue: false)
  bool get isGimmick => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSampleMaterial', defaultValue: false)
  bool get isSampleMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPoison', defaultValue: false)
  bool get isPoison => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDetailDtoCopyWith<ProductDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailDtoCopyWith<$Res> {
  factory $ProductDetailDtoCopyWith(
          ProductDetailDto value, $Res Function(ProductDetailDto) then) =
      _$ProductDetailDtoCopyWithImpl<$Res, ProductDetailDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
      String unitOfMeasurement,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      String therapeuticClass,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      String genericMaterialName,
      @JsonKey(name: 'itemBrand', defaultValue: '') String itemBrand,
      @JsonKey(name: 'materialBrand', defaultValue: '') String materialBrand,
      @JsonKey(name: 'isFavourite', defaultValue: false) bool isFavourite,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false) bool isFOCMaterial,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'country', defaultValue: '') String country,
      @JsonKey(name: 'countryName', defaultValue: '') String countryName,
      @JsonKey(name: 'hidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      String itemRegistrationNumber,
      @JsonKey(name: 'promoType', defaultValue: '') String promoType,
      @JsonKey(name: 'promoStatus', defaultValue: false) bool promoStatus,
      @JsonKey(name: 'suspensionStatus', defaultValue: false) bool isSuspended,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      bool hasMandatoryTenderContract,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      bool hasValidTenderContract,
      @JsonKey(name: 'isGimmick', defaultValue: false) bool isGimmick,
      @JsonKey(name: 'isSampleMaterial', defaultValue: false)
      bool isSampleMaterial,
      @JsonKey(name: 'isPoison', defaultValue: false) bool isPoison});
}

/// @nodoc
class _$ProductDetailDtoCopyWithImpl<$Res, $Val extends ProductDetailDto>
    implements $ProductDetailDtoCopyWith<$Res> {
  _$ProductDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? principalCode = null,
    Object? principalName = null,
    Object? unitOfMeasurement = null,
    Object? therapeuticClass = null,
    Object? genericMaterialName = null,
    Object? itemBrand = null,
    Object? materialBrand = null,
    Object? isFavourite = null,
    Object? isFOCMaterial = null,
    Object? defaultMaterialDescription = null,
    Object? country = null,
    Object? countryName = null,
    Object? hidePrice = null,
    Object? governmentMaterialCode = null,
    Object? itemRegistrationNumber = null,
    Object? promoType = null,
    Object? promoStatus = null,
    Object? isSuspended = null,
    Object? isMarketPlace = null,
    Object? hasMandatoryTenderContract = null,
    Object? hasValidTenderContract = null,
    Object? isGimmick = null,
    Object? isSampleMaterial = null,
    Object? isPoison = null,
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
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      unitOfMeasurement: null == unitOfMeasurement
          ? _value.unitOfMeasurement
          : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as String,
      therapeuticClass: null == therapeuticClass
          ? _value.therapeuticClass
          : therapeuticClass // ignore: cast_nullable_to_non_nullable
              as String,
      genericMaterialName: null == genericMaterialName
          ? _value.genericMaterialName
          : genericMaterialName // ignore: cast_nullable_to_non_nullable
              as String,
      itemBrand: null == itemBrand
          ? _value.itemBrand
          : itemBrand // ignore: cast_nullable_to_non_nullable
              as String,
      materialBrand: null == materialBrand
          ? _value.materialBrand
          : materialBrand // ignore: cast_nullable_to_non_nullable
              as String,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      isFOCMaterial: null == isFOCMaterial
          ? _value.isFOCMaterial
          : isFOCMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      promoType: null == promoType
          ? _value.promoType
          : promoType // ignore: cast_nullable_to_non_nullable
              as String,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspended: null == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMandatoryTenderContract: null == hasMandatoryTenderContract
          ? _value.hasMandatoryTenderContract
          : hasMandatoryTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      hasValidTenderContract: null == hasValidTenderContract
          ? _value.hasValidTenderContract
          : hasValidTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      isGimmick: null == isGimmick
          ? _value.isGimmick
          : isGimmick // ignore: cast_nullable_to_non_nullable
              as bool,
      isSampleMaterial: null == isSampleMaterial
          ? _value.isSampleMaterial
          : isSampleMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      isPoison: null == isPoison
          ? _value.isPoison
          : isPoison // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductDetailDtoImplCopyWith<$Res>
    implements $ProductDetailDtoCopyWith<$Res> {
  factory _$$ProductDetailDtoImplCopyWith(_$ProductDetailDtoImpl value,
          $Res Function(_$ProductDetailDtoImpl) then) =
      __$$ProductDetailDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
      String unitOfMeasurement,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      String therapeuticClass,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      String genericMaterialName,
      @JsonKey(name: 'itemBrand', defaultValue: '') String itemBrand,
      @JsonKey(name: 'materialBrand', defaultValue: '') String materialBrand,
      @JsonKey(name: 'isFavourite', defaultValue: false) bool isFavourite,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false) bool isFOCMaterial,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'country', defaultValue: '') String country,
      @JsonKey(name: 'countryName', defaultValue: '') String countryName,
      @JsonKey(name: 'hidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      String itemRegistrationNumber,
      @JsonKey(name: 'promoType', defaultValue: '') String promoType,
      @JsonKey(name: 'promoStatus', defaultValue: false) bool promoStatus,
      @JsonKey(name: 'suspensionStatus', defaultValue: false) bool isSuspended,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      bool hasMandatoryTenderContract,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      bool hasValidTenderContract,
      @JsonKey(name: 'isGimmick', defaultValue: false) bool isGimmick,
      @JsonKey(name: 'isSampleMaterial', defaultValue: false)
      bool isSampleMaterial,
      @JsonKey(name: 'isPoison', defaultValue: false) bool isPoison});
}

/// @nodoc
class __$$ProductDetailDtoImplCopyWithImpl<$Res>
    extends _$ProductDetailDtoCopyWithImpl<$Res, _$ProductDetailDtoImpl>
    implements _$$ProductDetailDtoImplCopyWith<$Res> {
  __$$ProductDetailDtoImplCopyWithImpl(_$ProductDetailDtoImpl _value,
      $Res Function(_$ProductDetailDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? principalCode = null,
    Object? principalName = null,
    Object? unitOfMeasurement = null,
    Object? therapeuticClass = null,
    Object? genericMaterialName = null,
    Object? itemBrand = null,
    Object? materialBrand = null,
    Object? isFavourite = null,
    Object? isFOCMaterial = null,
    Object? defaultMaterialDescription = null,
    Object? country = null,
    Object? countryName = null,
    Object? hidePrice = null,
    Object? governmentMaterialCode = null,
    Object? itemRegistrationNumber = null,
    Object? promoType = null,
    Object? promoStatus = null,
    Object? isSuspended = null,
    Object? isMarketPlace = null,
    Object? hasMandatoryTenderContract = null,
    Object? hasValidTenderContract = null,
    Object? isGimmick = null,
    Object? isSampleMaterial = null,
    Object? isPoison = null,
  }) {
    return _then(_$ProductDetailDtoImpl(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      unitOfMeasurement: null == unitOfMeasurement
          ? _value.unitOfMeasurement
          : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as String,
      therapeuticClass: null == therapeuticClass
          ? _value.therapeuticClass
          : therapeuticClass // ignore: cast_nullable_to_non_nullable
              as String,
      genericMaterialName: null == genericMaterialName
          ? _value.genericMaterialName
          : genericMaterialName // ignore: cast_nullable_to_non_nullable
              as String,
      itemBrand: null == itemBrand
          ? _value.itemBrand
          : itemBrand // ignore: cast_nullable_to_non_nullable
              as String,
      materialBrand: null == materialBrand
          ? _value.materialBrand
          : materialBrand // ignore: cast_nullable_to_non_nullable
              as String,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      isFOCMaterial: null == isFOCMaterial
          ? _value.isFOCMaterial
          : isFOCMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      promoType: null == promoType
          ? _value.promoType
          : promoType // ignore: cast_nullable_to_non_nullable
              as String,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspended: null == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMandatoryTenderContract: null == hasMandatoryTenderContract
          ? _value.hasMandatoryTenderContract
          : hasMandatoryTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      hasValidTenderContract: null == hasValidTenderContract
          ? _value.hasValidTenderContract
          : hasValidTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      isGimmick: null == isGimmick
          ? _value.isGimmick
          : isGimmick // ignore: cast_nullable_to_non_nullable
              as bool,
      isSampleMaterial: null == isSampleMaterial
          ? _value.isSampleMaterial
          : isSampleMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      isPoison: null == isPoison
          ? _value.isPoison
          : isPoison // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductDetailDtoImpl extends _ProductDetailDto {
  _$ProductDetailDtoImpl(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
      required this.materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      required this.materialDescription,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required this.principalCode,
      @JsonKey(name: 'principalName', defaultValue: '')
      required this.principalName,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
      required this.unitOfMeasurement,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      required this.therapeuticClass,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      required this.genericMaterialName,
      @JsonKey(name: 'itemBrand', defaultValue: '') required this.itemBrand,
      @JsonKey(name: 'materialBrand', defaultValue: '')
      required this.materialBrand,
      @JsonKey(name: 'isFavourite', defaultValue: false)
      required this.isFavourite,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false)
      required this.isFOCMaterial,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      required this.defaultMaterialDescription,
      @JsonKey(name: 'country', defaultValue: '') required this.country,
      @JsonKey(name: 'countryName', defaultValue: '') required this.countryName,
      @JsonKey(name: 'hidePrice', defaultValue: false) required this.hidePrice,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      required this.governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      required this.itemRegistrationNumber,
      @JsonKey(name: 'promoType', defaultValue: '') required this.promoType,
      @JsonKey(name: 'promoStatus', defaultValue: false)
      required this.promoStatus,
      @JsonKey(name: 'suspensionStatus', defaultValue: false)
      required this.isSuspended,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required this.isMarketPlace,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      required this.hasMandatoryTenderContract,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      required this.hasValidTenderContract,
      @JsonKey(name: 'isGimmick', defaultValue: false) required this.isGimmick,
      @JsonKey(name: 'isSampleMaterial', defaultValue: false)
      required this.isSampleMaterial,
      @JsonKey(name: 'isPoison', defaultValue: false) required this.isPoison})
      : super._();

  factory _$ProductDetailDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDetailDtoImplFromJson(json);

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  final String principalCode;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  final String principalName;
  @override
  @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
  final String unitOfMeasurement;
  @override
  @JsonKey(name: 'therapeuticClass', defaultValue: '')
  final String therapeuticClass;
  @override
  @JsonKey(name: 'genericMaterialName', defaultValue: '')
  final String genericMaterialName;
  @override
  @JsonKey(name: 'itemBrand', defaultValue: '')
  final String itemBrand;
  @override
  @JsonKey(name: 'materialBrand', defaultValue: '')
  final String materialBrand;
  @override
  @JsonKey(name: 'isFavourite', defaultValue: false)
  final bool isFavourite;
  @override
  @JsonKey(name: 'isFOCMaterial', defaultValue: false)
  final bool isFOCMaterial;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  final String defaultMaterialDescription;
  @override
  @JsonKey(name: 'country', defaultValue: '')
  final String country;
  @override
  @JsonKey(name: 'countryName', defaultValue: '')
  final String countryName;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  final bool hidePrice;
  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  final String governmentMaterialCode;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  final String itemRegistrationNumber;
  @override
  @JsonKey(name: 'promoType', defaultValue: '')
  final String promoType;
  @override
  @JsonKey(name: 'promoStatus', defaultValue: false)
  final bool promoStatus;
  @override
  @JsonKey(name: 'suspensionStatus', defaultValue: false)
  final bool isSuspended;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  final bool isMarketPlace;
  @override
  @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
  final bool hasMandatoryTenderContract;
  @override
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  final bool hasValidTenderContract;
  @override
  @JsonKey(name: 'isGimmick', defaultValue: false)
  final bool isGimmick;
  @override
  @JsonKey(name: 'isSampleMaterial', defaultValue: false)
  final bool isSampleMaterial;
  @override
  @JsonKey(name: 'isPoison', defaultValue: false)
  final bool isPoison;

  @override
  String toString() {
    return 'ProductDetailDto(materialNumber: $materialNumber, materialDescription: $materialDescription, principalCode: $principalCode, principalName: $principalName, unitOfMeasurement: $unitOfMeasurement, therapeuticClass: $therapeuticClass, genericMaterialName: $genericMaterialName, itemBrand: $itemBrand, materialBrand: $materialBrand, isFavourite: $isFavourite, isFOCMaterial: $isFOCMaterial, defaultMaterialDescription: $defaultMaterialDescription, country: $country, countryName: $countryName, hidePrice: $hidePrice, governmentMaterialCode: $governmentMaterialCode, itemRegistrationNumber: $itemRegistrationNumber, promoType: $promoType, promoStatus: $promoStatus, isSuspended: $isSuspended, isMarketPlace: $isMarketPlace, hasMandatoryTenderContract: $hasMandatoryTenderContract, hasValidTenderContract: $hasValidTenderContract, isGimmick: $isGimmick, isSampleMaterial: $isSampleMaterial, isPoison: $isPoison)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailDtoImpl &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode) &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.unitOfMeasurement, unitOfMeasurement) ||
                other.unitOfMeasurement == unitOfMeasurement) &&
            (identical(other.therapeuticClass, therapeuticClass) ||
                other.therapeuticClass == therapeuticClass) &&
            (identical(other.genericMaterialName, genericMaterialName) ||
                other.genericMaterialName == genericMaterialName) &&
            (identical(other.itemBrand, itemBrand) ||
                other.itemBrand == itemBrand) &&
            (identical(other.materialBrand, materialBrand) ||
                other.materialBrand == materialBrand) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            (identical(other.isFOCMaterial, isFOCMaterial) ||
                other.isFOCMaterial == isFOCMaterial) &&
            (identical(other.defaultMaterialDescription,
                    defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            (identical(other.governmentMaterialCode, governmentMaterialCode) ||
                other.governmentMaterialCode == governmentMaterialCode) &&
            (identical(other.itemRegistrationNumber, itemRegistrationNumber) ||
                other.itemRegistrationNumber == itemRegistrationNumber) &&
            (identical(other.promoType, promoType) ||
                other.promoType == promoType) &&
            (identical(other.promoStatus, promoStatus) ||
                other.promoStatus == promoStatus) &&
            (identical(other.isSuspended, isSuspended) ||
                other.isSuspended == isSuspended) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace) &&
            (identical(other.hasMandatoryTenderContract,
                    hasMandatoryTenderContract) ||
                other.hasMandatoryTenderContract ==
                    hasMandatoryTenderContract) &&
            (identical(other.hasValidTenderContract, hasValidTenderContract) ||
                other.hasValidTenderContract == hasValidTenderContract) &&
            (identical(other.isGimmick, isGimmick) ||
                other.isGimmick == isGimmick) &&
            (identical(other.isSampleMaterial, isSampleMaterial) ||
                other.isSampleMaterial == isSampleMaterial) &&
            (identical(other.isPoison, isPoison) ||
                other.isPoison == isPoison));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        materialNumber,
        materialDescription,
        principalCode,
        principalName,
        unitOfMeasurement,
        therapeuticClass,
        genericMaterialName,
        itemBrand,
        materialBrand,
        isFavourite,
        isFOCMaterial,
        defaultMaterialDescription,
        country,
        countryName,
        hidePrice,
        governmentMaterialCode,
        itemRegistrationNumber,
        promoType,
        promoStatus,
        isSuspended,
        isMarketPlace,
        hasMandatoryTenderContract,
        hasValidTenderContract,
        isGimmick,
        isSampleMaterial,
        isPoison
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailDtoImplCopyWith<_$ProductDetailDtoImpl> get copyWith =>
      __$$ProductDetailDtoImplCopyWithImpl<_$ProductDetailDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDetailDtoImplToJson(
      this,
    );
  }
}

abstract class _ProductDetailDto extends ProductDetailDto {
  factory _ProductDetailDto(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
      required final String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      required final String materialDescription,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required final String principalCode,
      @JsonKey(name: 'principalName', defaultValue: '')
      required final String principalName,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
      required final String unitOfMeasurement,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      required final String therapeuticClass,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      required final String genericMaterialName,
      @JsonKey(name: 'itemBrand', defaultValue: '')
      required final String itemBrand,
      @JsonKey(name: 'materialBrand', defaultValue: '')
      required final String materialBrand,
      @JsonKey(name: 'isFavourite', defaultValue: false)
      required final bool isFavourite,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false)
      required final bool isFOCMaterial,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      required final String defaultMaterialDescription,
      @JsonKey(name: 'country', defaultValue: '') required final String country,
      @JsonKey(name: 'countryName', defaultValue: '')
      required final String countryName,
      @JsonKey(name: 'hidePrice', defaultValue: false)
      required final bool hidePrice,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      required final String governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      required final String itemRegistrationNumber,
      @JsonKey(name: 'promoType', defaultValue: '')
      required final String promoType,
      @JsonKey(name: 'promoStatus', defaultValue: false)
      required final bool promoStatus,
      @JsonKey(name: 'suspensionStatus', defaultValue: false)
      required final bool isSuspended,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required final bool isMarketPlace,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      required final bool hasMandatoryTenderContract,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      required final bool hasValidTenderContract,
      @JsonKey(name: 'isGimmick', defaultValue: false)
      required final bool isGimmick,
      @JsonKey(name: 'isSampleMaterial', defaultValue: false)
      required final bool isSampleMaterial,
      @JsonKey(name: 'isPoison', defaultValue: false)
      required final bool isPoison}) = _$ProductDetailDtoImpl;
  _ProductDetailDto._() : super._();

  factory _ProductDetailDto.fromJson(Map<String, dynamic> json) =
      _$ProductDetailDtoImpl.fromJson;

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName;
  @override
  @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
  String get unitOfMeasurement;
  @override
  @JsonKey(name: 'therapeuticClass', defaultValue: '')
  String get therapeuticClass;
  @override
  @JsonKey(name: 'genericMaterialName', defaultValue: '')
  String get genericMaterialName;
  @override
  @JsonKey(name: 'itemBrand', defaultValue: '')
  String get itemBrand;
  @override
  @JsonKey(name: 'materialBrand', defaultValue: '')
  String get materialBrand;
  @override
  @JsonKey(name: 'isFavourite', defaultValue: false)
  bool get isFavourite;
  @override
  @JsonKey(name: 'isFOCMaterial', defaultValue: false)
  bool get isFOCMaterial;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription;
  @override
  @JsonKey(name: 'country', defaultValue: '')
  String get country;
  @override
  @JsonKey(name: 'countryName', defaultValue: '')
  String get countryName;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice;
  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber;
  @override
  @JsonKey(name: 'promoType', defaultValue: '')
  String get promoType;
  @override
  @JsonKey(name: 'promoStatus', defaultValue: false)
  bool get promoStatus;
  @override
  @JsonKey(name: 'suspensionStatus', defaultValue: false)
  bool get isSuspended;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace;
  @override
  @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
  bool get hasMandatoryTenderContract;
  @override
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  bool get hasValidTenderContract;
  @override
  @JsonKey(name: 'isGimmick', defaultValue: false)
  bool get isGimmick;
  @override
  @JsonKey(name: 'isSampleMaterial', defaultValue: false)
  bool get isSampleMaterial;
  @override
  @JsonKey(name: 'isPoison', defaultValue: false)
  bool get isPoison;
  @override
  @JsonKey(ignore: true)
  _$$ProductDetailDtoImplCopyWith<_$ProductDetailDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
