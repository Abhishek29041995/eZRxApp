import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_customer_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late dynamic data;
  group('Test bundleInfoDto ', () {
    setUp(() async {
      data = {
        'customerNumber': '1234',
        'customerNumberShipTo': '',
        'salesOrganisation': 'fake-salesorg',
        'division': '',
      };
    });
    test('Test fromDomain', () {
      final configsDto = SubmitOrderCustomerDto.fromDomain(
        SubmitOrderCustomerDto.fromJson(data).toDomain(),
      );

      expect(configsDto.customerNumber, '1234');
    });

    test('Test toDomain', () {
      final configsDto = SubmitOrderCustomerDto.fromJson(data).toDomain();

      expect(configsDto.customerNumber, '1234');
    });
  });
}
