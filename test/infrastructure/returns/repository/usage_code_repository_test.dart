import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/usage_code_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class MockUsageCodeLocalDataSource extends Mock
    implements UsageCodeLocalDataSource {}

class MockUsageCodeRemoteDataSource extends Mock
    implements UsageCodeRemoteDataSource {}

void main() {
  late UsageRepository usageRepository;
  late Config mockConfig;
  final mockSalesOrg = SalesOrg('2601');
  late UsageCodeLocalDataSource usageCodeLocalDataSource;
  late UsageCodeRemoteDataSource usageCodeRemoteDataSource;
  final usageCode = [
    const Usage(
      usageCode: 'C13',
      usageDescription: 'Wrong Bill-To',
    ),
  ];

  setUpAll(() {
    mockConfig = MockConfig();
    usageCodeLocalDataSource = MockUsageCodeLocalDataSource();
    usageCodeRemoteDataSource = MockUsageCodeRemoteDataSource();
    usageRepository = UsageRepository(
      config: mockConfig,
      usageLocalDataSource: usageCodeLocalDataSource,
      usageRemoteDataSource: usageCodeRemoteDataSource,
    );
  });

  group('UsageRepository Test', () {
    test('=> getUsageCode Locally SUCCESS', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => usageCodeLocalDataSource.getUsages())
          .thenAnswer((invocation) async => usageCode);

      final result = await usageRepository.getUsages(
        salesOrg: mockSalesOrg,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('=> getUsageCode Locally FAILED', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => usageCodeLocalDataSource.getUsages())
          .thenThrow(const ApiFailure.serverTimeout());

      final result = await usageRepository.getUsages(
        salesOrg: mockSalesOrg,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('=> getUsageCode Remote SUCCESS', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => usageCodeRemoteDataSource.getUsages(
          salesOrg: mockSalesOrg.getOrCrash(),
        ),
      ).thenAnswer((invocation) async => usageCode);

      final result = await usageRepository.getUsages(
        salesOrg: mockSalesOrg,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('=> getUsageCode Remote FAILED', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => usageCodeRemoteDataSource.getUsages(
          salesOrg: mockSalesOrg.getOrDefaultValue(''),
        ),
      ).thenThrow(const ApiFailure.serverTimeout());

      final result = await usageRepository.getUsages(
        salesOrg: mockSalesOrg,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
