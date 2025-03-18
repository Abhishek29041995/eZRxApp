// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo_deal_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ComboDealDto _$ComboDealDtoFromJson(Map<String, dynamic> json) {
  return _ComboDealDto.fromJson(json);
}

/// @nodoc
mixin _$ComboDealDto {
  @JsonKey(name: 'groupDeal')
  ComboDealGroupDealDto get groupDeal => throw _privateConstructorUsedError;
  @JsonKey(name: 'flexiSKUTier', defaultValue: [])
  List<ComboDealSKUTierDto> get flexiSKUTier =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'flexiQtyTier', defaultValue: [])
  List<ComboDealQtyTierDto> get flexiQtyTier =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
  List<ComboDealAmountTierDto> get flexiAmountTier =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'materialComboDeals', defaultValue: [])
  List<ComboDealMaterialSetDto> get materialComboDeals =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'flexiTierRule', defaultValue: [])
  List<ComboDealTierRuleDto> get flexiTierRule =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComboDealDtoCopyWith<ComboDealDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealDtoCopyWith<$Res> {
  factory $ComboDealDtoCopyWith(
          ComboDealDto value, $Res Function(ComboDealDto) then) =
      _$ComboDealDtoCopyWithImpl<$Res, ComboDealDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'groupDeal') ComboDealGroupDealDto groupDeal,
      @JsonKey(name: 'flexiSKUTier', defaultValue: [])
      List<ComboDealSKUTierDto> flexiSKUTier,
      @JsonKey(name: 'flexiQtyTier', defaultValue: [])
      List<ComboDealQtyTierDto> flexiQtyTier,
      @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
      List<ComboDealAmountTierDto> flexiAmountTier,
      @JsonKey(name: 'materialComboDeals', defaultValue: [])
      List<ComboDealMaterialSetDto> materialComboDeals,
      @JsonKey(name: 'flexiTierRule', defaultValue: [])
      List<ComboDealTierRuleDto> flexiTierRule});

  $ComboDealGroupDealDtoCopyWith<$Res> get groupDeal;
}

