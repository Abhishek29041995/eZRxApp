// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Price {
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  MaterialCode get materialCode => throw _privateConstructorUsedError;
  MaterialPrice get lastPrice => throw _privateConstructorUsedError;
  MaterialPrice get finalPrice => throw _privateConstructorUsedError;
  MaterialPrice get finalTotalPrice => throw _privateConstructorUsedError;
  MaterialPrice get discountedValue => throw _privateConstructorUsedError;
  List<PriceRule> get rules => throw _privateConstructorUsedError;
  List<PriceTierItem> get tiers => throw _privateConstructorUsedError;
  List<PriceBonus> get bonuses => throw _privateConstructorUsedError;
  List<PriceBundle> get bundles => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  bool get additionalBonusEligible => throw _privateConstructorUsedError;
  bool get zmgDiscount => throw _privateConstructorUsedError;
  ZDP5Info get zdp5MaxQuota => throw _privateConstructorUsedError;
  ZDP5Info get zdp5RemainingQuota => throw _privateConstructorUsedError;
  bool get exceedQty => throw _privateConstructorUsedError;
  bool get overrideRulePresent => throw _privateConstructorUsedError;
  List<PriceRule> get overridenRules => throw _privateConstructorUsedError;
  List<OverridenRuleTier> get overridenRuleTier =>
      throw _privateConstructorUsedError;
  bool get isPriceOverride => throw _privateConstructorUsedError;
  bool get isDiscountOverride => throw _privateConstructorUsedError;
  Zdp8OverrideValue get zdp8Override => throw _privateConstructorUsedError;
  PriceOverrideValue get priceOverride => throw _privateConstructorUsedError;
  PriceComboDeal get comboDeal => throw _privateConstructorUsedError;
  bool get isMOVExclusion => throw _privateConstructorUsedError;
  bool get isFOC => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceCopyWith<Price> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceCopyWith<$Res> {
  factory $PriceCopyWith(Price value, $Res Function(Price) then) =
      _$PriceCopyWithImpl<$Res, Price>;
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      MaterialCode materialCode,
      MaterialPrice lastPrice,
      MaterialPrice finalPrice,
      MaterialPrice finalTotalPrice,
      MaterialPrice discountedValue,
      List<PriceRule> rules,
      List<PriceTierItem> tiers,
      List<PriceBonus> bonuses,
      List<PriceBundle> bundles,
      bool isValid,
      bool additionalBonusEligible,
      bool zmgDiscount,
      ZDP5Info zdp5MaxQuota,
      ZDP5Info zdp5RemainingQuota,
      bool exceedQty,
      bool overrideRulePresent,
      List<PriceRule> overridenRules,
      List<OverridenRuleTier> overridenRuleTier,
      bool isPriceOverride,
      bool isDiscountOverride,
      Zdp8OverrideValue zdp8Override,
      PriceOverrideValue priceOverride,
      PriceComboDeal comboDeal,
      bool isMOVExclusion,
      bool isFOC});

  $PriceComboDealCopyWith<$Res> get comboDeal;
}

