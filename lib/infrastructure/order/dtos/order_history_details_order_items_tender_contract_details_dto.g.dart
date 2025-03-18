// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_order_items_tender_contract_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryDetailsTenderContractDtoImpl
    _$$OrderHistoryDetailsTenderContractDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$OrderHistoryDetailsTenderContractDtoImpl(
          contractNumber: json['contractNumber'] as String? ?? '',
          contractReference: json['contractReference'] as String? ?? '',
          price: json['price'] == null
              ? 0.0
              : const StringToDoubleConverter()
                  .fromJson(json['price'] as String),
          priceUnit: (json['priceUnit'] as num?)?.toInt() ?? 0,
          contractQuantity: (json['contractQuantity'] as num?)?.toInt() ?? 0,
          remainingQuantity: (json['remainingQuantity'] as num?)?.toInt() ?? 0,
          isTenderExpired: json['isTenderExpire'] as bool? ?? false,
          expiryDate: json['expiryDate'] as String? ?? '',
          orderReason: json['orderReason'] as String? ?? '',
          visaNumber: json['visaNumber'] as String? ?? '',
          announcementLetterNumber:
              json['announcementLetterNumber'] as String? ?? '',
        );

Map<String, dynamic> _$$OrderHistoryDetailsTenderContractDtoImplToJson(
        _$OrderHistoryDetailsTenderContractDtoImpl instance) =>
    <String, dynamic>{
      'contractNumber': instance.contractNumber,
      'contractReference': instance.contractReference,
      'price': const StringToDoubleConverter().toJson(instance.price),
      'priceUnit': instance.priceUnit,
      'contractQuantity': instance.contractQuantity,
      'remainingQuantity': instance.remainingQuantity,
      'isTenderExpire': instance.isTenderExpired,
      'expiryDate': instance.expiryDate,
      'orderReason': instance.orderReason,
      'visaNumber': instance.visaNumber,
      'announcementLetterNumber': instance.announcementLetterNumber,
    };
