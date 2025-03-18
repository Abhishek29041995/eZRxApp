// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialDto _$MaterialDtoFromJson(Map<String, dynamic> json) {
  return _MaterialDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialDto {
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'therapeuticClass', defaultValue: '')
  String get therapeuticClass => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemBrand', defaultValue: '')
  String get itemBrand => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxClassification', defaultValue: '')
  String get taxClassification => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
  String get unitOfMeasurement => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialGroup2', defaultValue: '')
  String get materialGroup2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialGroup4', defaultValue: '')
  String get materialGroup4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSampleMaterial', defaultValue: false)
  bool get isSampleMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  bool get hasValidTenderContract => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
  bool get hasMandatoryTenderContract => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
  double get taxes => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFOCMaterial', defaultValue: false)
  bool get isFOCMaterial => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'quantity',
      defaultValue: 0,
      readValue: JsonReadValueHelper.handlevalidateQuantity)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarks', defaultValue: '')
  String get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'genericMaterialName', defaultValue: '')
  String get genericMaterialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ean', defaultValue: '')
  String get ean => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'bundleInformation',
      readValue: JsonReadValueHelper.readValueMapDynamic)
  BundleDto get bundle =>
      throw _privateConstructorUsedError; // new field from v3
  @JsonKey(name: 'code', defaultValue: '')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'manufactured', defaultValue: '')
  String get manufactured => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFavourite', defaultValue: false)
  bool get isFavourite =>
      throw _privateConstructorUsedError; // TODO: The default on type is assigned temporarily as material
// will update this once issue is resolved from BE side
// https://zuelligpharma.atlassian.net/browse/EZRX-16463
  @JsonKey(name: 'type', defaultValue: 'material')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'dataTotalCount', defaultValue: 0)
  int get dataTotalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'dataTotalHidden', defaultValue: 0)
  int get dataTotalHidden => throw _privateConstructorUsedError;
  @JsonKey(name: 'isGimmick', defaultValue: false)
  bool get isGimmick => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPoison', defaultValue: false)
  bool get isPoison => throw _privateConstructorUsedError;
  @JsonKey(name: 'data', defaultValue: <MaterialDataDto>[])
  List<MaterialDataDto> get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
  List<BundleDto> get bundles => throw _privateConstructorUsedError;
  @JsonKey(name: 'suspensionStatus', defaultValue: false)
  bool get isSuspended => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialDtoCopyWith<MaterialDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialDtoCopyWith<$Res> {
  factory $MaterialDtoCopyWith(
          MaterialDto value, $Res Function(MaterialDto) then) =
      _$MaterialDtoCopyWithImpl<$Res, MaterialDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      String therapeuticClass,
      @JsonKey(name: 'itemBrand', defaultValue: '') String itemBrand,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      String taxClassification,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      String itemRegistrationNumber,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
      String unitOfMeasurement,
      @JsonKey(name: 'materialGroup2', defaultValue: '') String materialGroup2,
      @JsonKey(name: 'materialGroup4', defaultValue: '') String materialGroup4,
      @JsonKey(name: 'isSampleMaterial', defaultValue: false)
      bool isSampleMaterial,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      bool hasValidTenderContract,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      bool hasMandatoryTenderContract,
      @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
      double taxes,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false) bool isFOCMaterial,
      @JsonKey(
          name: 'quantity',
          defaultValue: 0,
          readValue: JsonReadValueHelper.handlevalidateQuantity)
      int quantity,
      @JsonKey(name: 'remarks', defaultValue: '') String remarks,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      String genericMaterialName,
      @JsonKey(name: 'ean', defaultValue: '') String ean,
      @JsonKey(
          name: 'bundleInformation',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      BundleDto bundle,
      @JsonKey(name: 'code', defaultValue: '') String code,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'manufactured', defaultValue: '') String manufactured,
      @JsonKey(name: 'isFavourite', defaultValue: false) bool isFavourite,
      @JsonKey(name: 'type', defaultValue: 'material') String type,
      @JsonKey(name: 'hidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(name: 'dataTotalCount', defaultValue: 0) int dataTotalCount,
      @JsonKey(name: 'dataTotalHidden', defaultValue: 0) int dataTotalHidden,
      @JsonKey(name: 'isGimmick', defaultValue: false) bool isGimmick,
      @JsonKey(name: 'isPoison', defaultValue: false) bool isPoison,
      @JsonKey(name: 'data', defaultValue: <MaterialDataDto>[])
      List<MaterialDataDto> data,
      @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
      List<BundleDto> bundles,
      @JsonKey(name: 'suspensionStatus', defaultValue: false) bool isSuspended,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace});

  $BundleDtoCopyWith<$Res> get bundle;
}

