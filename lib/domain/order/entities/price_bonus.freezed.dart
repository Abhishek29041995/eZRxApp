// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_bonus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PriceBonus {
  List<PriceBonusItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceBonusCopyWith<PriceBonus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceBonusCopyWith<$Res> {
  factory $PriceBonusCopyWith(
          PriceBonus value, $Res Function(PriceBonus) then) =
      _$PriceBonusCopyWithImpl<$Res, PriceBonus>;
  @useResult
  $Res call({List<PriceBonusItem> items});
}

/// @nodoc
class _$PriceBonusCopyWithImpl<$Res, $Val extends PriceBonus>
    implements $PriceBonusCopyWith<$Res> {
  _$PriceBonusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceBonusImplCopyWith<$Res>
    implements $PriceBonusCopyWith<$Res> {
  factory _$$PriceBonusImplCopyWith(
          _$PriceBonusImpl value, $Res Function(_$PriceBonusImpl) then) =
      __$$PriceBonusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PriceBonusItem> items});
}

/// @nodoc
class __$$PriceBonusImplCopyWithImpl<$Res>
    extends _$PriceBonusCopyWithImpl<$Res, _$PriceBonusImpl>
    implements _$$PriceBonusImplCopyWith<$Res> {
  __$$PriceBonusImplCopyWithImpl(
      _$PriceBonusImpl _value, $Res Function(_$PriceBonusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$PriceBonusImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusItem>,
    ));
  }
}

/// @nodoc

class _$PriceBonusImpl extends _PriceBonus {
  const _$PriceBonusImpl({required final List<PriceBonusItem> items})
      : _items = items,
        super._();

  final List<PriceBonusItem> _items;
  @override
  List<PriceBonusItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PriceBonus(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceBonusImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceBonusImplCopyWith<_$PriceBonusImpl> get copyWith =>
      __$$PriceBonusImplCopyWithImpl<_$PriceBonusImpl>(this, _$identity);
}

abstract class _PriceBonus extends PriceBonus {
  const factory _PriceBonus({required final List<PriceBonusItem> items}) =
      _$PriceBonusImpl;
  const _PriceBonus._() : super._();

  @override
  List<PriceBonusItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$PriceBonusImplCopyWith<_$PriceBonusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PriceBonusItem {
  BonusMaterialCalculation get calculation =>
      throw _privateConstructorUsedError;
  int get qualifyingQuantity => throw _privateConstructorUsedError;
  List<BonusMaterial> get bonusMaterials => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceBonusItemCopyWith<PriceBonusItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceBonusItemCopyWith<$Res> {
  factory $PriceBonusItemCopyWith(
          PriceBonusItem value, $Res Function(PriceBonusItem) then) =
      _$PriceBonusItemCopyWithImpl<$Res, PriceBonusItem>;
  @useResult
  $Res call(
      {BonusMaterialCalculation calculation,
      int qualifyingQuantity,
      List<BonusMaterial> bonusMaterials});
}

/// @nodoc
class _$PriceBonusItemCopyWithImpl<$Res, $Val extends PriceBonusItem>
    implements $PriceBonusItemCopyWith<$Res> {
  _$PriceBonusItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculation = null,
    Object? qualifyingQuantity = null,
    Object? bonusMaterials = null,
  }) {
    return _then(_value.copyWith(
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as BonusMaterialCalculation,
      qualifyingQuantity: null == qualifyingQuantity
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusMaterials: null == bonusMaterials
          ? _value.bonusMaterials
          : bonusMaterials // ignore: cast_nullable_to_non_nullable
              as List<BonusMaterial>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceBonusItemImplCopyWith<$Res>
    implements $PriceBonusItemCopyWith<$Res> {
  factory _$$PriceBonusItemImplCopyWith(_$PriceBonusItemImpl value,
          $Res Function(_$PriceBonusItemImpl) then) =
      __$$PriceBonusItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BonusMaterialCalculation calculation,
      int qualifyingQuantity,
      List<BonusMaterial> bonusMaterials});
}

/// @nodoc
class __$$PriceBonusItemImplCopyWithImpl<$Res>
    extends _$PriceBonusItemCopyWithImpl<$Res, _$PriceBonusItemImpl>
    implements _$$PriceBonusItemImplCopyWith<$Res> {
  __$$PriceBonusItemImplCopyWithImpl(
      _$PriceBonusItemImpl _value, $Res Function(_$PriceBonusItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculation = null,
    Object? qualifyingQuantity = null,
    Object? bonusMaterials = null,
  }) {
    return _then(_$PriceBonusItemImpl(
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as BonusMaterialCalculation,
      qualifyingQuantity: null == qualifyingQuantity
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusMaterials: null == bonusMaterials
          ? _value._bonusMaterials
          : bonusMaterials // ignore: cast_nullable_to_non_nullable
              as List<BonusMaterial>,
    ));
  }
}

/// @nodoc

class _$PriceBonusItemImpl extends _PriceBonusItem {
  const _$PriceBonusItemImpl(
      {required this.calculation,
      required this.qualifyingQuantity,
      required final List<BonusMaterial> bonusMaterials})
      : _bonusMaterials = bonusMaterials,
        super._();

  @override
  final BonusMaterialCalculation calculation;
  @override
  final int qualifyingQuantity;
  final List<BonusMaterial> _bonusMaterials;
  @override
  List<BonusMaterial> get bonusMaterials {
    if (_bonusMaterials is EqualUnmodifiableListView) return _bonusMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonusMaterials);
  }

  @override
  String toString() {
    return 'PriceBonusItem(calculation: $calculation, qualifyingQuantity: $qualifyingQuantity, bonusMaterials: $bonusMaterials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceBonusItemImpl &&
            (identical(other.calculation, calculation) ||
                other.calculation == calculation) &&
            (identical(other.qualifyingQuantity, qualifyingQuantity) ||
                other.qualifyingQuantity == qualifyingQuantity) &&
            const DeepCollectionEquality()
                .equals(other._bonusMaterials, _bonusMaterials));
  }

