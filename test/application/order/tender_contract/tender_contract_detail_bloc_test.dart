import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/tender_contract_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class TenderContractRepositoryMock extends Mock
    implements TenderContractRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late TenderContractRepository tenderContractRepositoryMock;
  late List<TenderContract> tenderContractListMockData;
  late TenderContract tenderContactMockData;
  final materialNumberMockData = MaterialNumber('fake-material-number');
  const fakeError = ApiFailure.other('fake-error');

  setUpAll(() async {
    tenderContractRepositoryMock = TenderContractRepositoryMock();
    tenderContractListMockData =
        await TenderContractLocalDataSource().getTenderContractDetails();
    tenderContactMockData = tenderContractListMockData.first;
  });

  group('Tender Contract Detail Bloc', () {
    blocTest(
      'Initialize',
      build: () => TenderContractDetailBloc(
        tenderContractRepository: tenderContractRepositoryMock,
      ),
      act: (TenderContractDetailBloc bloc) => bloc.add(
        const TenderContractDetailEvent.initialized(),
      ),
      expect: () => [TenderContractDetailState.initial()],
    );
    blocTest(
      'Fetch Tender Contracts Failure',
      build: () => TenderContractDetailBloc(
        tenderContractRepository: tenderContractRepositoryMock,
      ),
      setUp: () {
        when(
          () => tenderContractRepositoryMock.getTenderContractDetails(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeVNSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            materialNumber: materialNumberMockData,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            fakeError,
          ),
        );
      },
      act: (TenderContractDetailBloc bloc) => bloc.add(
        TenderContractDetailEvent.fetch(
          salesOrganisation: fakeVNSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          materialNumber: materialNumberMockData,
        ),
      ),
      expect: () => [
        TenderContractDetailState.initial().copyWith(
          isFetching: true,
        ),
        TenderContractDetailState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              fakeError,
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Fetch Tender Contracts Success',
      build: () => TenderContractDetailBloc(
        tenderContractRepository: tenderContractRepositoryMock,
      ),
      setUp: () {
        when(
          () => tenderContractRepositoryMock.getTenderContractDetails(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeVNSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            materialNumber: materialNumberMockData,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            tenderContractListMockData,
          ),
        );
      },
      act: (TenderContractDetailBloc bloc) => bloc.add(
        TenderContractDetailEvent.fetch(
          salesOrganisation: fakeVNSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          materialNumber: materialNumberMockData,
        ),
      ),
      expect: () => [
        TenderContractDetailState.initial().copyWith(
          isFetching: true,
        ),
        TenderContractDetailState.initial().copyWith(
          apiFailureOrSuccessOption:
              optionOf(Right(tenderContractListMockData)),
          tenderContractList: tenderContractListMockData,
          selectedTenderContract:
              tenderContractListMockData.firstAvailableContract,
        ),
      ],
    );

    blocTest(
      'Select Tender Contract',
      build: () => TenderContractDetailBloc(
        tenderContractRepository: tenderContractRepositoryMock,
      ),
      act: (TenderContractDetailBloc bloc) => bloc.add(
        TenderContractDetailEvent.select(
          tenderContract: tenderContractListMockData.first,
        ),
      ),
      expect: () => [
        TenderContractDetailState.initial().copyWith(
          selectedTenderContract: tenderContractListMockData.first,
        ),
      ],
    );
    blocTest(
      'Select Tender Contract With Remaining Quantity = 0',
      build: () => TenderContractDetailBloc(
        tenderContractRepository: tenderContractRepositoryMock,
      ),
      act: (TenderContractDetailBloc bloc) => bloc.add(
        TenderContractDetailEvent.select(
          tenderContract: tenderContractListMockData[1],
        ),
      ),
      expect: () => [],
    );
    blocTest(
      'Toggle Use Tender Contract Switch',
      build: () => TenderContractDetailBloc(
        tenderContractRepository: tenderContractRepositoryMock,
      ),
      act: (TenderContractDetailBloc bloc) => bloc.add(
        const TenderContractDetailEvent.toggleSwitch(
          enable: true,
        ),
      ),
      expect: () => [
        TenderContractDetailState.initial().copyWith(
          tenderContractEnable: true,
        ),
      ],
    );

    blocTest(
      'Check updateQty',
      build: () => TenderContractDetailBloc(
        tenderContractRepository: tenderContractRepositoryMock,
      ),
      act: (TenderContractDetailBloc bloc) => bloc.add(
        const TenderContractDetailEvent.updateQty(qty: 1),
      ),
      expect: () => [
        TenderContractDetailState.initial().copyWith(inputQty: 1),
      ],
    );

    blocTest(
      'Check set default value for edit',
      build: () => TenderContractDetailBloc(
        tenderContractRepository: tenderContractRepositoryMock,
      ),
      act: (TenderContractDetailBloc bloc) => bloc.add(
        TenderContractDetailEvent.setDefaultValueForEdit(
          tenderContract: tenderContactMockData,
        ),
      ),
      expect: () => [
        TenderContractDetailState.initial().copyWith(
          selectedTenderContract: tenderContactMockData,
          tenderContractEnable: true,
        ),
      ],
    );
  });
}
