import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/tender_contract_dto.dart';

class TenderContractRemoteDataSource {
  HttpService httpService;
  TenderContractQuery tenderContractQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  TenderContractRemoteDataSource({
    required this.httpService,
    required this.tenderContractQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<TenderContract>> getTenderContractDetails({
    required String materialNumber,
    required String salesOrg,
    required String selectedCustomerCode,
    required String shipTo,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}/order',
        data: jsonEncode(
          {
            'query': tenderContractQuery.getTenderContractDetails(),
            'variables': {
              'request': {
                'materialNumber': materialNumber,
                'customerNumber': selectedCustomerCode,
                'salesOrg': salesOrg,
                'shipToCustomer': shipTo,
              },
            },
          },
        ),
      );

      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      final finalData =
          res.data['data']['tenderContractDetails']['tenderContractDetails'];

      return List.from(finalData)
          .map((e) => TenderContractDto.fromJson(e).toDomain())
          .toList();
    });
  }
}
