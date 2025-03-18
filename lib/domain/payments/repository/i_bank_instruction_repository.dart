import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/bank_instruction.dart';

abstract class IBankInstructionRepository {
  Future<Either<ApiFailure, BankInstruction>> getBankInstruction({
    required String bankIdentification,
  });
}
