// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_rule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PriceRuleDto _$PriceRuleDtoFromJson(Map<String, dynamic> json) {
  return _PriceRuleDto.fromJson(json);
}

/// @nodoc
mixin _$PriceRuleDto {
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'rate', defaultValue: 0)
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'conditions', defaultValue: '')
  String get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'tieredRules')
  TieredRulesDto get tieredRules => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonusEligible', defaultValue: false)
  bool get bonusEligible => throw _privateConstructorUsedError;
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  String get conditionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'overriddenBy', defaultValue: '')
  String get overriddenBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxQuota', defaultValue: '')
  String get maxQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'remainingQuota', defaultValue: '')
  String get remainingQuota => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceRuleDtoCopyWith<PriceRuleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceRuleDtoCopyWith<$Res> {
  factory $PriceRuleDtoCopyWith(
          PriceRuleDto value, $Res Function(PriceRuleDto) then) =
      _$PriceRuleDtoCopyWithImpl<$Res, PriceRuleDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'rate', defaultValue: 0) double rate,
      @JsonKey(name: 'conditions', defaultValue: '') String condition,
      @JsonKey(name: 'tieredRules') TieredRulesDto tieredRules,
      @JsonKey(name: 'bonusEligible', defaultValue: false) bool bonusEligible,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      String conditionNumber,
      @JsonKey(name: 'overriddenBy', defaultValue: '') String overriddenBy,
      @JsonKey(name: 'maxQuota', defaultValue: '') String maxQuota,
      @JsonKey(name: 'remainingQuota', defaultValue: '')
      String remainingQuota});

  $TieredRulesDtoCopyWith<$Res> get tieredRules;
}

