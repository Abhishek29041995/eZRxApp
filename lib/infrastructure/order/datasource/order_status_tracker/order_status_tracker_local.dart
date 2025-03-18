import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_status_tracker_dto.dart';
import 'package:flutter/services.dart';

class OrderStatusTrackerLocalDataSource {
  OrderStatusTrackerLocalDataSource();

  Future<List<OrderStatusTracker>> getOrderStatusTracker() async {
    await Future.delayed(const Duration(seconds: 1));
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/get_zyllem_v2/getZyllemv2Response.json'),
    );
    final finalData = data['data']['zyllemStatusV2']['Entry'];

    return List.from(finalData)
        .map((e) => OrderStatusTrackerDto.fromJson(e).toDomain())
        .toList();
  }
}
