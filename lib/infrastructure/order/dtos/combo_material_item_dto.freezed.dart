// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo_material_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ComboMaterialItemDto _$ComboMaterialItemDtoFromJson(Map<String, dynamic> json) {
  return _ComboMaterialItemDto.fromJson(json);
}

/// @nodoc
mixin _$ComboMaterialItemDto {
  @JsonKey(name: 'productID', defaultValue: '')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'parentID', defaultValue: '')
  String get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'setNo', defaultValue: '')
  String get setNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity', defaultValue: 0)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'ttemSource', defaultValue: 'EZRX')
  String get itemSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'rate', defaultValue: 0)
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  String get conditionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'mandatory', defaultValue: false)
  bool get mandatory => throw _privateConstructorUsedError;
  @JsonKey(name: 'suffix', defaultValue: '')
  String get suffix => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'listPrice', defaultValue: 0.0)
  double get listPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'ttemCheck', defaultValue: false)
  bool get itemCheck => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid', defaultValue: false)
  bool get valid => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'comboDealType', defaultValue: '')
  String get comboDealType => throw _privateConstructorUsedError;
  @JsonKey(name: 'isComboEligible', defaultValue: false)
  bool get isComboEligible => throw _privateConstructorUsedError;
  @JsonKey(name: 'finalIndividualPrice', defaultValue: 0.0)
  double get finalIndividualPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialNumber', defaultValue: 'EN')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxM1', defaultValue: '')
  String get taxM1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
  double get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFOCMaterial', defaultValue: false)
  bool get isFOCMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxClassification', defaultValue: '')
  String get taxClassification => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComboMaterialItemDtoCopyWith<ComboMaterialItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboMaterialItemDtoCopyWith<$Res> {
  factory $ComboMaterialItemDtoCopyWith(ComboMaterialItemDto value,
          $Res Function(ComboMaterialItemDto) then) =
      _$ComboMaterialItemDtoCopyWithImpl<$Res, ComboMaterialItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'productID', defaultValue: '') String productId,
      @JsonKey(name: 'parentID', defaultValue: '') String parentId,
      @JsonKey(name: 'setNo', defaultValue: '') String setNo,
      @JsonKey(name: 'quantity', defaultValue: 0) int quantity,
      @JsonKey(name: 'ttemSource', defaultValue: 'EZRX') String itemSource,
      @JsonKey(name: 'rate', defaultValue: 0) double rate,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      String conditionNumber,
      @JsonKey(name: 'mandatory', defaultValue: false) bool mandatory,
      @JsonKey(name: 'suffix', defaultValue: '') String suffix,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'listPrice', defaultValue: 0.0) double listPrice,
      @JsonKey(name: 'ttemCheck', defaultValue: false) bool itemCheck,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'valid', defaultValue: false) bool valid,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'comboDealType', defaultValue: '') String comboDealType,
      @JsonKey(name: 'isComboEligible', defaultValue: false)
      bool isComboEligible,
      @JsonKey(name: 'finalIndividualPrice', defaultValue: 0.0)
      double finalIndividualPrice,
      @JsonKey(name: 'materialNumber', defaultValue: 'EN')
      String materialNumber,
      @JsonKey(name: 'taxM1', defaultValue: '') String taxM1,
      @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
      double tax,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false) bool isFOCMaterial,
      @JsonKey(name: 'hidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      String taxClassification});
}

