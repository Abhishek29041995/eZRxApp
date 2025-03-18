// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apl_simulator_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AplSimulatorOrder {
  double get totalPriceWithoutTax => throw _privateConstructorUsedError;
  double get smallOrderFee => throw _privateConstructorUsedError;
  double get grandTotal => throw _privateConstructorUsedError;
  double get totalTax => throw _privateConstructorUsedError;
  double get totalDiscountValue => throw _privateConstructorUsedError;
  List<AplProduct> get aplProducts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AplSimulatorOrderCopyWith<AplSimulatorOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AplSimulatorOrderCopyWith<$Res> {
  factory $AplSimulatorOrderCopyWith(
          AplSimulatorOrder value, $Res Function(AplSimulatorOrder) then) =
      _$AplSimulatorOrderCopyWithImpl<$Res, AplSimulatorOrder>;
  @useResult
  $Res call(
      {double totalPriceWithoutTax,
      double smallOrderFee,
      double grandTotal,
      double totalTax,
      double totalDiscountValue,
      List<AplProduct> aplProducts});
}

/// @nodoc
class _$AplSimulatorOrderCopyWithImpl<$Res, $Val extends AplSimulatorOrder>
    implements $AplSimulatorOrderCopyWith<$Res> {
  _$AplSimulatorOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPriceWithoutTax = null,
    Object? smallOrderFee = null,
    Object? grandTotal = null,
    Object? totalTax = null,
    Object? totalDiscountValue = null,
    Object? aplProducts = null,
  }) {
    return _then(_value.copyWith(
      totalPriceWithoutTax: null == totalPriceWithoutTax
          ? _value.totalPriceWithoutTax
          : totalPriceWithoutTax // ignore: cast_nullable_to_non_nullable
              as double,
      smallOrderFee: null == smallOrderFee
          ? _value.smallOrderFee
          : smallOrderFee // ignore: cast_nullable_to_non_nullable
              as double,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      totalDiscountValue: null == totalDiscountValue
          ? _value.totalDiscountValue
          : totalDiscountValue // ignore: cast_nullable_to_non_nullable
              as double,
      aplProducts: null == aplProducts
          ? _value.aplProducts
          : aplProducts // ignore: cast_nullable_to_non_nullable
              as List<AplProduct>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AplSimulatorOrderImplCopyWith<$Res>
    implements $AplSimulatorOrderCopyWith<$Res> {
  factory _$$AplSimulatorOrderImplCopyWith(_$AplSimulatorOrderImpl value,
          $Res Function(_$AplSimulatorOrderImpl) then) =
      __$$AplSimulatorOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalPriceWithoutTax,
      double smallOrderFee,
      double grandTotal,
      double totalTax,
      double totalDiscountValue,
      List<AplProduct> aplProducts});
}

/// @nodoc
class __$$AplSimulatorOrderImplCopyWithImpl<$Res>
    extends _$AplSimulatorOrderCopyWithImpl<$Res, _$AplSimulatorOrderImpl>
    implements _$$AplSimulatorOrderImplCopyWith<$Res> {
  __$$AplSimulatorOrderImplCopyWithImpl(_$AplSimulatorOrderImpl _value,
      $Res Function(_$AplSimulatorOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPriceWithoutTax = null,
    Object? smallOrderFee = null,
    Object? grandTotal = null,
    Object? totalTax = null,
    Object? totalDiscountValue = null,
    Object? aplProducts = null,
  }) {
    return _then(_$AplSimulatorOrderImpl(
      totalPriceWithoutTax: null == totalPriceWithoutTax
          ? _value.totalPriceWithoutTax
          : totalPriceWithoutTax // ignore: cast_nullable_to_non_nullable
              as double,
      smallOrderFee: null == smallOrderFee
          ? _value.smallOrderFee
          : smallOrderFee // ignore: cast_nullable_to_non_nullable
              as double,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      totalDiscountValue: null == totalDiscountValue
          ? _value.totalDiscountValue
          : totalDiscountValue // ignore: cast_nullable_to_non_nullable
              as double,
      aplProducts: null == aplProducts
          ? _value._aplProducts
          : aplProducts // ignore: cast_nullable_to_non_nullable
              as List<AplProduct>,
    ));
  }
}

/// @nodoc

class _$AplSimulatorOrderImpl extends _AplSimulatorOrder {
  const _$AplSimulatorOrderImpl(
      {required this.totalPriceWithoutTax,
      required this.smallOrderFee,
      required this.grandTotal,
      required this.totalTax,
      required this.totalDiscountValue,
      required final List<AplProduct> aplProducts})
      : _aplProducts = aplProducts,
        super._();

  @override
  final double totalPriceWithoutTax;
  @override
  final double smallOrderFee;
  @override
  final double grandTotal;
  @override
  final double totalTax;
  @override
  final double totalDiscountValue;
  final List<AplProduct> _aplProducts;
  @override
  List<AplProduct> get aplProducts {
    if (_aplProducts is EqualUnmodifiableListView) return _aplProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aplProducts);
  }

  @override
  String toString() {
    return 'AplSimulatorOrder(totalPriceWithoutTax: $totalPriceWithoutTax, smallOrderFee: $smallOrderFee, grandTotal: $grandTotal, totalTax: $totalTax, totalDiscountValue: $totalDiscountValue, aplProducts: $aplProducts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AplSimulatorOrderImpl &&
            (identical(other.totalPriceWithoutTax, totalPriceWithoutTax) ||
                other.totalPriceWithoutTax == totalPriceWithoutTax) &&
            (identical(other.smallOrderFee, smallOrderFee) ||
                other.smallOrderFee == smallOrderFee) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.totalDiscountValue, totalDiscountValue) ||
                other.totalDiscountValue == totalDiscountValue) &&
            const DeepCollectionEquality()
                .equals(other._aplProducts, _aplProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalPriceWithoutTax,
      smallOrderFee,
      grandTotal,
      totalTax,
      totalDiscountValue,
      const DeepCollectionEquality().hash(_aplProducts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AplSimulatorOrderImplCopyWith<_$AplSimulatorOrderImpl> get copyWith =>
      __$$AplSimulatorOrderImplCopyWithImpl<_$AplSimulatorOrderImpl>(
          this, _$identity);
}

abstract class _AplSimulatorOrder extends AplSimulatorOrder {
  const factory _AplSimulatorOrder(
      {required final double totalPriceWithoutTax,
      required final double smallOrderFee,
      required final double grandTotal,
      required final double totalTax,
      required final double totalDiscountValue,
      required final List<AplProduct> aplProducts}) = _$AplSimulatorOrderImpl;
  const _AplSimulatorOrder._() : super._();

  @override
  double get totalPriceWithoutTax;
  @override
  double get smallOrderFee;
  @override
  double get grandTotal;
  @override
  double get totalTax;
  @override
  double get totalDiscountValue;
  @override
  List<AplProduct> get aplProducts;
  @override
  @JsonKey(ignore: true)
  _$$AplSimulatorOrderImplCopyWith<_$AplSimulatorOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
