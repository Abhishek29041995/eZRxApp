// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartDto _$CartDtoFromJson(Map<String, dynamic> json) {
  return _CartDto.fromJson(json);
}

/// @nodoc
mixin _$CartDto {
  @JsonKey(name: 'ezRxItems', defaultValue: <CartProductDto>[])
  List<CartProductDto> get cartProducts => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerCode', defaultValue: '')
  String get cartCustomerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipToCustomerCode', defaultValue: '')
  String get cartShipToCustomerCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartDtoCopyWith<CartDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartDtoCopyWith<$Res> {
  factory $CartDtoCopyWith(CartDto value, $Res Function(CartDto) then) =
      _$CartDtoCopyWithImpl<$Res, CartDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ezRxItems', defaultValue: <CartProductDto>[])
      List<CartProductDto> cartProducts,
      @JsonKey(name: 'customerCode', defaultValue: '') String cartCustomerCode,
      @JsonKey(name: 'shipToCustomerCode', defaultValue: '')
      String cartShipToCustomerCode});
}

/// @nodoc
class _$CartDtoCopyWithImpl<$Res, $Val extends CartDto>
    implements $CartDtoCopyWith<$Res> {
  _$CartDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartProducts = null,
    Object? cartCustomerCode = null,
    Object? cartShipToCustomerCode = null,
  }) {
    return _then(_value.copyWith(
      cartProducts: null == cartProducts
          ? _value.cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<CartProductDto>,
      cartCustomerCode: null == cartCustomerCode
          ? _value.cartCustomerCode
          : cartCustomerCode // ignore: cast_nullable_to_non_nullable
              as String,
      cartShipToCustomerCode: null == cartShipToCustomerCode
          ? _value.cartShipToCustomerCode
          : cartShipToCustomerCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartDtoImplCopyWith<$Res> implements $CartDtoCopyWith<$Res> {
  factory _$$CartDtoImplCopyWith(
          _$CartDtoImpl value, $Res Function(_$CartDtoImpl) then) =
      __$$CartDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ezRxItems', defaultValue: <CartProductDto>[])
      List<CartProductDto> cartProducts,
      @JsonKey(name: 'customerCode', defaultValue: '') String cartCustomerCode,
      @JsonKey(name: 'shipToCustomerCode', defaultValue: '')
      String cartShipToCustomerCode});
}

/// @nodoc
class __$$CartDtoImplCopyWithImpl<$Res>
    extends _$CartDtoCopyWithImpl<$Res, _$CartDtoImpl>
    implements _$$CartDtoImplCopyWith<$Res> {
  __$$CartDtoImplCopyWithImpl(
      _$CartDtoImpl _value, $Res Function(_$CartDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartProducts = null,
    Object? cartCustomerCode = null,
    Object? cartShipToCustomerCode = null,
  }) {
    return _then(_$CartDtoImpl(
      cartProducts: null == cartProducts
          ? _value._cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<CartProductDto>,
      cartCustomerCode: null == cartCustomerCode
          ? _value.cartCustomerCode
          : cartCustomerCode // ignore: cast_nullable_to_non_nullable
              as String,
      cartShipToCustomerCode: null == cartShipToCustomerCode
          ? _value.cartShipToCustomerCode
          : cartShipToCustomerCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartDtoImpl extends _CartDto {
  const _$CartDtoImpl(
      {@JsonKey(name: 'ezRxItems', defaultValue: <CartProductDto>[])
      required final List<CartProductDto> cartProducts,
      @JsonKey(name: 'customerCode', defaultValue: '')
      required this.cartCustomerCode,
      @JsonKey(name: 'shipToCustomerCode', defaultValue: '')
      required this.cartShipToCustomerCode})
      : _cartProducts = cartProducts,
        super._();

  factory _$CartDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartDtoImplFromJson(json);

  final List<CartProductDto> _cartProducts;
  @override
  @JsonKey(name: 'ezRxItems', defaultValue: <CartProductDto>[])
  List<CartProductDto> get cartProducts {
    if (_cartProducts is EqualUnmodifiableListView) return _cartProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartProducts);
  }

  @override
  @JsonKey(name: 'customerCode', defaultValue: '')
  final String cartCustomerCode;
  @override
  @JsonKey(name: 'shipToCustomerCode', defaultValue: '')
  final String cartShipToCustomerCode;

  @override
  String toString() {
    return 'CartDto(cartProducts: $cartProducts, cartCustomerCode: $cartCustomerCode, cartShipToCustomerCode: $cartShipToCustomerCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartDtoImpl &&
            const DeepCollectionEquality()
                .equals(other._cartProducts, _cartProducts) &&
            (identical(other.cartCustomerCode, cartCustomerCode) ||
                other.cartCustomerCode == cartCustomerCode) &&
            (identical(other.cartShipToCustomerCode, cartShipToCustomerCode) ||
                other.cartShipToCustomerCode == cartShipToCustomerCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartProducts),
      cartCustomerCode,
      cartShipToCustomerCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartDtoImplCopyWith<_$CartDtoImpl> get copyWith =>
      __$$CartDtoImplCopyWithImpl<_$CartDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartDtoImplToJson(
      this,
    );
  }
}

abstract class _CartDto extends CartDto {
  const factory _CartDto(
      {@JsonKey(name: 'ezRxItems', defaultValue: <CartProductDto>[])
      required final List<CartProductDto> cartProducts,
      @JsonKey(name: 'customerCode', defaultValue: '')
      required final String cartCustomerCode,
      @JsonKey(name: 'shipToCustomerCode', defaultValue: '')
      required final String cartShipToCustomerCode}) = _$CartDtoImpl;
  const _CartDto._() : super._();

  factory _CartDto.fromJson(Map<String, dynamic> json) = _$CartDtoImpl.fromJson;

  @override
  @JsonKey(name: 'ezRxItems', defaultValue: <CartProductDto>[])
  List<CartProductDto> get cartProducts;
  @override
  @JsonKey(name: 'customerCode', defaultValue: '')
  String get cartCustomerCode;
  @override
  @JsonKey(name: 'shipToCustomerCode', defaultValue: '')
  String get cartShipToCustomerCode;
  @override
  @JsonKey(ignore: true)
  _$$CartDtoImplCopyWith<_$CartDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
