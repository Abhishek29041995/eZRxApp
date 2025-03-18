import 'dart:convert';

import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_po_documents_dto.dart';
import 'package:ezrxmobile/presentation/core/png_image.dart';
import 'package:flutter/services.dart';

class PoDocumentLocalDataSource {
  Future<AttachmentFileBuffer> fileDownload(
    String name,
  ) async {
    await Future.delayed(const Duration(seconds: 3));
    final data = await rootBundle.load(PngImage.splash);

    return AttachmentFileBuffer(
      name: name,
      buffer: data.buffer.asUint8List(),
    );
  }

  Future<PoDocuments> fileUpload() async {
    await Future.delayed(const Duration(seconds: 3));
    final data = json.decode(
      await rootBundle.loadString('assets/json/common/poUploadResponse.json'),
    );

    return PoDocumentsDto.fromJson(data).toDomain();
  }

  Future<bool> deleteFile() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/delete_file/deleteFileQueryResponse.json',
      ),
    );

    return data['data']['deleteFile']['isDeleted'] as bool;
  }
}
