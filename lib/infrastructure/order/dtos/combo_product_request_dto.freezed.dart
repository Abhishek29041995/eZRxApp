// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo_product_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ComboProductRequestDto _$ComboProductRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _ComboProductRequestDto.fromJson(json);
}

/// @nodoc
mixin _$ComboProductRequestDto {
  @JsonKey(name: 'ProductID', defaultValue: '')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentID', defaultValue: '')
  String get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SetNo', defaultValue: '')
  String get setNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity', defaultValue: 0)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'ItemSource', defaultValue: 'EZRX')
  String get itemSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerCode', defaultValue: '')
  String get customerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShipToID', defaultValue: '')
  String get shipToId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SalesOrg', defaultValue: '')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'MinQty', defaultValue: 0)
  int get minQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rate', defaultValue: 0)
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ConditionNumber', defaultValue: '')
  String get conditionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mandatory', defaultValue: false)
  bool get mandatory => throw _privateConstructorUsedError;
  @JsonKey(name: 'Suffix', defaultValue: '')
  String get suffix => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrincipleName', defaultValue: '')
  String get principleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ListPrice', defaultValue: 0.0)
  double get listPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'ItemCheck', defaultValue: false)
  bool get itemCheck => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrincipalCode', defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Valid', defaultValue: false)
  bool get valid => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'ComboDealType', defaultValue: '')
  String get comboDealType => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsComboEligible', defaultValue: false)
  bool get isComboEligible => throw _privateConstructorUsedError;
  @JsonKey(name: 'ComboDeals')
  PriceComboDealRequestDto get comboDeal => throw _privateConstructorUsedError;
  @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0.0)
  double get finalIndividualPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComboProductRequestDtoCopyWith<ComboProductRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboProductRequestDtoCopyWith<$Res> {
  factory $ComboProductRequestDtoCopyWith(ComboProductRequestDto value,
          $Res Function(ComboProductRequestDto) then) =
      _$ComboProductRequestDtoCopyWithImpl<$Res, ComboProductRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductID', defaultValue: '') String productId,
      @JsonKey(name: 'ParentID', defaultValue: '') String parentId,
      @JsonKey(name: 'SetNo', defaultValue: '') String setNo,
      @JsonKey(name: 'Quantity', defaultValue: 0) int quantity,
      @JsonKey(name: 'ItemSource', defaultValue: 'EZRX') String itemSource,
      @JsonKey(name: 'CustomerCode', defaultValue: '') String customerCode,
      @JsonKey(name: 'ShipToID', defaultValue: '') String shipToId,
      @JsonKey(name: 'SalesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'MinQty', defaultValue: 0) int minQty,
      @JsonKey(name: 'Rate', defaultValue: 0) double rate,
      @JsonKey(name: 'ConditionNumber', defaultValue: '')
      String conditionNumber,
      @JsonKey(name: 'Mandatory', defaultValue: false) bool mandatory,
      @JsonKey(name: 'Suffix', defaultValue: '') String suffix,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'PrincipleName', defaultValue: '') String principleName,
      @JsonKey(name: 'ListPrice', defaultValue: 0.0) double listPrice,
      @JsonKey(name: 'ItemCheck', defaultValue: false) bool itemCheck,
      @JsonKey(name: 'PrincipalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'Valid', defaultValue: false) bool valid,
      @JsonKey(name: 'Type', defaultValue: '') String type,
      @JsonKey(name: 'ComboDealType', defaultValue: '') String comboDealType,
      @JsonKey(name: 'IsComboEligible', defaultValue: false)
      bool isComboEligible,
      @JsonKey(name: 'ComboDeals') PriceComboDealRequestDto comboDeal,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0.0)
      double finalIndividualPrice});

  $PriceComboDealRequestDtoCopyWith<$Res> get comboDeal;
}

