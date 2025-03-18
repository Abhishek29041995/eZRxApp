import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/ez_point_token.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ez_point_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ez_point_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/ez_point_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';

class ConfigMock extends Mock implements Config {}

class EZPointLocalDataSourceMock extends Mock
    implements EZPointLocalDataSource {}

class EZPointRemoteDataSourceMock extends Mock
    implements EZPointRemoteDataSource {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late EZPointRepository repository;
  late Config configMock;
  late EZPointLocalDataSource localDataSourceMock;
  late EZPointRemoteDataSource remoteDataSourceMock;
  late EZPointToken eZPointTokenMock;
  final fakeError = Exception('fake-error');

  setUpAll(
    () async {
      localDataSourceMock = EZPointLocalDataSourceMock();
      remoteDataSourceMock = EZPointRemoteDataSourceMock();
      eZPointTokenMock = await EZPointLocalDataSource().getEZPointToken();
      configMock = ConfigMock();
      repository = EZPointRepository(
        config: configMock,
        localDataSource: localDataSourceMock,
        remoteDataSource: remoteDataSourceMock,
      );
    },
  );

  group(
    'EZPoint Repository',
    () {
      test(
        'Get EZPoint Token Success Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.getEZPointToken()).thenAnswer(
            (invocation) async => eZPointTokenMock,
          );
          final result = await repository.getEZPointToken(
            customerCodeInfo: fakeCustomerCodeInfo,
          );
          expect(
            result.isRight(),
            true,
          );
          expect(
            result.getOrElse(
              () => EZPointToken.empty(),
            ),
            eZPointTokenMock,
          );
        },
      );

      test(
        'Get EZPoint Token Failure Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.getEZPointToken(),
          ).thenThrow(
            fakeError,
          );
          final result = await repository.getEZPointToken(
            customerCodeInfo: fakeCustomerCodeInfo,
          );
          expect(
            result.isLeft(),
            true,
          );
        },
      );

      test(
        'Get EZPoint Token Success Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.getEZPointToken(
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            ),
          ).thenAnswer(
            (invocation) async => eZPointTokenMock,
          );
          final result = await repository.getEZPointToken(
            customerCodeInfo: fakeCustomerCodeInfo,
          );
          expect(
            result.isRight(),
            true,
          );
          expect(
            result.getOrElse(
              () => EZPointToken.empty(),
            ),
            eZPointTokenMock,
          );
        },
      );

      test(
        'Get EZPoint Token Failure Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.getEZPointToken(
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            ),
          ).thenThrow(fakeError);
          final result = await repository.getEZPointToken(
            customerCodeInfo: fakeCustomerCodeInfo,
          );
          expect(
            result.isLeft(),
            true,
          );
        },
      );
    },
  );
}
