import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/create_virtual_account.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/principal_cutoffs.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/error/payment_exception.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_query.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/create_virtual_account_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_open_item_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/principal_cutoffs_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_info_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_invoice_info_pdf_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_method_dto.dart';

class NewPaymentRemoteDataSource {
  HttpService httpService;
  NewPaymentQuery newPaymentQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  NewPaymentRemoteDataSource({
    required this.httpService,
    required this.newPaymentQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<CustomerOpenItem>> getOutstandingInvoices({
    required String customerCode,
    required String salesOrg,
    required int offset,
    required int pageSize,
    required List<Map<String, String>> filterList,
    required bool isMarketPlace,
  }) async {
    return await getCustomerOpenItems(
      customerCode: customerCode,
      salesOrg: salesOrg,
      debitCreditType: 'debit',
      orderBy: 'netDueDate',
      filterList: filterList,
      offset: offset,
      pageSize: pageSize,
      isMarketPlace: isMarketPlace,
    );
  }

  Future<List<CustomerOpenItem>> getAvailableCreditNotes({
    required String customerCode,
    required String salesOrg,
    required int offset,
    required int pageSize,
    required List<Map<String, String>> filterList,
    required bool isMarketPlace,
  }) async {
    return await getCustomerOpenItems(
      customerCode: customerCode,
      salesOrg: salesOrg,
      debitCreditType: 'credit',
      orderBy: 'postingKeyName',
      filterList: filterList,
      offset: offset,
      pageSize: pageSize,
      isMarketPlace: isMarketPlace,
    );
  }

  Future<PaymentInfo> pay({
    required String customerCode,
    required String salesOrg,
    required List<Map<String, dynamic>> customerInvoices,
    required String paymentMethod,
    required String transactionCurrency,
    required String userName,
    required String shipToCode,
    required bool isMarketPlace,
    required String baseUrl,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      cacheControl: 'no-cache',
      data: jsonEncode(
        {
          'query': newPaymentQuery.payQuery(),
          'variables': {
            'input': {
              'customerCode': customerCode,
              'customerInvoice': customerInvoices,
              'paymentMethod': paymentMethod,
              'salesOrg': salesOrg,
              'shipToCode': shipToCode,
              'transactionCurrency': transactionCurrency,
              'userName': userName,
              if (isMarketPlace) 'isMarketPlace': isMarketPlace,
              'isV2': true,
            },
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(
      res: res,
      property: 'addCustomerPayment',
    );
    final paymentInfo =
        PaymentInfoDto.fromJson(res.data['data']['addCustomerPayment'])
            .toDomain(baseUrl: baseUrl);

    if (paymentInfo.zzHtmcs.isEmpty) {
      throw const PaymentException.missingzzHtmcs();
    }

    return paymentInfo;
  }

  Future<void> updatePaymentGateway({
    required String salesOrg,
    required String txnStatus,
    required String paymentID,
    required String transactionRef,
    required bool isMarketPlace,
    required String customerCode,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': newPaymentQuery.updatePaymentGatewayQuery(),
          'variables': {
            'input': {
              'paymentID': paymentID,
              'txnStatus': txnStatus,
              'transactionRef': transactionRef,
              'salesOrg': salesOrg,
              if (isMarketPlace) ...{
                'isMarketPlace': isMarketPlace,
                'customerCode': customerCode,
              },
            },
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(
      res: res,
      property: 'updatePaymentGateway',
    );
  }

  Future<List<CustomerOpenItem>> getCustomerOpenItems({
    required String customerCode,
    required String salesOrg,
    required String debitCreditType,
    required String orderBy,
    required List<Map<String, String>> filterList,
    required int offset,
    required int pageSize,
    required bool isMarketPlace,
  }) async {
    final requestParams = <String, dynamic>{
      'customerCode': customerCode,
      'salesOrg': salesOrg,
      'debitCreditType': debitCreditType,
      'first': pageSize,
      'after': offset,
      'orderBy': {
        'order': 'desc',
        'field': orderBy,
      },
      if (isMarketPlace) 'isMarketPlace': isMarketPlace,
    };

    requestParams.putIfAbsent('filterBy', () => filterList);

    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      cacheControl: 'no-cache',
      data: jsonEncode(
        {
          'query': newPaymentQuery.getCustomerOpenItemsQuery(),
          'variables': {
            'request': requestParams,
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(
      res: res,
      property: 'customerOpenItems',
    );
    final data =
        res.data['data']['customerOpenItems']['customerOpenItemsResponse'];

    final result = <CustomerOpenItem>[];
    for (final dynamic item in data) {
      result.add(CustomerOpenItemDto.fromJson(item).toDomain());
    }

    return result;
  }

  Future<PaymentInvoiceInfoPdf> getPaymentInvoiceInfoPdf({
    required String customerCode,
    required String customerName,
    required String salesOrg,
    required String accountingDocExternalReference,
    required String paymentBatchAdditionalInfo,
    required String paymentId,
    required String zzAdviceNumber,
    required bool isMarketPlace,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': newPaymentQuery.getPaymentInvoiceInfoPdf(),
          'variables': {
            'request': {
              'accountingDocExternalReference': accountingDocExternalReference,
              'customerCode': customerCode,
              'customerName': customerName,
              'payer': customerCode,
              'paymentBatchAdditionalInfo': paymentBatchAdditionalInfo,
              'zzAdvice': zzAdviceNumber,
              'paymentId': paymentId,
              'salesOrg': salesOrg,
              if (isMarketPlace) 'isMarketPlace': isMarketPlace,
            },
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(
      res: res,
      property: 'paymentInvoicePdf',
    );
    final data = res.data['data']['paymentInvoicePdf'];

    return PaymentInvoiceInfoPdfDto.fromJson(data).toDomain();
  }

  Future<List<NewPaymentMethod>> fetchPaymentMethods({
    required String salesOrg,
    required bool isMarketPlace,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': newPaymentQuery.fetchPaymentMethodQuery(),
          'variables': {
            'request': {
              'salesOrg': salesOrg,
              if (isMarketPlace) 'isMarketPlace': isMarketPlace,
            },
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(
      res: res,
      property: 'availablePaymentMethods',
    );
    final paymentMethodList = res.data['data']['availablePaymentMethods'] ?? [];

    return List.from(paymentMethodList)
        .map((e) => PaymentMethodDto.fromJson(e).toDomain())
        .toList();
  }

  Future<CreateVirtualAccount> createVirtualAccount({
    required String customerCode,
    required String salesOrg,
    required List<String> invoices,
    required String bankID,
    required String provider,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      cacheControl: 'no-cache',
      data: jsonEncode(
        {
          'query': newPaymentQuery.createVirtualAccountQuery(),
          'variables': {
            'input': {
              'customer': customerCode,
              'salesOrg': salesOrg,
              'provider': provider,
              'bankID': bankID,
              'invoices': invoices,
            },
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(
      res: res,
      property: 'createVirtualAccount',
    );

    return CreateVirtualAccountDto.fromJson(
      res.data['data']['createVirtualAccount'],
    ).toDomain();
  }

  Future<PrincipalCutoffs> getPrincipalCutoffs({
    required List<String> branches,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}license',
      data: jsonEncode(
        {
          'query': newPaymentQuery.getPrincipalCutOffs(),
          'variables': {
            'request': {
              'branch': branches,
              'configurationName': 'Payment',
              'status': ['Active'],
            },
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(
      res: res,
      property: 'getPrincipalCutoffs',
    );

    return PrincipalCutoffsDto.fromJson(
      res.data['data']['getPrincipalCutoffs'],
    ).toDomain();
  }
}
