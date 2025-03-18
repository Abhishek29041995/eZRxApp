// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_aggregate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductDetailAggregate {
  MaterialInfo get materialInfo => throw _privateConstructorUsedError;
  ProductItem get productItem => throw _privateConstructorUsedError;
  List<MaterialInfo> get similarProduct => throw _privateConstructorUsedError;
  StockInfo get stockInfo => throw _privateConstructorUsedError;
  bool get exeedQty => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDetailAggregateCopyWith<ProductDetailAggregate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailAggregateCopyWith<$Res> {
  factory $ProductDetailAggregateCopyWith(ProductDetailAggregate value,
          $Res Function(ProductDetailAggregate) then) =
      _$ProductDetailAggregateCopyWithImpl<$Res, ProductDetailAggregate>;
  @useResult
  $Res call(
      {MaterialInfo materialInfo,
      ProductItem productItem,
      List<MaterialInfo> similarProduct,
      StockInfo stockInfo,
      bool exeedQty});

  $MaterialInfoCopyWith<$Res> get materialInfo;
  $ProductItemCopyWith<$Res> get productItem;
  $StockInfoCopyWith<$Res> get stockInfo;
}

/// @nodoc
class _$ProductDetailAggregateCopyWithImpl<$Res,
        $Val extends ProductDetailAggregate>
    implements $ProductDetailAggregateCopyWith<$Res> {
  _$ProductDetailAggregateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialInfo = null,
    Object? productItem = null,
    Object? similarProduct = null,
    Object? stockInfo = null,
    Object? exeedQty = null,
  }) {
    return _then(_value.copyWith(
      materialInfo: null == materialInfo
          ? _value.materialInfo
          : materialInfo // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      productItem: null == productItem
          ? _value.productItem
          : productItem // ignore: cast_nullable_to_non_nullable
              as ProductItem,
      similarProduct: null == similarProduct
          ? _value.similarProduct
          : similarProduct // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      stockInfo: null == stockInfo
          ? _value.stockInfo
          : stockInfo // ignore: cast_nullable_to_non_nullable
              as StockInfo,
      exeedQty: null == exeedQty
          ? _value.exeedQty
          : exeedQty // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get materialInfo {
    return $MaterialInfoCopyWith<$Res>(_value.materialInfo, (value) {
      return _then(_value.copyWith(materialInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductItemCopyWith<$Res> get productItem {
    return $ProductItemCopyWith<$Res>(_value.productItem, (value) {
      return _then(_value.copyWith(productItem: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StockInfoCopyWith<$Res> get stockInfo {
    return $StockInfoCopyWith<$Res>(_value.stockInfo, (value) {
      return _then(_value.copyWith(stockInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductDetailAggregateImplCopyWith<$Res>
    implements $ProductDetailAggregateCopyWith<$Res> {
  factory _$$ProductDetailAggregateImplCopyWith(
          _$ProductDetailAggregateImpl value,
          $Res Function(_$ProductDetailAggregateImpl) then) =
      __$$ProductDetailAggregateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialInfo materialInfo,
      ProductItem productItem,
      List<MaterialInfo> similarProduct,
      StockInfo stockInfo,
      bool exeedQty});

  @override
  $MaterialInfoCopyWith<$Res> get materialInfo;
  @override
  $ProductItemCopyWith<$Res> get productItem;
  @override
  $StockInfoCopyWith<$Res> get stockInfo;
}

/// @nodoc
class __$$ProductDetailAggregateImplCopyWithImpl<$Res>
    extends _$ProductDetailAggregateCopyWithImpl<$Res,
        _$ProductDetailAggregateImpl>
    implements _$$ProductDetailAggregateImplCopyWith<$Res> {
  __$$ProductDetailAggregateImplCopyWithImpl(
      _$ProductDetailAggregateImpl _value,
      $Res Function(_$ProductDetailAggregateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialInfo = null,
    Object? productItem = null,
    Object? similarProduct = null,
    Object? stockInfo = null,
    Object? exeedQty = null,
  }) {
    return _then(_$ProductDetailAggregateImpl(
      materialInfo: null == materialInfo
          ? _value.materialInfo
          : materialInfo // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      productItem: null == productItem
          ? _value.productItem
          : productItem // ignore: cast_nullable_to_non_nullable
              as ProductItem,
      similarProduct: null == similarProduct
          ? _value._similarProduct
          : similarProduct // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      stockInfo: null == stockInfo
          ? _value.stockInfo
          : stockInfo // ignore: cast_nullable_to_non_nullable
              as StockInfo,
      exeedQty: null == exeedQty
          ? _value.exeedQty
          : exeedQty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProductDetailAggregateImpl extends _ProductDetailAggregate {
  _$ProductDetailAggregateImpl(
      {required this.materialInfo,
      required this.productItem,
      required final List<MaterialInfo> similarProduct,
      required this.stockInfo,
      required this.exeedQty})
      : _similarProduct = similarProduct,
        super._();

  @override
  final MaterialInfo materialInfo;
  @override
  final ProductItem productItem;
  final List<MaterialInfo> _similarProduct;
  @override
  List<MaterialInfo> get similarProduct {
    if (_similarProduct is EqualUnmodifiableListView) return _similarProduct;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_similarProduct);
  }

  @override
  final StockInfo stockInfo;
  @override
  final bool exeedQty;

  @override
  String toString() {
    return 'ProductDetailAggregate(materialInfo: $materialInfo, productItem: $productItem, similarProduct: $similarProduct, stockInfo: $stockInfo, exeedQty: $exeedQty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailAggregateImpl &&
            (identical(other.materialInfo, materialInfo) ||
                other.materialInfo == materialInfo) &&
            (identical(other.productItem, productItem) ||
                other.productItem == productItem) &&
            const DeepCollectionEquality()
                .equals(other._similarProduct, _similarProduct) &&
            (identical(other.stockInfo, stockInfo) ||
                other.stockInfo == stockInfo) &&
            (identical(other.exeedQty, exeedQty) ||
                other.exeedQty == exeedQty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      materialInfo,
      productItem,
      const DeepCollectionEquality().hash(_similarProduct),
      stockInfo,
      exeedQty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailAggregateImplCopyWith<_$ProductDetailAggregateImpl>
      get copyWith => __$$ProductDetailAggregateImplCopyWithImpl<
          _$ProductDetailAggregateImpl>(this, _$identity);
}

abstract class _ProductDetailAggregate extends ProductDetailAggregate {
  factory _ProductDetailAggregate(
      {required final MaterialInfo materialInfo,
      required final ProductItem productItem,
      required final List<MaterialInfo> similarProduct,
      required final StockInfo stockInfo,
      required final bool exeedQty}) = _$ProductDetailAggregateImpl;
  _ProductDetailAggregate._() : super._();

  @override
  MaterialInfo get materialInfo;
  @override
  ProductItem get productItem;
  @override
  List<MaterialInfo> get similarProduct;
  @override
  StockInfo get stockInfo;
  @override
  bool get exeedQty;
  @override
  @JsonKey(ignore: true)
  _$$ProductDetailAggregateImplCopyWith<_$ProductDetailAggregateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
