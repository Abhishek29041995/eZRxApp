// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiscountInfo {
  DiscountType get type => throw _privateConstructorUsedError;
  int get minQty => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscountInfoCopyWith<DiscountInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountInfoCopyWith<$Res> {
  factory $DiscountInfoCopyWith(
          DiscountInfo value, $Res Function(DiscountInfo) then) =
      _$DiscountInfoCopyWithImpl<$Res, DiscountInfo>;
  @useResult
  $Res call({DiscountType type, int minQty, double rate});
}

/// @nodoc
class _$DiscountInfoCopyWithImpl<$Res, $Val extends DiscountInfo>
    implements $DiscountInfoCopyWith<$Res> {
  _$DiscountInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? minQty = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscountInfoImplCopyWith<$Res>
    implements $DiscountInfoCopyWith<$Res> {
  factory _$$DiscountInfoImplCopyWith(
          _$DiscountInfoImpl value, $Res Function(_$DiscountInfoImpl) then) =
      __$$DiscountInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DiscountType type, int minQty, double rate});
}

/// @nodoc
class __$$DiscountInfoImplCopyWithImpl<$Res>
    extends _$DiscountInfoCopyWithImpl<$Res, _$DiscountInfoImpl>
    implements _$$DiscountInfoImplCopyWith<$Res> {
  __$$DiscountInfoImplCopyWithImpl(
      _$DiscountInfoImpl _value, $Res Function(_$DiscountInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? minQty = null,
    Object? rate = null,
  }) {
    return _then(_$DiscountInfoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$DiscountInfoImpl extends _DiscountInfo {
  const _$DiscountInfoImpl(
      {required this.type, required this.minQty, required this.rate})
      : super._();

  @override
  final DiscountType type;
  @override
  final int minQty;
  @override
  final double rate;

  @override
  String toString() {
    return 'DiscountInfo(type: $type, minQty: $minQty, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountInfoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.minQty, minQty) || other.minQty == minQty) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, minQty, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountInfoImplCopyWith<_$DiscountInfoImpl> get copyWith =>
      __$$DiscountInfoImplCopyWithImpl<_$DiscountInfoImpl>(this, _$identity);
}

abstract class _DiscountInfo extends DiscountInfo {
  const factory _DiscountInfo(
      {required final DiscountType type,
      required final int minQty,
      required final double rate}) = _$DiscountInfoImpl;
  const _DiscountInfo._() : super._();

  @override
  DiscountType get type;
  @override
  int get minQty;
  @override
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$DiscountInfoImplCopyWith<_$DiscountInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
