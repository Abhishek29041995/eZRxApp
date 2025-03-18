import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_status_tracker_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class OrderStatusTrackerLocalDataSourceMock extends Mock
    implements OrderStatusTrackerLocalDataSource {}

class OrderStatusTrackerRemoteDataSourceMock extends Mock
    implements OrderStatusTrackerRemoteDataSource {}

void main() {
  late Config mockConfig;
  late OrderStatusTrackerRepository orderStatusTrackerRepository;
  late OrderStatusTrackerLocalDataSource orderStatusTrackerLocalDataSource;
  late OrderStatusTrackerRemoteDataSource orderStatusTrackerRemoteDataSource;

  setUpAll(() {
    mockConfig = MockConfig();
    orderStatusTrackerLocalDataSource = OrderStatusTrackerLocalDataSourceMock();
    orderStatusTrackerRemoteDataSource =
        OrderStatusTrackerRemoteDataSourceMock();
    orderStatusTrackerRepository = OrderStatusTrackerRepository(
      config: mockConfig,
      localDataSource: orderStatusTrackerLocalDataSource,
      remoteDataSource: orderStatusTrackerRemoteDataSource,
    );
  });

  group('orderStatusTrackerRepository ', () {
    test('get getOrderStatusTracker successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderStatusTrackerLocalDataSource.getOrderStatusTracker())
          .thenAnswer((invocation) async => <OrderStatusTracker>[]);

      final result = await orderStatusTrackerRepository.getOrderStatusTracker(
        invoiceNumber: StringValue('1234'),
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('get getOrderStatusTracker fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderStatusTrackerLocalDataSource.getOrderStatusTracker())
          .thenThrow((invocation) => MockException());

      final result = await orderStatusTrackerRepository.getOrderStatusTracker(
        invoiceNumber: StringValue('1234'),
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('get getOrderStatusTracker successfully remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => orderStatusTrackerRemoteDataSource.getOrderStatusTracker(
          invoiceNumber: '1234',
        ),
      ).thenAnswer((invocation) async => <OrderStatusTracker>[]);

      final result = await orderStatusTrackerRepository.getOrderStatusTracker(
        invoiceNumber: StringValue('1234'),
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('get getOrderStatusTracker fail remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => orderStatusTrackerRemoteDataSource.getOrderStatusTracker(
          invoiceNumber: '1234',
        ),
      ).thenThrow((invocation) => MockException());
      final result = await orderStatusTrackerRepository.getOrderStatusTracker(
        invoiceNumber: StringValue('1234'),
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
