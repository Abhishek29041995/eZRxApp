import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/value/value_objects.dart';

part 'return_item_dto.freezed.dart';
part 'return_item_dto.g.dart';

@freezed
class ReturnItemDto with _$ReturnItemDto {
  const ReturnItemDto._();

  const factory ReturnItemDto({
    @JsonKey(name: 'requestId', defaultValue: '') required String requestId,
    @JsonKey(name: 'requestDate', defaultValue: '') required String requestDate,
    @JsonKey(name: 'itemQty', defaultValue: '0') required String itemQty,
    @JsonKey(name: 'totalPrice', defaultValue: '') required String totalPrice,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'materialNumber', defaultValue: '')
    required String materialNumber,
    @JsonKey(name: 'materialName', defaultValue: '')
    required String materialName,
    @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
    required String defaultMaterialDescription,
    @JsonKey(name: 'orderNumber', defaultValue: '') required String orderNumber,
    @JsonKey(name: 'invoiceID', defaultValue: '') required String invoiceID,
    @JsonKey(name: 'customerName', defaultValue: '')
    required String customerName,
    @JsonKey(name: 'batch', defaultValue: '') required String batch,
    @JsonKey(name: 'outsidePolicy', defaultValue: false)
    required bool outsidePolicy,
    @JsonKey(name: 'expiry', defaultValue: '') required String expiry,
    @JsonKey(name: 'prsfd', defaultValue: '') required String prsfd,
    @JsonKey(
      defaultValue: false,
      readValue: JsonReadValueHelper.mappingIsMarketPlace,
    )
    required bool isMarketPlace,
    @JsonKey(name: 'lineItemNumber', defaultValue: '')
    required String lineItemNumber,
    @JsonKey(name: 'wareHouseStorageCondition', defaultValue: '')
    required String wareHouseStorageCondition,
  }) = _ReturnItemDto;

  factory ReturnItemDto.fromDomain(
    ReturnItem returnItem,
  ) {
    return ReturnItemDto(
      requestId: returnItem.requestId,
      requestDate: returnItem.requestDate.getOrCrash(),
      itemQty: returnItem.itemQty.toString(),
      totalPrice: returnItem.totalPrice.toStringAsFixed(2),
      status: returnItem.status.getOrCrash(),
      materialNumber: returnItem.materialNumber.getOrCrash(),
      materialName: returnItem.materialName,
      defaultMaterialDescription: returnItem.defaultMaterialDescription,
      orderNumber: returnItem.orderNumber,
      invoiceID: returnItem.invoiceID,
      customerName: returnItem.customerName,
      batch: returnItem.batch,
      outsidePolicy: returnItem.outsidePolicy,
      expiry: returnItem.expiry.getOrCrash(),
      prsfd: returnItem.prsfd.getOrDefaultValue(''),
      isMarketPlace: returnItem.isMarketPlace,
      lineItemNumber: returnItem.lineNumber,
      wareHouseStorageCondition:
          returnItem.wareHouseStorageCondition.getOrDefaultValue(''),
    );
  }

  ReturnItem toDomain() {
    return ReturnItem(
      requestId: requestId,
      requestDate: DateTimeStringValue(requestDate),
      itemQty: ReturnQuantity(itemQty),
      totalPrice: double.parse(totalPrice),
      status: StatusType(status),
      materialNumber: MaterialNumber(materialNumber),
      materialName: materialName,
      defaultMaterialDescription: defaultMaterialDescription,
      orderNumber: orderNumber,
      invoiceID: invoiceID,
      customerName: customerName,
      batch: batch,
      outsidePolicy: outsidePolicy,
      expiry: DateTimeStringValue(expiry),
      productImages: ProductImages.empty(),
      prsfd: Prsfd(prsfd),
      isMarketPlace: isMarketPlace,
      lineNumber: lineItemNumber,
      wareHouseStorageCondition: StorageCondition(wareHouseStorageCondition),
    );
  }

  factory ReturnItemDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnItemDtoFromJson(json);
}
