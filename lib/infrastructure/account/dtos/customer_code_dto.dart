import 'package:ezrxmobile/domain/account/entities/customer_address.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_name.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/bill_to_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/ship_to_dto.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_code_dto.freezed.dart';
part 'customer_code_dto.g.dart';

@freezed
class CustomerCodeDto with _$CustomerCodeDto {
  const CustomerCodeDto._();
  const factory CustomerCodeDto({
    @JsonKey(name: 'customerCodeSoldTo', defaultValue: '')
    required String customerCodeSoldTo,
    @JsonKey(name: 'name1', defaultValue: '') required String name1,
    @JsonKey(name: 'name2', defaultValue: '') required String name2,
    @JsonKey(name: 'name3', defaultValue: '') required String name3,
    @JsonKey(name: 'name4', defaultValue: '') required String name4,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'street1', defaultValue: '') required String street1,
    @JsonKey(name: 'street2', defaultValue: '') required String street2,
    @JsonKey(name: 'street3', defaultValue: '') required String street3,
    @JsonKey(name: 'street4', defaultValue: '') required String street4,
    @JsonKey(name: 'street5', defaultValue: '') required String street5,
    @JsonKey(name: 'city1', defaultValue: '') required String city1,
    @JsonKey(name: 'city2', defaultValue: '') required String city2,
    @JsonKey(name: 'telephoneNumber', defaultValue: '')
    required String telephoneNumber,
    @JsonKey(name: 'postalCode', defaultValue: '') required String postalCode,
    @JsonKey(name: 'division', defaultValue: '') required String division,
    @JsonKey(name: 'customerClassification', defaultValue: '')
    required String customerClassification,
    @JsonKey(name: 'customerLocalGroup', defaultValue: '')
    required String customerLocalGroup,
    @JsonKey(name: 'paymentTerm', defaultValue: '') required String paymentTerm,
    @JsonKey(name: 'paymentTermDescription', defaultValue: '')
    required String paymentTermDescription,
    @JsonKey(name: 'shipTo', defaultValue: <ShipToDto>[])
    required List<ShipToDto> shipToInfos,
    @JsonKey(name: 'billTo', defaultValue: <BillToDto>[])
    required List<BillToDto> billToInfos,
    @JsonKey(name: 'customerAttr7', defaultValue: '')
    required String customerAttr7,
    @JsonKey(name: 'customerGrp4', defaultValue: '')
    required String customerGrp4,
    @JsonKey(name: 'region', defaultValue: '') required String region,
    @JsonKey(name: 'emailAddresses', defaultValue: [])
    required List<String> emailAddresses,
    @JsonKey(name: 'comboEligible', defaultValue: false)
    required bool comboEligible,
    @JsonKey(name: 'salesDeals', defaultValue: [])
    required List<String> salesDeals,
    @JsonKey(name: 'country', defaultValue: '') required String country,
    @JsonKey(name: 'floor', defaultValue: '') required String floor,
    @JsonKey(name: 'houseNumber1', defaultValue: '')
    required String houseNumber1,
    @JsonKey(
      defaultValue: false,
      readValue: JsonReadValueHelper.mappingIsMarketPlace,
    )
    required bool isMarketPlace,
  }) = _CustomerCodeDto;

  CustomerCodeInfo toDomain() {
    return CustomerCodeInfo(
      customerCodeSoldTo: customerCodeSoldTo,
      customerName: CustomerName(
        name1: name1,
        name2: name2,
        name3: name3,
        name4: name4,
      ),
      customerAddress: CustomerAddress(
        street1: street1,
        street2: street2,
        street3: street3,
        street4: street4,
        street5: street5,
        city1: city1,
        city2: city2,
      ),
      status: Status(status),
      division: division,
      postalCode: postalCode,
      customerClassification: CustomerClassification(customerClassification),
      customerLocalGroup: customerLocalGroup,
      paymentTerm: PaymentTermCode(paymentTerm),
      paymentTermDescription: PaymentTermDescription(paymentTermDescription),
      shipToInfos: shipToInfos.map((e) => e.toDomain()).toList(),
      billToInfos: billToInfos.map((e) => e.toDomain()).toList(),
      customerAttr7: CustomerAttr7(customerAttr7),
      customerGrp4: CustomerGrp4(customerGrp4),
      region: region,
      emailAddresses: emailAddresses.map((e) => EmailAddress(e)).toList(),
      comboEligible: comboEligible,
      salesDeals: salesDeals.map((e) => SalesDealNumber(e)).toList(),
      telephoneNumber: PhoneNumber(telephoneNumber),
      country: country,
      floor: floor,
      houseNumber1: houseNumber1,
      isMarketPlace: isMarketPlace,
    );
  }

  factory CustomerCodeDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerCodeDtoFromJson(json);
}
