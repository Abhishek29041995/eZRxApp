// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bundle_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BundleInfo {
  int get sequence => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  DiscountType get type => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BundleInfoCopyWith<BundleInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleInfoCopyWith<$Res> {
  factory $BundleInfoCopyWith(
          BundleInfo value, $Res Function(BundleInfo) then) =
      _$BundleInfoCopyWithImpl<$Res, BundleInfo>;
  @useResult
  $Res call({int sequence, int quantity, DiscountType type, double rate});
}

/// @nodoc
class _$BundleInfoCopyWithImpl<$Res, $Val extends BundleInfo>
    implements $BundleInfoCopyWith<$Res> {
  _$BundleInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sequence = null,
    Object? quantity = null,
    Object? type = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BundleInfoImplCopyWith<$Res>
    implements $BundleInfoCopyWith<$Res> {
  factory _$$BundleInfoImplCopyWith(
          _$BundleInfoImpl value, $Res Function(_$BundleInfoImpl) then) =
      __$$BundleInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int sequence, int quantity, DiscountType type, double rate});
}

/// @nodoc
class __$$BundleInfoImplCopyWithImpl<$Res>
    extends _$BundleInfoCopyWithImpl<$Res, _$BundleInfoImpl>
    implements _$$BundleInfoImplCopyWith<$Res> {
  __$$BundleInfoImplCopyWithImpl(
      _$BundleInfoImpl _value, $Res Function(_$BundleInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sequence = null,
    Object? quantity = null,
    Object? type = null,
    Object? rate = null,
  }) {
    return _then(_$BundleInfoImpl(
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$BundleInfoImpl extends _BundleInfo {
  const _$BundleInfoImpl(
      {required this.sequence,
      required this.quantity,
      required this.type,
      required this.rate})
      : super._();

  @override
  final int sequence;
  @override
  final int quantity;
  @override
  final DiscountType type;
  @override
  final double rate;

  @override
  String toString() {
    return 'BundleInfo(sequence: $sequence, quantity: $quantity, type: $type, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BundleInfoImpl &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sequence, quantity, type, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BundleInfoImplCopyWith<_$BundleInfoImpl> get copyWith =>
      __$$BundleInfoImplCopyWithImpl<_$BundleInfoImpl>(this, _$identity);
}

abstract class _BundleInfo extends BundleInfo {
  const factory _BundleInfo(
      {required final int sequence,
      required final int quantity,
      required final DiscountType type,
      required final double rate}) = _$BundleInfoImpl;
  const _BundleInfo._() : super._();

  @override
  int get sequence;
  @override
  int get quantity;
  @override
  DiscountType get type;
  @override
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$BundleInfoImplCopyWith<_$BundleInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
