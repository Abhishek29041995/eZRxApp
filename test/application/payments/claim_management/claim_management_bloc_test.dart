import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/claim_management/claim_management_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_item.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_management_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_local.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/claim_management_repository.dart';
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
  late List<ClaimItem> items;

  group('ClaimManagementBloc Test', () {
    setUpAll(() async {
      WidgetsFlutterBinding.ensureInitialized();
      claimManagementRepository = ClaimManagementRepositoryMock();
      config = Config()..appFlavor = Flavor.mock;
      apiFailure = const ApiFailure.other('fake-error');
      items = await ClaimManagementLocalDataSource().getClaimSubmissions();
    });
    blocTest<ClaimManagementBloc, ClaimManagementState>(
      'ClaimManagementBloc Initial',
      build: () => ClaimManagementBloc(
        claimManagementRepository: claimManagementRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => claimManagementRepository.getClaimSubmissions(
            email: fakeClientUser.email,
          ),
        ).thenAnswer(
          (invocation) async => Left(apiFailure),
        );
      },
      act: (bloc) => bloc.add(
        ClaimManagementEvent.initialized(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
        ),
      ),
      expect: () => [
        ClaimManagementState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
        ),
        ClaimManagementState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          isLoading: true,
        ),
        ClaimManagementState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          failureOrSuccessOption: optionOf(Left(apiFailure)),
        ),
      ],
    );

    blocTest<ClaimManagementBloc, ClaimManagementState>(
      'ClaimManagementBloc fetch failure',
      build: () => ClaimManagementBloc(
        claimManagementRepository: claimManagementRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => claimManagementRepository.getClaimSubmissions(
            email: fakeClientUser.email,
          ),
        ).thenAnswer(
          (invocation) async => Left(apiFailure),
        );
      },
      seed: () => ClaimManagementState.initial().copyWith(
        salesOrganisation: fakePHSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
      ),
      act: (bloc) => bloc.add(
        ClaimManagementEvent.fetch(
          appliedFilter: ClaimManagementFilter.empty(),
        ),
      ),
      expect: () => [
        ClaimManagementState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          isLoading: true,
        ),
        ClaimManagementState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          failureOrSuccessOption: optionOf(Left(apiFailure)),
        ),
      ],
    );

    blocTest<ClaimManagementBloc, ClaimManagementState>(
      'ClaimManagementBloc fetch success',
      build: () => ClaimManagementBloc(
        claimManagementRepository: claimManagementRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => claimManagementRepository.getClaimSubmissions(
            email: fakeClientUser.email,
          ),
        ).thenAnswer(
          (invocation) async => Right(items),
        );
      },
      seed: () => ClaimManagementState.initial().copyWith(
        salesOrganisation: fakePHSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
      ),
      act: (bloc) => bloc.add(
        ClaimManagementEvent.fetch(
          appliedFilter: ClaimManagementFilter.empty(),
        ),
      ),
      expect: () => [
        ClaimManagementState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          isLoading: true,
        ),
        ClaimManagementState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          items: items,
        ),
      ],
    );

    blocTest<ClaimManagementBloc, ClaimManagementState>(
      'ClaimManagementBloc applyFilter filter by claim type and principal code',
      build: () => ClaimManagementBloc(
        claimManagementRepository: claimManagementRepository,
        config: config,
      ),
      seed: () => ClaimManagementState.initial().copyWith(
        salesOrganisation: fakePHSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        items: items,
      ),
      act: (bloc) => bloc.add(
        ClaimManagementEvent.applyFilter(
          appliedFilter: ClaimManagementFilter.empty().copyWith(
            claimTypes: [ClaimType(7)],
            searchKey: SearchKey.search('100480'),
          ),
        ),
      ),
      expect: () => [
        ClaimManagementState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          items: items,
          appliedFilter: ClaimManagementFilter.empty().copyWith(
            claimTypes: [ClaimType(7)],
            searchKey: SearchKey.search('100480'),
          ),
        ),
      ],
    );

    blocTest<ClaimManagementBloc, ClaimManagementState>(
      'ClaimManagementBloc applyFilter filter by principal name',
      build: () => ClaimManagementBloc(
        claimManagementRepository: claimManagementRepository,
        config: config,
      ),
      seed: () => ClaimManagementState.initial().copyWith(
        salesOrganisation: fakePHSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        items: items,
      ),
      act: (bloc) => bloc.add(
        ClaimManagementEvent.applyFilter(
          appliedFilter: ClaimManagementFilter.empty().copyWith(
            searchKey: SearchKey.search('abbott'),
          ),
        ),
      ),
      expect: () => [
        ClaimManagementState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          items: items,
          appliedFilter: ClaimManagementFilter.empty().copyWith(
            searchKey: SearchKey.search('abbott'),
          ),
        ),
      ],
    );

    test('isFilterEmpty test', () {
      expect(ClaimManagementState.initial().isFilterEmpty, true);
    });

    test('get filterItems test', () {
      final state = ClaimManagementState.initial().copyWith(
        items: [
          ClaimItem.empty().copyWith(
            principalName: 'fake-principal-name',
            claimType: ClaimType(1),
          ),
        ],
        appliedFilter: ClaimManagementFilter.empty().copyWith(
          claimTypes: [ClaimType(1)],
          searchKey: SearchKey.search('fake-principal-name'),
        ),
      );
      expect(state.filterItems, [
        ClaimItem.empty().copyWith(
          principalName: 'fake-principal-name',
          claimType: ClaimType(1),
        ),
      ]);
    });
  });
}
