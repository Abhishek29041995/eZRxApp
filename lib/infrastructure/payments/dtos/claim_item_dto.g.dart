// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClaimItemDtoImpl _$$ClaimItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$ClaimItemDtoImpl(
      createdAt: json['createdAt'] as String? ?? '',
      id: (json['claimId'] as num?)?.toInt() ?? 0,
      amount: json['claimAmount'] as String? ?? '',
      principalCode: (json['principalCode'] as num?)?.toInt() ?? 0,
      principalName: json['principalName'] as String? ?? '',
      claimType: json['claimType'] as String? ?? '',
    );

Map<String, dynamic> _$$ClaimItemDtoImplToJson(_$ClaimItemDtoImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'claimId': instance.id,
      'claimAmount': instance.amount,
      'principalCode': instance.principalCode,
      'principalName': instance.principalName,
      'claimType': instance.claimType,
    };
