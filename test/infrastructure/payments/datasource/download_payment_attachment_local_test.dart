import 'dart:convert';

import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/download_payment_attachment_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/e_credit_invoice_dto.dart';
import 'package:ezrxmobile/presentation/core/png_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DownloadPaymentAttachmentLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = DownloadPaymentAttachmentLocalDataSource();
    },
  );

  group(
    'Download Payment Attachment Local DataSource Test',
    () {
      test(
        'get file download url',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/payment_attachment/paymentAttachmentResponse.json',
            ),
          );
          final expectedResult = DownloadPaymentAttachmentDto.fromJson(
            res['data']['customerDocumentHeaderExcel'],
          ).toDomain();

          final result = await localDataSource.getFileDownloadUrl();

          expect(
            result,
            expectedResult,
          );
        },
      );

      test(
        'get Payment Summary File Download Url',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/payment_summary_attachment/paymentSummaryAttachmentResponse.json',
            ),
          );
          final expectedResult = DownloadPaymentAttachmentDto.fromJson(
            res['data']['customerPaymentExcel'],
          ).toDomain();

          final result =
              await localDataSource.getPaymentSummaryFileDownloadUrl();

          expect(
            result,
            expectedResult,
          );
        },
      );

      test(
        'file download',
        () async {
          final data = await rootBundle.load(PngImage.splash);

          final expectedResult = AttachmentFileBuffer(
            name: 'paymentAttachments',
            buffer: data.buffer.asUint8List(),
          );

          final result = await localDataSource.fileDownload();

          expect(
            result,
            expectedResult,
          );
        },
      );

      test(
        'e invoice download',
        () async {
          final data = await rootBundle.load(PngImage.splash);

          final expectedResult = AttachmentFileBuffer(
            name: 'paymentAttachments',
            buffer: data.buffer.asUint8List(),
          );

          final result = await localDataSource.eInvoiceDownload();

          expect(
            result,
            expectedResult,
          );
        },
      );

      test(
        'soa download',
        () async {
          final data = await rootBundle.load(PngImage.splash);

          final expectedResult = AttachmentFileBuffer(
            name: 'paymentAttachments',
            buffer: data.buffer.asUint8List(),
          );

          final result = await localDataSource.soaDownload();

          expect(
            result,
            expectedResult,
          );
        },
      );

      test(
        'Get e credit url Local DataSource',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/common/eCreditResponse.json',
            ),
          );
          final data = ECreditInvoiceDto.fromJson(res['data'].first).toDomain();

          final result = await localDataSource.getECreditDownloadUrl();

          expect(
            result,
            data,
          );
        },
      );
    },
  );
}
