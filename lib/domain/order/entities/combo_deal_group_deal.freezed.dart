// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo_deal_group_deal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ComboDealGroupDeal {
  double get minTotalAmount => throw _privateConstructorUsedError;
  double get maxTotalAmount => throw _privateConstructorUsedError;
  int get minTotalQuantity => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  DiscountType get type => throw _privateConstructorUsedError;
  String get conditionNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComboDealGroupDealCopyWith<ComboDealGroupDeal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealGroupDealCopyWith<$Res> {
  factory $ComboDealGroupDealCopyWith(
          ComboDealGroupDeal value, $Res Function(ComboDealGroupDeal) then) =
      _$ComboDealGroupDealCopyWithImpl<$Res, ComboDealGroupDeal>;
  @useResult
  $Res call(
      {double minTotalAmount,
      double maxTotalAmount,
      int minTotalQuantity,
      double rate,
      DiscountType type,
      String conditionNumber});
}

/// @nodoc
class _$ComboDealGroupDealCopyWithImpl<$Res, $Val extends ComboDealGroupDeal>
    implements $ComboDealGroupDealCopyWith<$Res> {
  _$ComboDealGroupDealCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minTotalAmount = null,
    Object? maxTotalAmount = null,
    Object? minTotalQuantity = null,
    Object? rate = null,
    Object? type = null,
    Object? conditionNumber = null,
  }) {
    return _then(_value.copyWith(
      minTotalAmount: null == minTotalAmount
          ? _value.minTotalAmount
          : minTotalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      maxTotalAmount: null == maxTotalAmount
          ? _value.maxTotalAmount
          : maxTotalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      minTotalQuantity: null == minTotalQuantity
          ? _value.minTotalQuantity
          : minTotalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComboDealGroupDealImplCopyWith<$Res>
    implements $ComboDealGroupDealCopyWith<$Res> {
  factory _$$ComboDealGroupDealImplCopyWith(_$ComboDealGroupDealImpl value,
          $Res Function(_$ComboDealGroupDealImpl) then) =
      __$$ComboDealGroupDealImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double minTotalAmount,
      double maxTotalAmount,
      int minTotalQuantity,
      double rate,
      DiscountType type,
      String conditionNumber});
}

/// @nodoc
class __$$ComboDealGroupDealImplCopyWithImpl<$Res>
    extends _$ComboDealGroupDealCopyWithImpl<$Res, _$ComboDealGroupDealImpl>
    implements _$$ComboDealGroupDealImplCopyWith<$Res> {
  __$$ComboDealGroupDealImplCopyWithImpl(_$ComboDealGroupDealImpl _value,
      $Res Function(_$ComboDealGroupDealImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minTotalAmount = null,
    Object? maxTotalAmount = null,
    Object? minTotalQuantity = null,
    Object? rate = null,
    Object? type = null,
    Object? conditionNumber = null,
  }) {
    return _then(_$ComboDealGroupDealImpl(
      minTotalAmount: null == minTotalAmount
          ? _value.minTotalAmount
          : minTotalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      maxTotalAmount: null == maxTotalAmount
          ? _value.maxTotalAmount
          : maxTotalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      minTotalQuantity: null == minTotalQuantity
          ? _value.minTotalQuantity
          : minTotalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ComboDealGroupDealImpl extends _ComboDealGroupDeal {
  const _$ComboDealGroupDealImpl(
      {required this.minTotalAmount,
      required this.maxTotalAmount,
      required this.minTotalQuantity,
      required this.rate,
      required this.type,
      required this.conditionNumber})
      : super._();

  @override
  final double minTotalAmount;
  @override
  final double maxTotalAmount;
  @override
  final int minTotalQuantity;
  @override
  final double rate;
  @override
  final DiscountType type;
  @override
  final String conditionNumber;

  @override
  String toString() {
    return 'ComboDealGroupDeal(minTotalAmount: $minTotalAmount, maxTotalAmount: $maxTotalAmount, minTotalQuantity: $minTotalQuantity, rate: $rate, type: $type, conditionNumber: $conditionNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComboDealGroupDealImpl &&
            (identical(other.minTotalAmount, minTotalAmount) ||
                other.minTotalAmount == minTotalAmount) &&
            (identical(other.maxTotalAmount, maxTotalAmount) ||
                other.maxTotalAmount == maxTotalAmount) &&
            (identical(other.minTotalQuantity, minTotalQuantity) ||
                other.minTotalQuantity == minTotalQuantity) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.conditionNumber, conditionNumber) ||
                other.conditionNumber == conditionNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, minTotalAmount, maxTotalAmount,
      minTotalQuantity, rate, type, conditionNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComboDealGroupDealImplCopyWith<_$ComboDealGroupDealImpl> get copyWith =>
      __$$ComboDealGroupDealImplCopyWithImpl<_$ComboDealGroupDealImpl>(
          this, _$identity);
}

abstract class _ComboDealGroupDeal extends ComboDealGroupDeal {
  const factory _ComboDealGroupDeal(
      {required final double minTotalAmount,
      required final double maxTotalAmount,
      required final int minTotalQuantity,
      required final double rate,
      required final DiscountType type,
      required final String conditionNumber}) = _$ComboDealGroupDealImpl;
  const _ComboDealGroupDeal._() : super._();

  @override
  double get minTotalAmount;
  @override
  double get maxTotalAmount;
  @override
  int get minTotalQuantity;
  @override
  double get rate;
  @override
  DiscountType get type;
  @override
  String get conditionNumber;
  @override
  @JsonKey(ignore: true)
  _$$ComboDealGroupDealImplCopyWith<_$ComboDealGroupDealImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