/// @nodoc
class _$ComboMaterialItemDtoCopyWithImpl<$Res,
        $Val extends ComboMaterialItemDto>
    implements $ComboMaterialItemDtoCopyWith<$Res> {
  _$ComboMaterialItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? parentId = null,
    Object? setNo = null,
    Object? quantity = null,
    Object? itemSource = null,
    Object? rate = null,
    Object? conditionNumber = null,
    Object? mandatory = null,
    Object? suffix = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
    Object? principalName = null,
    Object? listPrice = null,
    Object? itemCheck = null,
    Object? principalCode = null,
    Object? valid = null,
    Object? type = null,
    Object? comboDealType = null,
    Object? isComboEligible = null,
    Object? finalIndividualPrice = null,
    Object? materialNumber = null,
    Object? taxM1 = null,
    Object? tax = null,
    Object? isFOCMaterial = null,
    Object? hidePrice = null,
    Object? taxClassification = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      setNo: null == setNo
          ? _value.setNo
          : setNo // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      itemSource: null == itemSource
          ? _value.itemSource
          : itemSource // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      mandatory: null == mandatory
          ? _value.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      suffix: null == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      listPrice: null == listPrice
          ? _value.listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as double,
      itemCheck: null == itemCheck
          ? _value.itemCheck
          : itemCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      comboDealType: null == comboDealType
          ? _value.comboDealType
          : comboDealType // ignore: cast_nullable_to_non_nullable
              as String,
      isComboEligible: null == isComboEligible
          ? _value.isComboEligible
          : isComboEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      finalIndividualPrice: null == finalIndividualPrice
          ? _value.finalIndividualPrice
          : finalIndividualPrice // ignore: cast_nullable_to_non_nullable
              as double,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      taxM1: null == taxM1
          ? _value.taxM1
          : taxM1 // ignore: cast_nullable_to_non_nullable
              as String,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      isFOCMaterial: null == isFOCMaterial
          ? _value.isFOCMaterial
          : isFOCMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      taxClassification: null == taxClassification
          ? _value.taxClassification
          : taxClassification // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComboMaterialItemDtoImplCopyWith<$Res>
    implements $ComboMaterialItemDtoCopyWith<$Res> {
  factory _$$ComboMaterialItemDtoImplCopyWith(_$ComboMaterialItemDtoImpl value,
          $Res Function(_$ComboMaterialItemDtoImpl) then) =
      __$$ComboMaterialItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'productID', defaultValue: '') String productId,
      @JsonKey(name: 'parentID', defaultValue: '') String parentId,
      @JsonKey(name: 'setNo', defaultValue: '') String setNo,
      @JsonKey(name: 'quantity', defaultValue: 0) int quantity,
      @JsonKey(name: 'ttemSource', defaultValue: 'EZRX') String itemSource,
      @JsonKey(name: 'rate', defaultValue: 0) double rate,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      String conditionNumber,
      @JsonKey(name: 'mandatory', defaultValue: false) bool mandatory,
      @JsonKey(name: 'suffix', defaultValue: '') String suffix,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'listPrice', defaultValue: 0.0) double listPrice,
      @JsonKey(name: 'ttemCheck', defaultValue: false) bool itemCheck,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'valid', defaultValue: false) bool valid,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'comboDealType', defaultValue: '') String comboDealType,
      @JsonKey(name: 'isComboEligible', defaultValue: false)
      bool isComboEligible,
      @JsonKey(name: 'finalIndividualPrice', defaultValue: 0.0)
      double finalIndividualPrice,
      @JsonKey(name: 'materialNumber', defaultValue: 'EN')
      String materialNumber,
      @JsonKey(name: 'taxM1', defaultValue: '') String taxM1,
      @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
      double tax,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false) bool isFOCMaterial,
      @JsonKey(name: 'hidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      String taxClassification});
}

