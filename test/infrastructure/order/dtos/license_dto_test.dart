import 'package:ezrxmobile/infrastructure/order/dtos/license_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test bundleInfoDto ', () {
    setUp(() async {
      data = {
        'licenceType': '',
        'licenseDescription': 'fake-data',
        'licenseNumber': '1234',
        'validFrom': DateTime.now().toString(),
        'validTo': DateTime.now().toString(),
      };
    });

    test('Test fromDomain', () {
      final configsDto = LicenseDto.fromDomain(
        LicenseDto.fromJson(
          data,
        ).toDomain(),
      );
      expect(configsDto.licenseDescription, 'fake-data');
    });

    test('Test toJson', () {
      final configsDto = LicenseDto.fromDomain(
        LicenseDto.fromJson(
          data,
        ).toDomain(),
      ).toJson();
      expect(configsDto['licenseDescription'], 'fake-data');
    });
  });
}