/// @nodoc
class _$ComboProductRequestDtoCopyWithImpl<$Res,
        $Val extends ComboProductRequestDto>
    implements $ComboProductRequestDtoCopyWith<$Res> {
  _$ComboProductRequestDtoCopyWithImpl(this._value, this._then);

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
    Object? customerCode = null,
    Object? shipToId = null,
    Object? salesOrg = null,
    Object? minQty = null,
    Object? rate = null,
    Object? conditionNumber = null,
    Object? mandatory = null,
    Object? suffix = null,
    Object? materialDescription = null,
    Object? principleName = null,
    Object? listPrice = null,
    Object? itemCheck = null,
    Object? principalCode = null,
    Object? valid = null,
    Object? type = null,
    Object? comboDealType = null,
    Object? isComboEligible = null,
    Object? comboDeal = null,
    Object? finalIndividualPrice = null,
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
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      shipToId: null == shipToId
          ? _value.shipToId
          : shipToId // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
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
      principleName: null == principleName
          ? _value.principleName
          : principleName // ignore: cast_nullable_to_non_nullable
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
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as PriceComboDealRequestDto,
      finalIndividualPrice: null == finalIndividualPrice
          ? _value.finalIndividualPrice
          : finalIndividualPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceComboDealRequestDtoCopyWith<$Res> get comboDeal {
    return $PriceComboDealRequestDtoCopyWith<$Res>(_value.comboDeal, (value) {
      return _then(_value.copyWith(comboDeal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ComboProductRequestDtoImplCopyWith<$Res>
    implements $ComboProductRequestDtoCopyWith<$Res> {
  factory _$$ComboProductRequestDtoImplCopyWith(
          _$ComboProductRequestDtoImpl value,
          $Res Function(_$ComboProductRequestDtoImpl) then) =
      __$$ComboProductRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductID', defaultValue: '') String productId,
      @JsonKey(name: 'ParentID', defaultValue: '') String parentId,
      @JsonKey(name: 'SetNo', defaultValue: '') String setNo,
      @JsonKey(name: 'Quantity', defaultValue: 0) int quantity,
      @JsonKey(name: 'ItemSource', defaultValue: 'EZRX') String itemSource,
      @JsonKey(name: 'CustomerCode', defaultValue: '') String customerCode,
      @JsonKey(name: 'ShipToID', defaultValue: '') String shipToId,
      @JsonKey(name: 'SalesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'MinQty', defaultValue: 0) int minQty,
      @JsonKey(name: 'Rate', defaultValue: 0) double rate,
      @JsonKey(name: 'ConditionNumber', defaultValue: '')
      String conditionNumber,
      @JsonKey(name: 'Mandatory', defaultValue: false) bool mandatory,
      @JsonKey(name: 'Suffix', defaultValue: '') String suffix,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'PrincipleName', defaultValue: '') String principleName,
      @JsonKey(name: 'ListPrice', defaultValue: 0.0) double listPrice,
      @JsonKey(name: 'ItemCheck', defaultValue: false) bool itemCheck,
      @JsonKey(name: 'PrincipalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'Valid', defaultValue: false) bool valid,
      @JsonKey(name: 'Type', defaultValue: '') String type,
      @JsonKey(name: 'ComboDealType', defaultValue: '') String comboDealType,
      @JsonKey(name: 'IsComboEligible', defaultValue: false)
      bool isComboEligible,
      @JsonKey(name: 'ComboDeals') PriceComboDealRequestDto comboDeal,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0.0)
      double finalIndividualPrice});

  @override
  $PriceComboDealRequestDtoCopyWith<$Res> get comboDeal;
}

/// @nodoc
class __$$ComboProductRequestDtoImplCopyWithImpl<$Res>
    extends _$ComboProductRequestDtoCopyWithImpl<$Res,
        _$ComboProductRequestDtoImpl>
    implements _$$ComboProductRequestDtoImplCopyWith<$Res> {
  __$$ComboProductRequestDtoImplCopyWithImpl(
      _$ComboProductRequestDtoImpl _value,
      $Res Function(_$ComboProductRequestDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? parentId = null,
    Object? setNo = null,
    Object? quantity = null,
    Object? itemSource = null,
    Object? customerCode = null,
    Object? shipToId = null,
    Object? salesOrg = null,
    Object? minQty = null,
    Object? rate = null,
    Object? conditionNumber = null,
    Object? mandatory = null,
    Object? suffix = null,
    Object? materialDescription = null,
    Object? principleName = null,
    Object? listPrice = null,
    Object? itemCheck = null,
    Object? principalCode = null,
    Object? valid = null,
    Object? type = null,
    Object? comboDealType = null,
    Object? isComboEligible = null,
    Object? comboDeal = null,
    Object? finalIndividualPrice = null,
  }) {
    return _then(_$ComboProductRequestDtoImpl(
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
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      shipToId: null == shipToId
          ? _value.shipToId
          : shipToId // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
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
      principleName: null == principleName
          ? _value.principleName
          : principleName // ignore: cast_nullable_to_non_nullable
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
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as PriceComboDealRequestDto,
      finalIndividualPrice: null == finalIndividualPrice
          ? _value.finalIndividualPrice
          : finalIndividualPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComboProductRequestDtoImpl extends _ComboProductRequestDto {
  const _$ComboProductRequestDtoImpl(
      {@JsonKey(name: 'ProductID', defaultValue: '') required this.productId,
      @JsonKey(name: 'ParentID', defaultValue: '') required this.parentId,
      @JsonKey(name: 'SetNo', defaultValue: '') required this.setNo,
      @JsonKey(name: 'Quantity', defaultValue: 0) required this.quantity,
      @JsonKey(name: 'ItemSource', defaultValue: 'EZRX')
      required this.itemSource,
      @JsonKey(name: 'CustomerCode', defaultValue: '')
      required this.customerCode,
      @JsonKey(name: 'ShipToID', defaultValue: '') required this.shipToId,
      @JsonKey(name: 'SalesOrg', defaultValue: '') required this.salesOrg,
      @JsonKey(name: 'MinQty', defaultValue: 0) required this.minQty,
      @JsonKey(name: 'Rate', defaultValue: 0) required this.rate,
      @JsonKey(name: 'ConditionNumber', defaultValue: '')
      required this.conditionNumber,
      @JsonKey(name: 'Mandatory', defaultValue: false) required this.mandatory,
      @JsonKey(name: 'Suffix', defaultValue: '') required this.suffix,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      required this.materialDescription,
      @JsonKey(name: 'PrincipleName', defaultValue: '')
      required this.principleName,
      @JsonKey(name: 'ListPrice', defaultValue: 0.0) required this.listPrice,
      @JsonKey(name: 'ItemCheck', defaultValue: false) required this.itemCheck,
      @JsonKey(name: 'PrincipalCode', defaultValue: '')
      required this.principalCode,
      @JsonKey(name: 'Valid', defaultValue: false) required this.valid,
      @JsonKey(name: 'Type', defaultValue: '') required this.type,
      @JsonKey(name: 'ComboDealType', defaultValue: '')
      required this.comboDealType,
      @JsonKey(name: 'IsComboEligible', defaultValue: false)
      required this.isComboEligible,
      @JsonKey(name: 'ComboDeals')
      this.comboDeal = PriceComboDealRequestDto.empty,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0.0)
      required this.finalIndividualPrice})
      : super._();

  factory _$ComboProductRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComboProductRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'ProductID', defaultValue: '')
  final String productId;
  @override
  @JsonKey(name: 'ParentID', defaultValue: '')
  final String parentId;
  @override
  @JsonKey(name: 'SetNo', defaultValue: '')
  final String setNo;
  @override
  @JsonKey(name: 'Quantity', defaultValue: 0)
  final int quantity;
  @override
  @JsonKey(name: 'ItemSource', defaultValue: 'EZRX')
  final String itemSource;
  @override
  @JsonKey(name: 'CustomerCode', defaultValue: '')
  final String customerCode;
  @override
  @JsonKey(name: 'ShipToID', defaultValue: '')
  final String shipToId;
  @override
  @JsonKey(name: 'SalesOrg', defaultValue: '')
  final String salesOrg;
  @override
  @JsonKey(name: 'MinQty', defaultValue: 0)
  final int minQty;
  @override
  @JsonKey(name: 'Rate', defaultValue: 0)
  final double rate;
  @override
  @JsonKey(name: 'ConditionNumber', defaultValue: '')
  final String conditionNumber;
  @override
  @JsonKey(name: 'Mandatory', defaultValue: false)
  final bool mandatory;
  @override
  @JsonKey(name: 'Suffix', defaultValue: '')
  final String suffix;
  @override
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'PrincipleName', defaultValue: '')
  final String principleName;
  @override
  @JsonKey(name: 'ListPrice', defaultValue: 0.0)
  final double listPrice;
  @override
  @JsonKey(name: 'ItemCheck', defaultValue: false)
  final bool itemCheck;
  @override
  @JsonKey(name: 'PrincipalCode', defaultValue: '')
  final String principalCode;
  @override
  @JsonKey(name: 'Valid', defaultValue: false)
  final bool valid;
  @override
  @JsonKey(name: 'Type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'ComboDealType', defaultValue: '')
  final String comboDealType;
  @override
  @JsonKey(name: 'IsComboEligible', defaultValue: false)
  final bool isComboEligible;
  @override
  @JsonKey(name: 'ComboDeals')
  final PriceComboDealRequestDto comboDeal;
  @override
  @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0.0)
  final double finalIndividualPrice;

  @override
  String toString() {
    return 'ComboProductRequestDto(productId: $productId, parentId: $parentId, setNo: $setNo, quantity: $quantity, itemSource: $itemSource, customerCode: $customerCode, shipToId: $shipToId, salesOrg: $salesOrg, minQty: $minQty, rate: $rate, conditionNumber: $conditionNumber, mandatory: $mandatory, suffix: $suffix, materialDescription: $materialDescription, principleName: $principleName, listPrice: $listPrice, itemCheck: $itemCheck, principalCode: $principalCode, valid: $valid, type: $type, comboDealType: $comboDealType, isComboEligible: $isComboEligible, comboDeal: $comboDeal, finalIndividualPrice: $finalIndividualPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComboProductRequestDtoImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.setNo, setNo) || other.setNo == setNo) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.itemSource, itemSource) ||
                other.itemSource == itemSource) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.shipToId, shipToId) ||
                other.shipToId == shipToId) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.minQty, minQty) || other.minQty == minQty) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.conditionNumber, conditionNumber) ||
                other.conditionNumber == conditionNumber) &&
            (identical(other.mandatory, mandatory) ||
                other.mandatory == mandatory) &&
            (identical(other.suffix, suffix) || other.suffix == suffix) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.principleName, principleName) ||
                other.principleName == principleName) &&
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
            (identical(other.comboDeal, comboDeal) ||
                other.comboDeal == comboDeal) &&
            (identical(other.finalIndividualPrice, finalIndividualPrice) ||
                other.finalIndividualPrice == finalIndividualPrice));
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
        customerCode,
        shipToId,
        salesOrg,
        minQty,
        rate,
        conditionNumber,
        mandatory,
        suffix,
        materialDescription,
        principleName,
        listPrice,
        itemCheck,
        principalCode,
        valid,
        type,
        comboDealType,
        isComboEligible,
        comboDeal,
        finalIndividualPrice
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComboProductRequestDtoImplCopyWith<_$ComboProductRequestDtoImpl>
      get copyWith => __$$ComboProductRequestDtoImplCopyWithImpl<
          _$ComboProductRequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComboProductRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _ComboProductRequestDto extends ComboProductRequestDto {
  const factory _ComboProductRequestDto(
      {@JsonKey(name: 'ProductID', defaultValue: '')
      required final String productId,
      @JsonKey(name: 'ParentID', defaultValue: '')
      required final String parentId,
      @JsonKey(name: 'SetNo', defaultValue: '') required final String setNo,
      @JsonKey(name: 'Quantity', defaultValue: 0) required final int quantity,
      @JsonKey(name: 'ItemSource', defaultValue: 'EZRX')
      required final String itemSource,
      @JsonKey(name: 'CustomerCode', defaultValue: '')
      required final String customerCode,
      @JsonKey(name: 'ShipToID', defaultValue: '')
      required final String shipToId,
      @JsonKey(name: 'SalesOrg', defaultValue: '')
      required final String salesOrg,
      @JsonKey(name: 'MinQty', defaultValue: 0) required final int minQty,
      @JsonKey(name: 'Rate', defaultValue: 0) required final double rate,
      @JsonKey(name: 'ConditionNumber', defaultValue: '')
      required final String conditionNumber,
      @JsonKey(name: 'Mandatory', defaultValue: false)
      required final bool mandatory,
      @JsonKey(name: 'Suffix', defaultValue: '') required final String suffix,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      required final String materialDescription,
      @JsonKey(name: 'PrincipleName', defaultValue: '')
      required final String principleName,
      @JsonKey(name: 'ListPrice', defaultValue: 0.0)
      required final double listPrice,
      @JsonKey(name: 'ItemCheck', defaultValue: false)
      required final bool itemCheck,
      @JsonKey(name: 'PrincipalCode', defaultValue: '')
      required final String principalCode,
      @JsonKey(name: 'Valid', defaultValue: false) required final bool valid,
      @JsonKey(name: 'Type', defaultValue: '') required final String type,
      @JsonKey(name: 'ComboDealType', defaultValue: '')
      required final String comboDealType,
      @JsonKey(name: 'IsComboEligible', defaultValue: false)
      required final bool isComboEligible,
      @JsonKey(name: 'ComboDeals') final PriceComboDealRequestDto comboDeal,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0.0)
      required final double
          finalIndividualPrice}) = _$ComboProductRequestDtoImpl;
  const _ComboProductRequestDto._() : super._();

  factory _ComboProductRequestDto.fromJson(Map<String, dynamic> json) =
      _$ComboProductRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'ProductID', defaultValue: '')
  String get productId;
  @override
  @JsonKey(name: 'ParentID', defaultValue: '')
  String get parentId;
  @override
  @JsonKey(name: 'SetNo', defaultValue: '')
  String get setNo;
  @override
  @JsonKey(name: 'Quantity', defaultValue: 0)
  int get quantity;
  @override
  @JsonKey(name: 'ItemSource', defaultValue: 'EZRX')
  String get itemSource;
  @override
  @JsonKey(name: 'CustomerCode', defaultValue: '')
  String get customerCode;
  @override
  @JsonKey(name: 'ShipToID', defaultValue: '')
  String get shipToId;
  @override
  @JsonKey(name: 'SalesOrg', defaultValue: '')
  String get salesOrg;
  @override
  @JsonKey(name: 'MinQty', defaultValue: 0)
  int get minQty;
  @override
  @JsonKey(name: 'Rate', defaultValue: 0)
  double get rate;
  @override
  @JsonKey(name: 'ConditionNumber', defaultValue: '')
  String get conditionNumber;
  @override
  @JsonKey(name: 'Mandatory', defaultValue: false)
  bool get mandatory;
  @override
  @JsonKey(name: 'Suffix', defaultValue: '')
  String get suffix;
  @override
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'PrincipleName', defaultValue: '')
  String get principleName;
  @override
  @JsonKey(name: 'ListPrice', defaultValue: 0.0)
  double get listPrice;
  @override
  @JsonKey(name: 'ItemCheck', defaultValue: false)
  bool get itemCheck;
  @override
  @JsonKey(name: 'PrincipalCode', defaultValue: '')
  String get principalCode;
  @override
  @JsonKey(name: 'Valid', defaultValue: false)
  bool get valid;
  @override
  @JsonKey(name: 'Type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'ComboDealType', defaultValue: '')
  String get comboDealType;
  @override
  @JsonKey(name: 'IsComboEligible', defaultValue: false)
  bool get isComboEligible;
  @override
  @JsonKey(name: 'ComboDeals')
  PriceComboDealRequestDto get comboDeal;
  @override
  @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0.0)
  double get finalIndividualPrice;
  @override
  @JsonKey(ignore: true)
  _$$ComboProductRequestDtoImplCopyWith<_$ComboProductRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
