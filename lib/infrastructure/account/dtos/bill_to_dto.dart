import 'package:ezrxmobile/domain/account/entities/bill_to_address.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_alt_name.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_name.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_to_dto.freezed.dart';
part 'bill_to_dto.g.dart';

@freezed
class BillToDto with _$BillToDto {
  const BillToDto._();
  const factory BillToDto({
    @JsonKey(name: 'billToCustomerCode', defaultValue: '')
        required String billToCustomerCode,
    @JsonKey(name: 'defaulBillToAddress', defaultValue: true)
        required bool defaulBillToAddress,
    @JsonKey(name: 'name1', defaultValue: '') required String name1,
    @JsonKey(name: 'name2', defaultValue: '') required String name2,
    @JsonKey(name: 'name3', defaultValue: '') required String name3,
    @JsonKey(name: 'name4', defaultValue: '') required String name4,
    @JsonKey(name: 'altName1', defaultValue: '') required String altName1,
    @JsonKey(name: 'altName2', defaultValue: '') required String altName2,
    @JsonKey(name: 'altName3', defaultValue: '') required String altName3,
    @JsonKey(name: 'altName4', defaultValue: '') required String altName4,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'street', defaultValue: '') required String street,
    @JsonKey(name: 'street2', defaultValue: '') required String street2,
    @JsonKey(name: 'street3', defaultValue: '') required String street3,
    @JsonKey(name: 'street4', defaultValue: '') required String street4,
    @JsonKey(name: 'street5', defaultValue: '') required String street5,
    @JsonKey(name: 'postalCode', defaultValue: '') required String postalCode,
    @JsonKey(name: 'postalCode2', defaultValue: '') required String postalCode2,
    @JsonKey(name: 'city1', defaultValue: '') required String city1,
    @JsonKey(name: 'city2', defaultValue: '') required String city2,
    @JsonKey(name: 'telephoneNumber', defaultValue: '')
        required String telephoneNumber,
    @JsonKey(name: 'telephoneExtension', defaultValue: '')
        required String telephoneExtension,
    @JsonKey(name: 'faxNumber', defaultValue: '') required String faxNumber,
    @JsonKey(name: 'faxExtension', defaultValue: '')
        required String faxExtension,
    @JsonKey(name: 'taxNumber', defaultValue: '') required String taxNumber,
    @JsonKey(name: 'houseNumber1', defaultValue: '')
        required String houseNumber1,
    @JsonKey(name: 'houseNumber2', defaultValue: '')
        required String houseNumber2,
    @JsonKey(name: 'building', defaultValue: '') required String building,
    @JsonKey(name: 'region', defaultValue: '') required String region,
    @JsonKey(name: 'country', defaultValue: '') required String country,
    @JsonKey(name: 'district', defaultValue: '') required String district,
    @JsonKey(name: 'floor', defaultValue: '') required String floor,
    @JsonKey(name: 'plant', defaultValue: '') required String plant,
    @JsonKey(name: 'roomnumber', defaultValue: '') required String roomnumber,
    @JsonKey(name: 'taxIncludedBySalesOrganization', defaultValue: false)
        required bool taxIncludedBySalesOrganization,
    @JsonKey(name: 'customerClassification', defaultValue: '')
        required String customerClassification,
    @JsonKey(name: 'customerLocalGroup', defaultValue: '')
        required String customerLocalGroup,
    @JsonKey(name: 'emailAddresses', defaultValue: <String>[])
        required List<String> emailAddresses,
  }) = _BillToDto;

  BillToInfo toDomain() {
    return BillToInfo(
      billToCustomerCode: billToCustomerCode,
      defaulBillToAddress: defaulBillToAddress,
      billToName: BillToName(
        name1: name1,
        name2: name2,
        name3: name3,
        name4: name4,
      ),
      billToAltName: BillToAltName(
        altName1: altName1,
        altName2: altName2,
        altName3: altName3,
        altName4: altName4,
      ),
      status: status,
      billToAddress: BillToAddress(
        street: street,
        street2: street2,
        street3: street3,
        street4: street4,
        street5: street5,
        city1: city1,
        city2: city2,
      ),
      country: country,
      district: district,
      postalCode: postalCode,
      postalCode2: postalCode2,
      city1: city1,
      city2: city2,
      emailAddresses: emailAddresses.map((e) => EmailAddress(e)).toList(),
      telephoneNumber: telephoneNumber,
      telephoneExtension: telephoneExtension,
      faxNumber: faxNumber,
      faxExtension: faxExtension,
      taxNumber: StringValue(taxNumber),
      houseNumber1: houseNumber1,
      houseNumber2: houseNumber2,
      building: building,
      region: region,
      floor: floor,
      plant: plant,
      roomnumber: roomnumber,
      taxIncludedBySalesOrganization: taxIncludedBySalesOrganization,
      customerClassification: customerClassification,
      customerLocalGroup: customerLocalGroup,
    );
  }

  factory BillToDto.fromDomain(BillToInfo billToInfo) {
    return BillToDto(
      altName1: billToInfo.billToAltName.altName1,
      altName2: billToInfo.billToAltName.altName2,
      altName3: billToInfo.billToAltName.altName3,
      altName4: billToInfo.billToAltName.altName4,
      billToCustomerCode: billToInfo.billToCustomerCode,
      building: billToInfo.building,
      city1: billToInfo.city1,
      city2: billToInfo.city2,
      country: billToInfo.country,
      customerClassification: billToInfo.customerClassification,
      customerLocalGroup: billToInfo.customerLocalGroup,
      defaulBillToAddress: billToInfo.defaulBillToAddress,
      district: billToInfo.district,
      emailAddresses:
          billToInfo.emailAddresses.map((e) => e.getValue()).toList(),
      faxExtension: billToInfo.faxExtension,
      houseNumber2: billToInfo.houseNumber2,
      name1: billToInfo.billToName.name1,
      name2: billToInfo.billToName.name2,
      name3: billToInfo.billToName.name3,
      name4: billToInfo.billToName.name4,
      plant: billToInfo.plant,
      postalCode2: billToInfo.postalCode2,
      postalCode: billToInfo.postalCode,
      region: billToInfo.region,
      roomnumber: billToInfo.roomnumber,
      status: billToInfo.status,
      street2: billToInfo.billToAddress.street2,
      street3: billToInfo.billToAddress.street3,
      street4: billToInfo.billToAddress.street4,
      street5: billToInfo.billToAddress.street5,
      street: billToInfo.billToAddress.street,
      taxIncludedBySalesOrganization: billToInfo.taxIncludedBySalesOrganization,
      taxNumber: billToInfo.taxNumber.getOrDefaultValue(''),
      telephoneExtension: billToInfo.telephoneExtension,
      telephoneNumber: billToInfo.telephoneNumber,
      faxNumber: billToInfo.faxNumber,
      floor: billToInfo.floor,
      houseNumber1: billToInfo.houseNumber1,
    );
  }

  factory BillToDto.fromJson(Map<String, dynamic> json) =>
      _$BillToDtoFromJson(json);
}
