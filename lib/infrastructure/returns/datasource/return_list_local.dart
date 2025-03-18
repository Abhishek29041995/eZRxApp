import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_item_dto.dart';
import 'package:flutter/services.dart';

class ReturnListLocalDataSource {
  ReturnListLocalDataSource();

  Future<List<ReturnItem>> fetchReturnByItems() async {
    await Future.delayed(const Duration(seconds: 2));
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_return_by_item/getReturnByItemsResponse.json',
      ),
    );

    return List<Map<String, dynamic>>.from(
      data['data']['requestsByItems']['returnRequestsByItems'],
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
  }

  Future<List<ReturnItem>> fetchReturnByRequests() async {
    await Future.delayed(const Duration(seconds: 2));
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_return_by_request/getReturnByRequestResponse.json',
      ),
    );

    return List<Map<String, dynamic>>.from(
      data['data']['requestsByUserV3']['returnRequests'],
    ).map((e) => ReturnItemDto.fromJson(e).toDomain()).toList();
  }

  Future<String> getFileUrl() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/request_by_items_excel/requestsByItemsExcelResponse.json',
      ),
    );

    return data['data']['requestsByItemsExcel']['url'];
  }
}
