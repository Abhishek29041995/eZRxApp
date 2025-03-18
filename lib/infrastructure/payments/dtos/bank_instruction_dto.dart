import 'package:ezrxmobile/domain/payments/entities/bank_instruction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_instruction_dto.freezed.dart';
part 'bank_instruction_dto.g.dart';

@freezed
class BankInstructionDTO with _$BankInstructionDTO {
  const BankInstructionDTO._();
  const factory BankInstructionDTO({
    @JsonKey(
      name: 'bank',
      defaultValue: '',
    )
        required String bank,
    @JsonKey(
      name: 'transferMethods',
      defaultValue: [],
    )
        required List<TransferMethodDTO> transferMethods,
  }) = _BankInstructionDTO;

  BankInstruction toDomain() => BankInstruction(
        bank: bank,
        transferMethods: transferMethods.map((e) => e.toDomain()).toList(),
      );

  factory BankInstructionDTO.fromJson(Map<String, dynamic> json) =>
      _$BankInstructionDTOFromJson(json);
}

@freezed
class TransferMethodDTO with _$TransferMethodDTO {
  const TransferMethodDTO._();
  const factory TransferMethodDTO({
    @JsonKey(
      name: 'title',
      defaultValue: '',
    )
        required String title,
    @JsonKey(
      name: 'paymentInstructions',
      defaultValue: [],
    )
        required List<InstructionDetailsDTO> paymentInstructions,
  }) = _TransferMethodDTO;

  TransferMethod toDomain() => TransferMethod(
        title: title,
        paymentInstructions:
            paymentInstructions.map((e) => e.toDomain()).toList(),
      );

  factory TransferMethodDTO.fromJson(Map<String, dynamic> json) =>
      _$TransferMethodDTOFromJson(json);
}

@freezed
class InstructionDetailsDTO with _$InstructionDetailsDTO {
  const InstructionDetailsDTO._();
  const factory InstructionDetailsDTO({
    @JsonKey(
      name: 'instructionType',
      defaultValue: '',
    )
        required String instructionType,
    @JsonKey(
      name: 'instructions',
      defaultValue: [],
    )
        required List<String> instructions,
  }) = _InstructionDetailsDTO;

  InstructionDetail toDomain() => InstructionDetail(
        instructionType: instructionType,
        instructions: instructions,
      );

  factory InstructionDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$InstructionDetailsDTOFromJson(json);
}
