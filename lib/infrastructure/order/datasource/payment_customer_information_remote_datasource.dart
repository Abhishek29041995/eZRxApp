import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_querymutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/payment_customer_information_dto.dart';

class PaymentCustomerInformationRemoteDataSource {
  HttpService httpService;
  PaymentCustomerInformationQueryMutation
      paymentCustomerInformationQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  PaymentCustomerInformationRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.paymentCustomerInformationQueryMutation,
    required this.dataSourceExceptionHandler,
  });

  Future<PaymentCustomerInformation> getPaymentCustomerInformation({
    required String customer,
    required String salesOrganisation,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final paymentCustomerInformationQuery =
          paymentCustomerInformationQueryMutation
              .getPaymentCustomerInformationQuery();

      final variables = {
        'customer': customer,
        'salesOrganisation': salesOrganisation,
      };

      final finalData = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': paymentCustomerInformationQuery,
          'variables': variables,
        }),
      );

      dataSourceExceptionHandler.handleExceptionChecker(res: finalData);

      final res = finalData.data['data']['customerInformation'];

      return PaymentCustomerInformationDto.fromJson(res).toDomain();
    });
  }
}