/// @nodoc
class _$MaterialDtoCopyWithImpl<$Res, $Val extends MaterialDto>
    implements $MaterialDtoCopyWith<$Res> {
  _$MaterialDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? governmentMaterialCode = null,
    Object? therapeuticClass = null,
    Object? itemBrand = null,
    Object? principalName = null,
    Object? taxClassification = null,
    Object? itemRegistrationNumber = null,
    Object? unitOfMeasurement = null,
    Object? materialGroup2 = null,
    Object? materialGroup4 = null,
    Object? isSampleMaterial = null,
    Object? hasValidTenderContract = null,
    Object? hasMandatoryTenderContract = null,
    Object? taxes = null,
    Object? defaultMaterialDescription = null,
    Object? isFOCMaterial = null,
    Object? quantity = null,
    Object? remarks = null,
    Object? genericMaterialName = null,
    Object? ean = null,
    Object? bundle = null,
    Object? code = null,
    Object? name = null,
    Object? principalCode = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? manufactured = null,
    Object? isFavourite = null,
    Object? type = null,
    Object? hidePrice = null,
    Object? dataTotalCount = null,
    Object? dataTotalHidden = null,
    Object? isGimmick = null,
    Object? isPoison = null,
    Object? data = null,
    Object? bundles = null,
    Object? isSuspended = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_value.copyWith(
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      therapeuticClass: null == therapeuticClass
          ? _value.therapeuticClass
          : therapeuticClass // ignore: cast_nullable_to_non_nullable
              as String,
      itemBrand: null == itemBrand
          ? _value.itemBrand
          : itemBrand // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      taxClassification: null == taxClassification
          ? _value.taxClassification
          : taxClassification // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      unitOfMeasurement: null == unitOfMeasurement
          ? _value.unitOfMeasurement
          : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup2: null == materialGroup2
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup4: null == materialGroup4
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as String,
      isSampleMaterial: null == isSampleMaterial
          ? _value.isSampleMaterial
          : isSampleMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      hasValidTenderContract: null == hasValidTenderContract
          ? _value.hasValidTenderContract
          : hasValidTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMandatoryTenderContract: null == hasMandatoryTenderContract
          ? _value.hasMandatoryTenderContract
          : hasMandatoryTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      taxes: null == taxes
          ? _value.taxes
          : taxes // ignore: cast_nullable_to_non_nullable
              as double,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      isFOCMaterial: null == isFOCMaterial
          ? _value.isFOCMaterial
          : isFOCMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      genericMaterialName: null == genericMaterialName
          ? _value.genericMaterialName
          : genericMaterialName // ignore: cast_nullable_to_non_nullable
              as String,
      ean: null == ean
          ? _value.ean
          : ean // ignore: cast_nullable_to_non_nullable
              as String,
      bundle: null == bundle
          ? _value.bundle
          : bundle // ignore: cast_nullable_to_non_nullable
              as BundleDto,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      manufactured: null == manufactured
          ? _value.manufactured
          : manufactured // ignore: cast_nullable_to_non_nullable
              as String,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      dataTotalCount: null == dataTotalCount
          ? _value.dataTotalCount
          : dataTotalCount // ignore: cast_nullable_to_non_nullable
              as int,
      dataTotalHidden: null == dataTotalHidden
          ? _value.dataTotalHidden
          : dataTotalHidden // ignore: cast_nullable_to_non_nullable
              as int,
      isGimmick: null == isGimmick
          ? _value.isGimmick
          : isGimmick // ignore: cast_nullable_to_non_nullable
              as bool,
      isPoison: null == isPoison
          ? _value.isPoison
          : isPoison // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MaterialDataDto>,
      bundles: null == bundles
          ? _value.bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<BundleDto>,
      isSuspended: null == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BundleDtoCopyWith<$Res> get bundle {
    return $BundleDtoCopyWith<$Res>(_value.bundle, (value) {
      return _then(_value.copyWith(bundle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialDtoImplCopyWith<$Res>
    implements $MaterialDtoCopyWith<$Res> {
  factory _$$MaterialDtoImplCopyWith(
          _$MaterialDtoImpl value, $Res Function(_$MaterialDtoImpl) then) =
      __$$MaterialDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      String therapeuticClass,
      @JsonKey(name: 'itemBrand', defaultValue: '') String itemBrand,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      String taxClassification,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      String itemRegistrationNumber,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
      String unitOfMeasurement,
      @JsonKey(name: 'materialGroup2', defaultValue: '') String materialGroup2,
      @JsonKey(name: 'materialGroup4', defaultValue: '') String materialGroup4,
      @JsonKey(name: 'isSampleMaterial', defaultValue: false)
      bool isSampleMaterial,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      bool hasValidTenderContract,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      bool hasMandatoryTenderContract,
      @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
      double taxes,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false) bool isFOCMaterial,
      @JsonKey(
          name: 'quantity',
          defaultValue: 0,
          readValue: JsonReadValueHelper.handlevalidateQuantity)
      int quantity,
      @JsonKey(name: 'remarks', defaultValue: '') String remarks,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      String genericMaterialName,
      @JsonKey(name: 'ean', defaultValue: '') String ean,
      @JsonKey(
          name: 'bundleInformation',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      BundleDto bundle,
      @JsonKey(name: 'code', defaultValue: '') String code,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'manufactured', defaultValue: '') String manufactured,
      @JsonKey(name: 'isFavourite', defaultValue: false) bool isFavourite,
      @JsonKey(name: 'type', defaultValue: 'material') String type,
      @JsonKey(name: 'hidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(name: 'dataTotalCount', defaultValue: 0) int dataTotalCount,
      @JsonKey(name: 'dataTotalHidden', defaultValue: 0) int dataTotalHidden,
      @JsonKey(name: 'isGimmick', defaultValue: false) bool isGimmick,
      @JsonKey(name: 'isPoison', defaultValue: false) bool isPoison,
      @JsonKey(name: 'data', defaultValue: <MaterialDataDto>[])
      List<MaterialDataDto> data,
      @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
      List<BundleDto> bundles,
      @JsonKey(name: 'suspensionStatus', defaultValue: false) bool isSuspended,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace});

  @override
  $BundleDtoCopyWith<$Res> get bundle;
}

/// @nodoc
class __$$MaterialDtoImplCopyWithImpl<$Res>
    extends _$MaterialDtoCopyWithImpl<$Res, _$MaterialDtoImpl>
    implements _$$MaterialDtoImplCopyWith<$Res> {
  __$$MaterialDtoImplCopyWithImpl(
      _$MaterialDtoImpl _value, $Res Function(_$MaterialDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? governmentMaterialCode = null,
    Object? therapeuticClass = null,
    Object? itemBrand = null,
    Object? principalName = null,
    Object? taxClassification = null,
    Object? itemRegistrationNumber = null,
    Object? unitOfMeasurement = null,
    Object? materialGroup2 = null,
    Object? materialGroup4 = null,
    Object? isSampleMaterial = null,
    Object? hasValidTenderContract = null,
    Object? hasMandatoryTenderContract = null,
    Object? taxes = null,
    Object? defaultMaterialDescription = null,
    Object? isFOCMaterial = null,
    Object? quantity = null,
    Object? remarks = null,
    Object? genericMaterialName = null,
    Object? ean = null,
    Object? bundle = null,
    Object? code = null,
    Object? name = null,
    Object? principalCode = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? manufactured = null,
    Object? isFavourite = null,
    Object? type = null,
    Object? hidePrice = null,
    Object? dataTotalCount = null,
    Object? dataTotalHidden = null,
    Object? isGimmick = null,
    Object? isPoison = null,
    Object? data = null,
    Object? bundles = null,
    Object? isSuspended = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_$MaterialDtoImpl(
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      therapeuticClass: null == therapeuticClass
          ? _value.therapeuticClass
          : therapeuticClass // ignore: cast_nullable_to_non_nullable
              as String,
      itemBrand: null == itemBrand
          ? _value.itemBrand
          : itemBrand // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      taxClassification: null == taxClassification
          ? _value.taxClassification
          : taxClassification // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      unitOfMeasurement: null == unitOfMeasurement
          ? _value.unitOfMeasurement
          : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup2: null == materialGroup2
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup4: null == materialGroup4
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as String,
      isSampleMaterial: null == isSampleMaterial
          ? _value.isSampleMaterial
          : isSampleMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      hasValidTenderContract: null == hasValidTenderContract
          ? _value.hasValidTenderContract
          : hasValidTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMandatoryTenderContract: null == hasMandatoryTenderContract
          ? _value.hasMandatoryTenderContract
          : hasMandatoryTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      taxes: null == taxes
          ? _value.taxes
          : taxes // ignore: cast_nullable_to_non_nullable
              as double,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      isFOCMaterial: null == isFOCMaterial
          ? _value.isFOCMaterial
          : isFOCMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      genericMaterialName: null == genericMaterialName
          ? _value.genericMaterialName
          : genericMaterialName // ignore: cast_nullable_to_non_nullable
              as String,
      ean: null == ean
          ? _value.ean
          : ean // ignore: cast_nullable_to_non_nullable
              as String,
      bundle: null == bundle
          ? _value.bundle
          : bundle // ignore: cast_nullable_to_non_nullable
              as BundleDto,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      manufactured: null == manufactured
          ? _value.manufactured
          : manufactured // ignore: cast_nullable_to_non_nullable
              as String,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      dataTotalCount: null == dataTotalCount
          ? _value.dataTotalCount
          : dataTotalCount // ignore: cast_nullable_to_non_nullable
              as int,
      dataTotalHidden: null == dataTotalHidden
          ? _value.dataTotalHidden
          : dataTotalHidden // ignore: cast_nullable_to_non_nullable
              as int,
      isGimmick: null == isGimmick
          ? _value.isGimmick
          : isGimmick // ignore: cast_nullable_to_non_nullable
              as bool,
      isPoison: null == isPoison
          ? _value.isPoison
          : isPoison // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MaterialDataDto>,
      bundles: null == bundles
          ? _value._bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<BundleDto>,
      isSuspended: null == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialDtoImpl extends _MaterialDto {
  const _$MaterialDtoImpl(
      {@JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      required this.governmentMaterialCode,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      required this.therapeuticClass,
      @JsonKey(name: 'itemBrand', defaultValue: '') required this.itemBrand,
      @JsonKey(name: 'principalName', defaultValue: '')
      required this.principalName,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      required this.taxClassification,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      required this.itemRegistrationNumber,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
      required this.unitOfMeasurement,
      @JsonKey(name: 'materialGroup2', defaultValue: '')
      required this.materialGroup2,
      @JsonKey(name: 'materialGroup4', defaultValue: '')
      required this.materialGroup4,
      @JsonKey(name: 'isSampleMaterial', defaultValue: false)
      required this.isSampleMaterial,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      required this.hasValidTenderContract,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      required this.hasMandatoryTenderContract,
      @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
      required this.taxes,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      required this.defaultMaterialDescription,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false)
      required this.isFOCMaterial,
      @JsonKey(
          name: 'quantity',
          defaultValue: 0,
          readValue: JsonReadValueHelper.handlevalidateQuantity)
      required this.quantity,
      @JsonKey(name: 'remarks', defaultValue: '') required this.remarks,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      required this.genericMaterialName,
      @JsonKey(name: 'ean', defaultValue: '') required this.ean,
      @JsonKey(
          name: 'bundleInformation',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.bundle,
      @JsonKey(name: 'code', defaultValue: '') required this.code,
      @JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required this.principalCode,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      required this.materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      required this.materialDescription,
      @JsonKey(name: 'manufactured', defaultValue: '')
      required this.manufactured,
      @JsonKey(name: 'isFavourite', defaultValue: false)
      required this.isFavourite,
      @JsonKey(name: 'type', defaultValue: 'material') required this.type,
      @JsonKey(name: 'hidePrice', defaultValue: false) required this.hidePrice,
      @JsonKey(name: 'dataTotalCount', defaultValue: 0)
      required this.dataTotalCount,
      @JsonKey(name: 'dataTotalHidden', defaultValue: 0)
      required this.dataTotalHidden,
      @JsonKey(name: 'isGimmick', defaultValue: false) required this.isGimmick,
      @JsonKey(name: 'isPoison', defaultValue: false) required this.isPoison,
      @JsonKey(name: 'data', defaultValue: <MaterialDataDto>[])
      required final List<MaterialDataDto> data,
      @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
      required final List<BundleDto> bundles,
      @JsonKey(name: 'suspensionStatus', defaultValue: false)
      required this.isSuspended,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required this.isMarketPlace})
      : _data = data,
        _bundles = bundles,
        super._();

  factory _$MaterialDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialDtoImplFromJson(json);

  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  final String governmentMaterialCode;
  @override
  @JsonKey(name: 'therapeuticClass', defaultValue: '')
  final String therapeuticClass;
  @override
  @JsonKey(name: 'itemBrand', defaultValue: '')
  final String itemBrand;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  final String principalName;
  @override
  @JsonKey(name: 'taxClassification', defaultValue: '')
  final String taxClassification;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  final String itemRegistrationNumber;
  @override
  @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
  final String unitOfMeasurement;
  @override
  @JsonKey(name: 'materialGroup2', defaultValue: '')
  final String materialGroup2;
  @override
  @JsonKey(name: 'materialGroup4', defaultValue: '')
  final String materialGroup4;
  @override
  @JsonKey(name: 'isSampleMaterial', defaultValue: false)
  final bool isSampleMaterial;
  @override
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  final bool hasValidTenderContract;
  @override
  @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
  final bool hasMandatoryTenderContract;
  @override
  @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
  final double taxes;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  final String defaultMaterialDescription;
  @override
  @JsonKey(name: 'isFOCMaterial', defaultValue: false)
  final bool isFOCMaterial;
  @override
  @JsonKey(
      name: 'quantity',
      defaultValue: 0,
      readValue: JsonReadValueHelper.handlevalidateQuantity)
  final int quantity;
  @override
  @JsonKey(name: 'remarks', defaultValue: '')
  final String remarks;
  @override
  @JsonKey(name: 'genericMaterialName', defaultValue: '')
  final String genericMaterialName;
  @override
  @JsonKey(name: 'ean', defaultValue: '')
  final String ean;
  @override
  @JsonKey(
      name: 'bundleInformation',
      readValue: JsonReadValueHelper.readValueMapDynamic)
  final BundleDto bundle;
// new field from v3
  @override
  @JsonKey(name: 'code', defaultValue: '')
  final String code;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  final String principalCode;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'manufactured', defaultValue: '')
  final String manufactured;
  @override
  @JsonKey(name: 'isFavourite', defaultValue: false)
  final bool isFavourite;
// TODO: The default on type is assigned temporarily as material
// will update this once issue is resolved from BE side
// https://zuelligpharma.atlassian.net/browse/EZRX-16463
  @override
  @JsonKey(name: 'type', defaultValue: 'material')
  final String type;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  final bool hidePrice;
  @override
  @JsonKey(name: 'dataTotalCount', defaultValue: 0)
  final int dataTotalCount;
  @override
  @JsonKey(name: 'dataTotalHidden', defaultValue: 0)
  final int dataTotalHidden;
  @override
  @JsonKey(name: 'isGimmick', defaultValue: false)
  final bool isGimmick;
  @override
  @JsonKey(name: 'isPoison', defaultValue: false)
  final bool isPoison;
  final List<MaterialDataDto> _data;
  @override
  @JsonKey(name: 'data', defaultValue: <MaterialDataDto>[])
  List<MaterialDataDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  final List<BundleDto> _bundles;
  @override
  @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
  List<BundleDto> get bundles {
    if (_bundles is EqualUnmodifiableListView) return _bundles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundles);
  }

  @override
  @JsonKey(name: 'suspensionStatus', defaultValue: false)
  final bool isSuspended;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  final bool isMarketPlace;

  @override
  String toString() {
    return 'MaterialDto(governmentMaterialCode: $governmentMaterialCode, therapeuticClass: $therapeuticClass, itemBrand: $itemBrand, principalName: $principalName, taxClassification: $taxClassification, itemRegistrationNumber: $itemRegistrationNumber, unitOfMeasurement: $unitOfMeasurement, materialGroup2: $materialGroup2, materialGroup4: $materialGroup4, isSampleMaterial: $isSampleMaterial, hasValidTenderContract: $hasValidTenderContract, hasMandatoryTenderContract: $hasMandatoryTenderContract, taxes: $taxes, defaultMaterialDescription: $defaultMaterialDescription, isFOCMaterial: $isFOCMaterial, quantity: $quantity, remarks: $remarks, genericMaterialName: $genericMaterialName, ean: $ean, bundle: $bundle, code: $code, name: $name, principalCode: $principalCode, materialNumber: $materialNumber, materialDescription: $materialDescription, manufactured: $manufactured, isFavourite: $isFavourite, type: $type, hidePrice: $hidePrice, dataTotalCount: $dataTotalCount, dataTotalHidden: $dataTotalHidden, isGimmick: $isGimmick, isPoison: $isPoison, data: $data, bundles: $bundles, isSuspended: $isSuspended, isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialDtoImpl &&
            (identical(other.governmentMaterialCode, governmentMaterialCode) ||
                other.governmentMaterialCode == governmentMaterialCode) &&
            (identical(other.therapeuticClass, therapeuticClass) ||
                other.therapeuticClass == therapeuticClass) &&
            (identical(other.itemBrand, itemBrand) ||
                other.itemBrand == itemBrand) &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.taxClassification, taxClassification) ||
                other.taxClassification == taxClassification) &&
            (identical(other.itemRegistrationNumber, itemRegistrationNumber) ||
                other.itemRegistrationNumber == itemRegistrationNumber) &&
            (identical(other.unitOfMeasurement, unitOfMeasurement) ||
                other.unitOfMeasurement == unitOfMeasurement) &&
            (identical(other.materialGroup2, materialGroup2) ||
                other.materialGroup2 == materialGroup2) &&
            (identical(other.materialGroup4, materialGroup4) ||
                other.materialGroup4 == materialGroup4) &&
            (identical(other.isSampleMaterial, isSampleMaterial) ||
                other.isSampleMaterial == isSampleMaterial) &&
            (identical(other.hasValidTenderContract, hasValidTenderContract) ||
                other.hasValidTenderContract == hasValidTenderContract) &&
            (identical(other.hasMandatoryTenderContract,
                    hasMandatoryTenderContract) ||
                other.hasMandatoryTenderContract ==
                    hasMandatoryTenderContract) &&
            (identical(other.taxes, taxes) || other.taxes == taxes) &&
            (identical(other.defaultMaterialDescription,
                    defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription) &&
            (identical(other.isFOCMaterial, isFOCMaterial) ||
                other.isFOCMaterial == isFOCMaterial) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.genericMaterialName, genericMaterialName) ||
                other.genericMaterialName == genericMaterialName) &&
            (identical(other.ean, ean) || other.ean == ean) &&
            (identical(other.bundle, bundle) || other.bundle == bundle) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.manufactured, manufactured) ||
                other.manufactured == manufactured) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            (identical(other.dataTotalCount, dataTotalCount) ||
                other.dataTotalCount == dataTotalCount) &&
            (identical(other.dataTotalHidden, dataTotalHidden) ||
                other.dataTotalHidden == dataTotalHidden) &&
            (identical(other.isGimmick, isGimmick) ||
                other.isGimmick == isGimmick) &&
            (identical(other.isPoison, isPoison) ||
                other.isPoison == isPoison) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._bundles, _bundles) &&
            (identical(other.isSuspended, isSuspended) ||
                other.isSuspended == isSuspended) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        governmentMaterialCode,
        therapeuticClass,
        itemBrand,
        principalName,
        taxClassification,
        itemRegistrationNumber,
        unitOfMeasurement,
        materialGroup2,
        materialGroup4,
        isSampleMaterial,
        hasValidTenderContract,
        hasMandatoryTenderContract,
        taxes,
        defaultMaterialDescription,
        isFOCMaterial,
        quantity,
        remarks,
        genericMaterialName,
        ean,
        bundle,
        code,
        name,
        principalCode,
        materialNumber,
        materialDescription,
        manufactured,
        isFavourite,
        type,
        hidePrice,
        dataTotalCount,
        dataTotalHidden,
        isGimmick,
        isPoison,
        const DeepCollectionEquality().hash(_data),
        const DeepCollectionEquality().hash(_bundles),
        isSuspended,
        isMarketPlace
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialDtoImplCopyWith<_$MaterialDtoImpl> get copyWith =>
      __$$MaterialDtoImplCopyWithImpl<_$MaterialDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialDtoImplToJson(
      this,
    );
  }
}

abstract class _MaterialDto extends MaterialDto {
  const factory _MaterialDto(
      {@JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      required final String governmentMaterialCode,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      required final String therapeuticClass,
      @JsonKey(name: 'itemBrand', defaultValue: '')
      required final String itemBrand,
      @JsonKey(name: 'principalName', defaultValue: '')
      required final String principalName,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      required final String taxClassification,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      required final String itemRegistrationNumber,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
      required final String unitOfMeasurement,
      @JsonKey(name: 'materialGroup2', defaultValue: '')
      required final String materialGroup2,
      @JsonKey(name: 'materialGroup4', defaultValue: '')
      required final String materialGroup4,
      @JsonKey(name: 'isSampleMaterial', defaultValue: false)
      required final bool isSampleMaterial,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      required final bool hasValidTenderContract,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      required final bool hasMandatoryTenderContract,
      @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
      required final double taxes,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      required final String defaultMaterialDescription,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false)
      required final bool isFOCMaterial,
      @JsonKey(
          name: 'quantity',
          defaultValue: 0,
          readValue: JsonReadValueHelper.handlevalidateQuantity)
      required final int quantity,
      @JsonKey(name: 'remarks', defaultValue: '') required final String remarks,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      required final String genericMaterialName,
      @JsonKey(name: 'ean', defaultValue: '') required final String ean,
      @JsonKey(
          name: 'bundleInformation',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      required final BundleDto bundle,
      @JsonKey(name: 'code', defaultValue: '') required final String code,
      @JsonKey(name: 'name', defaultValue: '') required final String name,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required final String principalCode,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      required final String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      required final String materialDescription,
      @JsonKey(name: 'manufactured', defaultValue: '')
      required final String manufactured,
      @JsonKey(name: 'isFavourite', defaultValue: false)
      required final bool isFavourite,
      @JsonKey(name: 'type', defaultValue: 'material')
      required final String type,
      @JsonKey(name: 'hidePrice', defaultValue: false)
      required final bool hidePrice,
      @JsonKey(name: 'dataTotalCount', defaultValue: 0)
      required final int dataTotalCount,
      @JsonKey(name: 'dataTotalHidden', defaultValue: 0)
      required final int dataTotalHidden,
      @JsonKey(name: 'isGimmick', defaultValue: false)
      required final bool isGimmick,
      @JsonKey(name: 'isPoison', defaultValue: false)
      required final bool isPoison,
      @JsonKey(name: 'data', defaultValue: <MaterialDataDto>[])
      required final List<MaterialDataDto> data,
      @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
      required final List<BundleDto> bundles,
      @JsonKey(name: 'suspensionStatus', defaultValue: false)
      required final bool isSuspended,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required final bool isMarketPlace}) = _$MaterialDtoImpl;
  const _MaterialDto._() : super._();

  factory _MaterialDto.fromJson(Map<String, dynamic> json) =
      _$MaterialDtoImpl.fromJson;

  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode;
  @override
  @JsonKey(name: 'therapeuticClass', defaultValue: '')
  String get therapeuticClass;
  @override
  @JsonKey(name: 'itemBrand', defaultValue: '')
  String get itemBrand;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName;
  @override
  @JsonKey(name: 'taxClassification', defaultValue: '')
  String get taxClassification;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber;
  @override
  @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
  String get unitOfMeasurement;
  @override
  @JsonKey(name: 'materialGroup2', defaultValue: '')
  String get materialGroup2;
  @override
  @JsonKey(name: 'materialGroup4', defaultValue: '')
  String get materialGroup4;
  @override
  @JsonKey(name: 'isSampleMaterial', defaultValue: false)
  bool get isSampleMaterial;
  @override
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  bool get hasValidTenderContract;
  @override
  @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
  bool get hasMandatoryTenderContract;
  @override
  @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
  double get taxes;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription;
  @override
  @JsonKey(name: 'isFOCMaterial', defaultValue: false)
  bool get isFOCMaterial;
  @override
  @JsonKey(
      name: 'quantity',
      defaultValue: 0,
      readValue: JsonReadValueHelper.handlevalidateQuantity)
  int get quantity;
  @override
  @JsonKey(name: 'remarks', defaultValue: '')
  String get remarks;
  @override
  @JsonKey(name: 'genericMaterialName', defaultValue: '')
  String get genericMaterialName;
  @override
  @JsonKey(name: 'ean', defaultValue: '')
  String get ean;
  @override
  @JsonKey(
      name: 'bundleInformation',
      readValue: JsonReadValueHelper.readValueMapDynamic)
  BundleDto get bundle;
  @override // new field from v3
  @JsonKey(name: 'code', defaultValue: '')
  String get code;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'manufactured', defaultValue: '')
  String get manufactured;
  @override
  @JsonKey(name: 'isFavourite', defaultValue: false)
  bool get isFavourite;
  @override // TODO: The default on type is assigned temporarily as material
// will update this once issue is resolved from BE side
// https://zuelligpharma.atlassian.net/browse/EZRX-16463
  @JsonKey(name: 'type', defaultValue: 'material')
  String get type;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice;
  @override
  @JsonKey(name: 'dataTotalCount', defaultValue: 0)
  int get dataTotalCount;
  @override
  @JsonKey(name: 'dataTotalHidden', defaultValue: 0)
  int get dataTotalHidden;
  @override
  @JsonKey(name: 'isGimmick', defaultValue: false)
  bool get isGimmick;
  @override
  @JsonKey(name: 'isPoison', defaultValue: false)
  bool get isPoison;
  @override
  @JsonKey(name: 'data', defaultValue: <MaterialDataDto>[])
  List<MaterialDataDto> get data;
  @override
  @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
  List<BundleDto> get bundles;
  @override
  @JsonKey(name: 'suspensionStatus', defaultValue: false)
  bool get isSuspended;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace;
  @override
  @JsonKey(ignore: true)
  _$$MaterialDtoImplCopyWith<_$MaterialDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MaterialDataDto _$MaterialDataDtoFromJson(Map<String, dynamic> json) {
  return _MaterialDataDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialDataDto {
  @JsonKey(
      name: 'code',
      defaultValue: '',
      readValue: JsonReadValueHelper.readMaterialNumberValue)
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'manufactured', defaultValue: '')
  String get manufactured => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'genericMaterialName', defaultValue: '')
  String get genericMaterialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialDataDtoCopyWith<MaterialDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialDataDtoCopyWith<$Res> {
  factory $MaterialDataDtoCopyWith(
          MaterialDataDto value, $Res Function(MaterialDataDto) then) =
      _$MaterialDataDtoCopyWithImpl<$Res, MaterialDataDto>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'code',
          defaultValue: '',
          readValue: JsonReadValueHelper.readMaterialNumberValue)
      String code,
      @JsonKey(name: 'manufactured', defaultValue: '') String manufactured,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      String genericMaterialName,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      String itemRegistrationNumber,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace});
}

