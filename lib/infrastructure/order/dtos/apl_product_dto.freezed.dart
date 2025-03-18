// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apl_product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AplProductDto _$AplProductDtoFromJson(Map<String, dynamic> json) {
  return _AplProductDto.fromJson(json);
}

/// @nodoc
mixin _$AplProductDto {
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemNumber', defaultValue: '')
  String get itemNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'parentItemNumber', defaultValue: '')
  String get parentItemNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'material', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'netValue', defaultValue: 0)
  double get finalPriceTotal =>
      throw _privateConstructorUsedError; //total individual price (unit price * quantity)
  @JsonKey(name: 'productPriceNetValue', defaultValue: 0)
  double get finalPrice => throw _privateConstructorUsedError; //item unit price
  @JsonKey(name: 'productQty', defaultValue: 0)
  int get productQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxValue', defaultValue: 0)
  double get taxValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'promotions', defaultValue: <AplPromotionsDto>[])
  List<AplPromotionsDto> get aplPromotions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AplProductDtoCopyWith<AplProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AplProductDtoCopyWith<$Res> {
  factory $AplProductDtoCopyWith(
          AplProductDto value, $Res Function(AplProductDto) then) =
      _$AplProductDtoCopyWithImpl<$Res, AplProductDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'itemNumber', defaultValue: '') String itemNumber,
      @JsonKey(name: 'parentItemNumber', defaultValue: '')
      String parentItemNumber,
      @JsonKey(name: 'material', defaultValue: '') String materialNumber,
      @JsonKey(name: 'netValue', defaultValue: 0) double finalPriceTotal,
      @JsonKey(name: 'productPriceNetValue', defaultValue: 0) double finalPrice,
      @JsonKey(name: 'productQty', defaultValue: 0) int productQty,
      @JsonKey(name: 'taxValue', defaultValue: 0) double taxValue,
      @JsonKey(name: 'promotions', defaultValue: <AplPromotionsDto>[])
      List<AplPromotionsDto> aplPromotions});
}

/// @nodoc
class _$AplProductDtoCopyWithImpl<$Res, $Val extends AplProductDto>
    implements $AplProductDtoCopyWith<$Res> {
  _$AplProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? itemNumber = null,
    Object? parentItemNumber = null,
    Object? materialNumber = null,
    Object? finalPriceTotal = null,
    Object? finalPrice = null,
    Object? productQty = null,
    Object? taxValue = null,
    Object? aplPromotions = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      itemNumber: null == itemNumber
          ? _value.itemNumber
          : itemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      parentItemNumber: null == parentItemNumber
          ? _value.parentItemNumber
          : parentItemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      finalPriceTotal: null == finalPriceTotal
          ? _value.finalPriceTotal
          : finalPriceTotal // ignore: cast_nullable_to_non_nullable
              as double,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      productQty: null == productQty
          ? _value.productQty
          : productQty // ignore: cast_nullable_to_non_nullable
              as int,
      taxValue: null == taxValue
          ? _value.taxValue
          : taxValue // ignore: cast_nullable_to_non_nullable
              as double,
      aplPromotions: null == aplPromotions
          ? _value.aplPromotions
          : aplPromotions // ignore: cast_nullable_to_non_nullable
              as List<AplPromotionsDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AplProductDtoImplCopyWith<$Res>
    implements $AplProductDtoCopyWith<$Res> {
  factory _$$AplProductDtoImplCopyWith(
          _$AplProductDtoImpl value, $Res Function(_$AplProductDtoImpl) then) =
      __$$AplProductDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'itemNumber', defaultValue: '') String itemNumber,
      @JsonKey(name: 'parentItemNumber', defaultValue: '')
      String parentItemNumber,
      @JsonKey(name: 'material', defaultValue: '') String materialNumber,
      @JsonKey(name: 'netValue', defaultValue: 0) double finalPriceTotal,
      @JsonKey(name: 'productPriceNetValue', defaultValue: 0) double finalPrice,
      @JsonKey(name: 'productQty', defaultValue: 0) int productQty,
      @JsonKey(name: 'taxValue', defaultValue: 0) double taxValue,
      @JsonKey(name: 'promotions', defaultValue: <AplPromotionsDto>[])
      List<AplPromotionsDto> aplPromotions});
}

