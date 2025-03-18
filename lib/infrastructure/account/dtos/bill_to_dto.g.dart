// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_to_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillToDtoImpl _$$BillToDtoImplFromJson(Map<String, dynamic> json) =>
    _$BillToDtoImpl(
      billToCustomerCode: json['billToCustomerCode'] as String? ?? '',
      defaulBillToAddress: json['defaulBillToAddress'] as bool? ?? true,
      name1: json['name1'] as String? ?? '',
      name2: json['name2'] as String? ?? '',
      name3: json['name3'] as String? ?? '',
      name4: json['name4'] as String? ?? '',
      altName1: json['altName1'] as String? ?? '',
      altName2: json['altName2'] as String? ?? '',
      altName3: json['altName3'] as String? ?? '',
      altName4: json['altName4'] as String? ?? '',
      status: json['status'] as String? ?? '',
      street: json['street'] as String? ?? '',
      street2: json['street2'] as String? ?? '',
      street3: json['street3'] as String? ?? '',
      street4: json['street4'] as String? ?? '',
      street5: json['street5'] as String? ?? '',
      postalCode: json['postalCode'] as String? ?? '',
      postalCode2: json['postalCode2'] as String? ?? '',
      city1: json['city1'] as String? ?? '',
      city2: json['city2'] as String? ?? '',
      telephoneNumber: json['telephoneNumber'] as String? ?? '',
      telephoneExtension: json['telephoneExtension'] as String? ?? '',
      faxNumber: json['faxNumber'] as String? ?? '',
      faxExtension: json['faxExtension'] as String? ?? '',
      taxNumber: json['taxNumber'] as String? ?? '',
      houseNumber1: json['houseNumber1'] as String? ?? '',
      houseNumber2: json['houseNumber2'] as String? ?? '',
      building: json['building'] as String? ?? '',
      region: json['region'] as String? ?? '',
      country: json['country'] as String? ?? '',
      district: json['district'] as String? ?? '',
      floor: json['floor'] as String? ?? '',
      plant: json['plant'] as String? ?? '',
      roomnumber: json['roomnumber'] as String? ?? '',
      taxIncludedBySalesOrganization:
          json['taxIncludedBySalesOrganization'] as bool? ?? false,
      customerClassification: json['customerClassification'] as String? ?? '',
      customerLocalGroup: json['customerLocalGroup'] as String? ?? '',
      emailAddresses: (json['emailAddresses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$BillToDtoImplToJson(_$BillToDtoImpl instance) =>
    <String, dynamic>{
      'billToCustomerCode': instance.billToCustomerCode,
      'defaulBillToAddress': instance.defaulBillToAddress,
      'name1': instance.name1,
      'name2': instance.name2,
      'name3': instance.name3,
      'name4': instance.name4,
      'altName1': instance.altName1,
      'altName2': instance.altName2,
      'altName3': instance.altName3,
      'altName4': instance.altName4,
      'status': instance.status,
      'street': instance.street,
      'street2': instance.street2,
      'street3': instance.street3,
      'street4': instance.street4,
      'street5': instance.street5,
      'postalCode': instance.postalCode,
      'postalCode2': instance.postalCode2,
      'city1': instance.city1,
      'city2': instance.city2,
      'telephoneNumber': instance.telephoneNumber,
      'telephoneExtension': instance.telephoneExtension,
      'faxNumber': instance.faxNumber,
      'faxExtension': instance.faxExtension,
      'taxNumber': instance.taxNumber,
      'houseNumber1': instance.houseNumber1,
      'houseNumber2': instance.houseNumber2,
      'building': instance.building,
      'region': instance.region,
      'country': instance.country,
      'district': instance.district,
      'floor': instance.floor,
      'plant': instance.plant,
      'roomnumber': instance.roomnumber,
      'taxIncludedBySalesOrganization': instance.taxIncludedBySalesOrganization,
      'customerClassification': instance.customerClassification,
      'customerLocalGroup': instance.customerLocalGroup,
      'emailAddresses': instance.emailAddresses,
    };
