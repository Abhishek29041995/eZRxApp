// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialStockInfoDtoImpl _$$MaterialStockInfoDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialStockInfoDtoImpl(
      materialNumber: json['MaterialNumber'] as String? ?? '',
      stockInformation: (json['StockInformation'] as List<dynamic>?)
              ?.map((e) => StockInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$MaterialStockInfoDtoImplToJson(
        _$MaterialStockInfoDtoImpl instance) =>
    <String, dynamic>{
      'MaterialNumber': instance.materialNumber,
      'StockInformation':
          instance.stockInformation.map((e) => e.toJson()).toList(),
    };

_$StockInfoDtoImpl _$$StockInfoDtoImplFromJson(Map<String, dynamic> json) =>
    _$StockInfoDtoImpl(
      materialNumber: json['MaterialNumber'] as String? ?? '',
      expiryDate: json['ExpiryDate'] as String? ?? '',
      batch: json['Batch'] as String? ?? '',
      inStock: json['InStock'] as String? ?? '',
      stockQuantity: (json['StockQuantity'] as num?)?.toInt() ?? 0,
      salesDistrict: json['SalesDistrict'] as String? ?? '',
    );

Map<String, dynamic> _$$StockInfoDtoImplToJson(_$StockInfoDtoImpl instance) =>
    <String, dynamic>{
      'MaterialNumber': instance.materialNumber,
      'ExpiryDate': instance.expiryDate,
      'Batch': instance.batch,
      'InStock': instance.inStock,
      'StockQuantity': instance.stockQuantity,
      'SalesDistrict': instance.salesDistrict,
    };
