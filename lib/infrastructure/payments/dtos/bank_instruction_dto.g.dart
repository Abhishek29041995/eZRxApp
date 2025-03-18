// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_instruction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankInstructionDTOImpl _$$BankInstructionDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$BankInstructionDTOImpl(
      bank: json['bank'] as String? ?? '',
      transferMethods: (json['transferMethods'] as List<dynamic>?)
              ?.map(
                  (e) => TransferMethodDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$BankInstructionDTOImplToJson(
        _$BankInstructionDTOImpl instance) =>
    <String, dynamic>{
      'bank': instance.bank,
      'transferMethods':
          instance.transferMethods.map((e) => e.toJson()).toList(),
    };

_$TransferMethodDTOImpl _$$TransferMethodDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$TransferMethodDTOImpl(
      title: json['title'] as String? ?? '',
      paymentInstructions: (json['paymentInstructions'] as List<dynamic>?)
              ?.map((e) =>
                  InstructionDetailsDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$TransferMethodDTOImplToJson(
        _$TransferMethodDTOImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'paymentInstructions':
          instance.paymentInstructions.map((e) => e.toJson()).toList(),
    };

_$InstructionDetailsDTOImpl _$$InstructionDetailsDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$InstructionDetailsDTOImpl(
      instructionType: json['instructionType'] as String? ?? '',
      instructions: (json['instructions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$InstructionDetailsDTOImplToJson(
        _$InstructionDetailsDTOImpl instance) =>
    <String, dynamic>{
      'instructionType': instance.instructionType,
      'instructions': instance.instructions,
    };
