// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_item_override_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialItemOverrideDtoImpl _$$MaterialItemOverrideDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialItemOverrideDtoImpl(
      reference: json['reference'] as String? ?? '',
      valueOverride: (json['valueOverride'] as List<dynamic>?)
              ?.map((e) => ValueOverrideDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      percentageOverride: (json['percentageOverride'] as List<dynamic>?)
              ?.map((e) =>
                  PercentageOverrideDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$MaterialItemOverrideDtoImplToJson(
    _$MaterialItemOverrideDtoImpl instance) {
  final val = <String, dynamic>{
    'reference': instance.reference,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('valueOverride', valueOverrideTojson(instance.valueOverride));
  writeNotNull('percentageOverride',
      percentageOverrideTojson(instance.percentageOverride));
  return val;
}

_$ValueOverrideDtoImpl _$$ValueOverrideDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ValueOverrideDtoImpl(
      code: json['code'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      currency: json['currency'] as String? ?? '',
    );

Map<String, dynamic> _$$ValueOverrideDtoImplToJson(
        _$ValueOverrideDtoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'price': instance.price,
      'currency': instance.currency,
    };

_$PercentageOverrideDtoImpl _$$PercentageOverrideDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PercentageOverrideDtoImpl(
      code: json['code'] as String,
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$PercentageOverrideDtoImplToJson(
        _$PercentageOverrideDtoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'percentage': instance.percentage,
    };
