import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_meta_data.freezed.dart';

@freezed
class ProductMetaData with _$ProductMetaData {
  const ProductMetaData._();
  factory ProductMetaData({
    required List<ProductImages> productImages,
    required List<ProductItem> items,
  }) = _ProductMetaData;

  factory ProductMetaData.empty() => ProductMetaData(
        productImages: <ProductImages>[],
        items: <ProductItem>[],
      );

  Map<MaterialNumber, ProductMetaData> get metaDataMap {
    final metaDataMap = imageMap.map(
      (key, value) => MapEntry(
        key,
        ProductMetaData.empty().copyWith(productImages: [value]),
      ),
    );
    for (final item in items) {
      if (metaDataMap.containsKey(item.materialNumber)) {
        metaDataMap[item.materialNumber] =
            metaDataMap[item.materialNumber]!.copyWith(items: [item]);
      } else {
        metaDataMap.addAll({
          item.materialNumber: ProductMetaData.empty().copyWith(items: [item]),
        });
      }
    }

    return metaDataMap;
  }

  Map<MaterialNumber, ProductImages> get imageMap =>
      {for (final image in productImages) image.materialNumber: image};
}

@freezed
class ProductItem with _$ProductItem {
  const ProductItem._();
  factory ProductItem({
    required StringValue promotionMaterial,
    required ProductItemXp productItemXp,
    required MaterialNumber materialNumber,
  }) = _ProductItem;

  factory ProductItem.empty() => ProductItem(
        promotionMaterial: StringValue(''),
        productItemXp: ProductItemXp.empty(),
        materialNumber: MaterialNumber(''),
      );

  bool get isProductDetailsAvailable =>
      promotionMaterial.isNotEmpty || productItemXp != ProductItemXp.empty();
}

@freezed
class ProductItemXp with _$ProductItemXp {
  const ProductItemXp._();
  factory ProductItemXp({
    required StringValue dosage,
    required StringValue howToUse,
    required StringValue composition,
    required StringValue deliveryInstructions,
  }) = _ProductItemXp;

  factory ProductItemXp.empty() => ProductItemXp(
        composition: StringValue(''),
        deliveryInstructions: StringValue(''),
        dosage: StringValue(''),
        howToUse: StringValue(''),
      );
}
