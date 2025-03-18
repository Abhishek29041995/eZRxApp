import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_summary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

class PaymentSummaryRepositoryMock extends Mock
    implements PaymentSummaryRepository {}

void main() {
  late PaymentSummaryRepository paymentSummaryMockRepository;
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockSalesOrganisation = SalesOrganisation.empty();
  late List<PaymentSummaryDetails> details;
  late PaymentSummaryFilter paymentSummaryFilter;
  late Config config;
  const offSet = 0;

  final paymentSummaryState = PaymentSummaryState.initial();

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    paymentSummaryMockRepository = PaymentSummaryRepositoryMock();
    details = <PaymentSummaryDetails>[];
    config = Config()..appFlavor = Flavor.mock;
  });

  setUp(() {
    paymentSummaryFilter = PaymentSummaryFilter.defaultFilter();
  });

  group('Payment Summary Bloc Test', () {
    blocTest<ZPPaymentSummaryBloc, PaymentSummaryState>(
      'Payment Summary "fetchPaymentSummaryList" Event Success',
      build: () => ZPPaymentSummaryBloc(
        paymentSummaryRepository: paymentSummaryMockRepository,
        config: config,
      ),
      seed: () => paymentSummaryState.copyWith(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganization: mockSalesOrganisation,
      ),
      setUp: () {
        when(
          () => paymentSummaryMockRepository.fetchPaymentSummaryList(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            filter: paymentSummaryFilter,
            offset: offSet,
            pageSize: config.pageSize,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => Right(details),
        );
      },
      act: (ZPPaymentSummaryBloc bloc) => bloc.add(
        PaymentSummaryEvent.fetch(
          appliedFilter: paymentSummaryFilter,
        ),
      ),
      expect: () => [
        paymentSummaryState.copyWith(
          isFetching: true,
          appliedFilter: paymentSummaryFilter,
          failureOrSuccessOption: none(),
        ),
        paymentSummaryState.copyWith(
          details: details,
          canLoadMore: false,
          appliedFilter: paymentSummaryFilter,
        ),
      ],
    );

    blocTest<MPPaymentSummaryBloc, PaymentSummaryState>(
      'Payment Summary "fetchPaymentSummaryList" Event Success in marketplace',
      build: () => MPPaymentSummaryBloc(
        paymentSummaryRepository: paymentSummaryMockRepository,
        config: config,
      ),
      seed: () => paymentSummaryState.copyWith(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganization: mockSalesOrganisation,
      ),
      setUp: () {
        when(
          () => paymentSummaryMockRepository.fetchPaymentSummaryList(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            filter: paymentSummaryFilter,
            offset: offSet,
            pageSize: config.pageSize,
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(details),
        );
      },
      act: (MPPaymentSummaryBloc bloc) => bloc.add(
        PaymentSummaryEvent.fetch(
          appliedFilter: paymentSummaryFilter,
        ),
      ),
      expect: () => [
        paymentSummaryState.copyWith(
          isFetching: true,
          appliedFilter: paymentSummaryFilter,
          failureOrSuccessOption: none(),
        ),
        paymentSummaryState.copyWith(
          details: details,
          canLoadMore: false,
          appliedFilter: paymentSummaryFilter,
        ),
      ],
    );

    blocTest<ZPPaymentSummaryBloc, PaymentSummaryState>(
      'Payment Summary "fetchPaymentSummaryList" Event failure',
      build: () => ZPPaymentSummaryBloc(
        paymentSummaryRepository: paymentSummaryMockRepository,
        config: config,
      ),
      seed: () => paymentSummaryState.copyWith(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganization: mockSalesOrganisation,
      ),
      setUp: () {
        when(
          () => paymentSummaryMockRepository.fetchPaymentSummaryList(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            offset: offSet,
            filter: paymentSummaryFilter,
            pageSize: config.pageSize,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake-Error')),
        );
      },
      act: (ZPPaymentSummaryBloc bloc) => bloc.add(
        PaymentSummaryEvent.fetch(
          appliedFilter: paymentSummaryFilter,
        ),
      ),
      expect: () => [
        paymentSummaryState.copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
          appliedFilter: paymentSummaryFilter,
        ),
        paymentSummaryState.copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
          isFetching: false,
          appliedFilter: paymentSummaryFilter,
        ),
      ],
    );
    blocTest<ZPPaymentSummaryBloc, PaymentSummaryState>(
      'Payment Summary "loadMorePaymentSummary" Event Success',
      build: () => ZPPaymentSummaryBloc(
        paymentSummaryRepository: paymentSummaryMockRepository,
        config: config,
      ),
      seed: () => paymentSummaryState.copyWith(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganization: mockSalesOrganisation,
      ),
      setUp: () {
        when(
          () => paymentSummaryMockRepository.fetchPaymentSummaryList(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            filter: paymentSummaryFilter,
            offset: offSet,
            pageSize: config.pageSize,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => Right(details),
        );
      },
      act: (ZPPaymentSummaryBloc bloc) => bloc.add(
        const PaymentSummaryEvent.loadMore(),
      ),
      expect: () => [
        paymentSummaryState.copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
          canLoadMore: true,
          appliedFilter: paymentSummaryFilter,
        ),
        paymentSummaryState.copyWith(
          failureOrSuccessOption: none(),
          isFetching: false,
          canLoadMore: false,
          details: [...details, ...details],
          appliedFilter: paymentSummaryFilter,
        ),
      ],
    );
    blocTest<ZPPaymentSummaryBloc, PaymentSummaryState>(
      'Payment Summary "loadMorePaymentSummary" Event failure',
      build: () => ZPPaymentSummaryBloc(
        paymentSummaryRepository: paymentSummaryMockRepository,
        config: config,
      ),
      seed: () => paymentSummaryState.copyWith(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganization: mockSalesOrganisation,
      ),
      setUp: () {
        when(
          () => paymentSummaryMockRepository.fetchPaymentSummaryList(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            filter: paymentSummaryFilter,
            offset: offSet,
            pageSize: config.pageSize,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake-Error')),
        );
      },
      act: (ZPPaymentSummaryBloc bloc) => bloc.add(
        const PaymentSummaryEvent.loadMore(),
      ),
      expect: () => [
        paymentSummaryState.copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
          canLoadMore: true,
          appliedFilter: paymentSummaryFilter,
        ),
        paymentSummaryState.copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
          isFetching: false,
          appliedFilter: paymentSummaryFilter,
        ),
      ],
    );

    blocTest<ZPPaymentSummaryBloc, PaymentSummaryState>(
      'Payment Summary "fetchPaymentSummaryList" Event with empty search',
      build: () => ZPPaymentSummaryBloc(
        paymentSummaryRepository: paymentSummaryMockRepository,
        config: config,
      ),
      seed: () => paymentSummaryState.copyWith(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganization: mockSalesOrganisation,
      ),
      setUp: () {
        when(
          () => paymentSummaryMockRepository.fetchPaymentSummaryList(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            filter: paymentSummaryFilter,
            offset: offSet,
            pageSize: config.pageSize,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => Right(details),
        );
      },
      act: (ZPPaymentSummaryBloc bloc) => bloc.add(
        PaymentSummaryEvent.fetch(
          appliedFilter: paymentSummaryFilter,
        ),
      ),
      expect: () => [
        paymentSummaryState.copyWith(
          isFetching: true,
          appliedFilter: paymentSummaryFilter,
          failureOrSuccessOption: none(),
        ),
        paymentSummaryState.copyWith(
          details: details,
          canLoadMore: false,
          appliedFilter: paymentSummaryFilter,
        ),
      ],
    );

    blocTest<ZPPaymentSummaryBloc, PaymentSummaryState>(
      'Payment Summary "fetchPaymentSummaryList" Event with search change',
      build: () => ZPPaymentSummaryBloc(
        paymentSummaryRepository: paymentSummaryMockRepository,
        config: config,
      ),
      seed: () => paymentSummaryState.copyWith(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganization: mockSalesOrganisation,
      ),
      setUp: () {
        when(
          () => paymentSummaryMockRepository.fetchPaymentSummaryList(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            filter: paymentSummaryFilter,
            offset: offSet,
            pageSize: config.pageSize,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => Right(details),
        );
      },
      act: (ZPPaymentSummaryBloc bloc) => bloc.add(
        PaymentSummaryEvent.fetch(
          appliedFilter: paymentSummaryFilter,
        ),
      ),
      expect: () => [
        paymentSummaryState.copyWith(
          isFetching: true,
          appliedFilter: paymentSummaryFilter,
          failureOrSuccessOption: none(),
        ),
        paymentSummaryState.copyWith(
          details: details,
          canLoadMore: false,
          appliedFilter: paymentSummaryFilter,
        ),
      ],
    );

    blocTest(
      'for "initialized" event',
      build: () => ZPPaymentSummaryBloc(
        paymentSummaryRepository: paymentSummaryMockRepository,
        config: config,
      ),
      act: (ZPPaymentSummaryBloc bloc) => bloc.add(
        PaymentSummaryEvent.initialized(
          customerCodeInfo: mockCustomerCodeInfo,
          salesOrganization: mockSalesOrganisation,
        ),
      ),
      expect: () => [
        paymentSummaryState.copyWith(
          customerCodeInfo: mockCustomerCodeInfo,
          salesOrganization: mockSalesOrganisation,
        ),
      ],
    );
  });
}
