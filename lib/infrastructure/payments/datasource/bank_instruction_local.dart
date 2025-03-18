import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/bank_instruction.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/bank_instruction_dto.dart';
import 'package:flutter/services.dart';

class BankInstructionLocalDataSource {
  BankInstructionLocalDataSource();

  Future<BankInstruction> getBankInstruction(String bankIdentification) async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/common/bankPaymentInstructionData.json',
      ),
    );
    for (final dynamic detail in data) {
      final bankInstruction = BankInstructionDTO.fromJson(detail).toDomain();
      if (bankIdentification
          .toLowerCase()
          .contains(bankInstruction.bank.toLowerCase())) {
        return bankInstruction;
      }
    }

    return BankInstruction.empty();
  }
}
