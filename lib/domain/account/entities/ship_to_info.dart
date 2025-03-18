import 'package:ezrxmobile/domain/account/entities/ship_to_address.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_name.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/license_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship_to_info.freezed.dart';

@freezed
class ShipToInfo with _$ShipToInfo {
  const ShipToInfo._();

  const factory ShipToInfo({
    required bool defaultShipToAddress,
    required String shipToCustomerCode,
    required ShipToName shipToName,
    required ShipToAddress shipToAddress,
    required Status status,
    required String building,
    required String city1,
    required String city2,
    required String postalCode,
    required String houseNumber1,
    required String telephoneNumber,
    required String region,
    required String floor,
    required String plant,
    required String targetCustomerType,
    required String country,
    required List<LicenseInfo> licenses,
    required CustomerBlock customerBlock,
  }) = _ShipToInfo;

  factory ShipToInfo.empty() => ShipToInfo(
        defaultShipToAddress: false,
        shipToCustomerCode: '',
        shipToName: const ShipToName(
          name1: '',
          name2: '',
          name3: '',
          name4: '',
        ),
        shipToAddress: const ShipToAddress(
          street: '',
          street2: '',
          street3: '',
          street4: '',
          street5: '',
          city1: '',
          city2: '',
        ),
        status: Status(''),
        postalCode: '',
        houseNumber1: '',
        region: '',
        plant: '',
        targetCustomerType: '',
        telephoneNumber: '',
        city1: '',
        city2: '',
        floor: '',
        building: '',
        licenses: <LicenseInfo>[],
        country: '',
        customerBlock: CustomerBlock(''),
      );

  String get deliveryAddress => '${shipToAddress.toAddress()} $postalCode';

  String get fullDeliveryAddress =>
      '${shipToName.toString()} ${shipToAddress.toAddress()} $postalCode';
}
