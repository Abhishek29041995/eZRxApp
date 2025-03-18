import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_response_dto.dart';
import 'package:flutter/services.dart';

class OrderLocalDataSource {
  OrderLocalDataSource();

  Future<SubmitOrderResponse> submitOrder() async {
    await Future.delayed(const Duration(seconds: 5));
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/submit_order/submitOrderResponse.json',
      ),
    );

    return SubmitOrderResponseDto.fromJson(data['data']['submitOrder'])
        .toDomain();
  }
}
