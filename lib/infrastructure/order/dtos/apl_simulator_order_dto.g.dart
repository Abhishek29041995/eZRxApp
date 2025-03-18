// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apl_simulator_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AplSimulatorOrderDtoImpl _$$AplSimulatorOrderDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AplSimulatorOrderDtoImpl(
      totalPriceWithoutTax: (json['beforeTax'] as num?)?.toDouble() ?? 0,
      smallOrderFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0,
      grandTotal: (json['netTotalValue'] as num?)?.toDouble() ?? 0,
      totalTax: (json['tax'] as num?)?.toDouble() ?? 0,
      totalDiscountValue: (json['totalDiscValue'] as num?)?.toDouble() ?? 0,
      aplProductList: (json['products'] as List<dynamic>?)
              ?.map((e) => AplProductDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$AplSimulatorOrderDtoImplToJson(
        _$AplSimulatorOrderDtoImpl instance) =>
    <String, dynamic>{
      'beforeTax': instance.totalPriceWithoutTax,
      'deliveryFee': instance.smallOrderFee,
      'netTotalValue': instance.grandTotal,
      'tax': instance.totalTax,
      'totalDiscValue': instance.totalDiscountValue,
      'products': instance.aplProductList.map((e) => e.toJson()).toList(),
    };
