import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:flutter/services.dart';

class AnnouncementAttachmentDownloadLocalDataSource {
  Future<AttachmentFileBuffer> fileDownload(
    String name,
  ) async {
    final bytes = await rootBundle.load(
      'assets/svg/pdf_icon.svg',
    );
    final list = bytes.buffer.asUint8List();

    return AttachmentFileBuffer(
      name: name,
      buffer: list,
    );
  }
}
