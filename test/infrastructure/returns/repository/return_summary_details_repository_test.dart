import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_summary_details_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_other.dart';

class ReturnSummaryLocalDataSourceMock extends Mock
    implements ReturnSummaryDetailsRequestInformationLocal {}

class ReturnSummaryRemoteDataSourceMock extends Mock
    implements ReturnSummaryDetailsRequestInformationRemote {}

void main() {
  late ReturnSummaryDetailsRequestInformationLocal
      returnSummaryDetailsRequestInformationLocal;
  late ReturnSummaryDetailsRequestInformationRemote
      returnSummaryDetailsRequestInformationRemote;
  late Config config;
  late ReturnSummaryDetailsRepository returnSummaryDetailsRepository;
  late DeviceStorage deviceStorage;

  const fakeMarket = 'fake-market';
  final fakeReturnItem = ReturnItem.empty().copyWith(
    requestId: 'fake-request-id',
    invoiceID: 'fake-invoice-id',
    lineNumber: 'fake-line-number',
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    returnSummaryDetailsRequestInformationLocal =
        ReturnSummaryLocalDataSourceMock();
    returnSummaryDetailsRequestInformationRemote =
        ReturnSummaryRemoteDataSourceMock();
    deviceStorage = DeviceStorageMock();
    config = ConfigMock();

    returnSummaryDetailsRepository = ReturnSummaryDetailsRepository(
      config: config,
      returnRequestInformationLocalDataSource:
          returnSummaryDetailsRequestInformationLocal,
      returnRequestInformationRemoteDataSource:
          returnSummaryDetailsRequestInformationRemote,
      deviceStorage: deviceStorage,
    );
  });

  group('Return Summary Details Repository Test', () {
    test('=> getReturnInformation locally success', () async {
      when(() => config.appFlavor).thenReturn(Flavor.mock);
      when(
        () => returnSummaryDetailsRequestInformationLocal
            .getReturnRequestInformation(),
      ).thenAnswer(
        (invocation) async => RequestInformation.empty(),
      );

      final result = await returnSummaryDetailsRepository.getReturnInformation(
        returnItem: fakeReturnItem,
      );
      expect(result.isRight(), true);
    });

    test('=> getReturnInformation locally failed', () async {
      when(() => config.appFlavor).thenReturn(Flavor.mock);
      when(
        () => returnSummaryDetailsRequestInformationLocal
            .getReturnRequestInformation(),
      ).thenThrow((invocation) async => MockException());

      final result = await returnSummaryDetailsRepository.getReturnInformation(
        returnItem: fakeReturnItem,
      );
      expect(result.isLeft(), true);
    });

    test('=> getReturnInformation remote success', () async {
      when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
      when(() => config.appFlavor).thenReturn(Flavor.uat);
      when(
        () => returnSummaryDetailsRequestInformationRemote
            .getReturnRequestInformation(
          returnRequestId: fakeReturnItem.requestId,
          invoiceId: fakeReturnItem.invoiceID,
          lineNumber: fakeReturnItem.lineNumber,
          market: fakeMarket,
        ),
      ).thenAnswer(
        (invocation) async => RequestInformation.empty(),
      );

      final result = await returnSummaryDetailsRepository.getReturnInformation(
        returnItem: fakeReturnItem,
      );
      expect(result.isRight(), true);
    });

    test('=> getReturnInformation remote failure', () async {
      when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
      when(() => config.appFlavor).thenReturn(Flavor.uat);
      when(
        () => returnSummaryDetailsRequestInformationRemote
            .getReturnRequestInformation(
          returnRequestId: fakeReturnItem.requestId,
          invoiceId: fakeReturnItem.invoiceID,
          lineNumber: fakeReturnItem.lineNumber,
          market: fakeMarket,
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await returnSummaryDetailsRepository.getReturnInformation(
        returnItem: fakeReturnItem,
      );
      expect(result.isLeft(), true);
    });
  });
}