/// @nodoc
class _$PriceRuleDtoCopyWithImpl<$Res, $Val extends PriceRuleDto>
    implements $PriceRuleDtoCopyWith<$Res> {
  _$PriceRuleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? rate = null,
    Object? condition = null,
    Object? tieredRules = null,
    Object? bonusEligible = null,
    Object? conditionNumber = null,
    Object? overriddenBy = null,
    Object? maxQuota = null,
    Object? remainingQuota = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      tieredRules: null == tieredRules
          ? _value.tieredRules
          : tieredRules // ignore: cast_nullable_to_non_nullable
              as TieredRulesDto,
      bonusEligible: null == bonusEligible
          ? _value.bonusEligible
          : bonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      overriddenBy: null == overriddenBy
          ? _value.overriddenBy
          : overriddenBy // ignore: cast_nullable_to_non_nullable
              as String,
      maxQuota: null == maxQuota
          ? _value.maxQuota
          : maxQuota // ignore: cast_nullable_to_non_nullable
              as String,
      remainingQuota: null == remainingQuota
          ? _value.remainingQuota
          : remainingQuota // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TieredRulesDtoCopyWith<$Res> get tieredRules {
    return $TieredRulesDtoCopyWith<$Res>(_value.tieredRules, (value) {
      return _then(_value.copyWith(tieredRules: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PriceRuleDtoImplCopyWith<$Res>
    implements $PriceRuleDtoCopyWith<$Res> {
  factory _$$PriceRuleDtoImplCopyWith(
          _$PriceRuleDtoImpl value, $Res Function(_$PriceRuleDtoImpl) then) =
      __$$PriceRuleDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'rate', defaultValue: 0) double rate,
      @JsonKey(name: 'conditions', defaultValue: '') String condition,
      @JsonKey(name: 'tieredRules') TieredRulesDto tieredRules,
      @JsonKey(name: 'bonusEligible', defaultValue: false) bool bonusEligible,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      String conditionNumber,
      @JsonKey(name: 'overriddenBy', defaultValue: '') String overriddenBy,
      @JsonKey(name: 'maxQuota', defaultValue: '') String maxQuota,
      @JsonKey(name: 'remainingQuota', defaultValue: '')
      String remainingQuota});

  @override
  $TieredRulesDtoCopyWith<$Res> get tieredRules;
}

/// @nodoc
class __$$PriceRuleDtoImplCopyWithImpl<$Res>
    extends _$PriceRuleDtoCopyWithImpl<$Res, _$PriceRuleDtoImpl>
    implements _$$PriceRuleDtoImplCopyWith<$Res> {
  __$$PriceRuleDtoImplCopyWithImpl(
      _$PriceRuleDtoImpl _value, $Res Function(_$PriceRuleDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? rate = null,
    Object? condition = null,
    Object? tieredRules = null,
    Object? bonusEligible = null,
    Object? conditionNumber = null,
    Object? overriddenBy = null,
    Object? maxQuota = null,
    Object? remainingQuota = null,
  }) {
    return _then(_$PriceRuleDtoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      tieredRules: null == tieredRules
          ? _value.tieredRules
          : tieredRules // ignore: cast_nullable_to_non_nullable
              as TieredRulesDto,
      bonusEligible: null == bonusEligible
          ? _value.bonusEligible
          : bonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      overriddenBy: null == overriddenBy
          ? _value.overriddenBy
          : overriddenBy // ignore: cast_nullable_to_non_nullable
              as String,
      maxQuota: null == maxQuota
          ? _value.maxQuota
          : maxQuota // ignore: cast_nullable_to_non_nullable
              as String,
      remainingQuota: null == remainingQuota
          ? _value.remainingQuota
          : remainingQuota // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceRuleDtoImpl extends _PriceRuleDto {
  const _$PriceRuleDtoImpl(
      {@JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'rate', defaultValue: 0) required this.rate,
      @JsonKey(name: 'conditions', defaultValue: '') required this.condition,
      @JsonKey(name: 'tieredRules') this.tieredRules = TieredRulesDto.empty,
      @JsonKey(name: 'bonusEligible', defaultValue: false)
      required this.bonusEligible,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      required this.conditionNumber,
      @JsonKey(name: 'overriddenBy', defaultValue: '')
      required this.overriddenBy,
      @JsonKey(name: 'maxQuota', defaultValue: '') required this.maxQuota,
      @JsonKey(name: 'remainingQuota', defaultValue: '')
      required this.remainingQuota})
      : super._();

  factory _$PriceRuleDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceRuleDtoImplFromJson(json);

  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'rate', defaultValue: 0)
  final double rate;
  @override
  @JsonKey(name: 'conditions', defaultValue: '')
  final String condition;
  @override
  @JsonKey(name: 'tieredRules')
  final TieredRulesDto tieredRules;
  @override
  @JsonKey(name: 'bonusEligible', defaultValue: false)
  final bool bonusEligible;
  @override
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  final String conditionNumber;
  @override
  @JsonKey(name: 'overriddenBy', defaultValue: '')
  final String overriddenBy;
  @override
  @JsonKey(name: 'maxQuota', defaultValue: '')
  final String maxQuota;
  @override
  @JsonKey(name: 'remainingQuota', defaultValue: '')
  final String remainingQuota;

  @override
  String toString() {
    return 'PriceRuleDto(type: $type, rate: $rate, condition: $condition, tieredRules: $tieredRules, bonusEligible: $bonusEligible, conditionNumber: $conditionNumber, overriddenBy: $overriddenBy, maxQuota: $maxQuota, remainingQuota: $remainingQuota)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceRuleDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.tieredRules, tieredRules) ||
                other.tieredRules == tieredRules) &&
            (identical(other.bonusEligible, bonusEligible) ||
                other.bonusEligible == bonusEligible) &&
            (identical(other.conditionNumber, conditionNumber) ||
                other.conditionNumber == conditionNumber) &&
            (identical(other.overriddenBy, overriddenBy) ||
                other.overriddenBy == overriddenBy) &&
            (identical(other.maxQuota, maxQuota) ||
                other.maxQuota == maxQuota) &&
            (identical(other.remainingQuota, remainingQuota) ||
                other.remainingQuota == remainingQuota));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      rate,
      condition,
      tieredRules,
      bonusEligible,
      conditionNumber,
      overriddenBy,
      maxQuota,
      remainingQuota);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceRuleDtoImplCopyWith<_$PriceRuleDtoImpl> get copyWith =>
      __$$PriceRuleDtoImplCopyWithImpl<_$PriceRuleDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceRuleDtoImplToJson(
      this,
    );
  }
}

abstract class _PriceRuleDto extends PriceRuleDto {
  const factory _PriceRuleDto(
      {@JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'rate', defaultValue: 0) required final double rate,
      @JsonKey(name: 'conditions', defaultValue: '')
      required final String condition,
      @JsonKey(name: 'tieredRules') final TieredRulesDto tieredRules,
      @JsonKey(name: 'bonusEligible', defaultValue: false)
      required final bool bonusEligible,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      required final String conditionNumber,
      @JsonKey(name: 'overriddenBy', defaultValue: '')
      required final String overriddenBy,
      @JsonKey(name: 'maxQuota', defaultValue: '')
      required final String maxQuota,
      @JsonKey(name: 'remainingQuota', defaultValue: '')
      required final String remainingQuota}) = _$PriceRuleDtoImpl;
  const _PriceRuleDto._() : super._();

  factory _PriceRuleDto.fromJson(Map<String, dynamic> json) =
      _$PriceRuleDtoImpl.fromJson;

  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'rate', defaultValue: 0)
  double get rate;
  @override
  @JsonKey(name: 'conditions', defaultValue: '')
  String get condition;
  @override
  @JsonKey(name: 'tieredRules')
  TieredRulesDto get tieredRules;
  @override
  @JsonKey(name: 'bonusEligible', defaultValue: false)
  bool get bonusEligible;
  @override
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  String get conditionNumber;
  @override
  @JsonKey(name: 'overriddenBy', defaultValue: '')
  String get overriddenBy;
  @override
  @JsonKey(name: 'maxQuota', defaultValue: '')
  String get maxQuota;
  @override
  @JsonKey(name: 'remainingQuota', defaultValue: '')
  String get remainingQuota;
  @override
  @JsonKey(ignore: true)
  _$$PriceRuleDtoImplCopyWith<_$PriceRuleDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TieredRulesDto _$TieredRulesDtoFromJson(Map<String, dynamic> json) {
  return _TieredRulesDto.fromJson(json);
}

