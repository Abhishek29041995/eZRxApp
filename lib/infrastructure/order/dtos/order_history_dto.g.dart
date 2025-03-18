// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryDtoImpl _$$OrderHistoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderHistoryDtoImpl(
      orderBasicInformation: OrderHistoryBasicInfoDto.fromJson(
          json['orderBasicInformation'] as Map<String, dynamic>),
      orderItems: (json['orderItems'] as List<dynamic>)
          .map((e) => OrderHistoryItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderHistoryDtoImplToJson(
        _$OrderHistoryDtoImpl instance) =>
    <String, dynamic>{
      'orderBasicInformation': instance.orderBasicInformation.toJson(),
      'orderItems': instance.orderItems.map((e) => e.toJson()).toList(),
    };
