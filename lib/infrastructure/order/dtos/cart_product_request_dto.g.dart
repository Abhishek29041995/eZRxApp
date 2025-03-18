// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartProductRequestDtoImpl _$$CartProductRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CartProductRequestDtoImpl(
      salesOrg: json['SalesOrg'] as String? ?? '',
      customerCode: json['CustomerCode'] as String? ?? '',
      shipTo: json['ShipToID'] as String? ?? '',
      productNumber: json['ProductID'] as String? ?? '',
      quantity: (json['Quantity'] as num?)?.toInt() ?? 0,
      itemSource: json['ItemSource'] as String? ?? 'EZRX',
      language: json['Language'] as String? ?? 'EN',
      parentID: json['ParentID'] as String? ?? '',
      counterOfferPrice: (json['CounterOfferPrice'] as num?)?.toDouble() ?? 0.0,
      counterOfferDiscount:
          (json['DiscountOverridePercentage'] as num?)?.toDouble() ?? 0.0,
      comment: json['Comment'] as String? ?? '',
      counterOfferCurrency: json['CounterOfferCurrency'] as String? ?? '',
      type: json['Type'] as String? ?? '',
      itemId: json['ItemId'] as String? ?? '',
      tenderContractNumber: json['TenderContractNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$CartProductRequestDtoImplToJson(
        _$CartProductRequestDtoImpl instance) =>
    <String, dynamic>{
      'SalesOrg': instance.salesOrg,
      'CustomerCode': instance.customerCode,
      'ShipToID': instance.shipTo,
      'ProductID': instance.productNumber,
      'Quantity': instance.quantity,
      'ItemSource': instance.itemSource,
      'Language': instance.language,
      'ParentID': instance.parentID,
      'CounterOfferPrice': instance.counterOfferPrice,
      'DiscountOverridePercentage': instance.counterOfferDiscount,
      'Comment': instance.comment,
      'CounterOfferCurrency': instance.counterOfferCurrency,
      'Type': instance.type,
      'ItemId': instance.itemId,
      'TenderContractNumber': instance.tenderContractNumber,
    };
