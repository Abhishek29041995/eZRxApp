// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$licenseDtoImpl _$$licenseDtoImplFromJson(Map<String, dynamic> json) =>
    _$licenseDtoImpl(
      licenceType: json['licenceType'] as String? ?? '',
      licenseDescription: json['licenseDescription'] as String? ?? '',
      licenseNumber: json['licenseNumber'] as String? ?? '',
      validFrom: JsonReadValueHelper.readDateTimeStringFormat(json, 'validFrom')
              as String? ??
          '',
      validTo: JsonReadValueHelper.readDateTimeStringFormat(json, 'validTo')
              as String? ??
          '',
    );

Map<String, dynamic> _$$licenseDtoImplToJson(_$licenseDtoImpl instance) =>
    <String, dynamic>{
      'licenceType': instance.licenceType,
      'licenseDescription': instance.licenseDescription,
      'licenseNumber': instance.licenseNumber,
      'validFrom': instance.validFrom,
      'validTo': instance.validTo,
    };
