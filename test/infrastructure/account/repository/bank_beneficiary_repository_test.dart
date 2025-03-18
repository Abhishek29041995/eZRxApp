import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/bank_beneficiary_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class BankBeneficiaryLocalDataSourceMock extends Mock
    implements BankBeneficiaryLocalDataSource {}

class BankBeneficiaryRemoteDataSourceMock extends Mock
    implements BankBeneficiaryRemoteDataSource {}

void main() {
  late BankBeneficiaryRepository bankBeneficiaryRepo;
  late Config mockConfig;
  late BankBeneficiaryLocalDataSource localDataSource;
  late BankBeneficiaryRemoteDataSource remoteDataSource;

  final saleOrgMock = SalesOrg('3050');

  final bankInAccountsMockList = [
    BankBeneficiary.empty(),
    BankBeneficiary.empty(),
  ];

  setUpAll(() {
    mockConfig = MockConfig();
    localDataSource = BankBeneficiaryLocalDataSourceMock();
    remoteDataSource = BankBeneficiaryRemoteDataSourceMock();

    bankBeneficiaryRepo = BankBeneficiaryRepository(
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });

  group('BankBeneficiaryRepository => getBankBeneficiariesBySaleOrg', () {
    test('successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.getBankBeneficiariesBySaleOrg())
          .thenAnswer((invocation) async => bankInAccountsMockList);

      final result = await bankBeneficiaryRepo.getBankBeneficiariesBySaleOrg(
        salesOrg: saleOrgMock,
      );
      expect(result.isRight(), true);
    });

    test('fails locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.getBankBeneficiariesBySaleOrg())
          .thenThrow(MockException());

      final result = await bankBeneficiaryRepo.getBankBeneficiariesBySaleOrg(
        salesOrg: saleOrgMock,
      );
      expect(result.isLeft(), true);
    });

    test('successfully remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => remoteDataSource.getBankBeneficiariesBySaleOrg(
          salesOrg: saleOrgMock.getOrDefaultValue(''),
        ),
      ).thenAnswer((invocation) async => bankInAccountsMockList);

      final result = await bankBeneficiaryRepo.getBankBeneficiariesBySaleOrg(
        salesOrg: saleOrgMock,
      );
      expect(result.isRight(), true);
    });

    test('fails remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => remoteDataSource.getBankBeneficiariesBySaleOrg(
          salesOrg: saleOrgMock.getOrDefaultValue(''),
        ),
      ).thenThrow(Error());

      final result = await bankBeneficiaryRepo.getBankBeneficiariesBySaleOrg(
        salesOrg: saleOrgMock,
      );
      expect(result.isLeft(), true);
    });
  });
}
