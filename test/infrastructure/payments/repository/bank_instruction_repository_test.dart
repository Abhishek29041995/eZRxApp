import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/bank_instruction.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/bank_instruction_local.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/bank_instruction_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class BankInstructionLocalDataSourceMock extends Mock
    implements BankInstructionLocalDataSource {}

void main() {
  late BankInstructionLocalDataSource localDataSource;
  late BankInstruction bankInstruction;
  late BankInstructionRepository repository;
  const bankIdentification = 'BCA';
  final fakeException = Exception('fake-exception');

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    localDataSource = BankInstructionLocalDataSourceMock();
    bankInstruction = await BankInstructionLocalDataSource()
        .getBankInstruction(bankIdentification);
    repository = BankInstructionRepository(localDataSource: localDataSource);
  });

  group('Bank Instruction Repository Test', () {
    test('=> get Bank Instruction Success', () async {
      when(
        () => localDataSource.getBankInstruction(bankIdentification),
      ).thenAnswer(
        (invocation) async => bankInstruction,
      );

      final result = await repository.getBankInstruction(
        bankIdentification: bankIdentification,
      );
      expect(result.isRight(), true);
      expect(result.getOrElse(() => BankInstruction.empty()), bankInstruction);
    });

    test('=> get Bank Instruction Failure', () async {
      when(
        () => localDataSource.getBankInstruction(bankIdentification),
      ).thenThrow(fakeException);

      final result = await repository.getBankInstruction(
        bankIdentification: bankIdentification,
      );
      expect(result.isLeft(), true);
      expect(
        result,
        Left(
          FailureHandler.handleFailure(fakeException),
        ),
      );
    });
  });
}
