// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundle_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BundleInfoDtoImpl _$$BundleInfoDtoImplFromJson(Map<String, dynamic> json) =>
    _$BundleInfoDtoImpl(
      sequence: (json['sequence'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      type: json['type'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$BundleInfoDtoImplToJson(_$BundleInfoDtoImpl instance) =>
    <String, dynamic>{
      'sequence': instance.sequence,
      'quantity': instance.quantity,
      'type': instance.type,
      'rate': instance.rate,
    };
