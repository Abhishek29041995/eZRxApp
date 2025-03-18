import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';

import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_tender_contract.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/batches_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_details_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_tender_contract_details_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_order_items_dto.freezed.dart';
part 'order_history_details_order_items_dto.g.dart';

@freezed
class OrderHistoryDetailsOrderItemDto with _$OrderHistoryDetailsOrderItemDto {
  const OrderHistoryDetailsOrderItemDto._();
  const factory OrderHistoryDetailsOrderItemDto({
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'materialCode') required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
    required String materialDescription,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
    required String defaultMaterialDescription,
    @JsonKey(name: 'qty', defaultValue: 0) required int qty,
    @JsonKey(name: 'unitPrice', defaultValue: 0.0) required double unitPrice,
    @JsonKey(name: 'mrp', defaultValue: 0.0) required double originPrice,
    @JsonKey(name: 'totalPrice', defaultValue: 0.0) required double totalPrice,
    @JsonKey(name: 'tax', defaultValue: 0.0) required double tax,
    @JsonKey(name: 'sAPStatus', defaultValue: '') required String sAPStatus,
    @JsonKey(name: 'plannedDeliveryDate', defaultValue: '')
    required String plannedDeliveryDate,
    @JsonKey(name: 'pickedQuantity', defaultValue: 0)
    required int pickedQuantity,
    @JsonKey(name: 'lineReferenceNotes', defaultValue: '')
    required String lineReferenceNotes,
    @JsonKey(name: 'lineNumber', defaultValue: '') required String lineNumber,
    @JsonKey(
      name: 'isTenderContractMaterial',
      defaultValue: false,
      readValue: JsonReadValueHelper.readBoolStringFormat,
    )
    required bool isTenderContractMaterial,
    @JsonKey(name: 'parentID', defaultValue: '') required String parentId,
    @JsonKey(
      name: 'details',
      defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[],
    )
    required List<OrderHistoryDetailsOrderItemDetailsDto> details,
    @JsonKey(
      name: 'tenderContractDetails',
      readValue: JsonReadValueHelper.readValueMapDynamic,
    )
    required OrderHistoryDetailsTenderContractDto tenderContractDetails,
    @JsonKey(name: 'principalName', defaultValue: '')
    required String principalName,
    @JsonKey(name: 'principalCode', defaultValue: '')
    required String principalCode,
    @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
    required String governmentMaterialCode,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
    required String itemRegistrationNumber,
    @JsonKey(
      name: 'productType',
      readValue: JsonReadValueHelper.readProductType,
    )
    required String productType,
    @JsonKey(name: 'promoStatus', defaultValue: false)
    required bool promosStatus,
    @JsonKey(name: 'isCounterOffer', defaultValue: false)
    required bool isCounterOffer,
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(
      defaultValue: false,
      readValue: JsonReadValueHelper.mappingIsMarketPlace,
    )
    required bool isMarketPlace,
    @JsonKey(name: 'isCovid', defaultValue: false) required bool isCovid,
    @JsonKey(name: 'totalUnitPrice', defaultValue: 0.0)
    required double totalUnitPrice,
    @JsonKey(name: 'totalTax', defaultValue: 0.0) required double totalTax,
    @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
    required double taxRate,
    @JsonKey(
      name: 'batches',
      defaultValue: <BatchesDto>[],
    )
    required List<BatchesDto> batches,
  }) = _OrderHistoryDetailsOrderItemDto;
  factory OrderHistoryDetailsOrderItemDto.fromDomain(
    OrderHistoryDetailsOrderItem orderHistoryDetailsOrderItem,
  ) {
    return OrderHistoryDetailsOrderItemDto(
      type: orderHistoryDetailsOrderItem.type.getOrCrash(),
      materialNumber: orderHistoryDetailsOrderItem.materialNumber.displayMatNo,
      materialDescription: orderHistoryDetailsOrderItem.materialDescription,
      defaultMaterialDescription:
          orderHistoryDetailsOrderItem.defaultMaterialDescription,
      qty: orderHistoryDetailsOrderItem.qty,
      unitPrice: orderHistoryDetailsOrderItem.unitPrice,
      originPrice: orderHistoryDetailsOrderItem.originPrice,
      totalPrice: orderHistoryDetailsOrderItem.totalPrice,
      tax: orderHistoryDetailsOrderItem.tax,
      sAPStatus: orderHistoryDetailsOrderItem.sAPStatus.displayOrderStatus,
      plannedDeliveryDate:
          orderHistoryDetailsOrderItem.plannedDeliveryDate.dateString,
      pickedQuantity: orderHistoryDetailsOrderItem.pickedQuantity,
      lineReferenceNotes:
          orderHistoryDetailsOrderItem.lineReferenceNotes.getValue(),
      lineNumber: orderHistoryDetailsOrderItem.lineNumber.getOrDefaultValue(''),
      isTenderContractMaterial:
          orderHistoryDetailsOrderItem.isTenderContractMaterial,
      parentId: orderHistoryDetailsOrderItem.parentId,
      details: List.from(
        orderHistoryDetailsOrderItem.details,
      )
          .map((e) => OrderHistoryDetailsOrderItemDetailsDto.fromDomain(e))
          .toList(),
      tenderContractDetails: OrderHistoryDetailsTenderContractDto.fromDomain(
        orderHistoryDetailsOrderItem.tenderContractDetails,
      ),
      principalName: orderHistoryDetailsOrderItem.principalData.principalName
          .getOrDefaultValue(''),
      principalCode: orderHistoryDetailsOrderItem.principalData.principalCode
          .getOrDefaultValue(''),
      governmentMaterialCode:
          orderHistoryDetailsOrderItem.governmentMaterialCode,
      itemRegistrationNumber: orderHistoryDetailsOrderItem
          .itemRegistrationNumber
          .getOrDefaultValue(''),
      productType: orderHistoryDetailsOrderItem.productType.getValue(),
      promosStatus: orderHistoryDetailsOrderItem.promoStatus,
      isCounterOffer: orderHistoryDetailsOrderItem.isCounterOffer,
      hidePrice: orderHistoryDetailsOrderItem.hidePrice,
      isMarketPlace: orderHistoryDetailsOrderItem.isMarketPlace,
      isCovid: orderHistoryDetailsOrderItem.isCovid,
      taxRate: orderHistoryDetailsOrderItem.taxRate,
      totalTax: orderHistoryDetailsOrderItem.totalTax,
      totalUnitPrice: orderHistoryDetailsOrderItem.totalUnitPrice,
      batches: List.from(
        orderHistoryDetailsOrderItem.batches,
      ).map((e) => BatchesDto.fromDomain(e)).toList(),
    );
  }

  OrderHistoryDetailsOrderItem toDomain() {
    return OrderHistoryDetailsOrderItem(
      type: OrderItemType(type),
      materialNumber: MaterialNumber(materialNumber),
      materialDescription: materialDescription,
      defaultMaterialDescription: defaultMaterialDescription,
      qty: qty,
      unitPrice: unitPrice,
      originPrice: originPrice,
      totalPrice: totalPrice,
      tax: tax,
      sAPStatus: OrderStepValue(sAPStatus),
      plannedDeliveryDate: DateTimeStringValue(plannedDeliveryDate),
      pickedQuantity: pickedQuantity,
      lineReferenceNotes: Remarks(lineReferenceNotes),
      lineNumber: LineNumber(lineNumber),
      isTenderContractMaterial: isTenderContractMaterial,
      parentId: parentId,
      details: details.map((e) => e.toDomain()).toList(),
      tenderContractDetails: OrderHistoryDetailsTenderContract(
        contractNumber: TenderContractNumber(
          tenderContractDetails.contractNumber,
        ),
        orderReason: TenderContractReason(tenderContractDetails.orderReason),
        price: tenderContractDetails.price,
        priceUnit: tenderContractDetails.priceUnit,
        contractQuantity: tenderContractDetails.contractQuantity,
        remainingQuantity: tenderContractDetails.remainingQuantity,
        expiryDate: DateTimeStringValue(tenderContractDetails.expiryDate),
        contractReference: tenderContractDetails.contractReference,
        visaNumber: tenderContractDetails.visaNumber,
        announcementLetterNumber:
            tenderContractDetails.announcementLetterNumber,
        salesDistrict: '',
        isTenderExpired: tenderContractDetails.isTenderExpired,
      ),
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName(principalName),
        principalCode: PrincipalCode(principalCode),
      ),
      productImages: ProductImages.empty(),
      governmentMaterialCode: governmentMaterialCode,
      itemRegistrationNumber: ItemRegistrationNumber(itemRegistrationNumber),
      materialStockInfo: MaterialStockInfo.empty(),
      priceAggregate: PriceAggregate.empty(),
      productType: MaterialInfoType(productType),
      material: MaterialInfo.empty(),
      promoStatus: promosStatus,
      isCounterOffer: isCounterOffer,
      hidePrice: hidePrice,
      isMarketPlace: isMarketPlace,
      isCovid: isCovid,
      invoiceNumber: StringValue(''),
      taxRate: taxRate,
      totalTax: totalTax,
      totalUnitPrice: totalUnitPrice,
      batches: batches.map((e) => e.toDomain()).toList(),
    );
  }

  factory OrderHistoryDetailsOrderItemDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDetailsOrderItemDtoFromJson(json);
}
