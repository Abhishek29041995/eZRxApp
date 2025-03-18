import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_config_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_information_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_search_dto.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class CustomerCodeRemoteDataSource {
  final HttpService httpService;
  final CustomerCodeQueryMutation customerCodeQueryMutation;
  final DataSourceExceptionHandler dataSourceExceptionHandler;
  final Config config;
  final RemoteConfigService remoteConfigService;

  CustomerCodeRemoteDataSource({
    required this.httpService,
    required this.customerCodeQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
    required this.remoteConfigService,
  });

  Future<CustomerInformation> getCustomerCodeList({
    required String searchKey,
    required String salesOrg,
    required bool hideCustomer,
    required int pageSize,
    required int offset,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final queryData = customerCodeQueryMutation.getCustomerInfoBySearch(
          remoteConfigService.enableMarketPlaceMarkets.contains(market),
        );

        final variables = {
          'searchKey': searchKey,
          'salesOrganisation': salesOrg,
          'first': pageSize,
          'after': offset,
          'filterBlockCustomer': hideCustomer,
        };

        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}license',
          data: jsonEncode({
            'query': queryData,
            'variables': variables,
          }),
        );
        dataSourceExceptionHandler.handleExceptionChecker(res: res);

        final finalData = res.data['data']['customerInformationSearch'];

        return CustomerInformationDTO.fromJson(
          finalData,
        ).toDomain();
      },
    );
  }

  Future<CustomerInformation> getSalesRepCustomerCodeList({
    required CustomerCodeSearchDto request,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final queryData =
            customerCodeQueryMutation.getCustomerListForSalesRep();

        final variables = {
          'customerInformationSalesRepInput': {...request.toJson()},
        };

        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}license',
          data: jsonEncode({
            'query': queryData,
            'variables': variables,
          }),
        );
        dataSourceExceptionHandler.handleExceptionChecker(res: res);

        final finalData = res.data['data']['customerInformationSalesRep'];

        return CustomerInformationDTO.fromJson(
          finalData,
        ).toDomain();
      },
    );
  }

  Future<CustomerCodeConfig> getCustomerCodeConfig({
    required String customerCode,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final queryData = customerCodeQueryMutation.getCustomerCodeConfig();

        final variables = {
          'request': {
            'customerCode': customerCode,
          },
        };

        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}license',
          data: jsonEncode({
            'query': queryData,
            'variables': variables,
          }),
        );
        dataSourceExceptionHandler.handleExceptionChecker(res: res);

        final finalData = res.data['data']['customerConfig'];

        return CustomerCodeConfigDto.fromJson(
          finalData,
        ).toDomain;
      },
    );
  }
}
