// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_by_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViewByOrderDtoImpl _$$ViewByOrderDtoImplFromJson(Map<String, dynamic> json) =>
    _$ViewByOrderDtoImpl(
      orderCount: (json['orderCount'] as num?)?.toInt() ?? 0,
      creatingOrderIds: (json['creatingOrderIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      orderHeaders: (json['orderHeaders'] as List<dynamic>?)
              ?.map((e) =>
                  OrderHistoryDetailsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$ViewByOrderDtoImplToJson(
        _$ViewByOrderDtoImpl instance) =>
    <String, dynamic>{
      'orderCount': instance.orderCount,
      'creatingOrderIds': instance.creatingOrderIds,
      'orderHeaders': instance.orderHeaders.map((e) => e.toJson()).toList(),
    };
