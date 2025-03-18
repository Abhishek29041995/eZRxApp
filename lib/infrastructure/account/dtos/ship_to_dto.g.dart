// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_to_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShipToDtoImpl _$$ShipToDtoImplFromJson(Map<String, dynamic> json) =>
    _$ShipToDtoImpl(
      shipToCustomerCode: json['shipToCustomerCode'] as String? ?? '',
      defaultShipToAddress: json['defaultShipToAddress'] as bool? ?? true,
      name1: json['name1'] as String? ?? '',
      name2: json['name2'] as String? ?? '',
      name3: json['name3'] as String? ?? '',
      name4: json['name4'] as String? ?? '',
      status: json['status'] as String? ?? '',
      street: json['street'] as String? ?? '',
      street2: json['street2'] as String? ?? '',
      street3: json['street3'] as String? ?? '',
      street4: json['street4'] as String? ?? '',
      street5: json['street5'] as String? ?? '',
      postalCode: json['postalCode'] as String? ?? '',
      city1: json['city1'] as String? ?? '',
      city2: json['city2'] as String? ?? '',
      telephoneNumber: json['telephoneNumber'] as String? ?? '',
      houseNumber1: json['houseNumber1'] as String? ?? '',
      building: json['building'] as String? ?? '',
      region: json['region'] as String? ?? '',
      floor: json['floor'] as String? ?? '',
      plant: json['plant'] as String? ?? '',
      licenseDtoList: (json['licenses'] as List<dynamic>?)
              ?.map((e) => LicenseDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      country: json['country'] as String? ?? '',
      targetCustomerType: json['targetCustomerType'] as String? ?? '',
      customerBlock: json['customerBlock'] as String? ?? '',
    );

Map<String, dynamic> _$$ShipToDtoImplToJson(_$ShipToDtoImpl instance) =>
    <String, dynamic>{
      'shipToCustomerCode': instance.shipToCustomerCode,
      'defaultShipToAddress': instance.defaultShipToAddress,
      'name1': instance.name1,
      'name2': instance.name2,
      'name3': instance.name3,
      'name4': instance.name4,
      'status': instance.status,
      'street': instance.street,
      'street2': instance.street2,
      'street3': instance.street3,
      'street4': instance.street4,
      'street5': instance.street5,
      'postalCode': instance.postalCode,
      'city1': instance.city1,
      'city2': instance.city2,
      'telephoneNumber': instance.telephoneNumber,
      'houseNumber1': instance.houseNumber1,
      'building': instance.building,
      'region': instance.region,
      'floor': instance.floor,
      'plant': instance.plant,
      'licenses': instance.licenseDtoList.map((e) => e.toJson()).toList(),
      'country': instance.country,
      'targetCustomerType': instance.targetCustomerType,
      'customerBlock': instance.customerBlock,
    };
