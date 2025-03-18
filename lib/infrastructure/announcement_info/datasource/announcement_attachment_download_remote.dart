import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class AnnouncementAttachmentDownloadRemoteDataSource {
  final DataSourceExceptionHandler dataSourceExceptionHandler;
  final HttpService httpService;

  AnnouncementAttachmentDownloadRemoteDataSource({
    required this.dataSourceExceptionHandler,
    required this.httpService,
  });

  Future<AttachmentFileBuffer> fileDownload(
    String imgUrl,
    String name,
  ) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'GET',
        url: imgUrl,
        responseType: ResponseType.bytes,
      );
      dataSourceExceptionHandler.handleExceptionChecker(
        onCustomExceptionHandler: (response) {
          if (response.statusCode != 200 ||
              (response.data is List && response.data.isEmpty)) {
            throw const ApiFailure.attachmentDownloadError();
          }
        },
        res: res,
      );

      return AttachmentFileBuffer(
        name: name,
        buffer: res.data,
      );
    });
  }
}