/// @nodoc
class _$MaterialDataDtoCopyWithImpl<$Res, $Val extends MaterialDataDto>
    implements $MaterialDataDtoCopyWith<$Res> {
  _$MaterialDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? manufactured = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
    Object? genericMaterialName = null,
    Object? governmentMaterialCode = null,
    Object? itemRegistrationNumber = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      manufactured: null == manufactured
          ? _value.manufactured
          : manufactured // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      genericMaterialName: null == genericMaterialName
          ? _value.genericMaterialName
          : genericMaterialName // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialDataDtoImplCopyWith<$Res>
    implements $MaterialDataDtoCopyWith<$Res> {
  factory _$$MaterialDataDtoImplCopyWith(_$MaterialDataDtoImpl value,
          $Res Function(_$MaterialDataDtoImpl) then) =
      __$$MaterialDataDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'code',
          defaultValue: '',
          readValue: JsonReadValueHelper.readMaterialNumberValue)
      String code,
      @JsonKey(name: 'manufactured', defaultValue: '') String manufactured,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      String genericMaterialName,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      String governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      String itemRegistrationNumber,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace});
}

/// @nodoc
class __$$MaterialDataDtoImplCopyWithImpl<$Res>
    extends _$MaterialDataDtoCopyWithImpl<$Res, _$MaterialDataDtoImpl>
    implements _$$MaterialDataDtoImplCopyWith<$Res> {
  __$$MaterialDataDtoImplCopyWithImpl(
      _$MaterialDataDtoImpl _value, $Res Function(_$MaterialDataDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? manufactured = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
    Object? genericMaterialName = null,
    Object? governmentMaterialCode = null,
    Object? itemRegistrationNumber = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_$MaterialDataDtoImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      manufactured: null == manufactured
          ? _value.manufactured
          : manufactured // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      genericMaterialName: null == genericMaterialName
          ? _value.genericMaterialName
          : genericMaterialName // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialDataDtoImpl extends _MaterialDataDto {
  _$MaterialDataDtoImpl(
      {@JsonKey(
          name: 'code',
          defaultValue: '',
          readValue: JsonReadValueHelper.readMaterialNumberValue)
      required this.code,
      @JsonKey(name: 'manufactured', defaultValue: '')
      required this.manufactured,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      required this.materialDescription,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      required this.defaultMaterialDescription,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      required this.genericMaterialName,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      required this.governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      required this.itemRegistrationNumber,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required this.isMarketPlace})
      : super._();

  factory _$MaterialDataDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialDataDtoImplFromJson(json);

  @override
  @JsonKey(
      name: 'code',
      defaultValue: '',
      readValue: JsonReadValueHelper.readMaterialNumberValue)
  final String code;
  @override
  @JsonKey(name: 'manufactured', defaultValue: '')
  final String manufactured;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  final String defaultMaterialDescription;
  @override
  @JsonKey(name: 'genericMaterialName', defaultValue: '')
  final String genericMaterialName;
  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  final String governmentMaterialCode;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  final String itemRegistrationNumber;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  final bool isMarketPlace;

  @override
  String toString() {
    return 'MaterialDataDto(code: $code, manufactured: $manufactured, materialDescription: $materialDescription, defaultMaterialDescription: $defaultMaterialDescription, genericMaterialName: $genericMaterialName, governmentMaterialCode: $governmentMaterialCode, itemRegistrationNumber: $itemRegistrationNumber, isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialDataDtoImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.manufactured, manufactured) ||
                other.manufactured == manufactured) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.defaultMaterialDescription,
                    defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription) &&
            (identical(other.genericMaterialName, genericMaterialName) ||
                other.genericMaterialName == genericMaterialName) &&
            (identical(other.governmentMaterialCode, governmentMaterialCode) ||
                other.governmentMaterialCode == governmentMaterialCode) &&
            (identical(other.itemRegistrationNumber, itemRegistrationNumber) ||
                other.itemRegistrationNumber == itemRegistrationNumber) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      manufactured,
      materialDescription,
      defaultMaterialDescription,
      genericMaterialName,
      governmentMaterialCode,
      itemRegistrationNumber,
      isMarketPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialDataDtoImplCopyWith<_$MaterialDataDtoImpl> get copyWith =>
      __$$MaterialDataDtoImplCopyWithImpl<_$MaterialDataDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialDataDtoImplToJson(
      this,
    );
  }
}

