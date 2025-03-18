// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo_deal_sku_tier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ComboDealSKUTier {
  double get rate => throw _privateConstructorUsedError;
  String get conditionNumber => throw _privateConstructorUsedError;
  int get minQty => throw _privateConstructorUsedError;
  DiscountType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComboDealSKUTierCopyWith<ComboDealSKUTier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealSKUTierCopyWith<$Res> {
  factory $ComboDealSKUTierCopyWith(
          ComboDealSKUTier value, $Res Function(ComboDealSKUTier) then) =
      _$ComboDealSKUTierCopyWithImpl<$Res, ComboDealSKUTier>;
  @useResult
  $Res call(
      {double rate, String conditionNumber, int minQty, DiscountType type});
}

/// @nodoc
class _$ComboDealSKUTierCopyWithImpl<$Res, $Val extends ComboDealSKUTier>
    implements $ComboDealSKUTierCopyWith<$Res> {
  _$ComboDealSKUTierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? conditionNumber = null,
    Object? minQty = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComboDealSKUTierImplCopyWith<$Res>
    implements $ComboDealSKUTierCopyWith<$Res> {
  factory _$$ComboDealSKUTierImplCopyWith(_$ComboDealSKUTierImpl value,
          $Res Function(_$ComboDealSKUTierImpl) then) =
      __$$ComboDealSKUTierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double rate, String conditionNumber, int minQty, DiscountType type});
}

/// @nodoc
class __$$ComboDealSKUTierImplCopyWithImpl<$Res>
    extends _$ComboDealSKUTierCopyWithImpl<$Res, _$ComboDealSKUTierImpl>
    implements _$$ComboDealSKUTierImplCopyWith<$Res> {
  __$$ComboDealSKUTierImplCopyWithImpl(_$ComboDealSKUTierImpl _value,
      $Res Function(_$ComboDealSKUTierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? conditionNumber = null,
    Object? minQty = null,
    Object? type = null,
  }) {
    return _then(_$ComboDealSKUTierImpl(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
    ));
  }
}

/// @nodoc

class _$ComboDealSKUTierImpl extends _ComboDealSKUTier {
  const _$ComboDealSKUTierImpl(
      {required this.rate,
      required this.conditionNumber,
      required this.minQty,
      required this.type})
      : super._();

  @override
  final double rate;
  @override
  final String conditionNumber;
  @override
  final int minQty;
  @override
  final DiscountType type;

  @override
  String toString() {
    return 'ComboDealSKUTier(rate: $rate, conditionNumber: $conditionNumber, minQty: $minQty, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComboDealSKUTierImpl &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.conditionNumber, conditionNumber) ||
                other.conditionNumber == conditionNumber) &&
            (identical(other.minQty, minQty) || other.minQty == minQty) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, rate, conditionNumber, minQty, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComboDealSKUTierImplCopyWith<_$ComboDealSKUTierImpl> get copyWith =>
      __$$ComboDealSKUTierImplCopyWithImpl<_$ComboDealSKUTierImpl>(
          this, _$identity);
}

abstract class _ComboDealSKUTier extends ComboDealSKUTier {
  const factory _ComboDealSKUTier(
      {required final double rate,
      required final String conditionNumber,
      required final int minQty,
      required final DiscountType type}) = _$ComboDealSKUTierImpl;
  const _ComboDealSKUTier._() : super._();

  @override
  double get rate;
  @override
  String get conditionNumber;
  @override
  int get minQty;
  @override
  DiscountType get type;
  @override
  @JsonKey(ignore: true)
  _$$ComboDealSKUTierImplCopyWith<_$ComboDealSKUTierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
