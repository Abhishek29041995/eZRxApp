// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_code_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerInformationDTOImpl _$$CustomerInformationDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerInformationDTOImpl(
      shipToCount: (json['shipToCount'] as num?)?.toInt() ?? 0,
      soldToInformation: (json['SoldToInformation'] as List<dynamic>?)
              ?.map((e) => CustomerCodeDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$CustomerInformationDTOImplToJson(
        _$CustomerInformationDTOImpl instance) =>
    <String, dynamic>{
      'shipToCount': instance.shipToCount,
      'SoldToInformation':
          instance.soldToInformation.map((e) => e.toJson()).toList(),
    };
