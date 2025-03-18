import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/e_credit_invoice_dto.dart';

class EInvoiceRemoteDataSource {
  final HttpService httpService;
  final Config config;
  final DataSourceExceptionHandler exceptionHandler;

  EInvoiceRemoteDataSource({
    required this.httpService,
    required this.exceptionHandler,
    required this.config,
  });

  Future<DownloadPaymentAttachment> getEInvoice({
    required String invoiceNumber,
    required String salesOrg,
    required String country,
    required String soldTo,
  }) async {
    return await exceptionHandler.handle(() async {
      final data = _getData(
        invoiceNumber: invoiceNumber,
        salesOrg: salesOrg,
        country: country,
        soldTo: soldTo,
      );
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}payment/listInvoice',
        data: jsonEncode(
          data,
        ),
      );
      exceptionHandler.handleExceptionChecker(res: res);
      if (res.data['data'] == null || res.data['data'].isEmpty) {
        return DownloadPaymentAttachment.empty();
      }

      return ECreditInvoiceDto.fromJson(res.data['data'][0]).toDomain();
    });
  }

  Map<String, dynamic> _getData({
    required String invoiceNumber,
    required String salesOrg,
    required String country,
    required String soldTo,
  }) {
    switch (country) {
      case 'SG':
        return {
          'invoice_number': invoiceNumber,
        };
      case 'PH':
        return {
          'invoice_number': invoiceNumber,
          'sales_org': salesOrg,
          'sold_to': soldTo,
          'document_type': 'ZPF2',
        };
      default:
        return <String, dynamic>{};
    }
  }
}
