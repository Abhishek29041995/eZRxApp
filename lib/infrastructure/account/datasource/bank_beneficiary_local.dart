import 'dart:convert';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/bank_beneficiary_dto.dart';
import 'package:flutter/services.dart';

class BankBeneficiaryLocalDataSource {
  BankBeneficiaryLocalDataSource();

  Future<List<BankBeneficiary>> getBankBeneficiariesBySaleOrg() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_payment_bank_in_accounts/getPaymentBankInAccountsResponse.json',
      ),
    );

    return List.from(data['data']['bankBeneficiary'])
        .map((e) => BankBeneficiaryDto.fromJson(e).toDomain())
        .toList();
  }
}
