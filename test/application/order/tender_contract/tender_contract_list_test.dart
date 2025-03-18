import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_list_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/tender_contract_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockTenderContractRepository extends Mock
    implements TenderContractRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late TenderContractRepository tenderContractMockRepository;
  late final List<TenderContract> mockTenderContractList;
  final tenderContractListState = TenderContractListState.initial();
  const fakeError = ApiFailure.other('fake-error');
  final materialNumberMockData = MaterialNumber('fake-material-number');
  final mockListTenderContractDetails =
      <MaterialNumber, List<TenderContract>>{};

  setUpAll(() async {
    tenderContractMockRepository = MockTenderContractRepository();
    mockTenderContractList =
        await TenderContractLocalDataSource().getTenderContractDetails();
    mockListTenderContractDetails.addAll({
      materialNumberMockData: mockTenderContractList,
    });
  });

  group('Tender Contract Bloc', () {
    blocTest(
      'Tender Contract List Initialize',
      build: () => TenderContractListBloc(
        tenderContractRepository: tenderContractMockRepository,
      ),
      act: (TenderContractListBloc bloc) =>
          bloc.add(const TenderContractListEvent.initialize()),
      expect: () => [tenderContractListState],
    );

    blocTest(
      'Fetch Tender Contract List Success',
      build: () => TenderContractListBloc(
        tenderContractRepository: tenderContractMockRepository,
      ),
      setUp: () async {
        when(
          () => tenderContractMockRepository.getListTenderContractDetails(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            materialNumbers: [materialNumberMockData],
          ),
        ).thenAnswer((_) async => Right(mockListTenderContractDetails));
      },
      act: (TenderContractListBloc bloc) => bloc.add(
        TenderContractListEvent.fetch(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          materialNumbers: [materialNumberMockData],
        ),
      ),
      expect: () => [
        tenderContractListState.copyWith(isFetching: true),
        tenderContractListState.copyWith(
          tenderContracts: mockListTenderContractDetails,
        ),
      ],
    );

    blocTest(
      'Fetch Tender Contract List Failed',
      build: () => TenderContractListBloc(
        tenderContractRepository: tenderContractMockRepository,
      ),
      setUp: () async {
        when(
          () => tenderContractMockRepository.getListTenderContractDetails(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            materialNumbers: [materialNumberMockData],
          ),
        ).thenAnswer((_) async => const Left(fakeError));
      },
      act: (TenderContractListBloc bloc) => bloc.add(
        TenderContractListEvent.fetch(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          materialNumbers: [materialNumberMockData],
        ),
      ),
      expect: () => [
        tenderContractListState.copyWith(isFetching: true),
        tenderContractListState.copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'set isFetching false when list can fetch Material Numbers is empty',
      build: () => TenderContractListBloc(
        tenderContractRepository: tenderContractMockRepository,
      ),
      act: (TenderContractListBloc bloc) => bloc.add(
        TenderContractListEvent.fetch(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          materialNumbers: [],
        ),
      ),
      expect: () => [
        tenderContractListState.copyWith(isFetching: true),
        tenderContractListState,
      ],
    );
  });
}
