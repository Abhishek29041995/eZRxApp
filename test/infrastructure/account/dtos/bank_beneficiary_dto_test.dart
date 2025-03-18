import 'dart:convert';

import 'package:ezrxmobile/infrastructure/account/dtos/bank_beneficiary_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('Test Bank Beneficiary DTO', () {
    setUp(
      () async {
        data = json.decode(
          await rootBundle.loadString(
            'assets/json/get_payment_bank_in_accounts/getPaymentBankInAccountsResponse.json',
          ),
        );
      },
    );
    test('=> data mapping', () {
      final bankBeneficiaryList = List.from(data['data']['bankBeneficiary'])
          .map((e) => BankBeneficiaryDto.fromJson(e).toDomain())
          .toList();
      expect(bankBeneficiaryList.length, 2);
      expect(bankBeneficiaryList.first.salesOrg.getOrDefaultValue(''), '2500');

      //--Todo---//
      final bankBeneficiaryDtoList =
          bankBeneficiaryList.map((e) => BankBeneficiaryDto.fromDomain(e));
      expect(bankBeneficiaryDtoList.length, 2);
      expect(bankBeneficiaryDtoList.first.salesOrg, '2500');

      final bankBeneficiaryDtoListMap =
          bankBeneficiaryDtoList.map((e) => e.toJson());
      expect(bankBeneficiaryDtoListMap.length, 2);
      expect(bankBeneficiaryDtoListMap.first['salesOrg'], '2500');
    });
  });
}
