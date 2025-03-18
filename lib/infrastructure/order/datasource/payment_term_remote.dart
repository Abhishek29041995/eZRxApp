import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/payment_term_dto.dart';

class PaymentTermsRemoteDataSource {
  HttpService httpService;
  PaymentTermsQueryMutation payemttTermsQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  PaymentTermsRemoteDataSource({
    required this.httpService,
    required this.payemttTermsQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<PaymentTerm>> getPaymentTerms({
    required String salesOrganisation,
    required String soldToCustomerCode,
    required String basePaymentTermCode,
    required String language,
    required List<String> principalCode,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryAvailablePaymentTerms =
          payemttTermsQueryMutation.getAvailablePaymentTerm();

      final availablePaymentTermsVariables = {
        'salesOrganisation': salesOrganisation,
        'language': language,
        'basePaymentTermCode': basePaymentTermCode,
        'soldToCustomerCode': soldToCustomerCode,
        'principalCode': principalCode,
      };

      final resAvailablePaymentTerms = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryAvailablePaymentTerms,
          'variables': availablePaymentTermsVariables,
        }),
      );

      dataSourceExceptionHandler.handleExceptionChecker(
        res: resAvailablePaymentTerms,
      );

      final finalData =
          resAvailablePaymentTerms.data['data']['availablePaymentTerm'];

      return List.from(finalData)
          .map((e) => PaymentTermDto.fromJson(e).toDomain())
          .toList();
    });
  }
}
