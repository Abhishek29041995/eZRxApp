// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_code_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerCodeDtoImpl _$$CustomerCodeDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerCodeDtoImpl(
      customerCodeSoldTo: json['customerCodeSoldTo'] as String? ?? '',
      name1: json['name1'] as String? ?? '',
      name2: json['name2'] as String? ?? '',
      name3: json['name3'] as String? ?? '',
      name4: json['name4'] as String? ?? '',
      status: json['status'] as String? ?? '',
      street1: json['street1'] as String? ?? '',
      street2: json['street2'] as String? ?? '',
      street3: json['street3'] as String? ?? '',
      street4: json['street4'] as String? ?? '',
      street5: json['street5'] as String? ?? '',
      city1: json['city1'] as String? ?? '',
      city2: json['city2'] as String? ?? '',
      telephoneNumber: json['telephoneNumber'] as String? ?? '',
      postalCode: json['postalCode'] as String? ?? '',
      division: json['division'] as String? ?? '',
      customerClassification: json['customerClassification'] as String? ?? '',
      customerLocalGroup: json['customerLocalGroup'] as String? ?? '',
      paymentTerm: json['paymentTerm'] as String? ?? '',
      paymentTermDescription: json['paymentTermDescription'] as String? ?? '',
      shipToInfos: (json['shipTo'] as List<dynamic>?)
              ?.map((e) => ShipToDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      billToInfos: (json['billTo'] as List<dynamic>?)
              ?.map((e) => BillToDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      customerAttr7: json['customerAttr7'] as String? ?? '',
      customerGrp4: json['customerGrp4'] as String? ?? '',
      region: json['region'] as String? ?? '',
      emailAddresses: (json['emailAddresses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      comboEligible: json['comboEligible'] as bool? ?? false,
      salesDeals: (json['salesDeals'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      country: json['country'] as String? ?? '',
      floor: json['floor'] as String? ?? '',
      houseNumber1: json['houseNumber1'] as String? ?? '',
      isMarketPlace:
          JsonReadValueHelper.mappingIsMarketPlace(json, 'isMarketPlace')
                  as bool? ??
              false,
    );

Map<String, dynamic> _$$CustomerCodeDtoImplToJson(
        _$CustomerCodeDtoImpl instance) =>
    <String, dynamic>{
      'customerCodeSoldTo': instance.customerCodeSoldTo,
      'name1': instance.name1,
      'name2': instance.name2,
      'name3': instance.name3,
      'name4': instance.name4,
      'status': instance.status,
      'street1': instance.street1,
      'street2': instance.street2,
      'street3': instance.street3,
      'street4': instance.street4,
      'street5': instance.street5,
      'city1': instance.city1,
      'city2': instance.city2,
      'telephoneNumber': instance.telephoneNumber,
      'postalCode': instance.postalCode,
      'division': instance.division,
      'customerClassification': instance.customerClassification,
      'customerLocalGroup': instance.customerLocalGroup,
      'paymentTerm': instance.paymentTerm,
      'paymentTermDescription': instance.paymentTermDescription,
      'shipTo': instance.shipToInfos.map((e) => e.toJson()).toList(),
      'billTo': instance.billToInfos.map((e) => e.toJson()).toList(),
      'customerAttr7': instance.customerAttr7,
      'customerGrp4': instance.customerGrp4,
      'region': instance.region,
      'emailAddresses': instance.emailAddresses,
      'comboEligible': instance.comboEligible,
      'salesDeals': instance.salesDeals,
      'country': instance.country,
      'floor': instance.floor,
      'houseNumber1': instance.houseNumber1,
      'isMarketPlace': instance.isMarketPlace,
    };
