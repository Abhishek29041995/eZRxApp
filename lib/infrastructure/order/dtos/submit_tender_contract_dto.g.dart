// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_tender_contract_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmitTenderContractDtoImpl _$$SubmitTenderContractDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmitTenderContractDtoImpl(
      contractNumber: json['contractNumber'] as String? ?? '',
      contractLineItemNumber: json['contractLineItemNumber'] as String? ?? '',
      contractPrice: (json['contractPrice'] as num?)?.toDouble() ?? 0.0,
      contractUnitOfMeasurement:
          (json['contractUnitOfMeasurement'] as num?)?.toInt() ?? 0,
      currency: json['currency'] as String? ?? '',
      contractPONumber: json['contractPONumber'] as String? ?? '',
    );

Map<String, dynamic> _$$SubmitTenderContractDtoImplToJson(
        _$SubmitTenderContractDtoImpl instance) =>
    <String, dynamic>{
      'contractNumber': instance.contractNumber,
      'contractLineItemNumber': instance.contractLineItemNumber,
      'contractPrice': instance.contractPrice,
      'contractUnitOfMeasurement': instance.contractUnitOfMeasurement,
      'currency': instance.currency,
      'contractPONumber': instance.contractPONumber,
    };
