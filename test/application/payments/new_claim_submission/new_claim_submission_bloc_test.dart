import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/new_claim_submission/new_claim_submission_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_submission.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_local.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/claim_management_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class ClaimManagementRepositoryMock extends Mock
    implements ClaimManagementRepository {}

void main() {
  late ClaimManagementRepository claimManagementRepository;
  late Config config;
  late ApiFailure apiFailure;
  late List<PrincipalData> principalList;
  late PlatformFile file;

  group('NewClaimSubmissionBloc Test', () {
    setUpAll(() async {
      WidgetsFlutterBinding.ensureInitialized();
      claimManagementRepository = ClaimManagementRepositoryMock();
      config = Config()..appFlavor = Flavor.mock;
      apiFailure = const ApiFailure.other('fake-error');
      principalList =
          await ClaimManagementLocalDataSource().getPrincipalForSalesOrg();
      file = PlatformFile(name: 'fake-name', size: 20);
    });
    blocTest<NewClaimSubmissionBloc, NewClaimSubmissionState>(
      'NewClaimSubmissionBloc Initial',
      build: () => NewClaimSubmissionBloc(
        claimManagementRepository: claimManagementRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => claimManagementRepository.getPrincipalForSalesOrg(
            salesOrganisation: fakePHSalesOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => Left(apiFailure),
        );
      },
      act: (bloc) => bloc.add(
        NewClaimSubmissionEvent.initialized(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
      ),
      expect: () => [
        NewClaimSubmissionState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        NewClaimSubmissionState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          isPrincipalLoading: true,
        ),
        NewClaimSubmissionState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          failureOrSuccessOption: optionOf(Left(apiFailure)),
        ),
      ],
    );

    blocTest<NewClaimSubmissionBloc, NewClaimSubmissionState>(
      'NewClaimSubmissionBloc fetchPrincipalList success',
      build: () => NewClaimSubmissionBloc(
        claimManagementRepository: claimManagementRepository,
        config: config,
      ),
      seed: () => NewClaimSubmissionState.initial().copyWith(
        salesOrganisation: fakePHSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
      ),
      setUp: () {
        when(
          () => claimManagementRepository.getPrincipalForSalesOrg(
            salesOrganisation: fakePHSalesOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => Right(principalList),
        );
      },
      act: (bloc) => bloc.add(
        const NewClaimSubmissionEvent.fetchPrincipalList(),
      ),
      expect: () => [
        NewClaimSubmissionState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          isPrincipalLoading: true,
        ),
        NewClaimSubmissionState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          principalList: List<PrincipalData>.from(
            principalList,
          )..sort(
              (a, b) => a.principalName
                  .getOrDefaultValue('')
                  .compareTo(b.principalName.getOrDefaultValue('')),
            ),
        ),
      ],
    );

    blocTest<NewClaimSubmissionBloc, NewClaimSubmissionState>(
      'NewClaimSubmissionBloc onSelectPrincipal',
      build: () => NewClaimSubmissionBloc(
        claimManagementRepository: claimManagementRepository,
        config: config,
      ),
      act: (bloc) => bloc.add(
        NewClaimSubmissionEvent.onSelectPrincipal(
          principal: principalList.first,
        ),
      ),
      expect: () => [
        NewClaimSubmissionState.initial().copyWith(
          claimSubmission:
              ClaimSubmission.empty().copyWith(principal: principalList.first),
        ),
      ],
    );

    blocTest<NewClaimSubmissionBloc, NewClaimSubmissionState>(
      'NewClaimSubmissionBloc onSelectClaimType',
      build: () => NewClaimSubmissionBloc(
        claimManagementRepository: claimManagementRepository,
        config: config,
      ),
      act: (bloc) => bloc.add(
        NewClaimSubmissionEvent.onSelectClaimType(
          claimType: ClaimType(1),
        ),
      ),
      expect: () => [
        NewClaimSubmissionState.initial().copyWith(
          claimSubmission:
              ClaimSubmission.empty().copyWith(claimType: ClaimType(1)),
        ),
      ],
    );

    blocTest<NewClaimSubmissionBloc, NewClaimSubmissionState>(
      'NewClaimSubmissionBloc onClaimAmountChange',
      build: () => NewClaimSubmissionBloc(
        claimManagementRepository: claimManagementRepository,
        config: config,
      ),
      act: (bloc) => bloc.add(
        const NewClaimSubmissionEvent.onClaimAmountChange(
          amount: 10,
        ),
      ),
      expect: () => [
        NewClaimSubmissionState.initial().copyWith(
          claimSubmission: ClaimSubmission.empty().copyWith(claimAmount: 10),
        ),
      ],
    );

    blocTest<NewClaimSubmissionBloc, NewClaimSubmissionState>(
      'NewClaimSubmissionBloc onClaimDetailsChange',
      build: () => NewClaimSubmissionBloc(
        claimManagementRepository: claimManagementRepository,
        config: config,
      ),
      act: (bloc) => bloc.add(
        const NewClaimSubmissionEvent.onClaimDetailsChange(
          claimDetails: 'fake-detail',
        ),
      ),
      expect: () => [
        NewClaimSubmissionState.initial().copyWith(
          claimSubmission:
              ClaimSubmission.empty().copyWith(claimDetails: 'fake-detail'),
        ),
      ],
    );

    blocTest<NewClaimSubmissionBloc, NewClaimSubmissionState>(
      'NewClaimSubmissionBloc addPoDocument',
      build: () => NewClaimSubmissionBloc(
        claimManagementRepository: claimManagementRepository,
        config: config,
      ),
      act: (bloc) => bloc.add(
        NewClaimSubmissionEvent.addPoDocument(
          poDocuments: [file],
        ),
      ),
      expect: () => [
        NewClaimSubmissionState.initial().copyWith(
          claimSubmission: ClaimSubmission.empty().copyWith(documents: [file]),
        ),
      ],
    );

    blocTest<NewClaimSubmissionBloc, NewClaimSubmissionState>(
      'NewClaimSubmissionBloc removePoDocument',
      build: () => NewClaimSubmissionBloc(
        claimManagementRepository: claimManagementRepository,
        config: config,
      ),
      seed: () => NewClaimSubmissionState.initial().copyWith(
        claimSubmission: ClaimSubmission.empty().copyWith(documents: [file]),
      ),
      act: (bloc) => bloc.add(
        NewClaimSubmissionEvent.removePoDocument(
          poDocument: file,
        ),
      ),
      expect: () => [
        NewClaimSubmissionState.initial(),
      ],
    );

    blocTest<NewClaimSubmissionBloc, NewClaimSubmissionState>(
      'NewClaimSubmissionBloc submit failure',
      build: () => NewClaimSubmissionBloc(
        claimManagementRepository: claimManagementRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => claimManagementRepository.submitClaim(
            user: fakeClientUser,
            data: ClaimSubmission.empty(),
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ).thenAnswer(
          (invocation) async => Left(apiFailure),
        );
      },
      act: (bloc) => bloc.add(
        NewClaimSubmissionEvent.submit(
          user: fakeClientUser,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
      ),
      expect: () => [
        NewClaimSubmissionState.initial().copyWith(
          isLoading: true,
        ),
        NewClaimSubmissionState.initial().copyWith(
          failureOrSuccessOption: optionOf(Left(apiFailure)),
        ),
      ],
    );

    blocTest<NewClaimSubmissionBloc, NewClaimSubmissionState>(
      'NewClaimSubmissionBloc submit success',
      build: () => NewClaimSubmissionBloc(
        claimManagementRepository: claimManagementRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => claimManagementRepository.submitClaim(
            user: fakeClientUser,
            data: ClaimSubmission.empty(),
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ).thenAnswer(
          (invocation) async => const Right(true),
        );
      },
      act: (bloc) => bloc.add(
        NewClaimSubmissionEvent.submit(
          user: fakeClientUser,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
      ),
      expect: () => [
        NewClaimSubmissionState.initial().copyWith(
          isLoading: true,
        ),
        NewClaimSubmissionState.initial().copyWith(
          failureOrSuccessOption: optionOf(const Right(true)),
        ),
      ],
    );

    test('formValidated is false test', () {
      expect(NewClaimSubmissionState.initial().formValidated, false);
    });

    test('formValidated is true test', () {
      expect(
        NewClaimSubmissionState.initial()
            .copyWith(
              claimSubmission: ClaimSubmission.empty().copyWith(
                principal: principalList.first,
                claimType: ClaimType(1),
                claimAmount: 10,
                claimDetails: 'fake-claim-details',
                documents: List.generate(5, (index) => file),
              ),
            )
            .formValidated,
        true,
      );
    });
  });
}