/// @nodoc
class __$$ComboMaterialItemDtoImplCopyWithImpl<$Res>
    extends _$ComboMaterialItemDtoCopyWithImpl<$Res, _$ComboMaterialItemDtoImpl>
    implements _$$ComboMaterialItemDtoImplCopyWith<$Res> {
  __$$ComboMaterialItemDtoImplCopyWithImpl(_$ComboMaterialItemDtoImpl _value,
      $Res Function(_$ComboMaterialItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? parentId = null,
    Object? setNo = null,
    Object? quantity = null,
    Object? itemSource = null,
    Object? rate = null,
    Object? conditionNumber = null,
    Object? mandatory = null,
    Object? suffix = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
    Object? principalName = null,
    Object? listPrice = null,
    Object? itemCheck = null,
    Object? principalCode = null,
    Object? valid = null,
    Object? type = null,
    Object? comboDealType = null,
    Object? isComboEligible = null,
    Object? finalIndividualPrice = null,
    Object? materialNumber = null,
    Object? taxM1 = null,
    Object? tax = null,
    Object? isFOCMaterial = null,
    Object? hidePrice = null,
    Object? taxClassification = null,
  }) {
    return _then(_$ComboMaterialItemDtoImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      setNo: null == setNo
          ? _value.setNo
          : setNo // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      itemSource: null == itemSource
          ? _value.itemSource
          : itemSource // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      mandatory: null == mandatory
          ? _value.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      suffix: null == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      listPrice: null == listPrice
          ? _value.listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as double,
      itemCheck: null == itemCheck
          ? _value.itemCheck
          : itemCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      comboDealType: null == comboDealType
          ? _value.comboDealType
          : comboDealType // ignore: cast_nullable_to_non_nullable
              as String,
      isComboEligible: null == isComboEligible
          ? _value.isComboEligible
          : isComboEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      finalIndividualPrice: null == finalIndividualPrice
          ? _value.finalIndividualPrice
          : finalIndividualPrice // ignore: cast_nullable_to_non_nullable
              as double,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      taxM1: null == taxM1
          ? _value.taxM1
          : taxM1 // ignore: cast_nullable_to_non_nullable
              as String,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      isFOCMaterial: null == isFOCMaterial
          ? _value.isFOCMaterial
          : isFOCMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      taxClassification: null == taxClassification
          ? _value.taxClassification
          : taxClassification // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComboMaterialItemDtoImpl extends _ComboMaterialItemDto {
  const _$ComboMaterialItemDtoImpl(
      {@JsonKey(name: 'productID', defaultValue: '') required this.productId,
      @JsonKey(name: 'parentID', defaultValue: '') required this.parentId,
      @JsonKey(name: 'setNo', defaultValue: '') required this.setNo,
      @JsonKey(name: 'quantity', defaultValue: 0) required this.quantity,
      @JsonKey(name: 'ttemSource', defaultValue: 'EZRX')
      required this.itemSource,
      @JsonKey(name: 'rate', defaultValue: 0) required this.rate,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      required this.conditionNumber,
      @JsonKey(name: 'mandatory', defaultValue: false) required this.mandatory,
      @JsonKey(name: 'suffix', defaultValue: '') required this.suffix,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      required this.materialDescription,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      required this.defaultMaterialDescription,
      @JsonKey(name: 'principalName', defaultValue: '')
      required this.principalName,
      @JsonKey(name: 'listPrice', defaultValue: 0.0) required this.listPrice,
      @JsonKey(name: 'ttemCheck', defaultValue: false) required this.itemCheck,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required this.principalCode,
      @JsonKey(name: 'valid', defaultValue: false) required this.valid,
      @JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'comboDealType', defaultValue: '')
      required this.comboDealType,
      @JsonKey(name: 'isComboEligible', defaultValue: false)
      required this.isComboEligible,
      @JsonKey(name: 'finalIndividualPrice', defaultValue: 0.0)
      required this.finalIndividualPrice,
      @JsonKey(name: 'materialNumber', defaultValue: 'EN')
      required this.materialNumber,
      @JsonKey(name: 'taxM1', defaultValue: '') required this.taxM1,
      @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
      required this.tax,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false)
      required this.isFOCMaterial,
      @JsonKey(name: 'hidePrice', defaultValue: false) required this.hidePrice,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      required this.taxClassification})
      : super._();

  factory _$ComboMaterialItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComboMaterialItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'productID', defaultValue: '')
  final String productId;
  @override
  @JsonKey(name: 'parentID', defaultValue: '')
  final String parentId;
  @override
  @JsonKey(name: 'setNo', defaultValue: '')
  final String setNo;
  @override
  @JsonKey(name: 'quantity', defaultValue: 0)
  final int quantity;
  @override
  @JsonKey(name: 'ttemSource', defaultValue: 'EZRX')
  final String itemSource;
  @override
  @JsonKey(name: 'rate', defaultValue: 0)
  final double rate;
  @override
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  final String conditionNumber;
  @override
  @JsonKey(name: 'mandatory', defaultValue: false)
  final bool mandatory;
  @override
  @JsonKey(name: 'suffix', defaultValue: '')
  final String suffix;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  final String defaultMaterialDescription;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  final String principalName;
  @override
  @JsonKey(name: 'listPrice', defaultValue: 0.0)
  final double listPrice;
  @override
  @JsonKey(name: 'ttemCheck', defaultValue: false)
  final bool itemCheck;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  final String principalCode;
  @override
  @JsonKey(name: 'valid', defaultValue: false)
  final bool valid;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'comboDealType', defaultValue: '')
  final String comboDealType;
  @override
  @JsonKey(name: 'isComboEligible', defaultValue: false)
  final bool isComboEligible;
  @override
  @JsonKey(name: 'finalIndividualPrice', defaultValue: 0.0)
  final double finalIndividualPrice;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: 'EN')
  final String materialNumber;
  @override
  @JsonKey(name: 'taxM1', defaultValue: '')
  final String taxM1;
  @override
  @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
  final double tax;
  @override
  @JsonKey(name: 'isFOCMaterial', defaultValue: false)
  final bool isFOCMaterial;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  final bool hidePrice;
  @override
  @JsonKey(name: 'taxClassification', defaultValue: '')
  final String taxClassification;

  @override
  String toString() {
    return 'ComboMaterialItemDto(productId: $productId, parentId: $parentId, setNo: $setNo, quantity: $quantity, itemSource: $itemSource, rate: $rate, conditionNumber: $conditionNumber, mandatory: $mandatory, suffix: $suffix, materialDescription: $materialDescription, defaultMaterialDescription: $defaultMaterialDescription, principalName: $principalName, listPrice: $listPrice, itemCheck: $itemCheck, principalCode: $principalCode, valid: $valid, type: $type, comboDealType: $comboDealType, isComboEligible: $isComboEligible, finalIndividualPrice: $finalIndividualPrice, materialNumber: $materialNumber, taxM1: $taxM1, tax: $tax, isFOCMaterial: $isFOCMaterial, hidePrice: $hidePrice, taxClassification: $taxClassification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComboMaterialItemDtoImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.setNo, setNo) || other.setNo == setNo) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.itemSource, itemSource) ||
                other.itemSource == itemSource) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.conditionNumber, conditionNumber) ||
                other.conditionNumber == conditionNumber) &&
            (identical(other.mandatory, mandatory) ||
                other.mandatory == mandatory) &&
            (identical(other.suffix, suffix) || other.suffix == suffix) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.defaultMaterialDescription,
                    defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription) &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.listPrice, listPrice) ||
                other.listPrice == listPrice) &&
            (identical(other.itemCheck, itemCheck) ||
                other.itemCheck == itemCheck) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode) &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.comboDealType, comboDealType) ||
                other.comboDealType == comboDealType) &&
            (identical(other.isComboEligible, isComboEligible) ||
                other.isComboEligible == isComboEligible) &&
            (identical(other.finalIndividualPrice, finalIndividualPrice) ||
                other.finalIndividualPrice == finalIndividualPrice) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.taxM1, taxM1) || other.taxM1 == taxM1) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.isFOCMaterial, isFOCMaterial) ||
                other.isFOCMaterial == isFOCMaterial) &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            (identical(other.taxClassification, taxClassification) ||
                other.taxClassification == taxClassification));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        productId,
        parentId,
        setNo,
        quantity,
        itemSource,
        rate,
        conditionNumber,
        mandatory,
        suffix,
        materialDescription,
        defaultMaterialDescription,
        principalName,
        listPrice,
        itemCheck,
        principalCode,
        valid,
        type,
        comboDealType,
        isComboEligible,
        finalIndividualPrice,
        materialNumber,
        taxM1,
        tax,
        isFOCMaterial,
        hidePrice,
        taxClassification
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComboMaterialItemDtoImplCopyWith<_$ComboMaterialItemDtoImpl>
      get copyWith =>
          __$$ComboMaterialItemDtoImplCopyWithImpl<_$ComboMaterialItemDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComboMaterialItemDtoImplToJson(
      this,
    );
  }
}