/// @nodoc
class _$PriceCopyWithImpl<$Res, $Val extends Price>
    implements $PriceCopyWith<$Res> {
  _$PriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? materialCode = null,
    Object? lastPrice = null,
    Object? finalPrice = null,
    Object? finalTotalPrice = null,
    Object? discountedValue = null,
    Object? rules = null,
    Object? tiers = null,
    Object? bonuses = null,
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
    Object? isDiscountOverride = null,
    Object? zdp8Override = null,
    Object? priceOverride = null,
    Object? comboDeal = null,
    Object? isMOVExclusion = null,
    Object? isFOC = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      materialCode: null == materialCode
          ? _value.materialCode
          : materialCode // ignore: cast_nullable_to_non_nullable
              as MaterialCode,
      lastPrice: null == lastPrice
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      finalTotalPrice: null == finalTotalPrice
          ? _value.finalTotalPrice
          : finalTotalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      discountedValue: null == discountedValue
          ? _value.discountedValue
          : discountedValue // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      rules: null == rules
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<PriceRule>,
      tiers: null == tiers
          ? _value.tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTierItem>,
      bonuses: null == bonuses
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<PriceBonus>,
      bundles: null == bundles
          ? _value.bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<PriceBundle>,
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
              as ZDP5Info,
      zdp5RemainingQuota: null == zdp5RemainingQuota
          ? _value.zdp5RemainingQuota
          : zdp5RemainingQuota // ignore: cast_nullable_to_non_nullable
              as ZDP5Info,
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
              as List<PriceRule>,
      overridenRuleTier: null == overridenRuleTier
          ? _value.overridenRuleTier
          : overridenRuleTier // ignore: cast_nullable_to_non_nullable
              as List<OverridenRuleTier>,
      isPriceOverride: null == isPriceOverride
          ? _value.isPriceOverride
          : isPriceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      isDiscountOverride: null == isDiscountOverride
          ? _value.isDiscountOverride
          : isDiscountOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      zdp8Override: null == zdp8Override
          ? _value.zdp8Override
          : zdp8Override // ignore: cast_nullable_to_non_nullable
              as Zdp8OverrideValue,
      priceOverride: null == priceOverride
          ? _value.priceOverride
          : priceOverride // ignore: cast_nullable_to_non_nullable
              as PriceOverrideValue,
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as PriceComboDeal,
      isMOVExclusion: null == isMOVExclusion
          ? _value.isMOVExclusion
          : isMOVExclusion // ignore: cast_nullable_to_non_nullable
              as bool,
      isFOC: null == isFOC
          ? _value.isFOC
          : isFOC // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceComboDealCopyWith<$Res> get comboDeal {
    return $PriceComboDealCopyWith<$Res>(_value.comboDeal, (value) {
      return _then(_value.copyWith(comboDeal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PriceImplCopyWith<$Res> implements $PriceCopyWith<$Res> {
  factory _$$PriceImplCopyWith(
          _$PriceImpl value, $Res Function(_$PriceImpl) then) =
      __$$PriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      MaterialCode materialCode,
      MaterialPrice lastPrice,
      MaterialPrice finalPrice,
      MaterialPrice finalTotalPrice,
      MaterialPrice discountedValue,
      List<PriceRule> rules,
      List<PriceTierItem> tiers,
      List<PriceBonus> bonuses,
      List<PriceBundle> bundles,
      bool isValid,
      bool additionalBonusEligible,
      bool zmgDiscount,
      ZDP5Info zdp5MaxQuota,
      ZDP5Info zdp5RemainingQuota,
      bool exceedQty,
      bool overrideRulePresent,
      List<PriceRule> overridenRules,
      List<OverridenRuleTier> overridenRuleTier,
      bool isPriceOverride,
      bool isDiscountOverride,
      Zdp8OverrideValue zdp8Override,
      PriceOverrideValue priceOverride,
      PriceComboDeal comboDeal,
      bool isMOVExclusion,
      bool isFOC});

  @override
  $PriceComboDealCopyWith<$Res> get comboDeal;
}

/// @nodoc
class __$$PriceImplCopyWithImpl<$Res>
    extends _$PriceCopyWithImpl<$Res, _$PriceImpl>
    implements _$$PriceImplCopyWith<$Res> {
  __$$PriceImplCopyWithImpl(
      _$PriceImpl _value, $Res Function(_$PriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? materialCode = null,
    Object? lastPrice = null,
    Object? finalPrice = null,
    Object? finalTotalPrice = null,
    Object? discountedValue = null,
    Object? rules = null,
    Object? tiers = null,
    Object? bonuses = null,
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
    Object? isDiscountOverride = null,
    Object? zdp8Override = null,
    Object? priceOverride = null,
    Object? comboDeal = null,
    Object? isMOVExclusion = null,
    Object? isFOC = null,
  }) {
    return _then(_$PriceImpl(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      materialCode: null == materialCode
          ? _value.materialCode
          : materialCode // ignore: cast_nullable_to_non_nullable
              as MaterialCode,
      lastPrice: null == lastPrice
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      finalTotalPrice: null == finalTotalPrice
          ? _value.finalTotalPrice
          : finalTotalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      discountedValue: null == discountedValue
          ? _value.discountedValue
          : discountedValue // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      rules: null == rules
          ? _value._rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<PriceRule>,
      tiers: null == tiers
          ? _value._tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTierItem>,
      bonuses: null == bonuses
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<PriceBonus>,
      bundles: null == bundles
          ? _value._bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<PriceBundle>,
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
              as ZDP5Info,
      zdp5RemainingQuota: null == zdp5RemainingQuota
          ? _value.zdp5RemainingQuota
          : zdp5RemainingQuota // ignore: cast_nullable_to_non_nullable
              as ZDP5Info,
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
              as List<PriceRule>,
      overridenRuleTier: null == overridenRuleTier
          ? _value._overridenRuleTier
          : overridenRuleTier // ignore: cast_nullable_to_non_nullable
              as List<OverridenRuleTier>,
      isPriceOverride: null == isPriceOverride
          ? _value.isPriceOverride
          : isPriceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      isDiscountOverride: null == isDiscountOverride
          ? _value.isDiscountOverride
          : isDiscountOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      zdp8Override: null == zdp8Override
          ? _value.zdp8Override
          : zdp8Override // ignore: cast_nullable_to_non_nullable
              as Zdp8OverrideValue,
      priceOverride: null == priceOverride
          ? _value.priceOverride
          : priceOverride // ignore: cast_nullable_to_non_nullable
              as PriceOverrideValue,
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as PriceComboDeal,
      isMOVExclusion: null == isMOVExclusion
          ? _value.isMOVExclusion
          : isMOVExclusion // ignore: cast_nullable_to_non_nullable
              as bool,
      isFOC: null == isFOC
          ? _value.isFOC
          : isFOC // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PriceImpl extends _Price {
  const _$PriceImpl(
      {required this.materialNumber,
      required this.materialCode,
      required this.lastPrice,
      required this.finalPrice,
      required this.finalTotalPrice,
      required this.discountedValue,
      required final List<PriceRule> rules,
      required final List<PriceTierItem> tiers,
      required final List<PriceBonus> bonuses,
      required final List<PriceBundle> bundles,
      required this.isValid,
      required this.additionalBonusEligible,
      required this.zmgDiscount,
      required this.zdp5MaxQuota,
      required this.zdp5RemainingQuota,
      required this.exceedQty,
      required this.overrideRulePresent,
      required final List<PriceRule> overridenRules,
      required final List<OverridenRuleTier> overridenRuleTier,
      this.isPriceOverride = false,
      this.isDiscountOverride = false,
      required this.zdp8Override,
      required this.priceOverride,
      required this.comboDeal,
      required this.isMOVExclusion,
      required this.isFOC})
      : _rules = rules,
        _tiers = tiers,
        _bonuses = bonuses,
        _bundles = bundles,
        _overridenRules = overridenRules,
        _overridenRuleTier = overridenRuleTier,
        super._();

  @override
  final MaterialNumber materialNumber;
  @override
  final MaterialCode materialCode;
  @override
  final MaterialPrice lastPrice;
  @override
  final MaterialPrice finalPrice;
  @override
  final MaterialPrice finalTotalPrice;
  @override
  final MaterialPrice discountedValue;
  final List<PriceRule> _rules;
  @override
  List<PriceRule> get rules {
    if (_rules is EqualUnmodifiableListView) return _rules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rules);
  }

  final List<PriceTierItem> _tiers;
  @override
  List<PriceTierItem> get tiers {
    if (_tiers is EqualUnmodifiableListView) return _tiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tiers);
  }

  final List<PriceBonus> _bonuses;
  @override
  List<PriceBonus> get bonuses {
    if (_bonuses is EqualUnmodifiableListView) return _bonuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonuses);
  }

  final List<PriceBundle> _bundles;
  @override
  List<PriceBundle> get bundles {
    if (_bundles is EqualUnmodifiableListView) return _bundles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundles);
  }

  @override
  final bool isValid;
  @override
  final bool additionalBonusEligible;
  @override
  final bool zmgDiscount;
  @override
  final ZDP5Info zdp5MaxQuota;
  @override
  final ZDP5Info zdp5RemainingQuota;
  @override
  final bool exceedQty;
  @override
  final bool overrideRulePresent;
  final List<PriceRule> _overridenRules;
  @override
  List<PriceRule> get overridenRules {
    if (_overridenRules is EqualUnmodifiableListView) return _overridenRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_overridenRules);
  }

  final List<OverridenRuleTier> _overridenRuleTier;
  @override
  List<OverridenRuleTier> get overridenRuleTier {
    if (_overridenRuleTier is EqualUnmodifiableListView)
      return _overridenRuleTier;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_overridenRuleTier);
  }

  @override
  @JsonKey()
  final bool isPriceOverride;
  @override
  @JsonKey()
  final bool isDiscountOverride;
  @override
  final Zdp8OverrideValue zdp8Override;
  @override
  final PriceOverrideValue priceOverride;
  @override
  final PriceComboDeal comboDeal;
  @override
  final bool isMOVExclusion;
  @override
  final bool isFOC;

  @override
  String toString() {
    return 'Price(materialNumber: $materialNumber, materialCode: $materialCode, lastPrice: $lastPrice, finalPrice: $finalPrice, finalTotalPrice: $finalTotalPrice, discountedValue: $discountedValue, rules: $rules, tiers: $tiers, bonuses: $bonuses, bundles: $bundles, isValid: $isValid, additionalBonusEligible: $additionalBonusEligible, zmgDiscount: $zmgDiscount, zdp5MaxQuota: $zdp5MaxQuota, zdp5RemainingQuota: $zdp5RemainingQuota, exceedQty: $exceedQty, overrideRulePresent: $overrideRulePresent, overridenRules: $overridenRules, overridenRuleTier: $overridenRuleTier, isPriceOverride: $isPriceOverride, isDiscountOverride: $isDiscountOverride, zdp8Override: $zdp8Override, priceOverride: $priceOverride, comboDeal: $comboDeal, isMOVExclusion: $isMOVExclusion, isFOC: $isFOC)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceImpl &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialCode, materialCode) ||
                other.materialCode == materialCode) &&
            (identical(other.lastPrice, lastPrice) ||
                other.lastPrice == lastPrice) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.finalTotalPrice, finalTotalPrice) ||
                other.finalTotalPrice == finalTotalPrice) &&
            (identical(other.discountedValue, discountedValue) ||
                other.discountedValue == discountedValue) &&
            const DeepCollectionEquality().equals(other._rules, _rules) &&
            const DeepCollectionEquality().equals(other._tiers, _tiers) &&
            const DeepCollectionEquality().equals(other._bonuses, _bonuses) &&
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
            (identical(other.isDiscountOverride, isDiscountOverride) ||
                other.isDiscountOverride == isDiscountOverride) &&
            (identical(other.zdp8Override, zdp8Override) ||
                other.zdp8Override == zdp8Override) &&
            (identical(other.priceOverride, priceOverride) ||
                other.priceOverride == priceOverride) &&
            (identical(other.comboDeal, comboDeal) ||
                other.comboDeal == comboDeal) &&
            (identical(other.isMOVExclusion, isMOVExclusion) ||
                other.isMOVExclusion == isMOVExclusion) &&
            (identical(other.isFOC, isFOC) || other.isFOC == isFOC));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        materialNumber,
        materialCode,
        lastPrice,
        finalPrice,
        finalTotalPrice,
        discountedValue,
        const DeepCollectionEquality().hash(_rules),
        const DeepCollectionEquality().hash(_tiers),
        const DeepCollectionEquality().hash(_bonuses),
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
        isDiscountOverride,
        zdp8Override,
        priceOverride,
        comboDeal,
        isMOVExclusion,
        isFOC
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceImplCopyWith<_$PriceImpl> get copyWith =>
      __$$PriceImplCopyWithImpl<_$PriceImpl>(this, _$identity);
}

