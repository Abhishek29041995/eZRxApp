// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_tier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PriceTier {
  List<PriceTierItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceTierCopyWith<PriceTier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceTierCopyWith<$Res> {
  factory $PriceTierCopyWith(PriceTier value, $Res Function(PriceTier) then) =
      _$PriceTierCopyWithImpl<$Res, PriceTier>;
  @useResult
  $Res call({List<PriceTierItem> items});
}

/// @nodoc
class _$PriceTierCopyWithImpl<$Res, $Val extends PriceTier>
    implements $PriceTierCopyWith<$Res> {
  _$PriceTierCopyWithImpl(this._value, this._then);

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
              as List<PriceTierItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceTierImplCopyWith<$Res>
    implements $PriceTierCopyWith<$Res> {
  factory _$$PriceTierImplCopyWith(
          _$PriceTierImpl value, $Res Function(_$PriceTierImpl) then) =
      __$$PriceTierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PriceTierItem> items});
}

/// @nodoc
class __$$PriceTierImplCopyWithImpl<$Res>
    extends _$PriceTierCopyWithImpl<$Res, _$PriceTierImpl>
    implements _$$PriceTierImplCopyWith<$Res> {
  __$$PriceTierImplCopyWithImpl(
      _$PriceTierImpl _value, $Res Function(_$PriceTierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$PriceTierImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceTierItem>,
    ));
  }
}

/// @nodoc

class _$PriceTierImpl extends _PriceTier {
  const _$PriceTierImpl({required final List<PriceTierItem> items})
      : _items = items,
        super._();

  final List<PriceTierItem> _items;
  @override
  List<PriceTierItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PriceTier(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceTierImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceTierImplCopyWith<_$PriceTierImpl> get copyWith =>
      __$$PriceTierImplCopyWithImpl<_$PriceTierImpl>(this, _$identity);
}

abstract class _PriceTier extends PriceTier {
  const factory _PriceTier({required final List<PriceTierItem> items}) =
      _$PriceTierImpl;
  const _PriceTier._() : super._();

