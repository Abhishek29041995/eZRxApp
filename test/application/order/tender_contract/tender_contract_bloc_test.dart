import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/tender_contract_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTenderContractRepository extends Mock
    implements TenderContractRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late TenderContractRepository tenderContractMockRepository;
  final salesOrg3050 = SalesOrg('3050');
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockShipToInfo = ShipToInfo.empty();
  final mockSalesOrganisation = SalesOrganisation(
    salesOrg: salesOrg3050,
    customerInfos: <SalesOrgCustomerInfo>[],
  );
  final mockMaterialInfo = MaterialInfo.empty();
  final mockTenderContract = TenderContract.empty();
  late final List<TenderContract> mockTenderContractList;
  final materialState = TenderContractState.initial();
  setUpAll(() async {
    tenderContractMockRepository = MockTenderContractRepository();
    mockTenderContractList =
        await TenderContractLocalDataSource().getTenderContractDetails();
  });

  group('Tender Contract Bloc', () {
    blocTest<TenderContractBloc, TenderContractState>(
      'Tender Contract Initialize',
      build: () => TenderContractBloc(
        tenderContractRepository: tenderContractMockRepository,
      ),
      act: (TenderContractBloc bloc) =>
          bloc.add(const TenderContractEvent.initialized()),
      expect: () => [
        TenderContractState.initial(),
      ],
    );

    blocTest(
      'Fetch tender contracts success',
      build: () => TenderContractBloc(
        tenderContractRepository: tenderContractMockRepository,
      ),
      setUp: () {
        when(
          () => tenderContractMockRepository.getTenderContractDetails(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            materialNumber: mockMaterialInfo.materialNumber,
          ),
        ).thenAnswer(
          (invocation) async => Right(mockTenderContractList),
        );
      },
      act: (TenderContractBloc bloc) {
        bloc.add(
          TenderContractEvent.fetch(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            materialInfo: mockMaterialInfo,
            defaultSelectedTenderContract: TenderContract.empty(),
          ),
        );
      },
      expect: () => [
        materialState.copyWith(
          isFetching: true,
          tenderContractList: [],
          apiFailureOrSuccessOption: none(),
        ),
        materialState.copyWith(
          isFetching: false,
          tenderContractList: mockTenderContractList.withNoContractItem,
          apiFailureOrSuccessOption: optionOf(Right(mockTenderContractList)),
        ),
        materialState.copyWith(
          tenderContractList: mockTenderContractList.withNoContractItem,
          selectedTenderContract: TenderContract.noContract(),
          apiFailureOrSuccessOption: optionOf(Right(mockTenderContractList)),
        ),
      ],
    );

    blocTest(
      'Fetch tender contracts success with defaultSelectedTenderContract',
      build: () => TenderContractBloc(
        tenderContractRepository: tenderContractMockRepository,
      ),
      setUp: () {
        when(
          () => tenderContractMockRepository.getTenderContractDetails(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            materialNumber: mockMaterialInfo.materialNumber,
          ),
        ).thenAnswer(
          (invocation) async => Right(mockTenderContractList),
        );
      },
      act: (TenderContractBloc bloc) {
        bloc.add(
          TenderContractEvent.fetch(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            materialInfo: mockMaterialInfo,
            defaultSelectedTenderContract: mockTenderContractList.first,
          ),
        );
      },
      expect: () => [
        materialState.copyWith(
          isFetching: true,
          tenderContractList: [],
          apiFailureOrSuccessOption: none(),
        ),
        materialState.copyWith(
          isFetching: false,
          tenderContractList: mockTenderContractList.withNoContractItem,
          apiFailureOrSuccessOption: optionOf(Right(mockTenderContractList)),
        ),
        materialState.copyWith(
          tenderContractList: mockTenderContractList.withNoContractItem,
          selectedTenderContract: mockTenderContractList.first,
          apiFailureOrSuccessOption: optionOf(Right(mockTenderContractList)),
        ),
      ],
    );

    blocTest(
      'Fetch tender contracts fail',
      build: () => TenderContractBloc(
        tenderContractRepository: tenderContractMockRepository,
      ),
      setUp: () {
        when(
          () => tenderContractMockRepository.getTenderContractDetails(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            materialNumber: mockMaterialInfo.materialNumber,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (TenderContractBloc bloc) {
        bloc.add(
          TenderContractEvent.fetch(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            materialInfo: mockMaterialInfo,
            defaultSelectedTenderContract: TenderContract.empty(),
          ),
        );
      },
      expect: () => [
        materialState.copyWith(
          isFetching: true,
          tenderContractList: [],
          apiFailureOrSuccessOption: none(),
        ),
        materialState.copyWith(
          isFetching: false,
          tenderContractList: [],
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Tender contract selected',
      build: () => TenderContractBloc(
        tenderContractRepository: tenderContractMockRepository,
      ),
      setUp: () {
        when(
          () => tenderContractMockRepository.getTenderContractDetails(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            materialNumber: mockMaterialInfo.materialNumber,
          ),
        ).thenAnswer(
          (invocation) async => Right(mockTenderContractList),
        );
      },
      act: (TenderContractBloc bloc) {
        bloc.add(
          TenderContractEvent.selected(
            tenderContract: mockTenderContract,
          ),
        );
      },
      expect: () => [
        TenderContractState.initial().copyWith(
          isFetching: false,
          selectedTenderContract: mockTenderContract,
        ),
      ],
    );

    blocTest(
      'Tender contract unselected',
      build: () => TenderContractBloc(
        tenderContractRepository: tenderContractMockRepository,
      ),
      setUp: () {
        when(
          () => tenderContractMockRepository.getTenderContractDetails(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            materialNumber: mockMaterialInfo.materialNumber,
          ),
        ).thenAnswer(
          (invocation) async => Right(mockTenderContractList),
        );
      },
      act: (TenderContractBloc bloc) {
        bloc.add(const TenderContractEvent.unselected());
      },
      expect: () => [
        TenderContractState.initial().copyWith(
          selectedTenderContract: TenderContract.empty(),
        ),
      ],
    );
  });
}
