import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/tender_contract_dto.dart';
import 'package:flutter/services.dart';

class TenderContractLocalDataSource {
  TenderContractLocalDataSource();

  Future<List<TenderContract>> getTenderContractDetails() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_tender_contract_details/getTenderContractDetailsResponse.json',
      ),
    );

    final finalData =
        data['data']['tenderContractDetails']['tenderContractDetails'];

    return List.from(finalData)
        .map((e) => TenderContractDto.fromJson(e).toDomain())
        .toList();
  }
}