abstract class _Price extends Price {
  const factory _Price(
      {required final MaterialNumber materialNumber,
      required final MaterialCode materialCode,
      required final MaterialPrice lastPrice,
      required final MaterialPrice finalPrice,
      required final MaterialPrice finalTotalPrice,
      required final MaterialPrice discountedValue,
      required final List<PriceRule> rules,
      required final List<PriceTierItem> tiers,
      required final List<PriceBonus> bonuses,
      required final List<PriceBundle> bundles,
      required final bool isValid,
      required final bool additionalBonusEligible,
      required final bool zmgDiscount,
      required final ZDP5Info zdp5MaxQuota,
      required final ZDP5Info zdp5RemainingQuota,
      required final bool exceedQty,
      required final bool overrideRulePresent,
      required final List<PriceRule> overridenRules,
      required final List<OverridenRuleTier> overridenRuleTier,
      final bool isPriceOverride,
      final bool isDiscountOverride,
      required final Zdp8OverrideValue zdp8Override,
      required final PriceOverrideValue priceOverride,
      required final PriceComboDeal comboDeal,
      required final bool isMOVExclusion,
      required final bool isFOC}) = _$PriceImpl;
  const _Price._() : super._();

  @override
  MaterialNumber get materialNumber;
  @override
  MaterialCode get materialCode;
  @override
  MaterialPrice get lastPrice;
  @override
  MaterialPrice get finalPrice;
  @override
  MaterialPrice get finalTotalPrice;
  @override
  MaterialPrice get discountedValue;
  @override
  List<PriceRule> get rules;
  @override
  List<PriceTierItem> get tiers;
  @override
  List<PriceBonus> get bonuses;
  @override
  List<PriceBundle> get bundles;
  @override
  bool get isValid;
  @override
  bool get additionalBonusEligible;
  @override
  bool get zmgDiscount;
  @override
  ZDP5Info get zdp5MaxQuota;
  @override
  ZDP5Info get zdp5RemainingQuota;
  @override
  bool get exceedQty;
  @override
  bool get overrideRulePresent;
  @override
  List<PriceRule> get overridenRules;
  @override
  List<OverridenRuleTier> get overridenRuleTier;
  @override
  bool get isPriceOverride;
  @override
  bool get isDiscountOverride;
  @override
  Zdp8OverrideValue get zdp8Override;
  @override
  PriceOverrideValue get priceOverride;
  @override
  PriceComboDeal get comboDeal;
  @override
  bool get isMOVExclusion;
  @override
  bool get isFOC;
  @override
  @JsonKey(ignore: true)
  _$$PriceImplCopyWith<_$PriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
