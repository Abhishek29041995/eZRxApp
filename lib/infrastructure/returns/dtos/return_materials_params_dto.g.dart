// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_materials_params_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReturnMaterialsParamsDtoImpl _$$ReturnMaterialsParamsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ReturnMaterialsParamsDtoImpl(
      salesOrg: json['salesOrg'] as String? ?? '',
      soldTo: json['soldTo'] as String? ?? '',
      shipTo: json['shipTo'] as String? ?? '',
      first: (json['first'] as num?)?.toInt() ?? 0,
      after: (json['after'] as num?)?.toInt() ?? 0,
      searchFilter: json['searchFilter'] as String? ?? '',
      filter:
          ReturnItemsFilterDto.fromJson(json['filter'] as Map<String, dynamic>),
      language: json['language'] as String? ?? '',
      username: json['username'] as String? ?? '',
    );

Map<String, dynamic> _$$ReturnMaterialsParamsDtoImplToJson(
        _$ReturnMaterialsParamsDtoImpl instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'soldTo': instance.soldTo,
      'shipTo': instance.shipTo,
      'first': instance.first,
      'after': instance.after,
      'searchFilter': instance.searchFilter,
      'language': instance.language,
      'username': instance.username,
    };
