import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';

part 'download_payment_attachment_dto.freezed.dart';
part 'download_payment_attachment_dto.g.dart';

@freezed
class DownloadPaymentAttachmentDto with _$DownloadPaymentAttachmentDto {
  const DownloadPaymentAttachmentDto._();

  const factory DownloadPaymentAttachmentDto({
    @JsonKey(name: 'url', defaultValue: '') required String url,
  }) = _DownloadPaymentAttachmentDto;

  DownloadPaymentAttachment toDomain() {
    return DownloadPaymentAttachment(
      url: url,
    );
  }

  factory DownloadPaymentAttachmentDto.fromJson(Map<String, dynamic> json) =>
      _$DownloadPaymentAttachmentDtoFromJson(json);
}
