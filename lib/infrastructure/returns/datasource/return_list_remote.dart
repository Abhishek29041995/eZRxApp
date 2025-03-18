import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_item_dto.dart';
import 'package:flutter/foundation.dart';

class ReturnListRemoteDataSource {
  final HttpService httpService;
  final ReturnQuery queryMutation;
  final DataSourceExceptionHandler dataSourceExceptionHandler;
  final Config config;
  final RemoteConfigService remoteConfigService;

  ReturnListRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
    required this.remoteConfigService,
  });

  Future<List<ReturnItem>> fetchReturnByItems({
    required Map<String, dynamic> requestParams,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getRequestsByItems(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode(
          {
            'query': queryData,
            'variables': {
              'request': requestParams,
            },
          },
        ),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      return List<Map<String, dynamic>>.from(
        res.data['data']['requestsByItems']['returnRequestsByItems'],
      )
          .map(
            (returnRequestsByItem) => List<Map<String, dynamic>>.from(
              returnRequestsByItem['requestByItems'],
            )
                .map(
                  (requestByItem) =>
                      ReturnItemDto.fromJson(requestByItem).toDomain(),
                )
                .toList(),
          )
          .toList()
          .expand((element) => element)
          .toList();
    });
  }

  Future<List<ReturnItem>> fetchReturnByRequest({
    required Map<String, dynamic> requestParams,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getRequestsByRequest(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode(
          {
            'query': queryData,
            'variables': {
              'requestsByUserRequest': requestParams,
            },
          },
        ),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      return List<Map<String, dynamic>>.from(
        res.data['data']['requestsByUserV3']['returnRequests'],
      ).map((e) => ReturnItemDto.fromJson(e).toDomain()).toList();
    });
  }

  Future<String> getFileUrl({
    required String salesOrg,
    required Map<String, dynamic> requestParams,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}ereturn',
          data: jsonEncode(
            {
              'query': queryMutation.getRequestsByItemsExcel(),
              'variables': {
                'input': requestParams,
              },
            },
          ),
          headers: {'salesorg': salesOrg},
        );
        dataSourceExceptionHandler.handleExceptionChecker(res: res);

        return res.data['data']['requestsByItemsExcel']['url'];
      },
    );
  }

  Future<AttachmentFileBuffer> downloadFile({
    required String url,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final fileResponse = await httpService.request(
          method: 'GET',
          url: url,
          responseType: ResponseType.bytes,
        );

        return AttachmentFileBuffer(
          name: Uri.parse(url).pathSegments.last,
          buffer: Uint8List.fromList(fileResponse.data),
        );
      },
    );
  }
}
