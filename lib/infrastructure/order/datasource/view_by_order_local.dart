import 'dart:convert';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_order_dto.dart';
import 'package:flutter/services.dart';

class ViewByOrderLocalDataSource {
  ViewByOrderLocalDataSource();
  Future<ViewByOrder> getViewByOrders() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_order_history/getOrderHistoryV3Response.json',
      ),
    );

    final finalData = data['data']['orderHistoryV3'];

    return ViewByOrderDto.fromJson(makeResponseCamelCase(jsonEncode(finalData)))
        .toDomain();
  }
}