/// @nodoc
mixin _$TieredRulesDto {
  @JsonKey(name: 'tier', defaultValue: '')
  String get tier => throw _privateConstructorUsedError;
  @JsonKey(name: 'ruleTier', defaultValue: <RuleTierDto>[])
  List<RuleTierDto> get ruleTier => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TieredRulesDtoCopyWith<TieredRulesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TieredRulesDtoCopyWith<$Res> {
  factory $TieredRulesDtoCopyWith(
          TieredRulesDto value, $Res Function(TieredRulesDto) then) =
      _$TieredRulesDtoCopyWithImpl<$Res, TieredRulesDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'tier', defaultValue: '') String tier,
      @JsonKey(name: 'ruleTier', defaultValue: <RuleTierDto>[])
      List<RuleTierDto> ruleTier});
}

/// @nodoc
class _$TieredRulesDtoCopyWithImpl<$Res, $Val extends TieredRulesDto>
    implements $TieredRulesDtoCopyWith<$Res> {
  _$TieredRulesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tier = null,
    Object? ruleTier = null,
  }) {
    return _then(_value.copyWith(
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as String,
      ruleTier: null == ruleTier
          ? _value.ruleTier
          : ruleTier // ignore: cast_nullable_to_non_nullable
              as List<RuleTierDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TieredRulesDtoImplCopyWith<$Res>
    implements $TieredRulesDtoCopyWith<$Res> {
  factory _$$TieredRulesDtoImplCopyWith(_$TieredRulesDtoImpl value,
          $Res Function(_$TieredRulesDtoImpl) then) =
      __$$TieredRulesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'tier', defaultValue: '') String tier,
      @JsonKey(name: 'ruleTier', defaultValue: <RuleTierDto>[])
      List<RuleTierDto> ruleTier});
}

/// @nodoc
class __$$TieredRulesDtoImplCopyWithImpl<$Res>
    extends _$TieredRulesDtoCopyWithImpl<$Res, _$TieredRulesDtoImpl>
    implements _$$TieredRulesDtoImplCopyWith<$Res> {
  __$$TieredRulesDtoImplCopyWithImpl(
      _$TieredRulesDtoImpl _value, $Res Function(_$TieredRulesDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tier = null,
    Object? ruleTier = null,
  }) {
    return _then(_$TieredRulesDtoImpl(
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as String,
      ruleTier: null == ruleTier
          ? _value._ruleTier
          : ruleTier // ignore: cast_nullable_to_non_nullable
              as List<RuleTierDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TieredRulesDtoImpl extends _TieredRulesDto {
  const _$TieredRulesDtoImpl(
      {@JsonKey(name: 'tier', defaultValue: '') required this.tier,
      @JsonKey(name: 'ruleTier', defaultValue: <RuleTierDto>[])
      required final List<RuleTierDto> ruleTier})
      : _ruleTier = ruleTier,
        super._();

  factory _$TieredRulesDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TieredRulesDtoImplFromJson(json);

  @override
  @JsonKey(name: 'tier', defaultValue: '')
  final String tier;
  final List<RuleTierDto> _ruleTier;
  @override
  @JsonKey(name: 'ruleTier', defaultValue: <RuleTierDto>[])
  List<RuleTierDto> get ruleTier {
    if (_ruleTier is EqualUnmodifiableListView) return _ruleTier;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ruleTier);
  }

  @override
  String toString() {
    return 'TieredRulesDto(tier: $tier, ruleTier: $ruleTier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TieredRulesDtoImpl &&
            (identical(other.tier, tier) || other.tier == tier) &&
            const DeepCollectionEquality().equals(other._ruleTier, _ruleTier));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, tier, const DeepCollectionEquality().hash(_ruleTier));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TieredRulesDtoImplCopyWith<_$TieredRulesDtoImpl> get copyWith =>
      __$$TieredRulesDtoImplCopyWithImpl<_$TieredRulesDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TieredRulesDtoImplToJson(
      this,
    );
  }
}

abstract class _TieredRulesDto extends TieredRulesDto {
  const factory _TieredRulesDto(
      {@JsonKey(name: 'tier', defaultValue: '') required final String tier,
      @JsonKey(name: 'ruleTier', defaultValue: <RuleTierDto>[])
      required final List<RuleTierDto> ruleTier}) = _$TieredRulesDtoImpl;
  const _TieredRulesDto._() : super._();

  factory _TieredRulesDto.fromJson(Map<String, dynamic> json) =
      _$TieredRulesDtoImpl.fromJson;

  @override
  @JsonKey(name: 'tier', defaultValue: '')
  String get tier;
  @override
  @JsonKey(name: 'ruleTier', defaultValue: <RuleTierDto>[])
  List<RuleTierDto> get ruleTier;
  @override
  @JsonKey(ignore: true)
  _$$TieredRulesDtoImplCopyWith<_$TieredRulesDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RuleTierDto _$RuleTierDtoFromJson(Map<String, dynamic> json) {
  return _RuleTierDto.fromJson(json);
}

/// @nodoc
mixin _$RuleTierDto {
  @JsonKey(name: 'rate', defaultValue: 0)
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity', defaultValue: 0)
  double get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RuleTierDtoCopyWith<RuleTierDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuleTierDtoCopyWith<$Res> {
  factory $RuleTierDtoCopyWith(
          RuleTierDto value, $Res Function(RuleTierDto) then) =
      _$RuleTierDtoCopyWithImpl<$Res, RuleTierDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'rate', defaultValue: 0) double rate,
      @JsonKey(name: 'quantity', defaultValue: 0) double quantity});
}

