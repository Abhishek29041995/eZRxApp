import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/tender_contract_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class TenderContractLocalDataSourceMock extends Mock
    implements TenderContractLocalDataSource {}

class TenderContractRemoteDataSourceMock extends Mock
    implements TenderContractRemoteDataSource {}

void main() {
  late TenderContractRepository tenderContractRepository;
  late Config mockConfig;
  late TenderContractLocalDataSource tenderContractLocalDataSource;
  late TenderContractRemoteDataSource tenderContractRemoteDataSource;

  final mockMaterialInfo = MaterialInfo.empty().copyWith(
    materialNumber: MaterialNumber(
      'fake-material-1',
    ),
  );

  final mockMaterialInfos = [
    mockMaterialInfo,
    MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber(
        'fake-material-2',
      ),
    ),
  ];

  setUpAll(() {
    mockConfig = MockConfig();
    tenderContractLocalDataSource = TenderContractLocalDataSourceMock();
    tenderContractRemoteDataSource = TenderContractRemoteDataSourceMock();

    tenderContractRepository = TenderContractRepository(
      config: mockConfig,
      tenderContractLocalDataSource: tenderContractLocalDataSource,
      tenderContractRemoteDataSource: tenderContractRemoteDataSource,
    );
  });

  group('tenderContractRepository should - ', () {
    test('get tenderContract successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => tenderContractLocalDataSource.getTenderContractDetails())
          .thenAnswer((invocation) async => <TenderContract>[]);

      final result = await tenderContractRepository.getTenderContractDetails(
        materialNumber: mockMaterialInfo.materialNumber,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeVNSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get tenderContract fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => tenderContractLocalDataSource.getTenderContractDetails())
          .thenThrow((invocation) async => MockException());

      final result = await tenderContractRepository.getTenderContractDetails(
        materialNumber: mockMaterialInfo.materialNumber,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeVNSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get tenderContract successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => tenderContractRemoteDataSource.getTenderContractDetails(
          materialNumber: mockMaterialInfo.materialNumber.getOrDefaultValue(''),
          salesOrg: fakeVNSalesOrganisation.salesOrg.getValue(),
          selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipTo: fakeShipToInfo.shipToCustomerCode,
        ),
      ).thenAnswer((invocation) async => <TenderContract>[]);

      final result = await tenderContractRepository.getTenderContractDetails(
        materialNumber: mockMaterialInfo.materialNumber,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeVNSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get tenderContract fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => tenderContractRemoteDataSource.getTenderContractDetails(
          materialNumber: mockMaterialInfo.materialNumber.getOrDefaultValue(''),
          salesOrg: fakeVNSalesOrganisation.salesOrg.getValue(),
          selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipTo: fakeShipToInfo.shipToCustomerCode,
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await tenderContractRepository.getTenderContractDetails(
        materialNumber: mockMaterialInfo.materialNumber,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeVNSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('get list tenderContractDetail successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => tenderContractRemoteDataSource.getTenderContractDetails(
          materialNumber:
              mockMaterialInfos.first.materialNumber.getOrDefaultValue(''),
          salesOrg: fakeVNSalesOrganisation.salesOrg.getValue(),
          selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipTo: fakeShipToInfo.shipToCustomerCode,
        ),
      ).thenAnswer((invocation) async => <TenderContract>[]);

      when(
        () => tenderContractRemoteDataSource.getTenderContractDetails(
          materialNumber:
              mockMaterialInfos.last.materialNumber.getOrDefaultValue(''),
          salesOrg: fakeVNSalesOrganisation.salesOrg.getValue(),
          selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipTo: fakeShipToInfo.shipToCustomerCode,
        ),
      ).thenAnswer((invocation) async => <TenderContract>[]);

      final result =
          await tenderContractRepository.getListTenderContractDetails(
        materialNumbers: mockMaterialInfos
            .map(
              (e) => e.materialNumber,
            )
            .toList(),
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeVNSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isRight(),
        true,
      );
    });
  });
}
