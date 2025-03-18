import 'package:ezrxmobile/infrastructure/order/dtos/material_item_override_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_material_info_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const fakeSaleDistrict = 'fake-sale-district';
  late dynamic data;
  group('Test bundleInfoDto ', () {
    setUp(() async {
      data = {
        'materialNumber': '1234',
        'qty': 20,
        'bonuses': [
          {
            'MaterialNumber': '1234',
            'freeQuantity': 20,
            'comment': '',
            'MaterialDescription': '',
            'expiryDate': '1234',
            'inStock': 'yes',
            'remainingQty': 12,
            'bonusOverrideFlag': false,
            'additionalBonusFlag': false,
          }
        ],
        'override': <String, dynamic>{},
        'contract': <String, dynamic>{},
        'salesDistrict': fakeSaleDistrict,
      };
    });
    test('Test fromDomain', () {
      final configsDto = SubmitMaterialInfoDto.fromDomain(
        SubmitMaterialInfoDto.fromJson(data).toDomain(),
      );

      expect(configsDto.materialNumber, '1234');
      expect(configsDto.salesDistrict, fakeSaleDistrict);
    });

    test('Test toDomain', () {
      final configsDto = SubmitMaterialInfoDto.fromJson(data).toDomain();

      expect(configsDto.materialNumber.getOrCrash(), '1234');
      expect(configsDto.salesDistrict, fakeSaleDistrict);
    });

    test('Test toJson', () {
      final configsDto = SubmitMaterialInfoDto.fromDomain(
        SubmitMaterialInfoDto.fromJson(data).toDomain(),
      ).toJson();

      expect(configsDto['qty'], 20);
      expect(configsDto['salesDistrict'], fakeSaleDistrict);
    });

    test('Test overridetojson', () {
      const configDto = MaterialItemOverrideDto(
        reference: '',
        valueOverride: [
          ValueOverrideDto(code: '', price: 10, currency: 'fake-currency'),
        ],
        percentageOverride: [],
      );
      final config = overrideTojson(configDto);

      expect(config, {
        'reference': '',
        'valueOverride': [
          {'code': '', 'price': 10, 'currency': 'fake-currency'},
        ],
      });
    });
  });
}
