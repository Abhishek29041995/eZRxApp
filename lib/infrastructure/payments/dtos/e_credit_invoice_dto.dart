import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'e_credit_invoice_dto.freezed.dart';
part 'e_credit_invoice_dto.g.dart';

@freezed
class ECreditInvoiceDto with _$ECreditInvoiceDto {
  const ECreditInvoiceDto._();
  factory ECreditInvoiceDto({
    @JsonKey(name: 'name', defaultValue: '') required String name,
  }) = _ECreditInvoiceDto;

  factory ECreditInvoiceDto.fromJson(Map<String, dynamic> json) =>
      _$ECreditInvoiceDtoFromJson(json);

  DownloadPaymentAttachment toDomain() => DownloadPaymentAttachment(url: name);
}
