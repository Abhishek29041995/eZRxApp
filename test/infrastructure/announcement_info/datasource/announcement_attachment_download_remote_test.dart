import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_attachment_download_remote.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late AnnouncementAttachmentDownloadRemoteDataSource remoteDataSource;
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  const imgUrl =
      'https://fastly.picsum.photos/id/1011/200/300.jpg?hmac=3OASTCcuMs99-ZFi2rl7Rh9DuaNJXZytGmDyOsRm7Hw';
  const name = 'fake-name';

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();

    remoteDataSource = AnnouncementAttachmentDownloadRemoteDataSource(
      httpService: service,
      dataSourceExceptionHandler: DataSourceExceptionHandler(),
    );
  });
  group('Announcement Attachment Download Remote Data Source test', () {
    test('File Download success', () async {
      final bytes = await rootBundle.load(
        'assets/svg/pdf_icon.svg',
      );
      final res = bytes.buffer.asUint8List();
      dioAdapter.onGet(
        imgUrl,
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
      );

      final result = await remoteDataSource.fileDownload(
        imgUrl,
        name,
      );

      expect(
        result,
        AttachmentFileBuffer(
          name: name,
          buffer: res,
        ),
      );
    });
  });
}
