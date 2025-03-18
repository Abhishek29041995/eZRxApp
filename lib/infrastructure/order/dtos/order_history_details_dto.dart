import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_payment_term_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_po_documents_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_dto.freezed.dart';
part 'order_history_details_dto.g.dart';

@freezed
class OrderHistoryDetailsDto with _$OrderHistoryDetailsDto {
  const OrderHistoryDetailsDto._();
  const factory OrderHistoryDetailsDto({
    @JsonKey(name: 'orderValue', defaultValue: 0.0) required double orderValue,
    @JsonKey(name: 'totalTax', defaultValue: 0) required double totalTax,
    @JsonKey(name: 'deliveryFee', defaultValue: 0) required double deliveryFee,
    @JsonKey(name: 'manualFee', defaultValue: 0) required double manualFee,
    @JsonKey(name: 'totalValue', defaultValue: 0) required double totalValue,
    @JsonKey(name: 'totalDiscount', defaultValue: 0)
    required double totalDiscount,
    @JsonKey(name: 'processingStatus', defaultValue: '')
    required String processingStatus,
    @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
    required String requestedDeliveryDate,
    @JsonKey(name: 'expectedDeliveryDate', defaultValue: '')
    required String expectedDeliveryDate,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'telephoneNumber', defaultValue: '')
    required String telephoneNumber,
    @JsonKey(readValue: JsonReadValueHelper.readCreatedDateTimeValue)
    required String createdDate,
    @JsonKey(name: 'eZRXNumber', defaultValue: '') required String eZRXNumber,
    @JsonKey(name: 'orderBy', defaultValue: '') required String orderBy,
    @JsonKey(name: 'referenceNotes', defaultValue: '')
    required String referenceNotes,
    @JsonKey(name: 'companyName', defaultValue: '') required String companyName,
    @JsonKey(name: 'orderNumber', defaultValue: '') required String orderNumber,
    @JsonKey(name: 'pOReference', defaultValue: '') required String pOReference,
    @JsonKey(name: 'shipTo', defaultValue: '') required String shipTo,
    @JsonKey(name: 'soldTo', defaultValue: '') required String soldTo,
    @JsonKey(name: 'shipToAddres', defaultValue: '')
    required String shipToAddress,
    @JsonKey(name: 'soldToAddress', defaultValue: '')
    required String soldToAddress,
    @JsonKey(name: 'invoiceNumber', defaultValue: '')
    required String invoiceNumber,
    @JsonKey(name: 'orderReason', defaultValue: '') required String orderReason,
    @JsonKey(name: 'orderItems', readValue: JsonReadValueHelper.readList)
    required List<OrderHistoryDetailsOrderItemDto> orderHistoryDetailsOrderItem,
    @JsonKey(
      name: 'paymentTerm',
      readValue: JsonReadValueHelper.readValueMapDynamic,
    )
    required OrderHistoryDetailsPaymentTermDto orderHistoryDetailsPaymentTerm,
    @JsonKey(
      name: 'specialInstructions',
      readValue: JsonReadValueHelper.readString,
    )
    required String orderHistoryDetailsSpecialInstructions,
    @JsonKey(
      name: 'pODocuments',
      readValue: JsonReadValueHelper.readList,
    )
    required List<PoDocumentsDto> orderHistoryDetailsPoDocuments,
    @JsonKey(name: 'itmCount', defaultValue: 0) required int itemCount,
    @JsonKey(
      defaultValue: false,
      readValue: JsonReadValueHelper.mappingIsMarketPlace,
    )
    required bool isMarketPlace,
    @JsonKey(name: 'taxRate', readValue: JsonReadValueHelper.handleTax)
    required double taxRate,
  }) = _OrderHistoryDetailsDto;
  factory OrderHistoryDetailsDto.fromDomain(
    OrderHistoryDetails orderHistoryDetails,
  ) {
    return OrderHistoryDetailsDto(
      totalTax: orderHistoryDetails.totalTax,
      deliveryFee: orderHistoryDetails.deliveryFee,
      manualFee: orderHistoryDetails.manualFee,
      totalDiscount: orderHistoryDetails.manualFee,
      totalValue: orderHistoryDetails.totalValue,
      processingStatus:
          orderHistoryDetails.processingStatus.getOrDefaultValue(''),
      requestedDeliveryDate:
          orderHistoryDetails.requestedDeliveryDate.dateString,
      expectedDeliveryDate: orderHistoryDetails.expectedDeliveryDate.dateString,
      type: orderHistoryDetails.type.documentTypeCode,
      telephoneNumber:
          orderHistoryDetails.telephoneNumber.displayTelephoneNumber,
      orderValue: orderHistoryDetails.orderValue,
      createdDate: orderHistoryDetails.createdDate.getValue(),
      eZRXNumber: orderHistoryDetails.eZRXNumber,
      orderBy: orderHistoryDetails.orderBy.getOrDefaultValue(''),
      referenceNotes: orderHistoryDetails.referenceNotes.getOrDefaultValue(''),
      companyName: orderHistoryDetails.companyName.getValue(),
      orderNumber: orderHistoryDetails.orderNumber.getValue(),
      pOReference: orderHistoryDetails.poReference.displayNAIfEmpty,
      shipTo: orderHistoryDetails.shipTo,
      soldTo: orderHistoryDetails.soldTo,
      shipToAddress: orderHistoryDetails.shipToAddress,
      soldToAddress: orderHistoryDetails.soldToAddress,
      invoiceNumber: orderHistoryDetails.invoiceNumber.getOrDefaultValue(''),
      orderReason: orderHistoryDetails.orderReason,
      orderHistoryDetailsOrderItem:
          List.from(orderHistoryDetails.orderHistoryDetailsOrderItem)
              .map((e) => OrderHistoryDetailsOrderItemDto.fromDomain(e))
              .toList(),
      orderHistoryDetailsPaymentTerm:
          OrderHistoryDetailsPaymentTermDto.fromDomain(
        orderHistoryDetails.orderHistoryDetailsPaymentTerm,
      ),
      orderHistoryDetailsSpecialInstructions: orderHistoryDetails
          .orderHistoryDetailsSpecialInstructions.displayNAIfEmpty,
      orderHistoryDetailsPoDocuments:
          List.from(orderHistoryDetails.orderHistoryDetailsPoDocuments)
              .map((e) => PoDocumentsDto.fromDomain(e))
              .toList(),
      itemCount: orderHistoryDetails.orderItemsCount,
      isMarketPlace: orderHistoryDetails.isMarketPlace,
      taxRate: orderHistoryDetails.taxRate,
    );
  }

  OrderHistoryDetails toDomain() {
    return OrderHistoryDetails(
      deliveryFee: deliveryFee,
      manualFee: manualFee,
      totalDiscount: totalDiscount,
      totalValue: totalValue,
      totalTax: totalTax,
      processingStatus: OrderStepValue(processingStatus),
      requestedDeliveryDate: DateTimeStringValue(requestedDeliveryDate),
      expectedDeliveryDate: DateTimeStringValue(expectedDeliveryDate),
      type: DocumentType(type),
      telephoneNumber: PhoneNumber(telephoneNumber),
      orderValue: orderValue,
      createdDate: DateTimeStringValue(createdDate),
      eZRXNumber: eZRXNumber,
      orderBy: StringValue(orderBy),
      referenceNotes: StringValue(referenceNotes),
      companyName: CompanyName(companyName),
      orderNumber: OrderNumber(orderNumber),
      poReference: StringValue(pOReference),
      shipTo: shipTo,
      soldTo: soldTo,
      shipToAddress: shipToAddress,
      soldToAddress: soldToAddress,
      invoiceNumber: StringValue(invoiceNumber),
      orderReason: orderReason,
      orderHistoryDetailsOrderItem:
          orderHistoryDetailsOrderItem.map((dto) => dto.toDomain()).toList(),
      orderHistoryDetailsPaymentTerm: orderHistoryDetailsPaymentTerm.toDomain(),
      orderHistoryDetailsSpecialInstructions:
          StringValue(orderHistoryDetailsSpecialInstructions),
      orderHistoryDetailsPoDocuments:
          orderHistoryDetailsPoDocuments.map((dto) => dto.toDomain()).toList(),
      itemCount: itemCount,
      isMarketPlace: isMarketPlace,
      taxRate: taxRate,
    );
  }

  factory OrderHistoryDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDetailsDtoFromJson(json);
}
