// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_representative_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesRepresentativeInfoDtoImpl _$$SalesRepresentativeInfoDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SalesRepresentativeInfoDtoImpl(
      count: (json['count'] as num).toInt(),
      uniquePrincipalGroups: (json['uniquePrincipalGroup'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      uniquePrincipalNumbers: (json['uniquePrincipalNumber'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      uniqueSalesOrganisations:
          (json['uniqueSalesOrganisation'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$$SalesRepresentativeInfoDtoImplToJson(
        _$SalesRepresentativeInfoDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'uniquePrincipalGroup': instance.uniquePrincipalGroups,
      'uniquePrincipalNumber': instance.uniquePrincipalNumbers,
      'uniqueSalesOrganisation': instance.uniqueSalesOrganisations,
    };
