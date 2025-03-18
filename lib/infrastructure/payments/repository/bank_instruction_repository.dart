import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/bank_instruction.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/payments/repository/i_bank_instruction_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/bank_instruction_local.dart';

class BankInstructionRepository extends IBankInstructionRepository {
  final BankInstructionLocalDataSource localDataSource;
  BankInstructionRepository({
    required this.localDataSource,
  });
  @override
  Future<Either<ApiFailure, BankInstruction>> getBankInstruction({
    required String bankIdentification,
  }) async {
    try {
      final response =
          await localDataSource.getBankInstruction(bankIdentification);

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
