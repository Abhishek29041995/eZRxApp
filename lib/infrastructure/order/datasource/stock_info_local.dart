import 'dart:async';
import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/stock_info_dto.dart';
import 'package:flutter/services.dart';

class StockInfoLocalDataSource {
  final _stockApiStatusDataController = StreamController<bool>.broadcast();

  StockInfoLocalDataSource();

  Future<List<StockInfo>> getStockInfoList() async {
    await Future.delayed(const Duration(seconds: 1));
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/stock_information_list/stockInformationListResponse.json',
      ),
    );

    return List.from(data['data']['stockInformationList'])
        .map((e) => StockInfoDto.fromJson(e).toDomain())
        .toList();
  }

  Future<List<MaterialStockInfo>> getMaterialStockInfoList() async {
    await Future.delayed(const Duration(seconds: 1));
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_stock_infomation_list/getStockInformationListResponse.json',
      ),
    );

    return List.from(data['data']['getStockInformationLists'])
        .map((e) => MaterialStockInfoDto.fromJson(e).toDomain())
        .toList();
  }

  void notifyStockApiStatusUpdated(
    bool isFailure,
  ) =>
      _stockApiStatusDataController.add(
        isFailure,
      );

  Stream<bool> get stockApiStatusData => _stockApiStatusDataController.stream;
}
