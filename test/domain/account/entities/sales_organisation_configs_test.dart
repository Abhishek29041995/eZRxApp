import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/utils/date_time_utils.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';

void main() {
  late SalesOrganisationConfigs configs;

  group('sales organisation configs test', () {
    setUpAll(() {
      configs = fakeMYSalesOrgConfigs;
    });
    test('deliveryStartDate test', () {
      final currentTime = DateTime.now();
      if (currentTime.hour < configs.salesOrg.cutOffTime &&
          currentTime.weekday <= DateTime.friday) {
        expect(
          configs.deliveryStartDate,
          DateTimeUtils.getNearestWorkingDate(currentTime),
        );
        return;
      }

      if (currentTime.hour >= configs.salesOrg.cutOffTime &&
          currentTime.weekday < DateTime.friday) {
        expect(
          configs.deliveryStartDate,
          DateTimeUtils.getNearestWorkingDate(
            currentTime.add(
              const Duration(days: 1),
            ),
          ),
        );
        return;
      }

      expect(
        configs.deliveryStartDate,
        DateTimeUtils.getNearestWorkingDate(currentTime)
            .add(const Duration(days: 1)),
      );
    });

    test('deliveryEndDate test', () {
      expect(
        configs.deliveryEndDate,
        DateTimeUtils.addWorkingDay(
          configs.deliveryStartDate,
          configs.futureDeliveryDay.intValue - 1,
        ),
      );
    });

    test('Show Gov Price For TW And enableListPrice = true Test', () {
      configs = fakeTWSalesOrgConfigs;
      expect(
        configs.showGovtListPrice,
        true,
      );
    });

    test('Hide Gov Price If enableListPrice = false Test', () {
      configs = fakeMYSalesOrgConfigs;
      expect(
        configs.showGovtListPrice,
        false,
      );
    });

    test('Hide Gov Price If Market Is Not TW Test', () {
      configs = fakeSGSalesOrgConfigs;
      expect(
        configs.showGovtListPrice,
        false,
      );
    });

    test('Display Stock Info When expiryDateDisplay is True Test', () {
      configs = fakeMYSalesOrgConfigs;
      expect(
        configs.displayStockInfo,
        true,
      );
    });

    test('Display Stock Info When enableBatchNumber is True Test', () {
      configs = fakeMYSalesOrgConfigs.copyWith(
        enableBatchNumber: true,
      );
      expect(
        configs.displayStockInfo,
        true,
      );
    });

    test(
        'Hide Stock Info When both expiryDateDisplay and enableBatchNumber is false Test',
        () {
      configs = fakeKHSalesOrgConfigs;
      expect(
        configs.displayStockInfo,
        false,
      );
    });

    test('zpMinOrderAmount when enableSmallOrderFee is enabled Test', () {
      configs = fakeMYSalesOrgConfigsWithSmallOrderFee;
      expect(
        configs.zpMinOrderAmount,
        configs.sapMinOrderAmount,
      );
    });

    test('zpMinOrderAmount when enableSmallOrderFee is disabled Test', () {
      configs = fakeMYSalesOrgConfigsWithSmallOrderFee;
      expect(
        configs.zpMinOrderAmount,
        configs.minOrderAmount,
      );
    });
  });
}