  @override
  List<PriceTierItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$PriceTierImplCopyWith<_$PriceTierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PriceTierItem {
  String get type => throw _privateConstructorUsedError;
  bool get applyBonus => throw _privateConstructorUsedError;
  int get sequence => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  double get minAmount => throw _privateConstructorUsedError;
  ScaleBasis get scaleBasis => throw _privateConstructorUsedError;
  double get promotionAmount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceTierItemCopyWith<PriceTierItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceTierItemCopyWith<$Res> {
  factory $PriceTierItemCopyWith(
          PriceTierItem value, $Res Function(PriceTierItem) then) =
      _$PriceTierItemCopyWithImpl<$Res, PriceTierItem>;
  @useResult
  $Res call(
      {String type,
      bool applyBonus,
      int sequence,
      int quantity,
      double rate,
      double percentage,
      double minAmount,
      ScaleBasis scaleBasis,
      double promotionAmount});
}

/// @nodoc
class _$PriceTierItemCopyWithImpl<$Res, $Val extends PriceTierItem>
    implements $PriceTierItemCopyWith<$Res> {
  _$PriceTierItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? applyBonus = null,
    Object? sequence = null,
    Object? quantity = null,
    Object? rate = null,
    Object? percentage = null,
    Object? minAmount = null,
    Object? scaleBasis = null,
    Object? promotionAmount = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      applyBonus: null == applyBonus
          ? _value.applyBonus
          : applyBonus // ignore: cast_nullable_to_non_nullable
              as bool,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      minAmount: null == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scaleBasis: null == scaleBasis
          ? _value.scaleBasis
          : scaleBasis // ignore: cast_nullable_to_non_nullable
              as ScaleBasis,
      promotionAmount: null == promotionAmount
          ? _value.promotionAmount
          : promotionAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceTierItemImplCopyWith<$Res>
    implements $PriceTierItemCopyWith<$Res> {
  factory _$$PriceTierItemImplCopyWith(
          _$PriceTierItemImpl value, $Res Function(_$PriceTierItemImpl) then) =
      __$$PriceTierItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      bool applyBonus,
      int sequence,
      int quantity,
      double rate,
      double percentage,
      double minAmount,
      ScaleBasis scaleBasis,
      double promotionAmount});
}

/// @nodoc
class __$$PriceTierItemImplCopyWithImpl<$Res>
    extends _$PriceTierItemCopyWithImpl<$Res, _$PriceTierItemImpl>
    implements _$$PriceTierItemImplCopyWith<$Res> {
  __$$PriceTierItemImplCopyWithImpl(
      _$PriceTierItemImpl _value, $Res Function(_$PriceTierItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? applyBonus = null,
    Object? sequence = null,
    Object? quantity = null,
    Object? rate = null,
    Object? percentage = null,
    Object? minAmount = null,
    Object? scaleBasis = null,
    Object? promotionAmount = null,
  }) {
    return _then(_$PriceTierItemImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      applyBonus: null == applyBonus
          ? _value.applyBonus
          : applyBonus // ignore: cast_nullable_to_non_nullable
              as bool,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      minAmount: null == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scaleBasis: null == scaleBasis
          ? _value.scaleBasis
          : scaleBasis // ignore: cast_nullable_to_non_nullable
              as ScaleBasis,
      promotionAmount: null == promotionAmount
          ? _value.promotionAmount
          : promotionAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PriceTierItemImpl extends _PriceTierItem {
  const _$PriceTierItemImpl(
      {required this.type,
      required this.applyBonus,
      required this.sequence,
      required this.quantity,
      required this.rate,
      required this.percentage,
      required this.minAmount,
      required this.scaleBasis,
      required this.promotionAmount})
      : super._();

  @override
  final String type;
  @override
  final bool applyBonus;
  @override
  final int sequence;
  @override
  final int quantity;
  @override
  final double rate;
  @override
  final double percentage;
  @override
  final double minAmount;
  @override
  final ScaleBasis scaleBasis;
  @override
  final double promotionAmount;

  @override
  String toString() {
    return 'PriceTierItem(type: $type, applyBonus: $applyBonus, sequence: $sequence, quantity: $quantity, rate: $rate, percentage: $percentage, minAmount: $minAmount, scaleBasis: $scaleBasis, promotionAmount: $promotionAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceTierItemImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.applyBonus, applyBonus) ||
                other.applyBonus == applyBonus) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.scaleBasis, scaleBasis) ||
                other.scaleBasis == scaleBasis) &&
            (identical(other.promotionAmount, promotionAmount) ||
                other.promotionAmount == promotionAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, applyBonus, sequence,
      quantity, rate, percentage, minAmount, scaleBasis, promotionAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceTierItemImplCopyWith<_$PriceTierItemImpl> get copyWith =>
      __$$PriceTierItemImplCopyWithImpl<_$PriceTierItemImpl>(this, _$identity);
}

abstract class _PriceTierItem extends PriceTierItem {
  const factory _PriceTierItem(
      {required final String type,
      required final bool applyBonus,
      required final int sequence,
      required final int quantity,
      required final double rate,
      required final double percentage,
      required final double minAmount,
      required final ScaleBasis scaleBasis,
      required final double promotionAmount}) = _$PriceTierItemImpl;
  const _PriceTierItem._() : super._();

  @override
  String get type;
  @override
  bool get applyBonus;
  @override
  int get sequence;
  @override
  int get quantity;
  @override
  double get rate;
  @override
  double get percentage;
  @override
  double get minAmount;
  @override
  ScaleBasis get scaleBasis;
  @override
  double get promotionAmount;
  @override
  @JsonKey(ignore: true)
  _$$PriceTierItemImplCopyWith<_$PriceTierItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
