// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_basic_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialBasicInformationDtoImpl _$$MaterialBasicInformationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialBasicInformationDtoImpl(
      salesOrg: json['salesOrg'] as String? ?? '',
      partnerRole: json['partnerRole'] as String? ?? '',
      partnerNumber: json['partnerNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$MaterialBasicInformationDtoImplToJson(
        _$MaterialBasicInformationDtoImpl instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'partnerRole': instance.partnerRole,
      'partnerNumber': instance.partnerNumber,
    };
