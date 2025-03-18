// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_order_items_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryDetailsOrderItemDetailsDtoImpl
    _$$OrderHistoryDetailsOrderItemDetailsDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$OrderHistoryDetailsOrderItemDetailsDtoImpl(
          discountCode: json['discountCode'] as String? ?? '',
          discountDescription: json['discountDescription'] as String? ?? '',
          rate: json['rate'] as String? ?? '',
        );

Map<String, dynamic> _$$OrderHistoryDetailsOrderItemDetailsDtoImplToJson(
        _$OrderHistoryDetailsOrderItemDetailsDtoImpl instance) =>
    <String, dynamic>{
      'discountCode': instance.discountCode,
      'discountDescription': instance.discountDescription,
      'rate': instance.rate,
    };
