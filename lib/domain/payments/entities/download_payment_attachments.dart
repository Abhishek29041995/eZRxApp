import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_payment_attachments.freezed.dart';

@freezed
class DownloadPaymentAttachment with _$DownloadPaymentAttachment {
  const DownloadPaymentAttachment._();

  const factory DownloadPaymentAttachment({
    required String url,
  }) = _DownloadPaymentAttachment;

  factory DownloadPaymentAttachment.empty() => const DownloadPaymentAttachment(
        url: '',
      );
}
