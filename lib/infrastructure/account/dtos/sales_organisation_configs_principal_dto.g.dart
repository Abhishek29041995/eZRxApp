// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_organisation_configs_principal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesOrganisationConfigsPrincipalDtoImpl
    _$$SalesOrganisationConfigsPrincipalDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$SalesOrganisationConfigsPrincipalDtoImpl(
          date: (json['date'] as num?)?.toInt() ?? 0,
          principalCode: json['principal'] as String,
        );

Map<String, dynamic> _$$SalesOrganisationConfigsPrincipalDtoImplToJson(
        _$SalesOrganisationConfigsPrincipalDtoImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'principal': instance.principalCode,
    };