/// @nodoc
class _$RuleTierDtoCopyWithImpl<$Res, $Val extends RuleTierDto>
    implements $RuleTierDtoCopyWith<$Res> {
  _$RuleTierDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RuleTierDtoImplCopyWith<$Res>
    implements $RuleTierDtoCopyWith<$Res> {
  factory _$$RuleTierDtoImplCopyWith(
          _$RuleTierDtoImpl value, $Res Function(_$RuleTierDtoImpl) then) =
      __$$RuleTierDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'rate', defaultValue: 0) double rate,
      @JsonKey(name: 'quantity', defaultValue: 0) double quantity});
}

/// @nodoc
class __$$RuleTierDtoImplCopyWithImpl<$Res>
    extends _$RuleTierDtoCopyWithImpl<$Res, _$RuleTierDtoImpl>
    implements _$$RuleTierDtoImplCopyWith<$Res> {
  __$$RuleTierDtoImplCopyWithImpl(
      _$RuleTierDtoImpl _value, $Res Function(_$RuleTierDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? quantity = null,
  }) {
    return _then(_$RuleTierDtoImpl(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RuleTierDtoImpl extends _RuleTierDto {
  const _$RuleTierDtoImpl(
      {@JsonKey(name: 'rate', defaultValue: 0) required this.rate,
      @JsonKey(name: 'quantity', defaultValue: 0) required this.quantity})
      : super._();

  factory _$RuleTierDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RuleTierDtoImplFromJson(json);

  @override
  @JsonKey(name: 'rate', defaultValue: 0)
  final double rate;
  @override
  @JsonKey(name: 'quantity', defaultValue: 0)
  final double quantity;

  @override
  String toString() {
    return 'RuleTierDto(rate: $rate, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleTierDtoImpl &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rate, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleTierDtoImplCopyWith<_$RuleTierDtoImpl> get copyWith =>
      __$$RuleTierDtoImplCopyWithImpl<_$RuleTierDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RuleTierDtoImplToJson(
      this,
    );
  }
}

abstract class _RuleTierDto extends RuleTierDto {
  const factory _RuleTierDto(
      {@JsonKey(name: 'rate', defaultValue: 0) required final double rate,
      @JsonKey(name: 'quantity', defaultValue: 0)
      required final double quantity}) = _$RuleTierDtoImpl;
  const _RuleTierDto._() : super._();

  factory _RuleTierDto.fromJson(Map<String, dynamic> json) =
      _$RuleTierDtoImpl.fromJson;

  @override
  @JsonKey(name: 'rate', defaultValue: 0)
  double get rate;
  @override
  @JsonKey(name: 'quantity', defaultValue: 0)
  double get quantity;
  @override
  @JsonKey(ignore: true)
  _$$RuleTierDtoImplCopyWith<_$RuleTierDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
