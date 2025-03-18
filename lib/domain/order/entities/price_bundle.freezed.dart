// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PriceBundle {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get conditions => throw _privateConstructorUsedError;
  bool get bonusEligible => throw _privateConstructorUsedError;
  List<PriceBundleItem> get information => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceBundleCopyWith<PriceBundle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceBundleCopyWith<$Res> {
  factory $PriceBundleCopyWith(
          PriceBundle value, $Res Function(PriceBundle) then) =
      _$PriceBundleCopyWithImpl<$Res, PriceBundle>;
  @useResult
  $Res call(
      {String name,
      String code,
      String conditions,
      bool bonusEligible,
      List<PriceBundleItem> information});
}

/// @nodoc
class _$PriceBundleCopyWithImpl<$Res, $Val extends PriceBundle>
    implements $PriceBundleCopyWith<$Res> {
  _$PriceBundleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? conditions = null,
    Object? bonusEligible = null,
    Object? information = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      bonusEligible: null == bonusEligible
          ? _value.bonusEligible
          : bonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceBundleImplCopyWith<$Res>
    implements $PriceBundleCopyWith<$Res> {
  factory _$$PriceBundleImplCopyWith(
          _$PriceBundleImpl value, $Res Function(_$PriceBundleImpl) then) =
      __$$PriceBundleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String code,
      String conditions,
      bool bonusEligible,
      List<PriceBundleItem> information});
}

/// @nodoc
class __$$PriceBundleImplCopyWithImpl<$Res>
    extends _$PriceBundleCopyWithImpl<$Res, _$PriceBundleImpl>
    implements _$$PriceBundleImplCopyWith<$Res> {
  __$$PriceBundleImplCopyWithImpl(
      _$PriceBundleImpl _value, $Res Function(_$PriceBundleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? conditions = null,
    Object? bonusEligible = null,
    Object? information = null,
  }) {
    return _then(_$PriceBundleImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      bonusEligible: null == bonusEligible
          ? _value.bonusEligible
          : bonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      information: null == information
          ? _value._information
          : information // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleItem>,
    ));
  }
}

/// @nodoc

class _$PriceBundleImpl extends _PriceBundle {
  const _$PriceBundleImpl(
      {required this.name,
      required this.code,
      required this.conditions,
      required this.bonusEligible,
      required final List<PriceBundleItem> information})
      : _information = information,
        super._();

  @override
  final String name;
  @override
  final String code;
  @override
  final String conditions;
  @override
  final bool bonusEligible;
  final List<PriceBundleItem> _information;
  @override
  List<PriceBundleItem> get information {
    if (_information is EqualUnmodifiableListView) return _information;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_information);
  }

  @override
  String toString() {
    return 'PriceBundle(name: $name, code: $code, conditions: $conditions, bonusEligible: $bonusEligible, information: $information)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceBundleImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.bonusEligible, bonusEligible) ||
                other.bonusEligible == bonusEligible) &&
            const DeepCollectionEquality()
                .equals(other._information, _information));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, code, conditions,
      bonusEligible, const DeepCollectionEquality().hash(_information));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceBundleImplCopyWith<_$PriceBundleImpl> get copyWith =>
      __$$PriceBundleImplCopyWithImpl<_$PriceBundleImpl>(this, _$identity);
}

abstract class _PriceBundle extends PriceBundle {
  const factory _PriceBundle(
      {required final String name,
      required final String code,
      required final String conditions,
      required final bool bonusEligible,
      required final List<PriceBundleItem> information}) = _$PriceBundleImpl;
  const _PriceBundle._() : super._();

  @override
  String get name;
  @override
  String get code;
  @override
  String get conditions;
  @override
  bool get bonusEligible;
  @override
  List<PriceBundleItem> get information;
  @override
  @JsonKey(ignore: true)
  _$$PriceBundleImplCopyWith<_$PriceBundleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PriceBundleItem {
  String get type => throw _privateConstructorUsedError;
  int get sequence => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceBundleItemCopyWith<PriceBundleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceBundleItemCopyWith<$Res> {
  factory $PriceBundleItemCopyWith(
          PriceBundleItem value, $Res Function(PriceBundleItem) then) =
      _$PriceBundleItemCopyWithImpl<$Res, PriceBundleItem>;
  @useResult
  $Res call({String type, int sequence, int quantity, double rate});
}

/// @nodoc
class _$PriceBundleItemCopyWithImpl<$Res, $Val extends PriceBundleItem>
    implements $PriceBundleItemCopyWith<$Res> {
  _$PriceBundleItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? sequence = null,
    Object? quantity = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceBundleItemImplCopyWith<$Res>
    implements $PriceBundleItemCopyWith<$Res> {
  factory _$$PriceBundleItemImplCopyWith(_$PriceBundleItemImpl value,
          $Res Function(_$PriceBundleItemImpl) then) =
      __$$PriceBundleItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, int sequence, int quantity, double rate});
}

/// @nodoc
class __$$PriceBundleItemImplCopyWithImpl<$Res>
    extends _$PriceBundleItemCopyWithImpl<$Res, _$PriceBundleItemImpl>
    implements _$$PriceBundleItemImplCopyWith<$Res> {
  __$$PriceBundleItemImplCopyWithImpl(
      _$PriceBundleItemImpl _value, $Res Function(_$PriceBundleItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? sequence = null,
    Object? quantity = null,
    Object? rate = null,
  }) {
    return _then(_$PriceBundleItemImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc

class _$PriceBundleItemImpl extends _PriceBundleItem {
  const _$PriceBundleItemImpl(
      {required this.type,
      required this.sequence,
      required this.quantity,
      required this.rate})
      : super._();

  @override
  final String type;
  @override
  final int sequence;
  @override
  final int quantity;
  @override
  final double rate;

  @override
  String toString() {
    return 'PriceBundleItem(type: $type, sequence: $sequence, quantity: $quantity, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceBundleItemImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, sequence, quantity, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceBundleItemImplCopyWith<_$PriceBundleItemImpl> get copyWith =>
      __$$PriceBundleItemImplCopyWithImpl<_$PriceBundleItemImpl>(
          this, _$identity);
}

abstract class _PriceBundleItem extends PriceBundleItem {
  const factory _PriceBundleItem(
      {required final String type,
      required final int sequence,
      required final int quantity,
      required final double rate}) = _$PriceBundleItemImpl;
  const _PriceBundleItem._() : super._();

  @override
  String get type;
  @override
  int get sequence;
  @override
  int get quantity;
  @override
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$PriceBundleItemImplCopyWith<_$PriceBundleItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
