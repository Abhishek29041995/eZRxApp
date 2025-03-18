import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final image1 =
      ProductImages.empty().copyWith(materialNumber: MaterialNumber('test1'));
  final image2 =
      ProductImages.empty().copyWith(materialNumber: MaterialNumber('test2'));
  final item1 =
      ProductItem.empty().copyWith(materialNumber: MaterialNumber('test1'));
  final item2 =
      ProductItem.empty().copyWith(materialNumber: MaterialNumber('test3'));

  group('ProductMetaData test -', () {
    test('"imageMap" getter', () {
      final entity = ProductMetaData.empty().copyWith(
        productImages: [image1, image2],
      );

      expect(
        entity.imageMap,
        {MaterialNumber('test1'): image1, MaterialNumber('test2'): image2},
      );
    });

    test('"metaDataMap" getter', () {
      final entity = ProductMetaData(
        productImages: [image1, image2],
        items: [item1, item2],
      );

      expect(entity.metaDataMap, {
        MaterialNumber('test1'):
            ProductMetaData(productImages: [image1], items: [item1]),
        MaterialNumber('test2'):
            ProductMetaData.empty().copyWith(productImages: [image2]),
        MaterialNumber('test3'):
            ProductMetaData.empty().copyWith(items: [item2]),
      });
    });
  });
}