abstract class _MaterialDataDto extends MaterialDataDto {
  factory _MaterialDataDto(
      {@JsonKey(
          name: 'code',
          defaultValue: '',
          readValue: JsonReadValueHelper.readMaterialNumberValue)
      required final String code,
      @JsonKey(name: 'manufactured', defaultValue: '')
      required final String manufactured,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      required final String materialDescription,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      required final String defaultMaterialDescription,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
      required final String genericMaterialName,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      required final String governmentMaterialCode,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      required final String itemRegistrationNumber,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required final bool isMarketPlace}) = _$MaterialDataDtoImpl;
  _MaterialDataDto._() : super._();

  factory _MaterialDataDto.fromJson(Map<String, dynamic> json) =
      _$MaterialDataDtoImpl.fromJson;

  @override
  @JsonKey(
      name: 'code',
      defaultValue: '',
      readValue: JsonReadValueHelper.readMaterialNumberValue)
  String get code;
  @override
  @JsonKey(name: 'manufactured', defaultValue: '')
  String get manufactured;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription;
  @override
  @JsonKey(name: 'genericMaterialName', defaultValue: '')
  String get genericMaterialName;
  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace;
  @override
  @JsonKey(ignore: true)
  _$$MaterialDataDtoImplCopyWith<_$MaterialDataDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MaterialResponseDto _$MaterialResponseDtoFromJson(Map<String, dynamic> json) {
  return _MaterialResponseDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialResponseDto {
  @JsonKey(name: 'count', defaultValue: 0)
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'products', defaultValue: <MaterialDto>[])
  List<MaterialDto> get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialResponseDtoCopyWith<MaterialResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialResponseDtoCopyWith<$Res> {
  factory $MaterialResponseDtoCopyWith(
          MaterialResponseDto value, $Res Function(MaterialResponseDto) then) =
      _$MaterialResponseDtoCopyWithImpl<$Res, MaterialResponseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count', defaultValue: 0) int count,
      @JsonKey(name: 'products', defaultValue: <MaterialDto>[])
      List<MaterialDto> products});
}

