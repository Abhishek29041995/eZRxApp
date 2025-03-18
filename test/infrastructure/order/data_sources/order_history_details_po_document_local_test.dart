import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/png_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PoDocumentLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = PoDocumentLocalDataSource();
    },
  );

  group(
    'Order History Details Po Doc',
    () {
      test(
        'Get Order History Details Po Doc',
        () async {
          final res = await rootBundle.load(PngImage.splash);

          final result = await localDataSource.fileDownload('fake-name');

          expect(
            result,
            AttachmentFileBuffer(
              name: 'fake-name',
              buffer: res.buffer.asUint8List(),
            ),
          );
        },
      );
    },
  );
}
