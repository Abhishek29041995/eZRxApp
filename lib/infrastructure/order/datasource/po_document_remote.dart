import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_po_documents_dto.dart';

class PoDocumentRemoteDataSource {
  final HttpService httpService;
  final DataSourceExceptionHandler dataSourceExceptionHandler;
  final Config config;
  PoDocumentQuery queryMutation;

  PoDocumentRemoteDataSource({
    required this.httpService,
    required this.dataSourceExceptionHandler,
    required this.config,
    required this.queryMutation,
  });
  Future<AttachmentFileBuffer> fileDownload(
    String name,
    String imgUrl,
  ) async {
    return await dataSourceExceptionHandler.handle(() async {
      final poDownloadUrl = '/api/ereturn/downloads?encryptedURL=$imgUrl';
      final res = await httpService.request(
        method: 'GET',
        url: poDownloadUrl,
        data: {'url': imgUrl},
        responseType: ResponseType.bytes,
      );
      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        additionalCondition: res.data is List && res.data.isEmpty,
      );

      return AttachmentFileBuffer(
        name: name,
        buffer: res.data,
      );
    });
  }

  Future<PoDocuments> fileUpload({
    required MultipartFile file,
    required String userName,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}po-upload',
        data: FormData.fromMap({
          'files': file,
          'userName': userName,
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      return PoDocumentsDto.fromJson(res.data)
          .toDomain()
          .copyWith(size: FileSize(file.length));
    });
  }

  Future<bool> deleteFile({
    required String filePath,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.deleteFile();
      final variables = {
        'filePath': filePath,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      return res.data['data']['deleteFile']['isDeleted'] as bool;
    });
  }
}
