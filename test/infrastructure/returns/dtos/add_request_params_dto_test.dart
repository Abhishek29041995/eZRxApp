import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/add_request_params.dart';
import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/add_request_params_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late Map<String, dynamic> data;
  const fakeUserName = 'fake-ext-sales-rep-user';
  const fakeRoleType = 'external_sales_rep';
  const fakeSpecialInstruction = 'fake-special-instruction';
  const fakeReturnReference = 'fake-return-reference';
  const fakeSoldTo = 'fake-sold_to';
  final user = User.empty().copyWith(
    username: Username(fakeUserName),
    role: Role.empty().copyWith(
      type: RoleType(fakeRoleType),
    ),
  );
  final addRequestParamsDto = AddRequestParamsDto.fromDomain(
    AddRequestParams(
      specialInstruction: fakeSpecialInstruction,
      returnReference: fakeReturnReference,
      user: user,
      soldTo: fakeSoldTo,
      invoiceDetails: <InvoiceDetails>[],
    ),
  );

  group('AddRequest Params dto test', () {
    setUp(() async {
      data = {
        'orderSource': 'MRXP',
        'purchaseNumberC': fakeReturnReference,
        'specialInstruction': fakeSpecialInstruction,
        'username': fakeUserName,
        'soldToCustomer': fakeSoldTo,
        'invoiceDetails': [],
      };
    });
    test('=> Invoice Details  fromDomain', () {
      final addRequestParams = addRequestParamsDto.toJson();

      expect(addRequestParams, data);
    });

    test('=> Invoice Details  fromJson', () {
      final addRequestParams =
          AddRequestParamsDto.fromJson(addRequestParamsDto.toJson());

      expect(addRequestParams, addRequestParamsDto);
    });
  });
}
