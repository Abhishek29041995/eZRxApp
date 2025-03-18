import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_name.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

// Customer code info
const _fakeBuilding = 'fakeBuilding';
const _shipToCustomerCode = '123';
const _shipToCustomerCode2 = '456';
const _fakeBillToCustomerCode = 'customer1234';
const _fakeCustomerCodeSoldTo = 'customer123';
final fakeShipToInfo = ShipToInfo.empty().copyWith(
  building: _fakeBuilding,
  shipToCustomerCode: _shipToCustomerCode,
  shipToName: _fakeShipToName,
);

final fakeShipToInfo2 = ShipToInfo.empty().copyWith(
  building: _fakeBuilding,
  shipToCustomerCode: _shipToCustomerCode2,
  shipToName: _fakeShipToName,
);

final fakeMarketPlaceCustomerCode =
    fakeCustomerCodeInfo.copyWith(isMarketPlace: true);

final _fakeBillToInfo =
    BillToInfo.empty().copyWith(billToCustomerCode: _fakeBillToCustomerCode);

final _fakeShipToName = ShipToName.empty().copyWith(
  name1: 'fake-name1',
  name2: 'fake-name2',
  name3: 'fake-name3',
  name4: 'fake-name4',
);

final fakeCustomerCodeInfo = CustomerCodeInfo.empty().copyWith(
  shipToInfos: [fakeShipToInfo],
  billToInfos: [_fakeBillToInfo],
  customerCodeSoldTo: _fakeCustomerCodeSoldTo,
);
final fakeCustomerCodeInfoForCovid = CustomerCodeInfo.empty().copyWith(
  shipToInfos: [fakeShipToInfo],
  billToInfos: [_fakeBillToInfo],
  customerCodeSoldTo: _fakeCustomerCodeSoldTo,
  customerGrp4: CustomerGrp4('VR'),
);

final fakeEmptyCustomerCodeInfo = CustomerCodeInfo.empty();
final fakeCustomerCodeInfoWithCustomerGrp4 = CustomerCodeInfo.empty().copyWith(
  customerAttr7: CustomerAttr7('ZEV'),
  customerGrp4: CustomerGrp4('VR'),
);
final fakeBlockedCustomerCodeInfo = CustomerCodeInfo.empty()
    .copyWith(status: Status('z1 - suspended customer'));

final fakeBlockedShipToInfo =
    ShipToInfo.empty().copyWith(status: Status('z1 - suspended customer'));

final fakeEDICustomerCodeInfo =
    CustomerCodeInfo.empty().copyWith(status: Status('EDI'));
final fakeCustomerCodeInfoWithPaymetTerm = CustomerCodeInfo.empty().copyWith(
  paymentTerm: PaymentTermCode('fake_payment-term_code'),
  paymentTermDescription:
      PaymentTermDescription('fake_payment-term_description'),
);
