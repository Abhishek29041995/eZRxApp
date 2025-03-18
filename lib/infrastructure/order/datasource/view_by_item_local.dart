import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_detail.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/invoice_data_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/invoice_detail_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_dto.dart';
import 'package:flutter/services.dart';

class ViewByItemLocalDataSource {
  ViewByItemLocalDataSource();
  Future<OrderHistory> getViewByItems() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_order_history_fetch_by_items/getOrderHistoryFetchByItemsResponse.json',
      ),
    );

    final finalData =
        data['data']['orderHistoryFetchByItems']['OrderHistory'][0];

    return OrderHistoryDto.fromJson(
      makeResponseCamelCase(
        jsonEncode(finalData),
      ),
    ).toDomain();
  }

  Future<List<InvoiceData>> getInvoiceDataForOrders() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_invoice_for_orders/getInvoiceForOrdersResponse.json',
      ),
    );
    final finalData = data['data']['getInvoiceIdForOrders'];

    return List.from(finalData)
        .map((e) => InvoiceDataDto.fromJson(e).toDomain())
        .toList();
  }

  Future<InvoiceDetailResponse> getInvoiceDetailsForOrder() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_invoice_details_for_order/getInvoiceDetailsForOrderResponse.json',
      ),
    );
    final finalData = data['data']['GetInvoiceDetailsForOrder'];

    return InvoiceDetailResponseDto.fromJson(
      makeResponseCamelCase(
        jsonEncode(finalData),
      ),
    ).toDomain();
  }
}
