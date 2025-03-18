import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/batches_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_po_documents_dto.dart';

part 'order_history_item_dto.freezed.dart';
part 'order_history_item_dto.g.dart';

@freezed
class OrderHistoryItemDto with _$OrderHistoryItemDto {
  const OrderHistoryItemDto._();
  const factory OrderHistoryItemDto({
    @JsonKey(name: 'materialCode', defaultValue: '')
    required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
    required String materialDescription,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
    required String defaultMaterialDescription,
    @JsonKey(name: 'qty', defaultValue: 0) required int qty,
    @JsonKey(name: 'unitPrice', defaultValue: 0.0) required double unitPrice,
    @JsonKey(name: 'mrp', defaultValue: 0.0) required double originPrice,
    @JsonKey(name: 'totalPrice', defaultValue: 0.0) required double totalPrice,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'deliveryDate', defaultValue: '')
    required String deliveryDate,
    @JsonKey(name: 'orderNumber', defaultValue: '') required String orderNumber,
    @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
    required String createdDate,
    @JsonKey(name: 'orderBy', defaultValue: '') required String orderBy,
    @JsonKey(name: 'orderType', defaultValue: '') required String orderType,
    @JsonKey(name: 'isBonusMaterial', defaultValue: false)
    required bool isBonusMaterial,
    @JsonKey(name: 'telephoneNumber', defaultValue: '')
    required String telephoneNumber,
    @JsonKey(name: 'invoiceNumber', defaultValue: '')
    required String invoiceNumber,
    @JsonKey(name: 'pOReference', defaultValue: '') required String pOReference,
    @JsonKey(name: 'manufactureName', defaultValue: '')
    required String manufactureName,
    @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
    required String governmentMaterialCode,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
    required String itemRegistrationNumber,
    @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
    required String requestedDeliveryDate,
    @JsonKey(name: 'specialInstructions', defaultValue: '')
    required String specialInstruction,
    @JsonKey(name: 'tax', defaultValue: 0.0) required double tax,
    @JsonKey(name: 'eZRXNumber', defaultValue: '') required String eZRXNumber,
    @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
    required List<PoDocumentsDto> orderHistoryItemPoAttachments,
    @JsonKey(name: 'promoStatus', defaultValue: false)
    required bool promoStatus,
    @JsonKey(name: 'isCounterOffer', defaultValue: false)
    required bool isCounterOffer,
    @JsonKey(name: 'isBundle', defaultValue: false) required bool isBundle,
    @JsonKey(name: 'lineNumber', defaultValue: '') required String lineNumber,
    @JsonKey(name: 'principalCode', defaultValue: '')
    required String principalCode,
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(name: 'referenceNotes', defaultValue: '')
    required String referenceNotes,
    @JsonKey(
      defaultValue: false,
      readValue: JsonReadValueHelper.mappingIsMarketPlace,
    )
    required bool isMarketPlace,
    @JsonKey(name: 'tenderContractNumber', defaultValue: '')
    required String tenderContractNumber,
    @JsonKey(name: 'tenderContractReference', defaultValue: '')
    required String tenderContractReference,
    @JsonKey(name: 'tenderOrderReason', defaultValue: '')
    required String tenderOrderReason,
    @JsonKey(name: 'tenderPriceUnit', defaultValue: 0)
    required int tenderPriceUnit,
    @StringToDoubleConverter()
    @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
    required double tenderPrice,
    @JsonKey(name: 'isTenderExpire', defaultValue: false)
    required bool isTenderExpired,
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
  }) = _OrderHistoryItemDto;

  factory OrderHistoryItemDto.fromDomain(OrderHistoryItem orderHistoryItem) {
    return OrderHistoryItemDto(
      materialNumber: orderHistoryItem.materialNumber.displayMatNo,
      materialDescription: orderHistoryItem.materialDescription,
      defaultMaterialDescription: orderHistoryItem.defaultMaterialDescription,
      qty: orderHistoryItem.qty,
      unitPrice: orderHistoryItem.unitPrice,
      originPrice: orderHistoryItem.originPrice,
      totalPrice: orderHistoryItem.totalPrice,
      status: orderHistoryItem.status.getOrCrash(),
      deliveryDate: orderHistoryItem.deliveryDate.dateString,
      orderNumber: orderHistoryItem.orderNumber.getOrCrash(),
      createdDate: orderHistoryItem.createdDate.dateString,
      tax: orderHistoryItem.tax,
      orderBy: orderHistoryItem.orderBy.getOrDefaultValue(''),
      orderType: orderHistoryItem.orderType.getOrCrash(),
      isBonusMaterial: orderHistoryItem.isBonusMaterial,
      telephoneNumber: orderHistoryItem.telephoneNumber.displayTelephoneNumber,
      invoiceNumber: orderHistoryItem.invoiceNumber.getOrDefaultValue(''),
      pOReference: orderHistoryItem.poReference.displayNAIfEmpty,
      requestedDeliveryDate: orderHistoryItem.requestedDeliveryDate.dateString,
      specialInstruction: orderHistoryItem.specialInstructions.displayNAIfEmpty,
      orderHistoryItemPoAttachments: orderHistoryItem
          .orderHistoryItemPoAttachments
          .map((e) => PoDocumentsDto.fromDomain(e))
          .toList(),
      eZRXNumber: orderHistoryItem.ezrxNumber.getOrDefaultValue(''),
      isBundle: orderHistoryItem.isBundle,
      promoStatus: orderHistoryItem.promoStatus,
      isCounterOffer: orderHistoryItem.isCounterOffer,
      lineNumber: orderHistoryItem.lineNumber.getOrDefaultValue(''),
      principalCode:
          orderHistoryItem.principalData.principalCode.getOrDefaultValue(''),
      manufactureName:
          orderHistoryItem.principalData.principalName.getOrDefaultValue(''),
      governmentMaterialCode: orderHistoryItem.governmentMaterialCode,
      itemRegistrationNumber:
          orderHistoryItem.itemRegistrationNumber.getOrDefaultValue(''),
      hidePrice: orderHistoryItem.hidePrice,
      referenceNotes: orderHistoryItem.referenceNotes.getOrDefaultValue(''),
      isMarketPlace: orderHistoryItem.isMarketPlace,
      tenderContractNumber:
          orderHistoryItem.tenderContractNumber.getOrDefaultValue(''),
      tenderContractReference:
          orderHistoryItem.tenderContractReference.getOrDefaultValue(''),
      tenderPriceUnit: orderHistoryItem.tenderPriceUnit,
      tenderPrice: orderHistoryItem.tenderPrice,
      tenderOrderReason:
          orderHistoryItem.tenderOrderReason.getOrDefaultValue(''),
      isTenderExpired: orderHistoryItem.isTenderExpired,
      isCovid: orderHistoryItem.isCovid,
      taxRate: orderHistoryItem.taxRate,
      totalTax: orderHistoryItem.totalTax,
      totalUnitPrice: orderHistoryItem.totalUnitPrice,
      batches: orderHistoryItem.batches
          .map((e) => BatchesDto.fromDomain(e))
          .toList(),
    );
  }
  OrderHistoryItem toDomain() {
    return OrderHistoryItem(
      materialNumber: MaterialNumber(materialNumber),
      materialDescription: materialDescription,
      defaultMaterialDescription: defaultMaterialDescription,
      qty: qty,
      unitPrice: unitPrice,
      originPrice: originPrice,
      totalPrice: totalPrice,
      status: OrderStepValue(status),
      deliveryDate: DateTimeStringValue(deliveryDate),
      orderNumber: OrderNumber(orderNumber),
      createdDate: DateTimeStringValue(createdDate),
      tax: tax,
      orderBy: StringValue(orderBy),
      orderType: DocumentType(orderType),
      invoiceNumber: StringValue(invoiceNumber),
      isBonusMaterial: isBonusMaterial,
      poReference: StringValue(pOReference),
      telephoneNumber: PhoneNumber(telephoneNumber),
      productImages: ProductImages.empty(),
      requestedDeliveryDate: DateTimeStringValue(requestedDeliveryDate),
      specialInstructions: StringValue(specialInstruction),
      orderHistoryItemPoAttachments:
          orderHistoryItemPoAttachments.map((e) => e.toDomain()).toList(),
      ezrxNumber: StringValue(eZRXNumber),
      isBundle: isBundle,
      promoStatus: promoStatus,
      isCounterOffer: isCounterOffer,
      lineNumber: LineNumber(lineNumber),
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName(manufactureName),
        principalCode: PrincipalCode(principalCode),
      ),
      governmentMaterialCode: governmentMaterialCode,
      itemRegistrationNumber: ItemRegistrationNumber(itemRegistrationNumber),
      hidePrice: hidePrice,
      referenceNotes: StringValue(referenceNotes),
      isMarketPlace: isMarketPlace,
      tenderContractNumber: TenderContractNumber(tenderContractNumber),
      tenderContractReference: TenderContractNumber(tenderContractReference),
      tenderPriceUnit: tenderPriceUnit,
      tenderPrice: tenderPrice,
      tenderOrderReason: TenderContractReason(tenderOrderReason),
      isTenderExpired: isTenderExpired,
      isCovid: isCovid,
      taxRate: taxRate,
      totalTax: totalTax,
      totalUnitPrice: totalUnitPrice,
      batches: batches.map((e) => e.toDomain()).toList(),
    );
  }

  factory OrderHistoryItemDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryItemDtoFromJson(json);
}
