// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo_deal_qty_tier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ComboDealQtyTier {
  double get rate => throw _privateConstructorUsedError;
  String get conditionNumber => throw _privateConstructorUsedError;
  int get minQty => throw _privateConstructorUsedError;
  DiscountType get type => throw _privateConstructorUsedError;
  ComboSuffix get suffix => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComboDealQtyTierCopyWith<ComboDealQtyTier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealQtyTierCopyWith<$Res> {
  factory $ComboDealQtyTierCopyWith(
          ComboDealQtyTier value, $Res Function(ComboDealQtyTier) then) =
      _$ComboDealQtyTierCopyWithImpl<$Res, ComboDealQtyTier>;
  @useResult
  $Res call(
      {double rate,
      String conditionNumber,
      int minQty,
      DiscountType type,
      ComboSuffix suffix});
}

/// @nodoc
class _$ComboDealQtyTierCopyWithImpl<$Res, $Val extends ComboDealQtyTier>
    implements $ComboDealQtyTierCopyWith<$Res> {
  _$ComboDealQtyTierCopyWithImpl(this._value, this._then);

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
    Object? suffix = null,
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
      suffix: null == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as ComboSuffix,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComboDealQtyTierImplCopyWith<$Res>
    implements $ComboDealQtyTierCopyWith<$Res> {
  factory _$$ComboDealQtyTierImplCopyWith(_$ComboDealQtyTierImpl value,
          $Res Function(_$ComboDealQtyTierImpl) then) =
      __$$ComboDealQtyTierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double rate,
      String conditionNumber,
      int minQty,
      DiscountType type,
      ComboSuffix suffix});
}

/// @nodoc
class __$$ComboDealQtyTierImplCopyWithImpl<$Res>
    extends _$ComboDealQtyTierCopyWithImpl<$Res, _$ComboDealQtyTierImpl>
    implements _$$ComboDealQtyTierImplCopyWith<$Res> {
  __$$ComboDealQtyTierImplCopyWithImpl(_$ComboDealQtyTierImpl _value,
      $Res Function(_$ComboDealQtyTierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? conditionNumber = null,
    Object? minQty = null,
    Object? type = null,
    Object? suffix = null,
  }) {
    return _then(_$ComboDealQtyTierImpl(
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
      suffix: null == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as ComboSuffix,
    ));
  }
}

/// @nodoc

class _$ComboDealQtyTierImpl extends _ComboDealQtyTier {
  const _$ComboDealQtyTierImpl(
      {required this.rate,
      required this.conditionNumber,
      required this.minQty,
      required this.type,
      required this.suffix})
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
  final ComboSuffix suffix;

  @override
  String toString() {
    return 'ComboDealQtyTier(rate: $rate, conditionNumber: $conditionNumber, minQty: $minQty, type: $type, suffix: $suffix)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComboDealQtyTierImpl &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.conditionNumber, conditionNumber) ||
                other.conditionNumber == conditionNumber) &&
            (identical(other.minQty, minQty) || other.minQty == minQty) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.suffix, suffix) || other.suffix == suffix));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, rate, conditionNumber, minQty, type, suffix);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComboDealQtyTierImplCopyWith<_$ComboDealQtyTierImpl> get copyWith =>
      __$$ComboDealQtyTierImplCopyWithImpl<_$ComboDealQtyTierImpl>(
          this, _$identity);
}

abstract class _ComboDealQtyTier extends ComboDealQtyTier {
  const factory _ComboDealQtyTier(
      {required final double rate,
      required final String conditionNumber,
      required final int minQty,
      required final DiscountType type,
      required final ComboSuffix suffix}) = _$ComboDealQtyTierImpl;
  const _ComboDealQtyTier._() : super._();

  @override
  double get rate;
  @override
  String get conditionNumber;
  @override
  int get minQty;
  @override
  DiscountType get type;
  @override
  ComboSuffix get suffix;
  @override
  @JsonKey(ignore: true)
  _$$ComboDealQtyTierImplCopyWith<_$ComboDealQtyTierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