/// @nodoc
class _$MaterialResponseDtoCopyWithImpl<$Res, $Val extends MaterialResponseDto>
    implements $MaterialResponseDtoCopyWith<$Res> {
  _$MaterialResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<MaterialDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialResponseDtoImplCopyWith<$Res>
    implements $MaterialResponseDtoCopyWith<$Res> {
  factory _$$MaterialResponseDtoImplCopyWith(_$MaterialResponseDtoImpl value,
          $Res Function(_$MaterialResponseDtoImpl) then) =
      __$$MaterialResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count', defaultValue: 0) int count,
      @JsonKey(name: 'products', defaultValue: <MaterialDto>[])
      List<MaterialDto> products});
}

/// @nodoc
class __$$MaterialResponseDtoImplCopyWithImpl<$Res>
    extends _$MaterialResponseDtoCopyWithImpl<$Res, _$MaterialResponseDtoImpl>
    implements _$$MaterialResponseDtoImplCopyWith<$Res> {
  __$$MaterialResponseDtoImplCopyWithImpl(_$MaterialResponseDtoImpl _value,
      $Res Function(_$MaterialResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? products = null,
  }) {
    return _then(_$MaterialResponseDtoImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<MaterialDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialResponseDtoImpl extends _MaterialResponseDto {
  _$MaterialResponseDtoImpl(
      {@JsonKey(name: 'count', defaultValue: 0) required this.count,
      @JsonKey(name: 'products', defaultValue: <MaterialDto>[])
      required final List<MaterialDto> products})
      : _products = products,
        super._();

  factory _$MaterialResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialResponseDtoImplFromJson(json);

  @override
  @JsonKey(name: 'count', defaultValue: 0)
  final int count;
  final List<MaterialDto> _products;
  @override
  @JsonKey(name: 'products', defaultValue: <MaterialDto>[])
  List<MaterialDto> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'MaterialResponseDto(count: $count, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialResponseDtoImpl &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialResponseDtoImplCopyWith<_$MaterialResponseDtoImpl> get copyWith =>
      __$$MaterialResponseDtoImplCopyWithImpl<_$MaterialResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _MaterialResponseDto extends MaterialResponseDto {
  factory _MaterialResponseDto(
      {@JsonKey(name: 'count', defaultValue: 0) required final int count,
      @JsonKey(name: 'products', defaultValue: <MaterialDto>[])
      required final List<MaterialDto> products}) = _$MaterialResponseDtoImpl;
  _MaterialResponseDto._() : super._();

  factory _MaterialResponseDto.fromJson(Map<String, dynamic> json) =
      _$MaterialResponseDtoImpl.fromJson;

  @override
  @JsonKey(name: 'count', defaultValue: 0)
  int get count;
  @override
  @JsonKey(name: 'products', defaultValue: <MaterialDto>[])
  List<MaterialDto> get products;
  @override
  @JsonKey(ignore: true)
  _$$MaterialResponseDtoImplCopyWith<_$MaterialResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
