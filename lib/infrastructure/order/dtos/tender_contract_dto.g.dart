// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tender_contract_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TenderContractDtoImpl _$$TenderContractDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TenderContractDtoImpl(
      contractNumber: json['contractNumber'] as String,
      contractItemNumber: json['contractItemNumber'] as String,
      contractReference: json['contractReference'] as String,
      tenderOrderReason: json['tenderOrderReason'] as String,
      tenderVisaNumber: json['tenderVisaNumber'] as String,
      salesDistrict: json['salesDistrict'] as String,
      tenderPackageDescription: json['tenderPackageDescription'] as String,
      tenderPrice: json['tenderPrice'] == null
          ? 0.0
          : const StringToDoubleConverter()
              .fromJson(json['tenderPrice'] as String),
      pricingUnit: (json['pricingUnit'] as num).toInt(),
      remainingTenderQuantity: (json['remainingTenderQuantity'] as num).toInt(),
      contractQuantity: (json['contractQuantity'] as num).toInt(),
      contractExpiryDate: json['contractExpiryDate'] as String,
      announcementLetterNumber: json['announcementLetterNumber'] as String,
      isNearToExpire: json['isNearToExpire'] as bool,
      contractPaymentTerm: json['contractPaymentTerm'] as String,
      tenderUnitPrice: json['tenderUnitPrice'] == null
          ? 0.0
          : const StringToDoubleConverter()
              .fromJson(json['tenderUnitPrice'] as String),
    );

Map<String, dynamic> _$$TenderContractDtoImplToJson(
        _$TenderContractDtoImpl instance) =>
    <String, dynamic>{
      'contractNumber': instance.contractNumber,
      'contractItemNumber': instance.contractItemNumber,
      'contractReference': instance.contractReference,
      'tenderOrderReason': instance.tenderOrderReason,
      'tenderVisaNumber': instance.tenderVisaNumber,
      'salesDistrict': instance.salesDistrict,
      'tenderPackageDescription': instance.tenderPackageDescription,
      'tenderPrice':
          const StringToDoubleConverter().toJson(instance.tenderPrice),
      'pricingUnit': instance.pricingUnit,
      'remainingTenderQuantity': instance.remainingTenderQuantity,
      'contractQuantity': instance.contractQuantity,
      'contractExpiryDate': instance.contractExpiryDate,
      'announcementLetterNumber': instance.announcementLetterNumber,
      'isNearToExpire': instance.isNearToExpire,
      'contractPaymentTerm': instance.contractPaymentTerm,
      'tenderUnitPrice':
          const StringToDoubleConverter().toJson(instance.tenderUnitPrice),
    };
