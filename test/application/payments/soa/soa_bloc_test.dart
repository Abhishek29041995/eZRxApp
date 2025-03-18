import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/payments/entities/soa_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/soa_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';

class SoaRepositoryMock extends Mock implements SoaRepository {}

void main() {
  late SoaRepository soaRepositoryMock;
  final soaFilter = SoaFilter(
    toDate: DateTimeStringValue(
      getDateStringByDateTime(DateFormat().add_yMd().parse('12/06/2022')),
    ),
    fromDate: DateTimeStringValue(
      getDateStringByDateTime(DateFormat().add_yMd().parse('07/05/2023')),
    ),
  );

  final mockCustomerCodeInfo =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: 'mockCustomerCode');
  final mockSoaList = <Soa>[
    Soa(
      soaData: SoaData(
        'ezrx_prod/uploads/MY_QA/20010030082707_1222_20221206_155346.pdf',
      ),
    ),
    Soa(
      soaData: SoaData(
        'ezrx_prod/uploads/MY_QA/20010030082707_0723_20230705_155346.pdf',
      ),
    ),
  ];

  setUpAll(() async {
    soaRepositoryMock = SoaRepositoryMock();
  });

  group('Soa Bloc', () {
    blocTest(
      'Initialize',
      build: () => ZPSoaBloc(
        repository: soaRepositoryMock,
      ),
      seed: () => SoaState.initial().copyWith(appliedFilter: soaFilter),
      act: (SoaBloc bloc) => bloc.add(
        const SoaEvent.initialized(),
      ),
    );

    blocTest(
      'Fetch Success for ZP',
      build: () => ZPSoaBloc(
        repository: soaRepositoryMock,
      ),
      seed: () => SoaState.initial().copyWith(appliedFilter: soaFilter),
      setUp: () {
        when(
          () => soaRepositoryMock.fetchSoa(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrg: fakeSalesOrg,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockSoaList,
          ),
        );
      },
      act: (SoaBloc bloc) => bloc.add(
        SoaEvent.fetch(
          customerCodeInfo: mockCustomerCodeInfo,
          salesOrg: fakeSalesOrg,
        ),
      ),
      expect: () => [
        SoaState.initial().copyWith(
          isFetching: true,
        ),
        SoaState.initial().copyWith(
          soaList: mockSoaList,
        ),
      ],
      verify: (SoaBloc bloc) => [
        expect(bloc.state.soaList.length, 2),
      ],
    );

    blocTest(
      'Fetch Success for MP',
      build: () => MPSoaBloc(
        repository: soaRepositoryMock,
      ),
      seed: () => SoaState.initial().copyWith(appliedFilter: soaFilter),
      setUp: () {
        when(
          () => soaRepositoryMock.fetchSoa(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrg: fakeSalesOrg,
            isMarketPlace: true,
          ),
        ).thenAnswer((_) async => Right(mockSoaList));
      },
      act: (SoaBloc bloc) => bloc.add(
        SoaEvent.fetch(
          customerCodeInfo: mockCustomerCodeInfo,
          salesOrg: fakeSalesOrg,
        ),
      ),
      expect: () => [
        SoaState.initial().copyWith(
          isFetching: true,
        ),
        SoaState.initial().copyWith(
          soaList: mockSoaList,
        ),
      ],
      verify: (SoaBloc bloc) => [
        expect(bloc.state.soaList.length, 2),
      ],
    );

    blocTest(
      'Fetch Failure',
      build: () => ZPSoaBloc(
        repository: soaRepositoryMock,
      ),
      seed: () => SoaState.initial().copyWith(appliedFilter: soaFilter),
      setUp: () {
        when(
          () => soaRepositoryMock.fetchSoa(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrg: fakeSalesOrg,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('api-failure'),
          ),
        );
      },
      act: (SoaBloc bloc) => bloc.add(
        SoaEvent.fetch(
          customerCodeInfo: mockCustomerCodeInfo,
          salesOrg: fakeSalesOrg,
        ),
      ),
      expect: () => [
        SoaState.initial().copyWith(
          isFetching: true,
        ),
        SoaState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('api-failure'),
            ),
          ),
          isFetching: false,
        ),
      ],
      verify: (SoaBloc bloc) => [
        expect(bloc.state.soaList.length, 0),
      ],
    );

    blocTest(
      'Update',
      build: () => ZPSoaBloc(
        repository: soaRepositoryMock,
      ),
      act: (SoaBloc bloc) => bloc.add(
        SoaEvent.updateFilter(soaFilter: soaFilter),
      ),
      expect: () => [
        SoaState.initial().copyWith(
          appliedFilter: soaFilter,
        ),
      ],
    );
  });
}