/// @nodoc
class _$ComboDealDtoCopyWithImpl<$Res, $Val extends ComboDealDto>
    implements $ComboDealDtoCopyWith<$Res> {
  _$ComboDealDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupDeal = null,
    Object? flexiSKUTier = null,
    Object? flexiQtyTier = null,
    Object? flexiAmountTier = null,
    Object? materialComboDeals = null,
    Object? flexiTierRule = null,
  }) {
    return _then(_value.copyWith(
      groupDeal: null == groupDeal
          ? _value.groupDeal
          : groupDeal // ignore: cast_nullable_to_non_nullable
              as ComboDealGroupDealDto,
      flexiSKUTier: null == flexiSKUTier
          ? _value.flexiSKUTier
          : flexiSKUTier // ignore: cast_nullable_to_non_nullable
              as List<ComboDealSKUTierDto>,
      flexiQtyTier: null == flexiQtyTier
          ? _value.flexiQtyTier
          : flexiQtyTier // ignore: cast_nullable_to_non_nullable
              as List<ComboDealQtyTierDto>,
      flexiAmountTier: null == flexiAmountTier
          ? _value.flexiAmountTier
          : flexiAmountTier // ignore: cast_nullable_to_non_nullable
              as List<ComboDealAmountTierDto>,
      materialComboDeals: null == materialComboDeals
          ? _value.materialComboDeals
          : materialComboDeals // ignore: cast_nullable_to_non_nullable
              as List<ComboDealMaterialSetDto>,
      flexiTierRule: null == flexiTierRule
          ? _value.flexiTierRule
          : flexiTierRule // ignore: cast_nullable_to_non_nullable
              as List<ComboDealTierRuleDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ComboDealGroupDealDtoCopyWith<$Res> get groupDeal {
    return $ComboDealGroupDealDtoCopyWith<$Res>(_value.groupDeal, (value) {
      return _then(_value.copyWith(groupDeal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ComboDealDtoImplCopyWith<$Res>
    implements $ComboDealDtoCopyWith<$Res> {
  factory _$$ComboDealDtoImplCopyWith(
          _$ComboDealDtoImpl value, $Res Function(_$ComboDealDtoImpl) then) =
      __$$ComboDealDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'groupDeal') ComboDealGroupDealDto groupDeal,
      @JsonKey(name: 'flexiSKUTier', defaultValue: [])
      List<ComboDealSKUTierDto> flexiSKUTier,
      @JsonKey(name: 'flexiQtyTier', defaultValue: [])
      List<ComboDealQtyTierDto> flexiQtyTier,
      @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
      List<ComboDealAmountTierDto> flexiAmountTier,
      @JsonKey(name: 'materialComboDeals', defaultValue: [])
      List<ComboDealMaterialSetDto> materialComboDeals,
      @JsonKey(name: 'flexiTierRule', defaultValue: [])
      List<ComboDealTierRuleDto> flexiTierRule});

  @override
  $ComboDealGroupDealDtoCopyWith<$Res> get groupDeal;
}

/// @nodoc
class __$$ComboDealDtoImplCopyWithImpl<$Res>
    extends _$ComboDealDtoCopyWithImpl<$Res, _$ComboDealDtoImpl>
    implements _$$ComboDealDtoImplCopyWith<$Res> {
  __$$ComboDealDtoImplCopyWithImpl(
      _$ComboDealDtoImpl _value, $Res Function(_$ComboDealDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupDeal = null,
    Object? flexiSKUTier = null,
    Object? flexiQtyTier = null,
    Object? flexiAmountTier = null,
    Object? materialComboDeals = null,
    Object? flexiTierRule = null,
  }) {
    return _then(_$ComboDealDtoImpl(
      groupDeal: null == groupDeal
          ? _value.groupDeal
          : groupDeal // ignore: cast_nullable_to_non_nullable
              as ComboDealGroupDealDto,
      flexiSKUTier: null == flexiSKUTier
          ? _value._flexiSKUTier
          : flexiSKUTier // ignore: cast_nullable_to_non_nullable
              as List<ComboDealSKUTierDto>,
      flexiQtyTier: null == flexiQtyTier
          ? _value._flexiQtyTier
          : flexiQtyTier // ignore: cast_nullable_to_non_nullable
              as List<ComboDealQtyTierDto>,
      flexiAmountTier: null == flexiAmountTier
          ? _value._flexiAmountTier
          : flexiAmountTier // ignore: cast_nullable_to_non_nullable
              as List<ComboDealAmountTierDto>,
      materialComboDeals: null == materialComboDeals
          ? _value._materialComboDeals
          : materialComboDeals // ignore: cast_nullable_to_non_nullable
              as List<ComboDealMaterialSetDto>,
      flexiTierRule: null == flexiTierRule
          ? _value._flexiTierRule
          : flexiTierRule // ignore: cast_nullable_to_non_nullable
              as List<ComboDealTierRuleDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComboDealDtoImpl extends _ComboDealDto {
  const _$ComboDealDtoImpl(
      {@JsonKey(name: 'groupDeal') this.groupDeal = ComboDealGroupDealDto.empty,
      @JsonKey(name: 'flexiSKUTier', defaultValue: [])
      required final List<ComboDealSKUTierDto> flexiSKUTier,
      @JsonKey(name: 'flexiQtyTier', defaultValue: [])
      required final List<ComboDealQtyTierDto> flexiQtyTier,
      @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
      required final List<ComboDealAmountTierDto> flexiAmountTier,
      @JsonKey(name: 'materialComboDeals', defaultValue: [])
      required final List<ComboDealMaterialSetDto> materialComboDeals,
      @JsonKey(name: 'flexiTierRule', defaultValue: [])
      required final List<ComboDealTierRuleDto> flexiTierRule})
      : _flexiSKUTier = flexiSKUTier,
        _flexiQtyTier = flexiQtyTier,
        _flexiAmountTier = flexiAmountTier,
        _materialComboDeals = materialComboDeals,
        _flexiTierRule = flexiTierRule,
        super._();

  factory _$ComboDealDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComboDealDtoImplFromJson(json);

  @override
  @JsonKey(name: 'groupDeal')
  final ComboDealGroupDealDto groupDeal;
  final List<ComboDealSKUTierDto> _flexiSKUTier;
  @override
  @JsonKey(name: 'flexiSKUTier', defaultValue: [])
  List<ComboDealSKUTierDto> get flexiSKUTier {
    if (_flexiSKUTier is EqualUnmodifiableListView) return _flexiSKUTier;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flexiSKUTier);
  }

  final List<ComboDealQtyTierDto> _flexiQtyTier;
  @override
  @JsonKey(name: 'flexiQtyTier', defaultValue: [])
  List<ComboDealQtyTierDto> get flexiQtyTier {
    if (_flexiQtyTier is EqualUnmodifiableListView) return _flexiQtyTier;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flexiQtyTier);
  }

  final List<ComboDealAmountTierDto> _flexiAmountTier;
  @override
  @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
  List<ComboDealAmountTierDto> get flexiAmountTier {
    if (_flexiAmountTier is EqualUnmodifiableListView) return _flexiAmountTier;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flexiAmountTier);
  }

  final List<ComboDealMaterialSetDto> _materialComboDeals;
  @override
  @JsonKey(name: 'materialComboDeals', defaultValue: [])
  List<ComboDealMaterialSetDto> get materialComboDeals {
    if (_materialComboDeals is EqualUnmodifiableListView)
      return _materialComboDeals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialComboDeals);
  }

  final List<ComboDealTierRuleDto> _flexiTierRule;
  @override
  @JsonKey(name: 'flexiTierRule', defaultValue: [])
  List<ComboDealTierRuleDto> get flexiTierRule {
    if (_flexiTierRule is EqualUnmodifiableListView) return _flexiTierRule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flexiTierRule);
  }

  @override
  String toString() {
    return 'ComboDealDto(groupDeal: $groupDeal, flexiSKUTier: $flexiSKUTier, flexiQtyTier: $flexiQtyTier, flexiAmountTier: $flexiAmountTier, materialComboDeals: $materialComboDeals, flexiTierRule: $flexiTierRule)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComboDealDtoImpl &&
            (identical(other.groupDeal, groupDeal) ||
                other.groupDeal == groupDeal) &&
            const DeepCollectionEquality()
                .equals(other._flexiSKUTier, _flexiSKUTier) &&
            const DeepCollectionEquality()
                .equals(other._flexiQtyTier, _flexiQtyTier) &&
            const DeepCollectionEquality()
                .equals(other._flexiAmountTier, _flexiAmountTier) &&
            const DeepCollectionEquality()
                .equals(other._materialComboDeals, _materialComboDeals) &&
            const DeepCollectionEquality()
                .equals(other._flexiTierRule, _flexiTierRule));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      groupDeal,
      const DeepCollectionEquality().hash(_flexiSKUTier),
      const DeepCollectionEquality().hash(_flexiQtyTier),
      const DeepCollectionEquality().hash(_flexiAmountTier),
      const DeepCollectionEquality().hash(_materialComboDeals),
      const DeepCollectionEquality().hash(_flexiTierRule));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComboDealDtoImplCopyWith<_$ComboDealDtoImpl> get copyWith =>
      __$$ComboDealDtoImplCopyWithImpl<_$ComboDealDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComboDealDtoImplToJson(
      this,
    );
  }
}

abstract class _ComboDealDto extends ComboDealDto {
  const factory _ComboDealDto(
          {@JsonKey(name: 'groupDeal') final ComboDealGroupDealDto groupDeal,
          @JsonKey(name: 'flexiSKUTier', defaultValue: [])
          required final List<ComboDealSKUTierDto> flexiSKUTier,
          @JsonKey(name: 'flexiQtyTier', defaultValue: [])
          required final List<ComboDealQtyTierDto> flexiQtyTier,
          @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
          required final List<ComboDealAmountTierDto> flexiAmountTier,
          @JsonKey(name: 'materialComboDeals', defaultValue: [])
          required final List<ComboDealMaterialSetDto> materialComboDeals,
          @JsonKey(name: 'flexiTierRule', defaultValue: [])
          required final List<ComboDealTierRuleDto> flexiTierRule}) =
      _$ComboDealDtoImpl;
  const _ComboDealDto._() : super._();

  factory _ComboDealDto.fromJson(Map<String, dynamic> json) =
      _$ComboDealDtoImpl.fromJson;

  @override
  @JsonKey(name: 'groupDeal')
  ComboDealGroupDealDto get groupDeal;
  @override
  @JsonKey(name: 'flexiSKUTier', defaultValue: [])
  List<ComboDealSKUTierDto> get flexiSKUTier;
  @override
  @JsonKey(name: 'flexiQtyTier', defaultValue: [])
  List<ComboDealQtyTierDto> get flexiQtyTier;
  @override
  @JsonKey(name: 'flexiAmmountTier', defaultValue: [])
  List<ComboDealAmountTierDto> get flexiAmountTier;
  @override
  @JsonKey(name: 'materialComboDeals', defaultValue: [])
  List<ComboDealMaterialSetDto> get materialComboDeals;
  @override
  @JsonKey(name: 'flexiTierRule', defaultValue: [])
  List<ComboDealTierRuleDto> get flexiTierRule;
  @override
  @JsonKey(ignore: true)
  _$$ComboDealDtoImplCopyWith<_$ComboDealDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
