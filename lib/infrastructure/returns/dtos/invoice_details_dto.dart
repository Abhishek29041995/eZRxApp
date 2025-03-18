import 'package:ezrxmobile/infrastructure/returns/dtos/return_item_details_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';

part 'invoice_details_dto.freezed.dart';
part 'invoice_details_dto.g.dart';

@freezed
class InvoiceDetailsDto with _$InvoiceDetailsDto {
  const InvoiceDetailsDto._();

  const factory InvoiceDetailsDto({
    @JsonKey(
      name: 'invoiceNumber',
      defaultValue: '',
    )
        required String invoiceNumber,
    @JsonKey(name: 'salesOrg', defaultValue: '')
        required String salesOrg,
    @JsonKey(name: 'materials', defaultValue: <ReturnItemDetailsDto>[])
        required List<ReturnItemDetailsDto> materials,
  }) = _InvoiceDetailsDto;

  factory InvoiceDetailsDto.fromDomain(InvoiceDetails invoiceDetails) {
    return InvoiceDetailsDto(
      invoiceNumber: invoiceDetails.invoiceNumber,
      salesOrg: invoiceDetails.salesOrg.getOrCrash(),
      materials: invoiceDetails.returnItemDetailsList
          .map((e) => ReturnItemDetailsDto.fromDomain(e))
          .toList(),
    );
  }

  factory InvoiceDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailsDtoFromJson(json);
}
