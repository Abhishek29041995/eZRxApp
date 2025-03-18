import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_aggregate.freezed.dart';

@freezed
class ProductDetailAggregate with _$ProductDetailAggregate {
  const ProductDetailAggregate._();
  factory ProductDetailAggregate({
    required MaterialInfo materialInfo,
    required ProductItem productItem,
    required List<MaterialInfo> similarProduct,
    required StockInfo stockInfo,
    required bool exeedQty,
  }) = _ProductDetailAggregate;

  factory ProductDetailAggregate.empty() => ProductDetailAggregate(
        materialInfo: MaterialInfo.empty(),
        productItem: ProductItem.empty(),
        similarProduct: <MaterialInfo>[],
        stockInfo: StockInfo.empty(),
        exeedQty: false,
      );

  bool get productDetailsAvailable =>
      productItem.isProductDetailsAvailable ||
      materialInfo.productImages.description.isValid();

  bool isRemainingQuantityExceeded(int zdp5RemainingQuota) =>
      !exeedQty && (materialInfo.quantity.intValue > zdp5RemainingQuota);

  bool isRemainingQuantityNotExceeded(int zdp5RemainingQuota) =>
      exeedQty && (materialInfo.quantity.intValue <= zdp5RemainingQuota);

  bool hasRemainingQuotaReached(int zdp5RemainingQuota) =>
      isRemainingQuantityNotExceeded(zdp5RemainingQuota) ||
      isRemainingQuantityExceeded(zdp5RemainingQuota);

  List<MaterialInfo> get allMaterial => materialInfo.type.typeBundle
      ? materialInfo.bundle.materials
      : [materialInfo, ...similarProduct];
}
