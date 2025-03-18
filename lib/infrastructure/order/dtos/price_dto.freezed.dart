// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PriceDto _$PriceDtoFromJson(Map<String, dynamic> json) {
  return _PriceDto.fromJson(json);
}

/// @nodoc
mixin _$PriceDto {
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'oldMaterialCode', defaultValue: '')
  String get oldMaterialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'listPrice', defaultValue: 0)
  double get listPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'finalIndividualPrice', defaultValue: 0)
  double get finalIndividualPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'finalTotalPrice', defaultValue: 0)
  double get finalTotalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountedValue', defaultValue: 0)
  double get discountedValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceRules', defaultValue: <PriceRuleDto>[])
  List<PriceRuleDto> get rules => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonuses', defaultValue: <PriceBonusDto>[])
  List<PriceBonusDto> get bonuses => throw _privateConstructorUsedError;
  @JsonKey(name: 'tieredPricing', defaultValue: <PriceTierDto>[])
  List<PriceTierDto> get tiers => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundles', defaultValue: <PriceBundleDto>[])
  List<PriceBundleDto> get bundles => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid', defaultValue: false)
  bool get isValid => throw _privateConstructorUsedError;
  @JsonKey(name: 'additionalBonusEligible', defaultValue: false)
  bool get additionalBonusEligible => throw _privateConstructorUsedError;
  @JsonKey(name: 'zMGDiscount', defaultValue: false)
  bool get zmgDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'zDP5MaxQuota', defaultValue: '')
  String get zdp5MaxQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'zDP5RemainingQuota', defaultValue: '')
  String get zdp5RemainingQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'exceedQty', defaultValue: false)
  bool get exceedQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'overridenRulePresent', defaultValue: false)
  bool get overrideRulePresent => throw _privateConstructorUsedError;
  @JsonKey(name: 'overridenRules', defaultValue: <PriceRuleDto>[])
  List<PriceRuleDto> get overridenRules => throw _privateConstructorUsedError;
  @JsonKey(name: 'overridenRuleTier', defaultValue: <OverridenRuleTierDto>[])
  List<OverridenRuleTierDto> get overridenRuleTier =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'isPriceOverride', defaultValue: false)
  bool get isPriceOverride => throw _privateConstructorUsedError;
  @JsonKey(name: 'zdp8Override', defaultValue: 0)
  double get zdp8Override => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceOverride', defaultValue: 0)
  double get priceOverride => throw _privateConstructorUsedError;
  @JsonKey(name: 'comboDeals')
  PriceComboDealDto get comboDeal => throw _privateConstructorUsedError;
  @JsonKey(name: 'isDiscountOverride', defaultValue: false)
  bool get isDiscountOverride => throw _privateConstructorUsedError;
  @JsonKey(name: 'isMOVExclusion', defaultValue: false)
  bool get isMOVExclusion => throw _privateConstructorUsedError;
  @JsonKey(name: 'conditionFlags')
  PriceConditionFlagDto get conditionFlags =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceDtoCopyWith<PriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceDtoCopyWith<$Res> {
  factory $PriceDtoCopyWith(PriceDto value, $Res Function(PriceDto) then) =
      _$PriceDtoCopyWithImpl<$Res, PriceDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'oldMaterialCode', defaultValue: '')
      String oldMaterialCode,
      @JsonKey(name: 'listPrice', defaultValue: 0) double listPrice,
      @JsonKey(name: 'finalIndividualPrice', defaultValue: 0)
      double finalIndividualPrice,
      @JsonKey(name: 'finalTotalPrice', defaultValue: 0) double finalTotalPrice,
      @JsonKey(name: 'discountedValue', defaultValue: 0) double discountedValue,
      @JsonKey(name: 'priceRules', defaultValue: <PriceRuleDto>[])
      List<PriceRuleDto> rules,
      @JsonKey(name: 'bonuses', defaultValue: <PriceBonusDto>[])
      List<PriceBonusDto> bonuses,
      @JsonKey(name: 'tieredPricing', defaultValue: <PriceTierDto>[])
      List<PriceTierDto> tiers,
      @JsonKey(name: 'bundles', defaultValue: <PriceBundleDto>[])
      List<PriceBundleDto> bundles,
      @JsonKey(name: 'valid', defaultValue: false) bool isValid,
      @JsonKey(name: 'additionalBonusEligible', defaultValue: false)
      bool additionalBonusEligible,
      @JsonKey(name: 'zMGDiscount', defaultValue: false) bool zmgDiscount,
      @JsonKey(name: 'zDP5MaxQuota', defaultValue: '') String zdp5MaxQuota,
      @JsonKey(name: 'zDP5RemainingQuota', defaultValue: '')
      String zdp5RemainingQuota,
      @JsonKey(name: 'exceedQty', defaultValue: false) bool exceedQty,
      @JsonKey(name: 'overridenRulePresent', defaultValue: false)
      bool overrideRulePresent,
      @JsonKey(name: 'overridenRules', defaultValue: <PriceRuleDto>[])
      List<PriceRuleDto> overridenRules,
      @JsonKey(
          name: 'overridenRuleTier', defaultValue: <OverridenRuleTierDto>[])
      List<OverridenRuleTierDto> overridenRuleTier,
      @JsonKey(name: 'isPriceOverride', defaultValue: false)
      bool isPriceOverride,
      @JsonKey(name: 'zdp8Override', defaultValue: 0) double zdp8Override,
      @JsonKey(name: 'priceOverride', defaultValue: 0) double priceOverride,
      @JsonKey(name: 'comboDeals') PriceComboDealDto comboDeal,
      @JsonKey(name: 'isDiscountOverride', defaultValue: false)
      bool isDiscountOverride,
      @JsonKey(name: 'isMOVExclusion', defaultValue: false) bool isMOVExclusion,
      @JsonKey(name: 'conditionFlags') PriceConditionFlagDto conditionFlags});

  $PriceComboDealDtoCopyWith<$Res> get comboDeal;
  $PriceConditionFlagDtoCopyWith<$Res> get conditionFlags;
}

