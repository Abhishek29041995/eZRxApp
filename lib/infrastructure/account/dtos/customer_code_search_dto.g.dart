// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_code_search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerCodeSearchDtoImpl _$$CustomerCodeSearchDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerCodeSearchDtoImpl(
      salesOrg: json['salesOrganisation'] as String? ?? '',
      first: (json['first'] as num?)?.toInt() ?? 24,
      filterBlockCustomer: json['filterBlockCustomer'] as bool? ?? false,
      after: (json['after'] as num?)?.toInt() ?? 0,
      searchKey: json['searchKey'] as String? ?? '',
    );

Map<String, dynamic> _$$CustomerCodeSearchDtoImplToJson(
        _$CustomerCodeSearchDtoImpl instance) =>
    <String, dynamic>{
      'salesOrganisation': instance.salesOrg,
      'first': instance.first,
      'filterBlockCustomer': instance.filterBlockCustomer,
      'after': instance.after,
      'searchKey': instance.searchKey,
    };
