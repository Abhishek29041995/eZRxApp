import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_summary_details_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

import '../../../common_mock_data/mock_other.dart';
import 'return_summary_details_repository_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ReturnSummaryDetailsRepository repository;
  late Config configMock;
  late ReturnSummaryDetailsRequestInformationLocal
      returnSummaryDetailsRequestInformationLocal;
  late ReturnSummaryDetailsRequestInformationRemote
      returnSummaryDetailsRequestInformationRemote;
  late RequestInformation successResult;
  final errorMock = Exception('fake-error');
  const fakeId = 'mock-id';
  const fakeMarket = 'fake-market';
  late DeviceStorage deviceStorage;

  setUpAll(
    () async {
      deviceStorage = DeviceStorageMock();
      configMock = ConfigMock();
      returnSummaryDetailsRequestInformationLocal =
          ReturnSummaryLocalDataSourceMock();
      returnSummaryDetailsRequestInformationRemote =
          ReturnSummaryRemoteDataSourceMock();
      repository = ReturnSummaryDetailsRepository(
        config: configMock,
        returnRequestInformationLocalDataSource:
            returnSummaryDetailsRequestInformationLocal,
        returnRequestInformationRemoteDataSource:
            returnSummaryDetailsRequestInformationRemote,
        deviceStorage: deviceStorage,
      );
      successResult = await ReturnSummaryDetailsRequestInformationLocal()
          .getReturnRequestInformation();
    },
  );

  group(
    'Test Return Details By Request Repository',
    () {
      test(
        'Get Return Summary Details By Request Success Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => returnSummaryDetailsRequestInformationLocal
                .getReturnRequestInformation(),
          ).thenAnswer(
            (_) async => successResult,
          );
          final result = await repository.getReturnRequestById(
            returnRequestId: ReturnRequestsId(requestId: fakeId),
          );
          expect(result.isRight(), true);
          expect(
            result.getOrElse(() => RequestInformation.empty()),
            successResult,
          );
        },
      );

      test(
        'Get Return Summary Details By Request Failure Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => returnSummaryDetailsRequestInformationLocal
                .getReturnRequestInformation(),
          ).thenThrow(errorMock);
          final result = await repository.getReturnRequestById(
            returnRequestId: ReturnRequestsId(requestId: fakeId),
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Get Return Summary Details By Request Success Remote',
        () async {
          when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => returnSummaryDetailsRequestInformationRemote
                .getReturnRequestInformation(
              returnRequestId: fakeId,
              market: fakeMarket,
            ),
          ).thenAnswer(
            (_) async => successResult,
          );
          final result = await repository.getReturnRequestById(
            returnRequestId: ReturnRequestsId(requestId: fakeId),
          );
          expect(result.isRight(), true);
          expect(
            result.getOrElse(() => RequestInformation.empty()),
            successResult,
          );
        },
      );

      test(
        'Get Return Summary Details By Request Failure Remote',
        () async {
          when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => returnSummaryDetailsRequestInformationRemote
                .getReturnRequestInformation(
              returnRequestId: fakeId,
              market: fakeMarket,
            ),
          ).thenThrow(errorMock);
          final result = await repository.getReturnRequestById(
            returnRequestId: ReturnRequestsId(requestId: fakeId),
          );
          expect(result.isLeft(), true);
        },
      );
    },
  );
}
