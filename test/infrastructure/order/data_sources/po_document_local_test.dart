import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_po_documents_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/png_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localDataSource = PoDocumentLocalDataSource();
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
  group(
    'PoDocument Local DataSource',
    () {
      test(
        'File Download',
        () async {
          final data = await rootBundle.load(PngImage.splash);
          final result = await localDataSource.fileDownload('fake_name');

          expect(
            result,
            AttachmentFileBuffer(
              name: 'fake_name',
              buffer: data.buffer.asUint8List(),
            ),
          );
        },
      );

      test(
        'File Upload',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/common/poUploadResponse.json',
            ),
          );

          final result = await localDataSource.fileUpload();

          expect(
            result,
            PoDocumentsDto.fromJson(res).toDomain(),
          );
        },
      );
      test(
        'Delete File',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/delete_file/deleteFileQueryResponse.json',
            ),
          );

          final result = await localDataSource.deleteFile();

          expect(
            result,
            res['data']['deleteFile']['isDeleted'],
          );
        },
      );
    },
  );
}
