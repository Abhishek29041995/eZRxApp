import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_item.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_submission.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/claim_management_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class ClaimManagementLocalDataSourceMock extends Mock
    implements ClaimManagementLocalDataSource {}

class ClaimManagementRemoteDataSourceMock extends Mock
    implements ClaimManagementRemoteDataSource {}

class FileSystemHelperMock extends Mock implements FileSystemHelper {}

class ConfigMock extends Mock implements Config {}

void main() {
  late Config configMock;

  late ClaimManagementLocalDataSource claimManagementLocalDataSource;
  late ClaimManagementRemoteDataSource claimManagementRemoteDataSource;
  late FileSystemHelper fileSystemHelper;
  late ClaimManagementRepository claimManagementRepository;
  late List<ClaimItem> mockList;
  late List<PrincipalData> principalList;
  final email = EmailAddress('fake@gmail.com');
  const fakeError = ApiFailure.other('fake-error');
  final submitData = ClaimSubmission.empty();

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    configMock = ConfigMock();
    claimManagementLocalDataSource = ClaimManagementLocalDataSourceMock();
    claimManagementRemoteDataSource = ClaimManagementRemoteDataSourceMock();
    fileSystemHelper = FileSystemHelperMock();
    claimManagementRepository = ClaimManagementRepository(
      config: configMock,
      localDataSource: claimManagementLocalDataSource,
      remoteDataSource: claimManagementRemoteDataSource,
      fileSystemHelper: fileSystemHelper,
    );
    mockList = await ClaimManagementLocalDataSource().getClaimSubmissions();
    principalList =
        await ClaimManagementLocalDataSource().getPrincipalForSalesOrg();
  });

  group('Claim Management Repository Test', () {
    test('=> getClaimSubmissions locally success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => claimManagementLocalDataSource.getClaimSubmissions(),
      ).thenAnswer(
        (invocation) async => mockList,
      );

      final result = await claimManagementRepository.getClaimSubmissions(
        email: email,
      );
      expect(result, Right(mockList));
    });

    test('=> getClaimSubmissions locally failure', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => claimManagementLocalDataSource.getClaimSubmissions(),
      ).thenThrow(fakeError);

      final result = await claimManagementRepository.getClaimSubmissions(
        email: email,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeError)));
    });

    test('=> getClaimSubmissions remote success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => claimManagementRemoteDataSource.getClaimSubmissions(
          email: 'fake@gmail.com',
        ),
      ).thenAnswer(
        (invocation) async => mockList,
      );

      final result = await claimManagementRepository.getClaimSubmissions(
        email: email,
      );
      expect(result, Right(mockList));
    });

    test('=> getClaimSubmissions remote failure', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => claimManagementRemoteDataSource.getClaimSubmissions(
          email: 'fake@gmail.com',
        ),
      ).thenThrow(fakeError);

      final result = await claimManagementRepository.getClaimSubmissions(
        email: email,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeError)));
    });

    test('=> getPrincipalForSalesOrg locally success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => claimManagementLocalDataSource.getPrincipalForSalesOrg(),
      ).thenAnswer(
        (invocation) async => principalList,
      );

      final result = await claimManagementRepository.getPrincipalForSalesOrg(
        salesOrganisation: fakePHSalesOrganisation,
      );
      expect(result, Right(principalList));
    });

    test('=> getPrincipalForSalesOrg locally failure', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => claimManagementLocalDataSource.getPrincipalForSalesOrg(),
      ).thenThrow(fakeError);

      final result = await claimManagementRepository.getPrincipalForSalesOrg(
        salesOrganisation: fakePHSalesOrganisation,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeError)));
    });

    test('=> getPrincipalForSalesOrg remote success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => claimManagementRemoteDataSource.getPrincipalForSalesOrg(
          salesOrg: fakePHSalesOrganisation.salesOrg.getOrDefaultValue(''),
        ),
      ).thenAnswer(
        (invocation) async => principalList,
      );

      final result = await claimManagementRepository.getPrincipalForSalesOrg(
        salesOrganisation: fakePHSalesOrganisation,
      );
      expect(result, Right(principalList));
    });

    test('=> getPrincipalForSalesOrg remote failure', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => claimManagementRemoteDataSource.getPrincipalForSalesOrg(
          salesOrg: fakePHSalesOrganisation.salesOrg.getOrDefaultValue(''),
        ),
      ).thenThrow(fakeError);

      final result = await claimManagementRepository.getPrincipalForSalesOrg(
        salesOrganisation: fakePHSalesOrganisation,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeError)));
    });

    test('=> submitClaim locally success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => claimManagementLocalDataSource.submitClaim(),
      ).thenAnswer(
        (invocation) async => true,
      );

      final result = await claimManagementRepository.submitClaim(
        user: fakeClientUser,
        data: submitData,
        customerCodeInfo: fakeCustomerCodeInfo,
      );
      expect(result, const Right(true));
    });

    test('=> submitClaim locally failure', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => claimManagementLocalDataSource.submitClaim(),
      ).thenThrow(fakeError);

      final result = await claimManagementRepository.submitClaim(
        user: fakeClientUser,
        data: submitData,
        customerCodeInfo: fakeCustomerCodeInfo,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeError)));
    });

    test('=> submitClaim remote success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => claimManagementRemoteDataSource.submitClaim(
          claimAmount: submitData.claimAmount.toString(),
          claimType: submitData.claimType.data,
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          claimDetail: submitData.claimDetails,
          principalCode:
              submitData.principal.principalCode.getOrDefaultValue(''),
          principalName:
              submitData.principal.principalName.getOrDefaultValue(''),
          email: fakeClientUser.email.getOrDefaultValue(''),
          files: [],
        ),
      ).thenAnswer(
        (invocation) async => true,
      );

      final result = await claimManagementRepository.submitClaim(
        user: fakeClientUser,
        data: submitData,
        customerCodeInfo: fakeCustomerCodeInfo,
      );
      expect(result, const Right(true));
    });

    test('=> submitClaim remote failure', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => claimManagementRemoteDataSource.submitClaim(
          claimAmount: submitData.claimAmount.toString(),
          claimType: submitData.claimType.data,
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          claimDetail: submitData.claimDetails,
          principalCode:
              submitData.principal.principalCode.getOrDefaultValue(''),
          principalName:
              submitData.principal.principalName.getOrDefaultValue(''),
          email: fakeClientUser.email.getOrDefaultValue(''),
          files: [],
        ),
      ).thenThrow(fakeError);

      final result = await claimManagementRepository.submitClaim(
        user: fakeClientUser,
        data: submitData,
        customerCodeInfo: fakeCustomerCodeInfo,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeError)));
    });
  });
}
