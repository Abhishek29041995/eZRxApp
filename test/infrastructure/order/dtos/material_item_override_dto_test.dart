import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_override_dto.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_mm_sales_org_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late dynamic data;
  group('Test bundleInfoDto ', () {
    setUp(() async {
      data = {
        'percentageOverride': [],
        'reference': 'fake-ref',
        'valueOverride': [],
      };
    });
    test('Test toDomain', () {
      final configs = MaterialItemOverrideDto.fromJson(data).toDomain();

      expect(configs.reference, 'fake-ref');
    });

    test('Test fromDomain', () {
      final configsDto = MaterialItemOverrideDto.fromDomain(
        MaterialItemOverrideDto.fromJson(
          data,
        ).toDomain(),
      );
      expect(configsDto.reference, '');
    });

    test('Test toJson', () {
      final configsDtoMap = MaterialItemOverrideDto.fromDomain(
        MaterialItemOverrideDto.fromJson(
          data,
        ).toDomain(),
      ).toJson();
      expect(configsDtoMap['reference'], '');
    });

    test('Test fromPrice', () {
      final configsDtoMap = MaterialItemOverrideDto.fromPriceAggregate(
        PriceAggregate.empty().copyWith(
          price: Price.empty().copyWith(
            isPriceOverride: true,
            lastPrice: MaterialPrice(2),
            finalPrice: MaterialPrice(1),
            zdp8Override: Zdp8OverrideValue(1),
          ),
          salesOrgConfig: fakeMMSalesOrgConfigs,
        ),
      );
      expect(configsDtoMap.valueOverride[0].price, 1);
    });

    test('Test valueOverride toDomain', () {
      const data = {'code': '', 'price': 1, 'currency': 'fake-currency'};
      final configs = ValueOverrideDto.fromJson(data).toDomain();
      expect(configs.currency.getOrCrash(), 'fake-currency');
    });

    test('Test valueOverride toJson', () {
      const data = {'code': '', 'price': 1, 'currency': 'FAKE-CURRENCY'};
      final configs = ValueOverrideDto.fromDomain(
        ValueOverrideDto.fromJson(data).toDomain(),
      ).toJson();
      expect(configs['currency'], 'FAKE-CURRENCY');
    });

    test('Test percentageOverride toDomain', () {
      const data = {'code': '', 'percentage': 10.0};
      final configs = PercentageOverrideDto.fromJson(data).toDomain();
      expect(configs.percentage, 10.0);
    });

    test('Test percentageOverride toJson', () {
      const data = {'code': '', 'percentage': 10.0};
      final configs = PercentageOverrideDto.fromDomain(
        PercentageOverrideDto.fromJson(data).toDomain(),
      ).toJson();
      expect(configs['percentage'], 10.0);
    });

    test('Test valueOverrideTojson', () {
      final configs = valueOverrideTojson([
        const ValueOverrideDto(code: '', price: 1, currency: 'fake-currency'),
      ]);
      expect(configs, [
        {'code': '', 'price': 1, 'currency': 'fake-currency'},
      ]);
    });

    test('Test percentageoverridetoJson', () {
      final configs = percentageOverrideTojson(
        [const PercentageOverrideDto(code: '', percentage: 10)],
      );
      expect(configs, [
        {'code': '', 'percentage': 10},
      ]);
    });
  });
}