/// @nodoc
class _$PriceDtoCopyWithImpl<$Res, $Val extends PriceDto>
    implements $PriceDtoCopyWith<$Res> {
  _$PriceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? oldMaterialCode = null,
    Object? listPrice = null,
    Object? finalIndividualPrice = null,
    Object? finalTotalPrice = null,
    Object? discountedValue = null,
    Object? rules = null,
    Object? bonuses = null,
    Object? tiers = null,
    Object? bundles = null,
    Object? isValid = null,
    Object? additionalBonusEligible = null,
    Object? zmgDiscount = null,
    Object? zdp5MaxQuota = null,
    Object? zdp5RemainingQuota = null,
    Object? exceedQty = null,
    Object? overrideRulePresent = null,
    Object? overridenRules = null,
    Object? overridenRuleTier = null,
    Object? isPriceOverride = null,
    Object? zdp8Override = null,
    Object? priceOverride = null,
    Object? comboDeal = null,
    Object? isDiscountOverride = null,
    Object? isMOVExclusion = null,
    Object? conditionFlags = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      oldMaterialCode: null == oldMaterialCode
          ? _value.oldMaterialCode
          : oldMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      listPrice: null == listPrice
          ? _value.listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as double,
      finalIndividualPrice: null == finalIndividualPrice
          ? _value.finalIndividualPrice
          : finalIndividualPrice // ignore: cast_nullable_to_non_nullable
              as double,
      finalTotalPrice: null == finalTotalPrice
          ? _value.finalTotalPrice
          : finalTotalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountedValue: null == discountedValue
          ? _value.discountedValue
          : discountedValue // ignore: cast_nullable_to_non_nullable
              as double,
      rules: null == rules
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<PriceRuleDto>,
      bonuses: null == bonuses
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusDto>,
      tiers: null == tiers
          ? _value.tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTierDto>,
      bundles: null == bundles
          ? _value.bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleDto>,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      additionalBonusEligible: null == additionalBonusEligible
          ? _value.additionalBonusEligible
          : additionalBonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      zmgDiscount: null == zmgDiscount
          ? _value.zmgDiscount
          : zmgDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      zdp5MaxQuota: null == zdp5MaxQuota
          ? _value.zdp5MaxQuota
          : zdp5MaxQuota // ignore: cast_nullable_to_non_nullable
              as String,
      zdp5RemainingQuota: null == zdp5RemainingQuota
          ? _value.zdp5RemainingQuota
          : zdp5RemainingQuota // ignore: cast_nullable_to_non_nullable
              as String,
      exceedQty: null == exceedQty
          ? _value.exceedQty
          : exceedQty // ignore: cast_nullable_to_non_nullable
              as bool,
      overrideRulePresent: null == overrideRulePresent
          ? _value.overrideRulePresent
          : overrideRulePresent // ignore: cast_nullable_to_non_nullable
              as bool,
      overridenRules: null == overridenRules
          ? _value.overridenRules
          : overridenRules // ignore: cast_nullable_to_non_nullable
              as List<PriceRuleDto>,
      overridenRuleTier: null == overridenRuleTier
          ? _value.overridenRuleTier
          : overridenRuleTier // ignore: cast_nullable_to_non_nullable
              as List<OverridenRuleTierDto>,
      isPriceOverride: null == isPriceOverride
          ? _value.isPriceOverride
          : isPriceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      zdp8Override: null == zdp8Override
          ? _value.zdp8Override
          : zdp8Override // ignore: cast_nullable_to_non_nullable
              as double,
      priceOverride: null == priceOverride
          ? _value.priceOverride
          : priceOverride // ignore: cast_nullable_to_non_nullable
              as double,
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as PriceComboDealDto,
      isDiscountOverride: null == isDiscountOverride
          ? _value.isDiscountOverride
          : isDiscountOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      isMOVExclusion: null == isMOVExclusion
          ? _value.isMOVExclusion
          : isMOVExclusion // ignore: cast_nullable_to_non_nullable
              as bool,
      conditionFlags: null == conditionFlags
          ? _value.conditionFlags
          : conditionFlags // ignore: cast_nullable_to_non_nullable
              as PriceConditionFlagDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceComboDealDtoCopyWith<$Res> get comboDeal {
    return $PriceComboDealDtoCopyWith<$Res>(_value.comboDeal, (value) {
      return _then(_value.copyWith(comboDeal: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceConditionFlagDtoCopyWith<$Res> get conditionFlags {
    return $PriceConditionFlagDtoCopyWith<$Res>(_value.conditionFlags, (value) {
      return _then(_value.copyWith(conditionFlags: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PriceDtoImplCopyWith<$Res>
    implements $PriceDtoCopyWith<$Res> {
  factory _$$PriceDtoImplCopyWith(
          _$PriceDtoImpl value, $Res Function(_$PriceDtoImpl) then) =
      __$$PriceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'oldMaterialCode', defaultValue: '')
      String oldMaterialCode,
      @JsonKey(name: 'listPrice', defaultValue: 0) double listPrice,
      @JsonKey(name: 'finalIndividualPrice', defaultValue: 0)
      double finalIndividualPrice,
      @JsonKey(name: 'finalTotalPrice', defaultValue: 0) double finalTotalPrice,
      @JsonKey(name: 'discountedValue', defaultValue: 0) double discountedValue,
      @JsonKey(name: 'priceRules', defaultValue: <PriceRuleDto>[])
      List<PriceRuleDto> rules,
      @JsonKey(name: 'bonuses', defaultValue: <PriceBonusDto>[])
      List<PriceBonusDto> bonuses,
      @JsonKey(name: 'tieredPricing', defaultValue: <PriceTierDto>[])
      List<PriceTierDto> tiers,
      @JsonKey(name: 'bundles', defaultValue: <PriceBundleDto>[])
      List<PriceBundleDto> bundles,
      @JsonKey(name: 'valid', defaultValue: false) bool isValid,
      @JsonKey(name: 'additionalBonusEligible', defaultValue: false)
      bool additionalBonusEligible,
      @JsonKey(name: 'zMGDiscount', defaultValue: false) bool zmgDiscount,
      @JsonKey(name: 'zDP5MaxQuota', defaultValue: '') String zdp5MaxQuota,
      @JsonKey(name: 'zDP5RemainingQuota', defaultValue: '')
      String zdp5RemainingQuota,
      @JsonKey(name: 'exceedQty', defaultValue: false) bool exceedQty,
      @JsonKey(name: 'overridenRulePresent', defaultValue: false)
      bool overrideRulePresent,
      @JsonKey(name: 'overridenRules', defaultValue: <PriceRuleDto>[])
      List<PriceRuleDto> overridenRules,
      @JsonKey(
          name: 'overridenRuleTier', defaultValue: <OverridenRuleTierDto>[])
      List<OverridenRuleTierDto> overridenRuleTier,
      @JsonKey(name: 'isPriceOverride', defaultValue: false)
      bool isPriceOverride,
      @JsonKey(name: 'zdp8Override', defaultValue: 0) double zdp8Override,
      @JsonKey(name: 'priceOverride', defaultValue: 0) double priceOverride,
      @JsonKey(name: 'comboDeals') PriceComboDealDto comboDeal,
      @JsonKey(name: 'isDiscountOverride', defaultValue: false)
      bool isDiscountOverride,
      @JsonKey(name: 'isMOVExclusion', defaultValue: false) bool isMOVExclusion,
      @JsonKey(name: 'conditionFlags') PriceConditionFlagDto conditionFlags});

  @override
  $PriceComboDealDtoCopyWith<$Res> get comboDeal;
  @override
  $PriceConditionFlagDtoCopyWith<$Res> get conditionFlags;
}

/// @nodoc
class __$$PriceDtoImplCopyWithImpl<$Res>
    extends _$PriceDtoCopyWithImpl<$Res, _$PriceDtoImpl>
    implements _$$PriceDtoImplCopyWith<$Res> {
  __$$PriceDtoImplCopyWithImpl(
      _$PriceDtoImpl _value, $Res Function(_$PriceDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? oldMaterialCode = null,
    Object? listPrice = null,
    Object? finalIndividualPrice = null,
    Object? finalTotalPrice = null,
    Object? discountedValue = null,
    Object? rules = null,
    Object? bonuses = null,
    Object? tiers = null,
    Object? bundles = null,
    Object? isValid = null,
    Object? additionalBonusEligible = null,
    Object? zmgDiscount = null,
    Object? zdp5MaxQuota = null,
    Object? zdp5RemainingQuota = null,
    Object? exceedQty = null,
    Object? overrideRulePresent = null,
    Object? overridenRules = null,
    Object? overridenRuleTier = null,
    Object? isPriceOverride = null,
    Object? zdp8Override = null,
    Object? priceOverride = null,
    Object? comboDeal = null,
    Object? isDiscountOverride = null,
    Object? isMOVExclusion = null,
    Object? conditionFlags = null,
  }) {
    return _then(_$PriceDtoImpl(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      oldMaterialCode: null == oldMaterialCode
          ? _value.oldMaterialCode
          : oldMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      listPrice: null == listPrice
          ? _value.listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as double,
      finalIndividualPrice: null == finalIndividualPrice
          ? _value.finalIndividualPrice
          : finalIndividualPrice // ignore: cast_nullable_to_non_nullable
              as double,
      finalTotalPrice: null == finalTotalPrice
          ? _value.finalTotalPrice
          : finalTotalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountedValue: null == discountedValue
          ? _value.discountedValue
          : discountedValue // ignore: cast_nullable_to_non_nullable
              as double,
      rules: null == rules
          ? _value._rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<PriceRuleDto>,
      bonuses: null == bonuses
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusDto>,
      tiers: null == tiers
          ? _value._tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTierDto>,
      bundles: null == bundles
          ? _value._bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleDto>,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      additionalBonusEligible: null == additionalBonusEligible
          ? _value.additionalBonusEligible
          : additionalBonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      zmgDiscount: null == zmgDiscount
          ? _value.zmgDiscount
          : zmgDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      zdp5MaxQuota: null == zdp5MaxQuota
          ? _value.zdp5MaxQuota
          : zdp5MaxQuota // ignore: cast_nullable_to_non_nullable
              as String,
      zdp5RemainingQuota: null == zdp5RemainingQuota
          ? _value.zdp5RemainingQuota
          : zdp5RemainingQuota // ignore: cast_nullable_to_non_nullable
              as String,
      exceedQty: null == exceedQty
          ? _value.exceedQty
          : exceedQty // ignore: cast_nullable_to_non_nullable
              as bool,
      overrideRulePresent: null == overrideRulePresent
          ? _value.overrideRulePresent
          : overrideRulePresent // ignore: cast_nullable_to_non_nullable
              as bool,
      overridenRules: null == overridenRules
          ? _value._overridenRules
          : overridenRules // ignore: cast_nullable_to_non_nullable
              as List<PriceRuleDto>,
      overridenRuleTier: null == overridenRuleTier
          ? _value._overridenRuleTier
          : overridenRuleTier // ignore: cast_nullable_to_non_nullable
              as List<OverridenRuleTierDto>,
      isPriceOverride: null == isPriceOverride
          ? _value.isPriceOverride
          : isPriceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      zdp8Override: null == zdp8Override
          ? _value.zdp8Override
          : zdp8Override // ignore: cast_nullable_to_non_nullable
              as double,
      priceOverride: null == priceOverride
          ? _value.priceOverride
          : priceOverride // ignore: cast_nullable_to_non_nullable
              as double,
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as PriceComboDealDto,
      isDiscountOverride: null == isDiscountOverride
          ? _value.isDiscountOverride
          : isDiscountOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      isMOVExclusion: null == isMOVExclusion
          ? _value.isMOVExclusion
          : isMOVExclusion // ignore: cast_nullable_to_non_nullable
              as bool,
      conditionFlags: null == conditionFlags
          ? _value.conditionFlags
          : conditionFlags // ignore: cast_nullable_to_non_nullable
              as PriceConditionFlagDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceDtoImpl extends _PriceDto {
  const _$PriceDtoImpl(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
      required this.materialNumber,
      @JsonKey(name: 'oldMaterialCode', defaultValue: '')
      required this.oldMaterialCode,
      @JsonKey(name: 'listPrice', defaultValue: 0) required this.listPrice,
      @JsonKey(name: 'finalIndividualPrice', defaultValue: 0)
      required this.finalIndividualPrice,
      @JsonKey(name: 'finalTotalPrice', defaultValue: 0)
      required this.finalTotalPrice,
      @JsonKey(name: 'discountedValue', defaultValue: 0)
      required this.discountedValue,
      @JsonKey(name: 'priceRules', defaultValue: <PriceRuleDto>[])
      required final List<PriceRuleDto> rules,
      @JsonKey(name: 'bonuses', defaultValue: <PriceBonusDto>[])
      required final List<PriceBonusDto> bonuses,
      @JsonKey(name: 'tieredPricing', defaultValue: <PriceTierDto>[])
      required final List<PriceTierDto> tiers,
      @JsonKey(name: 'bundles', defaultValue: <PriceBundleDto>[])
      required final List<PriceBundleDto> bundles,
      @JsonKey(name: 'valid', defaultValue: false) required this.isValid,
      @JsonKey(name: 'additionalBonusEligible', defaultValue: false)
      required this.additionalBonusEligible,
      @JsonKey(name: 'zMGDiscount', defaultValue: false)
      required this.zmgDiscount,
      @JsonKey(name: 'zDP5MaxQuota', defaultValue: '')
      required this.zdp5MaxQuota,
      @JsonKey(name: 'zDP5RemainingQuota', defaultValue: '')
      required this.zdp5RemainingQuota,
      @JsonKey(name: 'exceedQty', defaultValue: false) required this.exceedQty,
      @JsonKey(name: 'overridenRulePresent', defaultValue: false)
      required this.overrideRulePresent,
      @JsonKey(name: 'overridenRules', defaultValue: <PriceRuleDto>[])
      required final List<PriceRuleDto> overridenRules,
      @JsonKey(
          name: 'overridenRuleTier', defaultValue: <OverridenRuleTierDto>[])
      required final List<OverridenRuleTierDto> overridenRuleTier,
      @JsonKey(name: 'isPriceOverride', defaultValue: false)
      required this.isPriceOverride,
      @JsonKey(name: 'zdp8Override', defaultValue: 0)
      required this.zdp8Override,
      @JsonKey(name: 'priceOverride', defaultValue: 0)
      required this.priceOverride,
      @JsonKey(name: 'comboDeals') this.comboDeal = PriceComboDealDto.empty,
      @JsonKey(name: 'isDiscountOverride', defaultValue: false)
      required this.isDiscountOverride,
      @JsonKey(name: 'isMOVExclusion', defaultValue: false)
      required this.isMOVExclusion,
      @JsonKey(name: 'conditionFlags')
      this.conditionFlags = PriceConditionFlagDto.empty})
      : _rules = rules,
        _bonuses = bonuses,
        _tiers = tiers,
        _bundles = bundles,
        _overridenRules = overridenRules,
        _overridenRuleTier = overridenRuleTier,
        super._();

  factory _$PriceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceDtoImplFromJson(json);

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'oldMaterialCode', defaultValue: '')
  final String oldMaterialCode;
  @override
  @JsonKey(name: 'listPrice', defaultValue: 0)
  final double listPrice;
  @override
  @JsonKey(name: 'finalIndividualPrice', defaultValue: 0)
  final double finalIndividualPrice;
  @override
  @JsonKey(name: 'finalTotalPrice', defaultValue: 0)
  final double finalTotalPrice;
  @override
  @JsonKey(name: 'discountedValue', defaultValue: 0)
  final double discountedValue;
  final List<PriceRuleDto> _rules;
  @override
  @JsonKey(name: 'priceRules', defaultValue: <PriceRuleDto>[])
  List<PriceRuleDto> get rules {
    if (_rules is EqualUnmodifiableListView) return _rules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rules);
  }

  final List<PriceBonusDto> _bonuses;
  @override
  @JsonKey(name: 'bonuses', defaultValue: <PriceBonusDto>[])
  List<PriceBonusDto> get bonuses {
    if (_bonuses is EqualUnmodifiableListView) return _bonuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonuses);
  }

  final List<PriceTierDto> _tiers;
  @override
  @JsonKey(name: 'tieredPricing', defaultValue: <PriceTierDto>[])
  List<PriceTierDto> get tiers {
    if (_tiers is EqualUnmodifiableListView) return _tiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tiers);
  }

  final List<PriceBundleDto> _bundles;
  @override
  @JsonKey(name: 'bundles', defaultValue: <PriceBundleDto>[])
  List<PriceBundleDto> get bundles {
    if (_bundles is EqualUnmodifiableListView) return _bundles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundles);
  }

  @override
  @JsonKey(name: 'valid', defaultValue: false)
  final bool isValid;
  @override
  @JsonKey(name: 'additionalBonusEligible', defaultValue: false)
  final bool additionalBonusEligible;
  @override
  @JsonKey(name: 'zMGDiscount', defaultValue: false)
  final bool zmgDiscount;
  @override
  @JsonKey(name: 'zDP5MaxQuota', defaultValue: '')
  final String zdp5MaxQuota;
  @override
  @JsonKey(name: 'zDP5RemainingQuota', defaultValue: '')
  final String zdp5RemainingQuota;
  @override
  @JsonKey(name: 'exceedQty', defaultValue: false)
  final bool exceedQty;
  @override
  @JsonKey(name: 'overridenRulePresent', defaultValue: false)
  final bool overrideRulePresent;
  final List<PriceRuleDto> _overridenRules;
  @override
  @JsonKey(name: 'overridenRules', defaultValue: <PriceRuleDto>[])
  List<PriceRuleDto> get overridenRules {
    if (_overridenRules is EqualUnmodifiableListView) return _overridenRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_overridenRules);
  }

  final List<OverridenRuleTierDto> _overridenRuleTier;
  @override
  @JsonKey(name: 'overridenRuleTier', defaultValue: <OverridenRuleTierDto>[])
  List<OverridenRuleTierDto> get overridenRuleTier {
    if (_overridenRuleTier is EqualUnmodifiableListView)
      return _overridenRuleTier;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_overridenRuleTier);
  }

  @override
  @JsonKey(name: 'isPriceOverride', defaultValue: false)
  final bool isPriceOverride;
  @override
  @JsonKey(name: 'zdp8Override', defaultValue: 0)
  final double zdp8Override;
  @override
  @JsonKey(name: 'priceOverride', defaultValue: 0)
  final double priceOverride;
  @override
  @JsonKey(name: 'comboDeals')
  final PriceComboDealDto comboDeal;
  @override
  @JsonKey(name: 'isDiscountOverride', defaultValue: false)
  final bool isDiscountOverride;
  @override
  @JsonKey(name: 'isMOVExclusion', defaultValue: false)
  final bool isMOVExclusion;
  @override
  @JsonKey(name: 'conditionFlags')
  final PriceConditionFlagDto conditionFlags;

  @override
  String toString() {
    return 'PriceDto(materialNumber: $materialNumber, oldMaterialCode: $oldMaterialCode, listPrice: $listPrice, finalIndividualPrice: $finalIndividualPrice, finalTotalPrice: $finalTotalPrice, discountedValue: $discountedValue, rules: $rules, bonuses: $bonuses, tiers: $tiers, bundles: $bundles, isValid: $isValid, additionalBonusEligible: $additionalBonusEligible, zmgDiscount: $zmgDiscount, zdp5MaxQuota: $zdp5MaxQuota, zdp5RemainingQuota: $zdp5RemainingQuota, exceedQty: $exceedQty, overrideRulePresent: $overrideRulePresent, overridenRules: $overridenRules, overridenRuleTier: $overridenRuleTier, isPriceOverride: $isPriceOverride, zdp8Override: $zdp8Override, priceOverride: $priceOverride, comboDeal: $comboDeal, isDiscountOverride: $isDiscountOverride, isMOVExclusion: $isMOVExclusion, conditionFlags: $conditionFlags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceDtoImpl &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.oldMaterialCode, oldMaterialCode) ||
                other.oldMaterialCode == oldMaterialCode) &&
            (identical(other.listPrice, listPrice) ||
                other.listPrice == listPrice) &&
            (identical(other.finalIndividualPrice, finalIndividualPrice) ||
                other.finalIndividualPrice == finalIndividualPrice) &&
            (identical(other.finalTotalPrice, finalTotalPrice) ||
                other.finalTotalPrice == finalTotalPrice) &&
            (identical(other.discountedValue, discountedValue) ||
                other.discountedValue == discountedValue) &&
            const DeepCollectionEquality().equals(other._rules, _rules) &&
            const DeepCollectionEquality().equals(other._bonuses, _bonuses) &&
            const DeepCollectionEquality().equals(other._tiers, _tiers) &&
            const DeepCollectionEquality().equals(other._bundles, _bundles) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(
                    other.additionalBonusEligible, additionalBonusEligible) ||
                other.additionalBonusEligible == additionalBonusEligible) &&
            (identical(other.zmgDiscount, zmgDiscount) ||
                other.zmgDiscount == zmgDiscount) &&
            (identical(other.zdp5MaxQuota, zdp5MaxQuota) ||
                other.zdp5MaxQuota == zdp5MaxQuota) &&
            (identical(other.zdp5RemainingQuota, zdp5RemainingQuota) ||
                other.zdp5RemainingQuota == zdp5RemainingQuota) &&
            (identical(other.exceedQty, exceedQty) ||
                other.exceedQty == exceedQty) &&
            (identical(other.overrideRulePresent, overrideRulePresent) ||
                other.overrideRulePresent == overrideRulePresent) &&
            const DeepCollectionEquality()
                .equals(other._overridenRules, _overridenRules) &&
            const DeepCollectionEquality()
                .equals(other._overridenRuleTier, _overridenRuleTier) &&
            (identical(other.isPriceOverride, isPriceOverride) ||
                other.isPriceOverride == isPriceOverride) &&
            (identical(other.zdp8Override, zdp8Override) ||
                other.zdp8Override == zdp8Override) &&
            (identical(other.priceOverride, priceOverride) ||
                other.priceOverride == priceOverride) &&
            (identical(other.comboDeal, comboDeal) ||
                other.comboDeal == comboDeal) &&
            (identical(other.isDiscountOverride, isDiscountOverride) ||
                other.isDiscountOverride == isDiscountOverride) &&
            (identical(other.isMOVExclusion, isMOVExclusion) ||
                other.isMOVExclusion == isMOVExclusion) &&
            (identical(other.conditionFlags, conditionFlags) ||
                other.conditionFlags == conditionFlags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        materialNumber,
        oldMaterialCode,
        listPrice,
        finalIndividualPrice,
        finalTotalPrice,
        discountedValue,
        const DeepCollectionEquality().hash(_rules),
        const DeepCollectionEquality().hash(_bonuses),
        const DeepCollectionEquality().hash(_tiers),
        const DeepCollectionEquality().hash(_bundles),
        isValid,
        additionalBonusEligible,
        zmgDiscount,
        zdp5MaxQuota,
        zdp5RemainingQuota,
        exceedQty,
        overrideRulePresent,
        const DeepCollectionEquality().hash(_overridenRules),
        const DeepCollectionEquality().hash(_overridenRuleTier),
        isPriceOverride,
        zdp8Override,
        priceOverride,
        comboDeal,
        isDiscountOverride,
        isMOVExclusion,
        conditionFlags
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceDtoImplCopyWith<_$PriceDtoImpl> get copyWith =>
      __$$PriceDtoImplCopyWithImpl<_$PriceDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceDtoImplToJson(
      this,
    );
  }
}

abstract class _PriceDto extends PriceDto {
  const factory _PriceDto(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
      required final String materialNumber,
      @JsonKey(name: 'oldMaterialCode', defaultValue: '')
      required final String oldMaterialCode,
      @JsonKey(name: 'listPrice', defaultValue: 0)
      required final double listPrice,
      @JsonKey(name: 'finalIndividualPrice', defaultValue: 0)
      required final double finalIndividualPrice,
      @JsonKey(name: 'finalTotalPrice', defaultValue: 0)
      required final double finalTotalPrice,
      @JsonKey(name: 'discountedValue', defaultValue: 0)
      required final double discountedValue,
      @JsonKey(name: 'priceRules', defaultValue: <PriceRuleDto>[])
      required final List<PriceRuleDto> rules,
      @JsonKey(name: 'bonuses', defaultValue: <PriceBonusDto>[])
      required final List<PriceBonusDto> bonuses,
      @JsonKey(name: 'tieredPricing', defaultValue: <PriceTierDto>[])
      required final List<PriceTierDto> tiers,
      @JsonKey(name: 'bundles', defaultValue: <PriceBundleDto>[])
      required final List<PriceBundleDto> bundles,
      @JsonKey(name: 'valid', defaultValue: false) required final bool isValid,
      @JsonKey(name: 'additionalBonusEligible', defaultValue: false)
      required final bool additionalBonusEligible,
      @JsonKey(name: 'zMGDiscount', defaultValue: false)
      required final bool zmgDiscount,
      @JsonKey(name: 'zDP5MaxQuota', defaultValue: '')
      required final String zdp5MaxQuota,
      @JsonKey(name: 'zDP5RemainingQuota', defaultValue: '')
      required final String zdp5RemainingQuota,
      @JsonKey(name: 'exceedQty', defaultValue: false)
      required final bool exceedQty,
      @JsonKey(name: 'overridenRulePresent', defaultValue: false)
      required final bool overrideRulePresent,
      @JsonKey(name: 'overridenRules', defaultValue: <PriceRuleDto>[])
      required final List<PriceRuleDto> overridenRules,
      @JsonKey(
          name: 'overridenRuleTier', defaultValue: <OverridenRuleTierDto>[])
      required final List<OverridenRuleTierDto> overridenRuleTier,
      @JsonKey(name: 'isPriceOverride', defaultValue: false)
      required final bool isPriceOverride,
      @JsonKey(name: 'zdp8Override', defaultValue: 0)
      required final double zdp8Override,
      @JsonKey(name: 'priceOverride', defaultValue: 0)
      required final double priceOverride,
      @JsonKey(name: 'comboDeals') final PriceComboDealDto comboDeal,
      @JsonKey(name: 'isDiscountOverride', defaultValue: false)
      required final bool isDiscountOverride,
      @JsonKey(name: 'isMOVExclusion', defaultValue: false)
      required final bool isMOVExclusion,
      @JsonKey(name: 'conditionFlags')
      final PriceConditionFlagDto conditionFlags}) = _$PriceDtoImpl;
  const _PriceDto._() : super._();

  factory _PriceDto.fromJson(Map<String, dynamic> json) =
      _$PriceDtoImpl.fromJson;

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'oldMaterialCode', defaultValue: '')
  String get oldMaterialCode;
  @override
  @JsonKey(name: 'listPrice', defaultValue: 0)
  double get listPrice;
  @override
  @JsonKey(name: 'finalIndividualPrice', defaultValue: 0)
  double get finalIndividualPrice;
  @override
  @JsonKey(name: 'finalTotalPrice', defaultValue: 0)
  double get finalTotalPrice;
  @override
  @JsonKey(name: 'discountedValue', defaultValue: 0)
  double get discountedValue;
  @override
  @JsonKey(name: 'priceRules', defaultValue: <PriceRuleDto>[])
  List<PriceRuleDto> get rules;
  @override
  @JsonKey(name: 'bonuses', defaultValue: <PriceBonusDto>[])
  List<PriceBonusDto> get bonuses;
  @override
  @JsonKey(name: 'tieredPricing', defaultValue: <PriceTierDto>[])
  List<PriceTierDto> get tiers;
  @override
  @JsonKey(name: 'bundles', defaultValue: <PriceBundleDto>[])
  List<PriceBundleDto> get bundles;
  @override
  @JsonKey(name: 'valid', defaultValue: false)
  bool get isValid;
  @override
  @JsonKey(name: 'additionalBonusEligible', defaultValue: false)
  bool get additionalBonusEligible;
  @override
  @JsonKey(name: 'zMGDiscount', defaultValue: false)
  bool get zmgDiscount;
  @override
  @JsonKey(name: 'zDP5MaxQuota', defaultValue: '')
  String get zdp5MaxQuota;
  @override
  @JsonKey(name: 'zDP5RemainingQuota', defaultValue: '')
  String get zdp5RemainingQuota;
  @override
  @JsonKey(name: 'exceedQty', defaultValue: false)
  bool get exceedQty;
  @override
  @JsonKey(name: 'overridenRulePresent', defaultValue: false)
  bool get overrideRulePresent;
  @override
  @JsonKey(name: 'overridenRules', defaultValue: <PriceRuleDto>[])
  List<PriceRuleDto> get overridenRules;
  @override
  @JsonKey(name: 'overridenRuleTier', defaultValue: <OverridenRuleTierDto>[])
  List<OverridenRuleTierDto> get overridenRuleTier;
  @override
  @JsonKey(name: 'isPriceOverride', defaultValue: false)
  bool get isPriceOverride;
  @override
  @JsonKey(name: 'zdp8Override', defaultValue: 0)
  double get zdp8Override;
  @override
  @JsonKey(name: 'priceOverride', defaultValue: 0)
  double get priceOverride;
  @override
  @JsonKey(name: 'comboDeals')
  PriceComboDealDto get comboDeal;
  @override
  @JsonKey(name: 'isDiscountOverride', defaultValue: false)
  bool get isDiscountOverride;
  @override
  @JsonKey(name: 'isMOVExclusion', defaultValue: false)
  bool get isMOVExclusion;
  @override
  @JsonKey(name: 'conditionFlags')
  PriceConditionFlagDto get conditionFlags;
  @override
  @JsonKey(ignore: true)
  _$$PriceDtoImplCopyWith<_$PriceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
