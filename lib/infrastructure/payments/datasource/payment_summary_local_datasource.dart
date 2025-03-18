import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/transaction_item_dto.dart';
import 'package:flutter/services.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_details_dto.dart';

class PaymentSummaryLocalDataSource {
  PaymentSummaryLocalDataSource();

  Future<List<PaymentSummaryDetails>> getPaymentSummary() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/payment_summary_list/paymentSummaryListResponse.json',
      ),
    );

    return List.from(data['data']['customerPayment']['customerPaymentResponse'])
        .map((e) => PaymentSummaryDetailsDto.fromJson(e).toDomain())
        .toList();
  }

  Future<List<PaymentSummaryDetails>> getTransactions() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/list_transactions/listTransactionsResponse.json',
      ),
    );

    return List<Map<String, dynamic>>.from(
      data['data']['listTransactions']['TxnSummary'],
    ).map((e) => TransactionItemDto.fromJson(e).toDomain()).toList();
  }
}
