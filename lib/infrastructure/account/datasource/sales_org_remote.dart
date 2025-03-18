import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_dto.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class SalesOrgRemoteDataSource {
  HttpService httpService;
  SalesOrgQueryMutation salesOrgQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  RemoteConfigService remoteConfigService;

  SalesOrgRemoteDataSource({
    required this.httpService,
    required this.salesOrgQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.remoteConfigService,
  });

  Future<SalesOrganisationConfigs> getConfig({
    required String salesOrg,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '/api/license',
        data: jsonEncode({
          'query': salesOrgQueryMutation.getSalesOrgConfigsQuery(
            remoteConfigService.enableMarketPlaceMarkets.contains(market),
            remoteConfigService.enableOrderType,
            remoteConfigService.enableReferenceLength,
          ),
          'variables': {
            'request': {
              'salesOrg': salesOrg,
            },
          },
        }),
      );

      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      if (res.data['data']['salesOrgConfigs'] == null ||
          res.data['data']['salesOrgConfigs'].isEmpty) {
        return SalesOrganisationConfigs.empty();
      }

      return SalesOrganisationConfigsDto.fromJson(
        res.data['data']['salesOrgConfigs'][0],
      ).toDomain(
        enablePromotionBlacklist: remoteConfigService.enablePromotionBlacklist,
      );
    });
  }
}
