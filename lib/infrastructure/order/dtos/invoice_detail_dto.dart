import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_detail.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_detail_dto.freezed.dart';
part 'invoice_detail_dto.g.dart';

@freezed
class InvoiceDetailDto with _$InvoiceDetailDto {
  const InvoiceDetailDto._();
  const factory InvoiceDetailDto({
    @JsonKey(name: 'invoiceNumber', defaultValue: '')
    required String invoiceNumber,
    @JsonKey(name: 'invoiceDate', defaultValue: '') required String invoiceDate,
    @JsonKey(name: 'invoiceProcessingStatus', defaultValue: '')
    required String invoiceProcessingStatus,
    @JsonKey(name: 'invoiceTotalPrice', defaultValue: 0)
    required num invoiceTotalPrice,
    @JsonKey(name: 'invoiceTotalQty', defaultValue: 0)
    required num invoiceTotalQty,
    @JsonKey(name: 'invoiceItems')
    required List<OrderHistoryDetailsOrderItemDto> invoiceItems,
  }) = _InvoiceDetailDto;

  factory InvoiceDetailDto.fromDomain(InvoiceDetail invoiceDetail) {
    return InvoiceDetailDto(
      invoiceNumber: invoiceDetail.invoiceNumber.getOrDefaultValue(''),
      invoiceDate: invoiceDetail.invoiceDate.getOrDefaultValue(''),
      invoiceProcessingStatus:
          invoiceDetail.invoiceStatus.getOrDefaultValue(''),
      invoiceTotalPrice: invoiceDetail.invoiceTotalPrice,
      invoiceTotalQty: invoiceDetail.invoiceTotalQty,
      invoiceItems: invoiceDetail.orderItems
          .map((e) => OrderHistoryDetailsOrderItemDto.fromDomain(e))
          .toList(),
    );
  }

  InvoiceDetail toDomain() {
    return InvoiceDetail(
      invoiceNumber: StringValue(invoiceNumber),
      invoiceDate: DateTimeStringValue(invoiceDate),
      invoiceStatus: StatusType(invoiceProcessingStatus),
      orderItems: invoiceItems.map((dto) => dto.toDomain()).toList(),
      invoiceTotalPrice: invoiceTotalPrice.toDouble(),
      invoiceTotalQty: invoiceTotalQty.toInt(),
    );
  }

  factory InvoiceDetailDto.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailDtoFromJson(json);
}

@freezed
class InvoiceDetailResponseDto with _$InvoiceDetailResponseDto {
  const InvoiceDetailResponseDto._();
  factory InvoiceDetailResponseDto({
    @JsonKey(name: 'invoiceCount', defaultValue: 0) required int count,
    @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailDto>[])
    required List<InvoiceDetailDto> invoiceDetails,
  }) = _InvoiceDetailResponseDto;

  factory InvoiceDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailResponseDtoFromJson(json);

  InvoiceDetailResponse toDomain() => InvoiceDetailResponse(
        invoiceCount: count,
        invoiceDetails: invoiceDetails.map((e) => e.toDomain()).toList(),
      );
}
