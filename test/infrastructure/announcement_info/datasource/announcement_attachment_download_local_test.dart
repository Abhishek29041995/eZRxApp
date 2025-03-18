import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_attachment_download_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AnnouncementAttachmentDownloadLocalDataSource localDataSource;
  const fileName = 'fake-name';

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = AnnouncementAttachmentDownloadLocalDataSource();
    },
  );
  group(
    'Announcement Attachment Download local',
    () {
      test(
        'File Download success',
        () async {
          final bytes = await rootBundle.load(
            'assets/svg/pdf_icon.svg',
          );

          final result = await localDataSource.fileDownload(fileName);

          final list = bytes.buffer.asUint8List();

          expect(
            result,
            AttachmentFileBuffer(
              name: fileName,
              buffer: list,
            ),
          );
        },
      );
    },
  );
}
