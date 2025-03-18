import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/payment_term_dto.dart';
import 'package:flutter/services.dart';

class PaymentTermLocalDataSource {
  Future<List<PaymentTerm>> getPaymentTerms() async {
    final res = json.decode(
      await rootBundle
          .loadString('assets/json/common/getPaymentTermsResponse.json'),
    );

    final finalData = res['data']['availablePaymentTerm'];

    return List.from(finalData)
        .map((e) => PaymentTermDto.fromJson(e).toDomain())
        .toList();
  }
}
