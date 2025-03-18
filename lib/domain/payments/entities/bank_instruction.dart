import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_instruction.freezed.dart';

@freezed
class BankInstruction with _$BankInstruction {
  const BankInstruction._();

  const factory BankInstruction({
    required String bank,
    required List<TransferMethod> transferMethods,
  }) = _BankInstruction;

  factory BankInstruction.empty() => const BankInstruction(
        bank: '',
        transferMethods: <TransferMethod>[],
      );
}

@freezed
class TransferMethod with _$TransferMethod {
  const TransferMethod._();

  const factory TransferMethod({
    required String title,
    required List<InstructionDetail> paymentInstructions,
  }) = _TransferMethod;

  factory TransferMethod.empty() => const TransferMethod(
        title: '',
        paymentInstructions: <InstructionDetail>[],
      );
}

@freezed
class InstructionDetail with _$InstructionDetail {
  const InstructionDetail._();

  const factory InstructionDetail({
    required String instructionType,
    required List<String> instructions,
  }) = _InstructionDetail;

  factory InstructionDetail.empty() => const InstructionDetail(
        instructionType: '',
        instructions: <String>[],
      );
}
