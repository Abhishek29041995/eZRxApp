// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apl_get_total_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AplGetTotalPrice {
  int get smallOrderFee => throw _privateConstructorUsedError;
  int get totalTax => throw _privateConstructorUsedError;
  int get grandTotal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AplGetTotalPriceCopyWith<AplGetTotalPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AplGetTotalPriceCopyWith<$Res> {
  factory $AplGetTotalPriceCopyWith(
          AplGetTotalPrice value, $Res Function(AplGetTotalPrice) then) =
      _$AplGetTotalPriceCopyWithImpl<$Res, AplGetTotalPrice>;
  @useResult
  $Res call({int smallOrderFee, int totalTax, int grandTotal});
}

/// @nodoc
class _$AplGetTotalPriceCopyWithImpl<$Res, $Val extends AplGetTotalPrice>
    implements $AplGetTotalPriceCopyWith<$Res> {
  _$AplGetTotalPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smallOrderFee = null,
    Object? totalTax = null,
    Object? grandTotal = null,
  }) {
    return _then(_value.copyWith(
      smallOrderFee: null == smallOrderFee
          ? _value.smallOrderFee
          : smallOrderFee // ignore: cast_nullable_to_non_nullable
              as int,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as int,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AplGetTotalPriceImplCopyWith<$Res>
    implements $AplGetTotalPriceCopyWith<$Res> {
  factory _$$AplGetTotalPriceImplCopyWith(_$AplGetTotalPriceImpl value,
          $Res Function(_$AplGetTotalPriceImpl) then) =
      __$$AplGetTotalPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int smallOrderFee, int totalTax, int grandTotal});
}

/// @nodoc
class __$$AplGetTotalPriceImplCopyWithImpl<$Res>
    extends _$AplGetTotalPriceCopyWithImpl<$Res, _$AplGetTotalPriceImpl>
    implements _$$AplGetTotalPriceImplCopyWith<$Res> {
  __$$AplGetTotalPriceImplCopyWithImpl(_$AplGetTotalPriceImpl _value,
      $Res Function(_$AplGetTotalPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smallOrderFee = null,
    Object? totalTax = null,
    Object? grandTotal = null,
  }) {
    return _then(_$AplGetTotalPriceImpl(
      smallOrderFee: null == smallOrderFee
          ? _value.smallOrderFee
          : smallOrderFee // ignore: cast_nullable_to_non_nullable
              as int,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as int,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AplGetTotalPriceImpl extends _AplGetTotalPrice {
  const _$AplGetTotalPriceImpl(
      {required this.smallOrderFee,
      required this.totalTax,
      required this.grandTotal})
      : super._();

  @override
  final int smallOrderFee;
  @override
  final int totalTax;
  @override
  final int grandTotal;

  @override
  String toString() {
    return 'AplGetTotalPrice(smallOrderFee: $smallOrderFee, totalTax: $totalTax, grandTotal: $grandTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AplGetTotalPriceImpl &&
            (identical(other.smallOrderFee, smallOrderFee) ||
                other.smallOrderFee == smallOrderFee) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, smallOrderFee, totalTax, grandTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AplGetTotalPriceImplCopyWith<_$AplGetTotalPriceImpl> get copyWith =>
      __$$AplGetTotalPriceImplCopyWithImpl<_$AplGetTotalPriceImpl>(
          this, _$identity);
}

abstract class _AplGetTotalPrice extends AplGetTotalPrice {
  const factory _AplGetTotalPrice(
      {required final int smallOrderFee,
      required final int totalTax,
      required final int grandTotal}) = _$AplGetTotalPriceImpl;
  const _AplGetTotalPrice._() : super._();

  @override
  int get smallOrderFee;
  @override
  int get totalTax;
  @override
  int get grandTotal;
  @override
  @JsonKey(ignore: true)
  _$$AplGetTotalPriceImplCopyWith<_$AplGetTotalPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
