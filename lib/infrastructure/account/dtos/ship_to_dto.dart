import 'package:ezrxmobile/domain/account/entities/ship_to_address.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_name.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/license_info.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/license_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship_to_dto.freezed.dart';
part 'ship_to_dto.g.dart';

@freezed
class ShipToDto with _$ShipToDto {
  const ShipToDto._();
  const factory ShipToDto({
    @JsonKey(name: 'shipToCustomerCode', defaultValue: '')
    required String shipToCustomerCode,
    @JsonKey(name: 'defaultShipToAddress', defaultValue: true)
    required bool defaultShipToAddress,
    @JsonKey(name: 'name1', defaultValue: '') required String name1,
    @JsonKey(name: 'name2', defaultValue: '') required String name2,
    @JsonKey(name: 'name3', defaultValue: '') required String name3,
    @JsonKey(name: 'name4', defaultValue: '') required String name4,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'street', defaultValue: '') required String street,
    @JsonKey(name: 'street2', defaultValue: '') required String street2,
    @JsonKey(name: 'street3', defaultValue: '') required String street3,
    @JsonKey(name: 'street4', defaultValue: '') required String street4,
    @JsonKey(name: 'street5', defaultValue: '') required String street5,
    @JsonKey(name: 'postalCode', defaultValue: '') required String postalCode,
    @JsonKey(name: 'city1', defaultValue: '') required String city1,
    @JsonKey(name: 'city2', defaultValue: '') required String city2,
    @JsonKey(name: 'telephoneNumber', defaultValue: '')
    required String telephoneNumber,
    @JsonKey(name: 'houseNumber1', defaultValue: '')
    required String houseNumber1,
    @JsonKey(name: 'building', defaultValue: '') required String building,
    @JsonKey(name: 'region', defaultValue: '') required String region,
    @JsonKey(name: 'floor', defaultValue: '') required String floor,
    @JsonKey(name: 'plant', defaultValue: '') required String plant,
    @JsonKey(name: 'licenses', defaultValue: <LicenseDto>[])
    required List<LicenseDto> licenseDtoList,
    @JsonKey(name: 'country', defaultValue: '') required String country,
    @JsonKey(name: 'targetCustomerType', defaultValue: '')
    required String targetCustomerType,
    @JsonKey(name: 'customerBlock', defaultValue: '')
    required String customerBlock,
  }) = _ShipToDto;

  factory ShipToDto.fromDomain(ShipToInfo shipToInfo) {
    return ShipToDto(
      shipToCustomerCode: shipToInfo.shipToCustomerCode,
      defaultShipToAddress: shipToInfo.defaultShipToAddress,
      name1: shipToInfo.shipToName.name1,
      name2: shipToInfo.shipToName.name2,
      name3: shipToInfo.shipToName.name3,
      name4: shipToInfo.shipToName.name4,
      status: shipToInfo.status.getOrCrash(),
      street: shipToInfo.shipToAddress.street,
      street2: shipToInfo.shipToAddress.street2,
      street3: shipToInfo.shipToAddress.street3,
      street4: shipToInfo.shipToAddress.street4,
      street5: shipToInfo.shipToAddress.street5,
      postalCode: shipToInfo.postalCode,
      city1: shipToInfo.city1,
      city2: shipToInfo.city2,
      telephoneNumber: shipToInfo.telephoneNumber,
      houseNumber1: shipToInfo.houseNumber1,
      building: shipToInfo.building,
      region: shipToInfo.region,
      floor: shipToInfo.floor,
      plant: shipToInfo.plant,
      licenseDtoList:
          shipToInfo.licenses.map((e) => LicenseDto.fromDomain(e)).toList(),
      country: shipToInfo.country,
      targetCustomerType: shipToInfo.targetCustomerType,
      customerBlock: shipToInfo.customerBlock.getOrCrash(),
    );
  }

  ShipToInfo toDomain() {
    return ShipToInfo(
      shipToCustomerCode: shipToCustomerCode,
      defaultShipToAddress: defaultShipToAddress,
      shipToName: ShipToName(
        name1: name1,
        name2: name2,
        name3: name3,
        name4: name4,
      ),
      status: Status(status),
      shipToAddress: ShipToAddress(
        street: street,
        street2: street2,
        street3: street3,
        street4: street4,
        street5: street5,
        city1: city1,
        city2: city2,
      ),
      postalCode: postalCode,
      city1: city1,
      city2: city2,
      telephoneNumber: telephoneNumber,
      houseNumber1: houseNumber1,
      building: building,
      region: region,
      floor: floor,
      plant: plant,
      licenses: licenseDtoList.isNotEmpty
          ? licenseDtoList.map((e) => e.toDomain()).toList()
          : <LicenseInfo>[],
      country: country,
      targetCustomerType: targetCustomerType,
      customerBlock: CustomerBlock(customerBlock),
    );
  }

  factory ShipToDto.fromJson(Map<String, dynamic> json) =>
      _$ShipToDtoFromJson(json);
}