abstract class _ComboMaterialItemDto extends ComboMaterialItemDto {
  const factory _ComboMaterialItemDto(
      {@JsonKey(name: 'productID', defaultValue: '')
      required final String productId,
      @JsonKey(name: 'parentID', defaultValue: '')
      required final String parentId,
      @JsonKey(name: 'setNo', defaultValue: '') required final String setNo,
      @JsonKey(name: 'quantity', defaultValue: 0) required final int quantity,
      @JsonKey(name: 'ttemSource', defaultValue: 'EZRX')
      required final String itemSource,
      @JsonKey(name: 'rate', defaultValue: 0) required final double rate,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      required final String conditionNumber,
      @JsonKey(name: 'mandatory', defaultValue: false)
      required final bool mandatory,
      @JsonKey(name: 'suffix', defaultValue: '') required final String suffix,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      required final String materialDescription,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      required final String defaultMaterialDescription,
      @JsonKey(name: 'principalName', defaultValue: '')
      required final String principalName,
      @JsonKey(name: 'listPrice', defaultValue: 0.0)
      required final double listPrice,
      @JsonKey(name: 'ttemCheck', defaultValue: false)
      required final bool itemCheck,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required final String principalCode,
      @JsonKey(name: 'valid', defaultValue: false) required final bool valid,
      @JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'comboDealType', defaultValue: '')
      required final String comboDealType,
      @JsonKey(name: 'isComboEligible', defaultValue: false)
      required final bool isComboEligible,
      @JsonKey(name: 'finalIndividualPrice', defaultValue: 0.0)
      required final double finalIndividualPrice,
      @JsonKey(name: 'materialNumber', defaultValue: 'EN')
      required final String materialNumber,
      @JsonKey(name: 'taxM1', defaultValue: '') required final String taxM1,
      @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
      required final double tax,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false)
      required final bool isFOCMaterial,
      @JsonKey(name: 'hidePrice', defaultValue: false)
      required final bool hidePrice,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      required final String taxClassification}) = _$ComboMaterialItemDtoImpl;
  const _ComboMaterialItemDto._() : super._();

  factory _ComboMaterialItemDto.fromJson(Map<String, dynamic> json) =
      _$ComboMaterialItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'productID', defaultValue: '')
  String get productId;
  @override
  @JsonKey(name: 'parentID', defaultValue: '')
  String get parentId;
  @override
  @JsonKey(name: 'setNo', defaultValue: '')
  String get setNo;
  @override
  @JsonKey(name: 'quantity', defaultValue: 0)
  int get quantity;
  @override
  @JsonKey(name: 'ttemSource', defaultValue: 'EZRX')
  String get itemSource;
  @override
  @JsonKey(name: 'rate', defaultValue: 0)
  double get rate;
  @override
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  String get conditionNumber;
  @override
  @JsonKey(name: 'mandatory', defaultValue: false)
  bool get mandatory;
  @override
  @JsonKey(name: 'suffix', defaultValue: '')
  String get suffix;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName;
  @override
  @JsonKey(name: 'listPrice', defaultValue: 0.0)
  double get listPrice;
  @override
  @JsonKey(name: 'ttemCheck', defaultValue: false)
  bool get itemCheck;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode;
  @override
  @JsonKey(name: 'valid', defaultValue: false)
  bool get valid;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'comboDealType', defaultValue: '')
  String get comboDealType;
  @override
  @JsonKey(name: 'isComboEligible', defaultValue: false)
  bool get isComboEligible;
  @override
  @JsonKey(name: 'finalIndividualPrice', defaultValue: 0.0)
  double get finalIndividualPrice;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: 'EN')
  String get materialNumber;
  @override
  @JsonKey(name: 'taxM1', defaultValue: '')
  String get taxM1;
  @override
  @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
  double get tax;
  @override
  @JsonKey(name: 'isFOCMaterial', defaultValue: false)
  bool get isFOCMaterial;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice;
  @override
  @JsonKey(name: 'taxClassification', defaultValue: '')
  String get taxClassification;
  @override
  @JsonKey(ignore: true)
  _$$ComboMaterialItemDtoImplCopyWith<_$ComboMaterialItemDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
