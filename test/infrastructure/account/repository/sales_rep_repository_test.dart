import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/sales_rep_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SalesRepLocalDataSourceMock extends Mock
    implements SalesRepLocalDataSource {}

class SalesRepRemoteDataSourceMock extends Mock
    implements SalesRepRemoteDataSource {}

class ConfigMock extends Mock implements Config {}

void main() {
  late Config configMock;
  late SalesRepRepository repository;
  late SalesRepLocalDataSource salesRepLocalDataSourceMock;
  late SalesRepRemoteDataSource salesRepRemoteDataSourceMock;
  late User mockUser;
  late String mockUserName;

  setUpAll(() {
    configMock = ConfigMock();
    salesRepLocalDataSourceMock = SalesRepLocalDataSourceMock();
    salesRepRemoteDataSourceMock = SalesRepRemoteDataSourceMock();

    mockUserName = 'username';
    mockUser = User.empty().copyWith(
      username: Username(mockUserName),
    );

    repository = SalesRepRepository(
      config: configMock,
      localDataSource: salesRepLocalDataSourceMock,
      remoteDataSource: salesRepRemoteDataSourceMock,
    );
  });

  group('Sales Rep Repository Test', () {
    test('Get Sales Rep Info from local data source successfully test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(() => salesRepLocalDataSourceMock.getSalesRepInfo())
          .thenAnswer((invocation) async => SalesRepresentativeInfo.empty());

      final result = await repository.getSalesRepInfo(user: mockUser);

      expect(result.isRight(), true);
    });

    test('Get Sales Rep Info from local data source failed test', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(() => salesRepLocalDataSourceMock.getSalesRepInfo())
          .thenThrow((invocation) async => MockException());

      final result = await repository.getSalesRepInfo(user: mockUser);

      expect(result.isLeft(), true);
    });

    test('Get Sales Rep Info from remote data source successfully test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => salesRepRemoteDataSourceMock.getSalesRepInfo(
          userName: mockUserName,
        ),
      ).thenAnswer((invocation) async => SalesRepresentativeInfo.empty());

      final result = await repository.getSalesRepInfo(user: mockUser);

      expect(result.isRight(), true);
    });

    test('Get Sales Rep Info from remote data source failed test', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => salesRepRemoteDataSourceMock.getSalesRepInfo(
          userName: mockUserName,
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await repository.getSalesRepInfo(user: mockUser);

      expect(result.isLeft(), true);
    });
  });
}
