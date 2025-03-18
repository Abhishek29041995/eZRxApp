import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/payment_customer_information_dto.dart';
import 'package:flutter/services.dart';

class PaymentCustomerInformationLocalDataSource {
  Future<PaymentCustomerInformation> getPaymentCustomerInformation() async {
    final res = json.decode(
      await rootBundle.loadString(
        'assets/json/get_payment_customer_info/getPaymentCustomerInfoResponse.json',
      ),
    );

    final finalData = res['data']['customerInformation'];

    return PaymentCustomerInformationDto.fromJson(finalData).toDomain();
  }
}
