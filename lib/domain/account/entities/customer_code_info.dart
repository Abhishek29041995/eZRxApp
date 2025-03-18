import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_address.dart';
import 'package:ezrxmobile/domain/account/entities/customer_name.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_code_info.freezed.dart';

@freezed
class CustomerCodeInfo with _$CustomerCodeInfo {
  const CustomerCodeInfo._();

  const factory CustomerCodeInfo({
    required String customerCodeSoldTo,
    required CustomerName customerName,
    required CustomerAddress customerAddress,
    required Status status,
    required String division,
    required String postalCode,
    required CustomerClassification customerClassification,
    required String customerLocalGroup,
    required PaymentTermCode paymentTerm,
    required PaymentTermDescription paymentTermDescription,
    required List<ShipToInfo> shipToInfos,
    required List<BillToInfo> billToInfos,
    required List<EmailAddress> emailAddresses,
    required CustomerAttr7 customerAttr7,
    required CustomerGrp4 customerGrp4,
    required String region,
    required bool comboEligible,
    required List<SalesDealNumber> salesDeals,
    required PhoneNumber telephoneNumber,
    required String country,
    required String floor,
    required String houseNumber1,
    required bool isMarketPlace,
  }) = _CustomerCodeInfo;

  factory CustomerCodeInfo.empty() => CustomerCodeInfo(
        customerCodeSoldTo: '',
        customerName: const CustomerName(
          name1: '',
          name2: '',
          name3: '',
          name4: '',
        ),
        customerAddress: const CustomerAddress(
          street1: '',
          street2: '',
          street3: '',
          street4: '',
          street5: '',
          city1: '',
          city2: '',
        ),
        status: Status(''),
        division: '',
        postalCode: '',
        customerClassification: CustomerClassification(''),
        customerLocalGroup: '',
        paymentTerm: PaymentTermCode(''),
        paymentTermDescription: PaymentTermDescription(''),
        shipToInfos: <ShipToInfo>[],
        billToInfos: <BillToInfo>[],
        customerAttr7: CustomerAttr7(''),
        customerGrp4: CustomerGrp4(''),
        region: '',
        emailAddresses: <EmailAddress>[],
        comboEligible: false,
        salesDeals: [],
        telephoneNumber: PhoneNumber(''),
        country: '',
        floor: '',
        houseNumber1: '',
        isMarketPlace: false,
      );

  bool get hasBillToInfo {
    return getBillToInfo.billToCustomerCode.isNotEmpty &&
        getBillToInfo.billToCustomerCode != customerCodeSoldTo;
  }

  String get customerEmailAddress {
    return emailAddresses.isNotEmpty
        ? emailAddresses.first.value.getOrElse(() => 'NA')
        : 'NA';
  }

  int get countWhenValid => this != CustomerCodeInfo.empty() ? 1 : 0;

  BillToInfo get getBillToInfo =>
      billToInfos.isNotEmpty ? billToInfos.first : BillToInfo.empty();

  String get fullCustomerAddress =>
      '${customerName.toString()}${customerAddress.toAddress()} $postalCode';

  String get shortAddress => '${customerAddress.toAddress()} $postalCode';

  String get displayPaymentTerm {
    final displayWords = [
      if (paymentTerm.isValid()) paymentTerm.displayPaymentTermCode,
      if (paymentTermDescription.isValid())
        paymentTermDescription.displayPaymentTermDescription,
    ];

    return displayWords.isEmpty ? 'NA' : displayWords.join(' - ');
  }
}

extension CustomerCodeList on List<CustomerCodeInfo> {
  bool get canPreSelectShipToCode =>
      length == 1 && first.shipToInfos.length == 1;

  CustomerCodeInfo get preSelectedCustomerCodeInfo =>
      canPreSelectShipToCode ? first : CustomerCodeInfo.empty();

  ShipToInfo get preSelectedShipToInfo => canPreSelectShipToCode
      ? preSelectedCustomerCodeInfo.shipToInfos.first
      : ShipToInfo.empty();

  int get shipToCount => fold(0, (t, e) => t + e.shipToInfos.length);
}
