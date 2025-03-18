import 'package:ezrxmobile/domain/order/entities/submit_order.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  const fakePurchaseOrderType = 'fake-purchase-order-type';
  const fakeOrderReason = 'fake-order-reason';
  group('Test submitorderdto ', () {
    setUp(() async {
      data = {
        'username': 'test-name',
        'companyName': 'test-name',
        'PurchaseOrderType': fakePurchaseOrderType,
        'customer': <String, dynamic>{},
        'orderReason': fakeOrderReason,
        'salesRepAuthorizedDetails': <String, dynamic>{},
      };
    });
    test('Test toDomain', () {
      final configs = SubmitOrderDto.fromJson(data).toDomain();

      expect(configs.companyName.getOrCrash(), 'test-name');
      expect(configs.purchaseOrderType, fakePurchaseOrderType);
      expect(configs.orderReason, fakeOrderReason);
    });

    test('Test fromDomain', () {
      final configsDto = SubmitOrderDto.fromDomain(
        SubmitOrderDto.fromJson(data).toDomain(),
      );
      expect(configsDto.companyName, 'test-name');
      expect(configsDto.purchaseOrderType, fakePurchaseOrderType);
      expect(configsDto.orderReason, fakeOrderReason);
    });

    test('Test toJson', () {
      final configsDto = SubmitOrderDto.fromDomain(
        SubmitOrderDto.fromJson(data).toDomain(),
      ).toJson();
      expect(configsDto['companyName'], 'test-name');
      expect(configsDto['PurchaseOrderType'], fakePurchaseOrderType);
      expect(configsDto['orderReason'], fakeOrderReason);
    });

    test(
      'fromDomain should remove smallOrderFieldDetail when small order fee is 0',
      () {
        expect(
          SubmitOrderDto.fromDomain(SubmitOrder.empty()).smallOrderFeeDetail,
          null,
        );

        final smallOrderFeeDetail = SmallOrderFeeDetail.empty()
            .copyWith(mpSmallOrderFee: 10, zpSmallOrderFee: 0);
        expect(
          SubmitOrderDto.fromDomain(
            SubmitOrder.empty()
                .copyWith(smallOrderFeeDetail: smallOrderFeeDetail),
          ).smallOrderFeeDetail,
          SmallOrderFeeDetailDto.fromDomain(smallOrderFeeDetail),
        );
      },
    );
  });

  group('SmallOrderFeeDetailDto', () {
    test('Should remove mpSmallOrderFee field when value is 0', () {
      expect(
        SmallOrderFeeDetailDto.fromDomain(SmallOrderFeeDetail.empty())
            .mpSmallOrderFee,
        null,
      );

      expect(
        SmallOrderFeeDetailDto.fromDomain(
          SmallOrderFeeDetail.empty().copyWith(mpSmallOrderFee: 100.5),
        ).mpSmallOrderFee,
        '100.5',
      );
    });

    test('Should keep smallOrderFee field when value is 0', () {
      expect(
        SmallOrderFeeDetailDto.fromDomain(SmallOrderFeeDetail.empty())
            .smallOrderFee,
        '0.0',
      );

      expect(
        SmallOrderFeeDetailDto.fromDomain(
          SmallOrderFeeDetail.empty().copyWith(zpSmallOrderFee: 100.5),
        ).smallOrderFee,
        '100.5',
      );
    });
  });
}
