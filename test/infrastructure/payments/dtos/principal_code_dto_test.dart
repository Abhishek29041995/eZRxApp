import 'dart:convert';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/principal_code_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('=> Principal Code Dto ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle.loadString(
          'assets/json/principal_sales_org/principalForSalesOrgResponse.json',
        ),
      );
    });

    test('=> PrincipalCodeDto fromJson and toDomain', () {
      final principalCode = PrincipalCodeDto.fromJson(
        data['data']['principalForSalesOrg']['principals'][0],
      ).toDomain();

      expect(
        principalCode.principalCode,
        PrincipalCode('0000100462'),
      );
      expect(
        principalCode.principalName,
        PrincipalName('B. BRAUN MEDICAL INC.'),
      );
    });
  });
}