/// @nodoc
class __$$AplProductDtoImplCopyWithImpl<$Res>
    extends _$AplProductDtoCopyWithImpl<$Res, _$AplProductDtoImpl>
    implements _$$AplProductDtoImplCopyWith<$Res> {
  __$$AplProductDtoImplCopyWithImpl(
      _$AplProductDtoImpl _value, $Res Function(_$AplProductDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? itemNumber = null,
    Object? parentItemNumber = null,
    Object? materialNumber = null,
    Object? finalPriceTotal = null,
    Object? finalPrice = null,
    Object? productQty = null,
    Object? taxValue = null,
    Object? aplPromotions = null,
  }) {
    return _then(_$AplProductDtoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      itemNumber: null == itemNumber
          ? _value.itemNumber
          : itemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      parentItemNumber: null == parentItemNumber
          ? _value.parentItemNumber
          : parentItemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      finalPriceTotal: null == finalPriceTotal
          ? _value.finalPriceTotal
          : finalPriceTotal // ignore: cast_nullable_to_non_nullable
              as double,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      productQty: null == productQty
          ? _value.productQty
          : productQty // ignore: cast_nullable_to_non_nullable
              as int,
      taxValue: null == taxValue
          ? _value.taxValue
          : taxValue // ignore: cast_nullable_to_non_nullable
              as double,
      aplPromotions: null == aplPromotions
          ? _value._aplPromotions
          : aplPromotions // ignore: cast_nullable_to_non_nullable
              as List<AplPromotionsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AplProductDtoImpl extends _AplProductDto {
  const _$AplProductDtoImpl(
      {@JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'itemNumber', defaultValue: '') required this.itemNumber,
      @JsonKey(name: 'parentItemNumber', defaultValue: '')
      required this.parentItemNumber,
      @JsonKey(name: 'material', defaultValue: '') required this.materialNumber,
      @JsonKey(name: 'netValue', defaultValue: 0) required this.finalPriceTotal,
      @JsonKey(name: 'productPriceNetValue', defaultValue: 0)
      required this.finalPrice,
      @JsonKey(name: 'productQty', defaultValue: 0) required this.productQty,
      @JsonKey(name: 'taxValue', defaultValue: 0) required this.taxValue,
      @JsonKey(name: 'promotions', defaultValue: <AplPromotionsDto>[])
      required final List<AplPromotionsDto> aplPromotions})
      : _aplPromotions = aplPromotions,
        super._();

  factory _$AplProductDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AplProductDtoImplFromJson(json);

  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'itemNumber', defaultValue: '')
  final String itemNumber;
  @override
  @JsonKey(name: 'parentItemNumber', defaultValue: '')
  final String parentItemNumber;
  @override
  @JsonKey(name: 'material', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'netValue', defaultValue: 0)
  final double finalPriceTotal;
//total individual price (unit price * quantity)
  @override
  @JsonKey(name: 'productPriceNetValue', defaultValue: 0)
  final double finalPrice;
//item unit price
  @override
  @JsonKey(name: 'productQty', defaultValue: 0)
  final int productQty;
  @override
  @JsonKey(name: 'taxValue', defaultValue: 0)
  final double taxValue;
  final List<AplPromotionsDto> _aplPromotions;
  @override
  @JsonKey(name: 'promotions', defaultValue: <AplPromotionsDto>[])
  List<AplPromotionsDto> get aplPromotions {
    if (_aplPromotions is EqualUnmodifiableListView) return _aplPromotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aplPromotions);
  }

  @override
  String toString() {
    return 'AplProductDto(type: $type, itemNumber: $itemNumber, parentItemNumber: $parentItemNumber, materialNumber: $materialNumber, finalPriceTotal: $finalPriceTotal, finalPrice: $finalPrice, productQty: $productQty, taxValue: $taxValue, aplPromotions: $aplPromotions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AplProductDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.itemNumber, itemNumber) ||
                other.itemNumber == itemNumber) &&
            (identical(other.parentItemNumber, parentItemNumber) ||
                other.parentItemNumber == parentItemNumber) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.finalPriceTotal, finalPriceTotal) ||
                other.finalPriceTotal == finalPriceTotal) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.productQty, productQty) ||
                other.productQty == productQty) &&
            (identical(other.taxValue, taxValue) ||
                other.taxValue == taxValue) &&
            const DeepCollectionEquality()
                .equals(other._aplPromotions, _aplPromotions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      itemNumber,
      parentItemNumber,
      materialNumber,
      finalPriceTotal,
      finalPrice,
      productQty,
      taxValue,
      const DeepCollectionEquality().hash(_aplPromotions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AplProductDtoImplCopyWith<_$AplProductDtoImpl> get copyWith =>
      __$$AplProductDtoImplCopyWithImpl<_$AplProductDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AplProductDtoImplToJson(
      this,
    );
  }
}

abstract class _AplProductDto extends AplProductDto {
  const factory _AplProductDto(
          {@JsonKey(name: 'type', defaultValue: '') required final String type,
          @JsonKey(name: 'itemNumber', defaultValue: '')
          required final String itemNumber,
          @JsonKey(name: 'parentItemNumber', defaultValue: '')
          required final String parentItemNumber,
          @JsonKey(name: 'material', defaultValue: '')
          required final String materialNumber,
          @JsonKey(name: 'netValue', defaultValue: 0)
          required final double finalPriceTotal,
          @JsonKey(name: 'productPriceNetValue', defaultValue: 0)
          required final double finalPrice,
          @JsonKey(name: 'productQty', defaultValue: 0)
          required final int productQty,
          @JsonKey(name: 'taxValue', defaultValue: 0)
          required final double taxValue,
          @JsonKey(name: 'promotions', defaultValue: <AplPromotionsDto>[])
          required final List<AplPromotionsDto> aplPromotions}) =
      _$AplProductDtoImpl;
  const _AplProductDto._() : super._();

  factory _AplProductDto.fromJson(Map<String, dynamic> json) =
      _$AplProductDtoImpl.fromJson;

  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'itemNumber', defaultValue: '')
  String get itemNumber;
  @override
  @JsonKey(name: 'parentItemNumber', defaultValue: '')
  String get parentItemNumber;
  @override
  @JsonKey(name: 'material', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'netValue', defaultValue: 0)
  double get finalPriceTotal;
  @override //total individual price (unit price * quantity)
  @JsonKey(name: 'productPriceNetValue', defaultValue: 0)
  double get finalPrice;
  @override //item unit price
  @JsonKey(name: 'productQty', defaultValue: 0)
  int get productQty;
  @override
  @JsonKey(name: 'taxValue', defaultValue: 0)
  double get taxValue;
  @override
  @JsonKey(name: 'promotions', defaultValue: <AplPromotionsDto>[])
  List<AplPromotionsDto> get aplPromotions;
  @override
  @JsonKey(ignore: true)
  _$$AplProductDtoImplCopyWith<_$AplProductDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