  @override
  int get hashCode => Object.hash(runtimeType, calculation, qualifyingQuantity,
      const DeepCollectionEquality().hash(_bonusMaterials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceBonusItemImplCopyWith<_$PriceBonusItemImpl> get copyWith =>
      __$$PriceBonusItemImplCopyWithImpl<_$PriceBonusItemImpl>(
          this, _$identity);
}

abstract class _PriceBonusItem extends PriceBonusItem {
  const factory _PriceBonusItem(
          {required final BonusMaterialCalculation calculation,
          required final int qualifyingQuantity,
          required final List<BonusMaterial> bonusMaterials}) =
      _$PriceBonusItemImpl;
  const _PriceBonusItem._() : super._();

  @override
  BonusMaterialCalculation get calculation;
  @override
  int get qualifyingQuantity;
  @override
  List<BonusMaterial> get bonusMaterials;
  @override
  @JsonKey(ignore: true)
  _$$PriceBonusItemImplCopyWith<_$PriceBonusItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BonusMaterial {
  int get id => throw _privateConstructorUsedError;
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  String get materialDescription => throw _privateConstructorUsedError;
  BonusMaterialCalculation get calculation =>
      throw _privateConstructorUsedError;
  int get bonusRatio => throw _privateConstructorUsedError;
  int get qualifyingQuantity => throw _privateConstructorUsedError;
  int get bonusQuantity => throw _privateConstructorUsedError;
  int get limitPerTransaction => throw _privateConstructorUsedError;
  String get conditionId => throw _privateConstructorUsedError;
  MaterialCode get oldMaterialCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BonusMaterialCopyWith<BonusMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BonusMaterialCopyWith<$Res> {
  factory $BonusMaterialCopyWith(
          BonusMaterial value, $Res Function(BonusMaterial) then) =
      _$BonusMaterialCopyWithImpl<$Res, BonusMaterial>;
  @useResult
  $Res call(
      {int id,
      MaterialNumber materialNumber,
      String materialDescription,
      BonusMaterialCalculation calculation,
      int bonusRatio,
      int qualifyingQuantity,
      int bonusQuantity,
      int limitPerTransaction,
      String conditionId,
      MaterialCode oldMaterialCode});
}

/// @nodoc
class _$BonusMaterialCopyWithImpl<$Res, $Val extends BonusMaterial>
    implements $BonusMaterialCopyWith<$Res> {
  _$BonusMaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? calculation = null,
    Object? bonusRatio = null,
    Object? qualifyingQuantity = null,
    Object? bonusQuantity = null,
    Object? limitPerTransaction = null,
    Object? conditionId = null,
    Object? oldMaterialCode = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as BonusMaterialCalculation,
      bonusRatio: null == bonusRatio
          ? _value.bonusRatio
          : bonusRatio // ignore: cast_nullable_to_non_nullable
              as int,
      qualifyingQuantity: null == qualifyingQuantity
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusQuantity: null == bonusQuantity
          ? _value.bonusQuantity
          : bonusQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      limitPerTransaction: null == limitPerTransaction
          ? _value.limitPerTransaction
          : limitPerTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      conditionId: null == conditionId
          ? _value.conditionId
          : conditionId // ignore: cast_nullable_to_non_nullable
              as String,
      oldMaterialCode: null == oldMaterialCode
          ? _value.oldMaterialCode
          : oldMaterialCode // ignore: cast_nullable_to_non_nullable
              as MaterialCode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BonusMaterialImplCopyWith<$Res>
    implements $BonusMaterialCopyWith<$Res> {
  factory _$$BonusMaterialImplCopyWith(
          _$BonusMaterialImpl value, $Res Function(_$BonusMaterialImpl) then) =
      __$$BonusMaterialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      MaterialNumber materialNumber,
      String materialDescription,
      BonusMaterialCalculation calculation,
      int bonusRatio,
      int qualifyingQuantity,
      int bonusQuantity,
      int limitPerTransaction,
      String conditionId,
      MaterialCode oldMaterialCode});
}

/// @nodoc
class __$$BonusMaterialImplCopyWithImpl<$Res>
    extends _$BonusMaterialCopyWithImpl<$Res, _$BonusMaterialImpl>
    implements _$$BonusMaterialImplCopyWith<$Res> {
  __$$BonusMaterialImplCopyWithImpl(
      _$BonusMaterialImpl _value, $Res Function(_$BonusMaterialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? calculation = null,
    Object? bonusRatio = null,
    Object? qualifyingQuantity = null,
    Object? bonusQuantity = null,
    Object? limitPerTransaction = null,
    Object? conditionId = null,
    Object? oldMaterialCode = null,
  }) {
    return _then(_$BonusMaterialImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as BonusMaterialCalculation,
      bonusRatio: null == bonusRatio
          ? _value.bonusRatio
          : bonusRatio // ignore: cast_nullable_to_non_nullable
              as int,
      qualifyingQuantity: null == qualifyingQuantity
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusQuantity: null == bonusQuantity
          ? _value.bonusQuantity
          : bonusQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      limitPerTransaction: null == limitPerTransaction
          ? _value.limitPerTransaction
          : limitPerTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      conditionId: null == conditionId
          ? _value.conditionId
          : conditionId // ignore: cast_nullable_to_non_nullable
              as String,
      oldMaterialCode: null == oldMaterialCode
          ? _value.oldMaterialCode
          : oldMaterialCode // ignore: cast_nullable_to_non_nullable
              as MaterialCode,
    ));
  }
}

/// @nodoc

class _$BonusMaterialImpl extends _BonusMaterial {
  const _$BonusMaterialImpl(
      {required this.id,
      required this.materialNumber,
      required this.materialDescription,
      required this.calculation,
      required this.bonusRatio,
      required this.qualifyingQuantity,
      required this.bonusQuantity,
      required this.limitPerTransaction,
      required this.conditionId,
      required this.oldMaterialCode})
      : super._();

  @override
  final int id;
  @override
  final MaterialNumber materialNumber;
  @override
  final String materialDescription;
  @override
  final BonusMaterialCalculation calculation;
  @override
  final int bonusRatio;
  @override
  final int qualifyingQuantity;
  @override
  final int bonusQuantity;
  @override
  final int limitPerTransaction;
  @override
  final String conditionId;
  @override
  final MaterialCode oldMaterialCode;

  @override
  String toString() {
    return 'BonusMaterial(id: $id, materialNumber: $materialNumber, materialDescription: $materialDescription, calculation: $calculation, bonusRatio: $bonusRatio, qualifyingQuantity: $qualifyingQuantity, bonusQuantity: $bonusQuantity, limitPerTransaction: $limitPerTransaction, conditionId: $conditionId, oldMaterialCode: $oldMaterialCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BonusMaterialImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.calculation, calculation) ||
                other.calculation == calculation) &&
            (identical(other.bonusRatio, bonusRatio) ||
                other.bonusRatio == bonusRatio) &&
            (identical(other.qualifyingQuantity, qualifyingQuantity) ||
                other.qualifyingQuantity == qualifyingQuantity) &&
            (identical(other.bonusQuantity, bonusQuantity) ||
                other.bonusQuantity == bonusQuantity) &&
            (identical(other.limitPerTransaction, limitPerTransaction) ||
                other.limitPerTransaction == limitPerTransaction) &&
            (identical(other.conditionId, conditionId) ||
                other.conditionId == conditionId) &&
            (identical(other.oldMaterialCode, oldMaterialCode) ||
                other.oldMaterialCode == oldMaterialCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      materialNumber,
      materialDescription,
      calculation,
      bonusRatio,
      qualifyingQuantity,
      bonusQuantity,
      limitPerTransaction,
      conditionId,
      oldMaterialCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BonusMaterialImplCopyWith<_$BonusMaterialImpl> get copyWith =>
      __$$BonusMaterialImplCopyWithImpl<_$BonusMaterialImpl>(this, _$identity);
}

abstract class _BonusMaterial extends BonusMaterial {
  const factory _BonusMaterial(
      {required final int id,
      required final MaterialNumber materialNumber,
      required final String materialDescription,
      required final BonusMaterialCalculation calculation,
      required final int bonusRatio,
      required final int qualifyingQuantity,
      required final int bonusQuantity,
      required final int limitPerTransaction,
      required final String conditionId,
      required final MaterialCode oldMaterialCode}) = _$BonusMaterialImpl;
  const _BonusMaterial._() : super._();

  @override
  int get id;
  @override
  MaterialNumber get materialNumber;
  @override
  String get materialDescription;
  @override
  BonusMaterialCalculation get calculation;
  @override
  int get bonusRatio;
  @override
  int get qualifyingQuantity;
  @override
  int get bonusQuantity;
  @override
  int get limitPerTransaction;
  @override
  String get conditionId;
  @override
  MaterialCode get oldMaterialCode;
  @override
  @JsonKey(ignore: true)
  _$$BonusMaterialImplCopyWith<_$BonusMaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
