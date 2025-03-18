import 'dart:convert';
import 'package:ezrxmobile/domain/payments/entities/bank_instruction.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/bank_instruction_local.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/bank_instruction_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BankInstructionLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = BankInstructionLocalDataSource();
    },
  );

  group(
    'Bank Instruction Local DataSource test -',
    () {
      test('get bank instruction find item', () async {
        final data = json.decode(
          await rootBundle.loadString(
            'assets/json/common/bankPaymentInstructionData.json',
          ),
        );

        final expectResult = BankInstructionDTO.fromJson(
          data.firstWhere(
            (element) => element['bank'] == 'Mandiri',
          ),
        ).toDomain();

        final result = await localDataSource.getBankInstruction('Mandiri');
        expect(
          result,
          expectResult,
        );
      });

      test('get bank instruction not find item', () async {
        final result =
            await localDataSource.getBankInstruction('bank-not-exist');
        expect(
          result,
          BankInstruction.empty(),
        );
      });
    },
  );
}
