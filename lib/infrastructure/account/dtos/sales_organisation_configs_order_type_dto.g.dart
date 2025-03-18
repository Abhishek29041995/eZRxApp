// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_organisation_configs_order_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesOrganisationConfigsOrderTypeDtoImpl
    _$$SalesOrganisationConfigsOrderTypeDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$SalesOrganisationConfigsOrderTypeDtoImpl(
          categoryId: json['categoryId'] as String? ?? '',
          orderType: json['orderType'] as String? ?? '',
          orderReason: (json['orderReason'] as num?)?.toInt() ?? 0,
          description: json['description'] as String? ?? '',
          enabled: json['enabled'] as bool? ?? false,
        );

Map<String, dynamic> _$$SalesOrganisationConfigsOrderTypeDtoImplToJson(
        _$SalesOrganisationConfigsOrderTypeDtoImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'orderType': instance.orderType,
      'orderReason': instance.orderReason,
      'description': instance.description,
      'enabled': instance.enabled,
    };
