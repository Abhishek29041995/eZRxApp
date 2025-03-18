import 'dart:convert';

import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/create_virtual_account.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/entities/principal_cutoffs.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/create_virtual_account_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_open_item_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_info_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_method_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_invoice_info_pdf_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/principal_cutoffs_dto.dart';
import 'package:flutter/services.dart';

class NewPaymentLocalDataSource {
  NewPaymentLocalDataSource();

  Future<List<CustomerOpenItem>> getCustomerOpenItems() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/customer_open_items/customerOpenItemsResponse.json',
      ),
    );
    final res = data['data']['customerOpenItems']['customerOpenItemsResponse'];

    final result = <CustomerOpenItem>[];
    for (final dynamic item in res) {
      result.add(CustomerOpenItemDto.fromJson(item).toDomain());
    }

    return result;
  }

  Future<PaymentInfo> pay({
    required SalesOrg salesOrg,
    required String baseUrl,
  }) async {
    final data = json.decode(
      await rootBundle.loadString(
        salesOrg.paymentInfoResponsePath,
      ),
    );

    return PaymentInfoDto.fromJson(data['data']['addCustomerPayment'])
        .toDomain(baseUrl: baseUrl);
  }

  Future<void> updatePaymentGateway() async {
    json.decode(
      await rootBundle.loadString(
        'assets/json/update_payment_gateway/updatePaymentGatewayResponse.json',
      ),
    );
  }

  Future<PaymentInvoiceInfoPdf> getPaymentInvoiceInfoPdf() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/payment_invoice_info_pdf/paymentInvoiceInfoPdfResponse.json',
      ),
    );

    return PaymentInvoiceInfoPdfDto.fromJson(data['data']['paymentInvoicePdf'])
        .toDomain();
  }

  Future<List<NewPaymentMethod>> fetchPaymentMethods() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/payment_methods/paymentMethodsResponse.json',
      ),
    );

    final finalData = data['data']['availablePaymentMethods'];

    return List.from(finalData)
        .map((e) => PaymentMethodDto.fromJson(e).toDomain())
        .toList();
  }

  Future<CreateVirtualAccount> createVirtualAccount() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/create_virtual_account/createVirtualAccountResponse.json',
      ),
    );

    return CreateVirtualAccountDto.fromJson(
      data['data']['createVirtualAccount'],
    ).toDomain();
  }

  Future<PrincipalCutoffs> getPrincipalCutoffs() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_principal_cutoffs/getPrincipalCutoffsResponse.json',
      ),
    );

    return PrincipalCutoffsDto.fromJson(
      data['data']['getPrincipalCutoffs'],
    ).toDomain();
  }
}
