// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_license_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerLicenseDtoImpl _$$CustomerLicenseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerLicenseDtoImpl(
      licenseType: json['licenceType'] as String? ?? '',
      licenseNumber: json['licenseNumber'] as String? ?? '',
      validFrom: json['validFrom'] as String? ?? '',
      validTo: json['validTo'] as String? ?? '',
      licenseDescription: json['licenseDescription'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$CustomerLicenseDtoImplToJson(
        _$CustomerLicenseDtoImpl instance) =>
    <String, dynamic>{
      'licenceType': instance.licenseType,
      'licenseNumber': instance.licenseNumber,
      'validFrom': instance.validFrom,
      'validTo': instance.validTo,
      'licenseDescription': instance.licenseDescription,
      'status': instance.status,
    };
