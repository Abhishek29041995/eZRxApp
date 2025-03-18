import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_method_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('Payment Method dto ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle.loadString(
          'assets/json/payment_methods/paymentMethodsResponse.json',
        ),
      );
    });

    test('PaymentMethodDto fromJson and toDomain', () {
      final expectResult = <NewPaymentMethod>[];
      for (final dynamic item in data['data']['availablePaymentMethods']) {
        expectResult.add(PaymentMethodDto.fromJson(item).toDomain());
      }

      expect(expectResult.length, 1);
    });
  });
}
