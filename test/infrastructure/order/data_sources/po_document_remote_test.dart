import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_po_documents_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late PoDocumentRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat-my.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);
  const imageUrl = 'fake_image_url';
  const name = 'fake_name';
  const userName = 'fake_user_name';

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = PoDocumentRemoteDataSource(
        httpService: service,
        config: Config(),
        queryMutation: PoDocumentQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'PoDocument Remote DataSource',
    () {
      group('File Download-', () {
        test('success state', () async {
          final bytes = await rootBundle.load(
            'assets/svg/pdf_icon.svg',
          );
          final res = bytes.buffer.asUint8List();
          dioAdapter.onGet(
            '/api/ereturn/downloads?encryptedURL=$imageUrl',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: {'url': imageUrl},
          );

          final result = await remoteDataSource.fileDownload(
            name,
            imageUrl,
          );

          expect(
            result,
            AttachmentFileBuffer(
              name: name,
              buffer: res,
            ),
          );
        });

        test('statuscode not equal to 200', () async {
          final bytes = await rootBundle.load(
            'assets/svg/pdf_icon.svg',
          );
          final res = bytes.buffer.asUint8List();

          dioAdapter.onGet(
            '/api/ereturn/downloads?encryptedURL=$imageUrl',
            (server) => server.reply(
              201,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: {'url': imageUrl},
          );

          await remoteDataSource
              .fileDownload(
            name,
            imageUrl,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              AttachmentFileBuffer(
                name: name,
                buffer: res,
              ),
            );
          });
        });

        test('with error', () async {
          final bytes = await rootBundle.load(
            'assets/svg/pdf_icon.svg',
          );
          final res = bytes.buffer.asUint8List();
          dioAdapter.onGet(
            '/api/ereturn/downloads?encryptedURL=$imageUrl',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: {'url': imageUrl},
          );

          await remoteDataSource
              .fileDownload(
            name,
            imageUrl,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              AttachmentFileBuffer(
                name: name,
                buffer: res,
              ),
            );
          });
        });
      });
      group('Delete File-', () {
        test('success state', () async {
          final variables = {
            'filePath': imageUrl,
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/delete_file/deleteFileQueryResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/ereturn',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.deleteFile(),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.deleteFile(
            filePath: imageUrl,
          );

          expect(result, res['data']['deleteFile']['isDeleted']);
        });

        test('statuscode not equal to 200', () async {
          final variables = {
            'filePath': imageUrl,
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/delete_file/deleteFileQueryResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/ereturn',
            (server) => server.reply(
              201,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.deleteFile(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .deleteFile(
            filePath: imageUrl,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              res['data']['deleteFile']['isDeleted'],
            );
          });
        });

        test('with error', () async {
          final variables = {
            'filePath': imageUrl,
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/delete_file/deleteFileQueryResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/ereturn',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.deleteFile(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .deleteFile(
            filePath: imageUrl,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              res['data']['deleteFile']['isDeleted'],
            );
          });
        });
      });
      group('File Upload-', () {
        test('success state', () async {
          final file = MultipartFile.fromBytes(Uint8List(1));
          final variables = FormData.fromMap({
            'files': file,
            'userName': userName,
          });
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/common/poUploadResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/po-upload',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: variables,
          );

          final result = await remoteDataSource.fileUpload(
            file: file,
            userName: userName,
          );

          expect(
            result,
            PoDocumentsDto.fromJson(res)
                .toDomain()
                .copyWith(size: FileSize(file.length)),
          );
        });

        test('statuscode not equal to 200', () async {
          final file = MultipartFile.fromBytes(Uint8List(1));
          final variables = FormData.fromMap({
            'files': file,
            'userName': userName,
          });
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/common/poUploadResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/po-upload',
            (server) => server.reply(
              201,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: variables,
          );

          await remoteDataSource
              .fileUpload(
            file: file,
            userName: userName,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              PoDocumentsDto.fromJson(res)
                  .toDomain()
                  .copyWith(size: FileSize(file.length)),
            );
          });
        });

        test('with error', () async {
          final file = MultipartFile.fromBytes(Uint8List(1));
          final variables = FormData.fromMap({
            'files': file,
            'userName': userName,
          });
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/common/poUploadResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/po-upload',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: variables,
          );

          await remoteDataSource
              .fileUpload(
            file: file,
            userName: userName,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              PoDocumentsDto.fromJson(res)
                  .toDomain()
                  .copyWith(size: FileSize(file.length)),
            );
          });
        });
      });
    },
  );
}
