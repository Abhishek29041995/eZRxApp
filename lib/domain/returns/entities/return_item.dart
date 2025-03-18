import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/value/value_objects.dart';

part 'return_item.freezed.dart';

@freezed
class ReturnItem with _$ReturnItem {
  const ReturnItem._();

  const factory ReturnItem({
    required String requestId,
    required DateTimeStringValue requestDate,
    required ReturnQuantity itemQty,
    required double totalPrice,
    required StatusType status,
    required MaterialNumber materialNumber,
    required String materialName,
    required String defaultMaterialDescription,
    required String orderNumber,
    required String invoiceID,
    required String customerName,
    required String batch,
    required bool outsidePolicy,
    required DateTimeStringValue expiry,
    required ProductImages productImages,
    required Prsfd prsfd,
    required bool isMarketPlace,
    required String lineNumber,
    required StorageCondition wareHouseStorageCondition,
  }) = _ReturnItem;

  factory ReturnItem.empty() => ReturnItem(
        requestId: '',
        requestDate: DateTimeStringValue(''),
        itemQty: ReturnQuantity('0'),
        totalPrice: 0.0,
        status: StatusType(''),
        materialNumber: MaterialNumber(''),
        materialName: '',
        defaultMaterialDescription: '',
        orderNumber: '',
        invoiceID: '',
        customerName: '',
        batch: '',
        expiry: DateTimeStringValue(''),
        outsidePolicy: false,
        productImages: ProductImages.empty(),
        prsfd: Prsfd(''),
        isMarketPlace: false,
        lineNumber: '',
        wareHouseStorageCondition: StorageCondition(''),
      );

  String get displayBatch => isMarketPlace ? 'NA' : batch;

  String get displayExpiryDate => isMarketPlace ? 'NA' : expiry.dateOrNaString;
}
