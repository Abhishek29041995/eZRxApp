import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_in_progress_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PaymentInProgressRepositoryMock extends Mock
    implements PaymentInProgressRepository {}

void main() {
  late PaymentInProgressRepository repository;
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockSalesOrganisation = SalesOrganisation.empty();
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = PaymentInProgressRepositoryMock();
  });
  group('Payment In Progress Bloc Test', () {
    blocTest<PaymentInProgressBloc, PaymentInProgressState>(
      'Payment In Progress "initial" Event',
      build: () => ZPPaymentInProgressBloc(
        repository: repository,
      ),
      act: (PaymentInProgressBloc bloc) => bloc.add(
        const PaymentInProgressEvent.initialized(),
      ),
      expect: () => [PaymentInProgressState.initial()],
    );
    blocTest<PaymentInProgressBloc, PaymentInProgressState>(
      'Payment In Progress "fetch" Event Success for ZP',
      build: () => ZPPaymentInProgressBloc(
        repository: repository,
      ),
      setUp: () {
        when(
          () => repository.getPaymentInProgress(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => Right(StringValue('100')),
        );
      },
      act: (PaymentInProgressBloc bloc) => bloc.add(
        PaymentInProgressEvent.fetch(
          salesOrganization: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
        ),
      ),
      expect: () => [
        PaymentInProgressState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
        ),
        PaymentInProgressState.initial().copyWith(
          isFetching: false,
          amount: StringValue('100'),
        ),
      ],
    );
    blocTest<PaymentInProgressBloc, PaymentInProgressState>(
      'Payment In Progress "fetch" Event failure',
      build: () => ZPPaymentInProgressBloc(
        repository: repository,
      ),
      setUp: () {
        when(
          () => repository.getPaymentInProgress(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake-Error')),
        );
      },
      act: (PaymentInProgressBloc bloc) => bloc.add(
        PaymentInProgressEvent.fetch(
          salesOrganization: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
        ),
      ),
      expect: () => [
        PaymentInProgressState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
        ),
        PaymentInProgressState.initial().copyWith(
          isFetching: false,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
        ),
      ],
    );

    blocTest<PaymentInProgressBloc, PaymentInProgressState>(
      'Payment In Progress "fetch" Event Success for MP',
      build: () => MPPaymentInProgressBloc(
        repository: repository,
      ),
      setUp: () {
        when(
          () => repository.getPaymentInProgress(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            isMarketPlace: true,
          ),
        ).thenAnswer((_) async => Right(StringValue('100')));
      },
      act: (PaymentInProgressBloc bloc) => bloc.add(
        PaymentInProgressEvent.fetch(
          salesOrganization: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
        ),
      ),
      expect: () => [
        PaymentInProgressState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
        ),
        PaymentInProgressState.initial().copyWith(
          isFetching: false,
          amount: StringValue('100'),
        ),
      ],
    );
  });
}
