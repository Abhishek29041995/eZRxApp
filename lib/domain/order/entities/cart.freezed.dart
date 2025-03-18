// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Cart {
  List<PriceAggregate> get cartProducts => throw _privateConstructorUsedError;
  String get cartShipToCustomerCode => throw _privateConstructorUsedError;
  String get cartCustomerCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call(
      {List<PriceAggregate> cartProducts,
      String cartShipToCustomerCode,
      String cartCustomerCode});
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartProducts = null,
    Object? cartShipToCustomerCode = null,
    Object? cartCustomerCode = null,
  }) {
    return _then(_value.copyWith(
      cartProducts: null == cartProducts
          ? _value.cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      cartShipToCustomerCode: null == cartShipToCustomerCode
          ? _value.cartShipToCustomerCode
          : cartShipToCustomerCode // ignore: cast_nullable_to_non_nullable
              as String,
      cartCustomerCode: null == cartCustomerCode
          ? _value.cartCustomerCode
          : cartCustomerCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PriceAggregate> cartProducts,
      String cartShipToCustomerCode,
      String cartCustomerCode});
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$CartCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartProducts = null,
    Object? cartShipToCustomerCode = null,
    Object? cartCustomerCode = null,
  }) {
    return _then(_$CartImpl(
      cartProducts: null == cartProducts
          ? _value._cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      cartShipToCustomerCode: null == cartShipToCustomerCode
          ? _value.cartShipToCustomerCode
          : cartShipToCustomerCode // ignore: cast_nullable_to_non_nullable
              as String,
      cartCustomerCode: null == cartCustomerCode
          ? _value.cartCustomerCode
          : cartCustomerCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CartImpl extends _Cart {
  const _$CartImpl(
      {required final List<PriceAggregate> cartProducts,
      required this.cartShipToCustomerCode,
      required this.cartCustomerCode})
      : _cartProducts = cartProducts,
        super._();

  final List<PriceAggregate> _cartProducts;
  @override
  List<PriceAggregate> get cartProducts {
    if (_cartProducts is EqualUnmodifiableListView) return _cartProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartProducts);
  }

  @override
  final String cartShipToCustomerCode;
  @override
  final String cartCustomerCode;

  @override
  String toString() {
    return 'Cart(cartProducts: $cartProducts, cartShipToCustomerCode: $cartShipToCustomerCode, cartCustomerCode: $cartCustomerCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            const DeepCollectionEquality()
                .equals(other._cartProducts, _cartProducts) &&
            (identical(other.cartShipToCustomerCode, cartShipToCustomerCode) ||
                other.cartShipToCustomerCode == cartShipToCustomerCode) &&
            (identical(other.cartCustomerCode, cartCustomerCode) ||
                other.cartCustomerCode == cartCustomerCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartProducts),
      cartShipToCustomerCode,
      cartCustomerCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);
}

abstract class _Cart extends Cart {
  const factory _Cart(
      {required final List<PriceAggregate> cartProducts,
      required final String cartShipToCustomerCode,
      required final String cartCustomerCode}) = _$CartImpl;
  const _Cart._() : super._();

  @override
  List<PriceAggregate> get cartProducts;
  @override
  String get cartShipToCustomerCode;
  @override
  String get cartCustomerCode;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
