import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_query.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_license_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class CustomerLicenseRemoteDataSource {
  final CustomerLicenseQuery customerLicenseQuery;
  final HttpService httpService;
  final Config config;
  final DataSourceExceptionHandler dataSourceExceptionHandler;

  CustomerLicenseRemoteDataSource({
    required this.customerLicenseQuery,
    required this.httpService,
    required this.config,
    required this.dataSourceExceptionHandler,
  });

  Future<List<CustomerLicense>> getCustomerLicense({
    required String customerCode,
    required String salesOrg,
    required int pageSize,
    required int offset,
    required String language,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = customerLicenseQuery.getCustomerLicense();

      final variables = {
        'salesOrganisation': salesOrg,
        'customerCodes': [customerCode],
        'filterBlockCustomer': false,
        'first': pageSize,
        'after': offset,
        'orderBy': 'DESC',
        'language': language,
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

      final finalData = res.data['data']['customerLicenses']['Licenses'];

      return List.from(finalData)
          .map((e) => CustomerLicenseDto.fromJson(e).toDomain)
          .toList();
    });
  }
}
