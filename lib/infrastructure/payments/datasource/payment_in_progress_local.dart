import 'dart:convert';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_in_progress_dto.dart';
import 'package:flutter/services.dart';

class PaymentInProgressLocalDataSource {
  PaymentInProgressLocalDataSource();

  Future<List<StringValue>> getPaymentInProgress() async {
    await Future.delayed(const Duration(seconds: 2));
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/payment_in_progress/paymentInProgressResponse.json',
      ),
    );
    final result = data['data']['paymentInProgress']['results'];

    return result
        .map<StringValue>(
          (e) => PaymentInProgressDto.fromJson(e).toAmount,
        )
        .toList();
  }
}
