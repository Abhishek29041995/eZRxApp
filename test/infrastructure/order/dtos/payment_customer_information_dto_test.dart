import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/payment_customer_information_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test payment customer information ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle.loadString(
          'assets/json/get_payment_customer_info/getPaymentCustomerInfoResponse.json',
        ),
      );
    });

    test('Test fromDomain', () {
      final configsDto = PaymentCustomerInformationDto.fromDomain(
        PaymentCustomerInformationDto.fromJson(
          data['data']['customerInformation'],
        ).toDomain().copyWith(
          shipToInfoList: [
            ShipToInfo.empty().copyWith(status: Status('fake-status')),
          ],
        ),
      );
      expect(configsDto.paymentTerm, 'T019');
    });

    test('Test toJson', () {
      final configsDto = PaymentCustomerInformationDto.fromDomain(
        PaymentCustomerInformationDto.fromJson(
          data['data']['customerInformation'],
        ).toDomain().copyWith(
          shipToInfoList: [
            ShipToInfo.empty().copyWith(status: Status('fake-status')),
          ],
        ),
      ).toJson();
      expect(configsDto['paymentTerm'], 'T019');
    });
  });
}
