import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_bundle_list_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class MaterialBundleListLocalDatasourceMock extends Mock
    implements MaterialBundleListLocalDatasource {}

class MaterialBundleListRemoteDataSourceMock extends Mock
    implements MaterialBundleListRemoteDataSource {}

void main() {
  late MaterialBundleListRepository materialBundleListRepository;
  late Config mockConfig;
  late MaterialBundleListLocalDatasource materialBundleListLocalDatasource;
  late MaterialBundleListRemoteDataSource materialBundleListRemoteDataSource;

  final mockUser = User.empty();
  final mockShipToInfo = ShipToInfo.empty()
      .copyWith(building: 'fakeBuilding', shipToCustomerCode: '875433');
  final mockCustomerCodeInfo =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '123456777');
  final mockSalesOrganisation =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601'));

  setUpAll(() {
    mockConfig = MockConfig();
    materialBundleListLocalDatasource = MaterialBundleListLocalDatasourceMock();
    materialBundleListRemoteDataSource =
        MaterialBundleListRemoteDataSourceMock();
    materialBundleListRepository = MaterialBundleListRepository(
      config: mockConfig,
      materialBundleListLocalDatasource: materialBundleListLocalDatasource,
      materialBundleListRemoteDatasource: materialBundleListRemoteDataSource,
    );
  });

  group('materialBundleListRepository should - ', () {
    test('get materialBundleList successfully locally for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => materialBundleListLocalDatasource
            .getMaterialBundleListForSalesRep(),
      ).thenAnswer((invocation) async => <MaterialInfo>[]);

      final result = await materialBundleListRepository.getMaterialBundleList(
        customerCode: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        shipToCode: mockShipToInfo,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
        ),
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get materialBundleList successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => materialBundleListLocalDatasource.getMaterialBundleList())
          .thenAnswer((invocation) async => <MaterialInfo>[]);

      final result = await materialBundleListRepository.getMaterialBundleList(
        customerCode: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        shipToCode: mockShipToInfo,
        user: mockUser,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get materialBundleList fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => materialBundleListLocalDatasource.getMaterialBundleList())
          .thenThrow((invocation) async => MockException());

      final result = await materialBundleListRepository.getMaterialBundleList(
        customerCode: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        shipToCode: mockShipToInfo,
        user: mockUser,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get materialBundleList successfully remote for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(
        () =>
            materialBundleListRemoteDataSource.getMaterialBundleListForSalesRep(
          userName: 'user',
          customerCode: '123456777',
          shipToCode: '875433',
          salesOrganisation: '2601',
        ),
      ).thenAnswer((invocation) async => <MaterialInfo>[]);

      final result = await materialBundleListRepository.getMaterialBundleList(
        customerCode: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        shipToCode: mockShipToInfo,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(
            type: RoleType('external_sales_rep'),
          ),
          username: Username('user'),
        ),
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get materialBundleList successfully remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(
        () => materialBundleListRemoteDataSource.getMaterialBundleList(
          customerCode: '123456777',
          salesOrganisation: '2601',
        ),
      ).thenAnswer((invocation) async => <MaterialInfo>[]);

      final result = await materialBundleListRepository.getMaterialBundleList(
        customerCode: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        shipToCode: mockShipToInfo,
        user: mockUser,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get materialBundleList fail remote for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(
        () =>
            materialBundleListRemoteDataSource.getMaterialBundleListForSalesRep(
          userName: 'user',
          customerCode: '123456777',
          shipToCode: '875433',
          salesOrganisation: '2601',
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await materialBundleListRepository.getMaterialBundleList(
        customerCode: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        shipToCode: mockShipToInfo,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(
            type: RoleType('external_sales_rep'),
          ),
          username: Username('user'),
        ),
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get materialBundleList fail remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(
        () => materialBundleListRemoteDataSource.getMaterialBundleList(
          customerCode: '123456777',
          salesOrganisation: '2601',
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await materialBundleListRepository.getMaterialBundleList(
        customerCode: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        shipToCode: mockShipToInfo,
        user: mockUser,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
