// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartDtoImpl _$$CartDtoImplFromJson(Map<String, dynamic> json) =>
    _$CartDtoImpl(
      cartProducts: (json['ezRxItems'] as List<dynamic>?)
              ?.map((e) => CartProductDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      cartCustomerCode: json['customerCode'] as String? ?? '',
      cartShipToCustomerCode: json['shipToCustomerCode'] as String? ?? '',
    );

Map<String, dynamic> _$$CartDtoImplToJson(_$CartDtoImpl instance) =>
    <String, dynamic>{
      'ezRxItems': instance.cartProducts.map((e) => e.toJson()).toList(),
      'customerCode': instance.cartCustomerCode,
      'shipToCustomerCode': instance.cartShipToCustomerCode,
    };
