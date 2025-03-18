import 'dart:convert';

import 'package:ezrxmobile/infrastructure/payments/dtos/e_credit_invoice_dto.dart';
import 'package:ezrxmobile/presentation/core/png_image.dart';
import 'package:flutter/services.dart';

import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';

import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';

import 'package:ezrxmobile/infrastructure/payments/dtos/download_payment_attachment_dto.dart';

class DownloadPaymentAttachmentLocalDataSource {
  DownloadPaymentAttachmentLocalDataSource();

  Future<DownloadPaymentAttachment> getFileDownloadUrl() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/payment_attachment/paymentAttachmentResponse.json',
      ),
    );

    return DownloadPaymentAttachmentDto.fromJson(
      data['data']['customerDocumentHeaderExcel'],
    ).toDomain();
  }

  Future<DownloadPaymentAttachment> getPaymentSummaryFileDownloadUrl() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/payment_summary_attachment/paymentSummaryAttachmentResponse.json',
      ),
    );

    return DownloadPaymentAttachmentDto.fromJson(
      data['data']['customerPaymentExcel'],
    ).toDomain();
  }

  Future<AttachmentFileBuffer> fileDownload() async {
    final data = await rootBundle.load(PngImage.splash);

    return AttachmentFileBuffer(
      name: 'paymentAttachments',
      buffer: data.buffer.asUint8List(),
    );
  }

  Future<AttachmentFileBuffer> soaDownload() async {
    final data = await rootBundle.load(PngImage.splash);

    return AttachmentFileBuffer(
      name: 'paymentAttachments',
      buffer: data.buffer.asUint8List(),
    );
  }

  Future<AttachmentFileBuffer> eInvoiceDownload() async {
    final data = await rootBundle.load(PngImage.splash);

    return AttachmentFileBuffer(
      name: 'paymentAttachments',
      buffer: data.buffer.asUint8List(),
    );
  }

  Future<DownloadPaymentAttachment> getECreditDownloadUrl() async {
    final res = json.decode(
      await rootBundle.loadString(
        'assets/json/common/eCreditResponse.json',
      ),
    );
    final data = res['data'].first;

    return ECreditInvoiceDto.fromJson(data).toDomain();
  }
}
