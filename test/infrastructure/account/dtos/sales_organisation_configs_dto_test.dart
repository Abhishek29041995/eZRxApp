import 'dart:convert';

import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test SalesOrganisationConfigsDto ', () {
    setUpAll(() async {
      data = json.decode(
        await rootBundle.loadString(
          'assets/json/get_sales_org_configs/getSalesOrgConfigsResponse.json',
        ),
      );
    });
    test('Test toDomain', () {
      final configs = SalesOrganisationConfigsDto.fromJson(
        data['data']['salesOrgConfigs'][0],
      ).toDomain();
      expect(configs.currency, Currency('myr'));
      expect(configs.enableMarketPlace, true);
      expect(configs.mpMinOrderAmount, 0.0);
    });

    test('Test fromDomain', () {
      final configsDto = SalesOrganisationConfigsDto.fromDomain(
        SalesOrganisationConfigsDto.fromJson(
          data['data']['salesOrgConfigs'][0],
        ).toDomain(),
      );
      expect(configsDto.currency, 'myr');
      expect(configsDto.enableMarketPlace, true);
      expect(configsDto.mpMinOrderAmount, 0.0);
    });

    test('Test toJson', () {
      final configsDtoMap = SalesOrganisationConfigsDto.fromDomain(
        SalesOrganisationConfigsDto.fromJson(
          data['data']['salesOrgConfigs'][0],
        ).toDomain(),
      ).toJson();
      expect(configsDtoMap['currency'], 'myr');
      expect(configsDtoMap['enableMarketPlace'], true);
      expect(configsDtoMap['mpMinOrderAmount'], '0.0');
    });

    test('Test fromJson with default value', () {
      final json = data['data']['salesOrgConfigs'][0] as Map<String, dynamic>;

      expect(
        SalesOrganisationConfigsDto.fromJson(
          {...json}..remove('enableMarketPlace'),
        ).enableMarketPlace,
        false,
      );

      expect(
        SalesOrganisationConfigsDto.fromJson(
          {...json}..remove('mpMinOrderAmount'),
        ).mpMinOrderAmount,
        0.0,
      );
    });
  });
}
