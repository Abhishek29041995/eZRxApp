import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_balance.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/account_summary_local.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/account_summary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AccountSummaryRepositoryMock extends Mock
    implements AccountSummaryRepository {}

void main() {
  late AccountSummaryRepository accountSummaryMockRepository;
  late OutstandingBalance outstandingBalance;
  late CreditLimit creditLimit;
  final salesOrg = SalesOrg('2001');
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    accountSummaryMockRepository = AccountSummaryRepositoryMock();
    outstandingBalance =
        await AccountSummaryLocalDataSource().fetchInvoiceSummary();
    creditLimit = await AccountSummaryLocalDataSource().fetchCreditSummary();
  });

  group(
    'Account Summary Bloc Test -',
    () {
      blocTest<AccountSummaryBloc, AccountSummaryState>(
        'Account Summary Initialize Event',
        build: () => ZPAccountSummaryBloc(
          accountSummaryRepository: accountSummaryMockRepository,
        ),
        act: (AccountSummaryBloc bloc) => bloc.add(
          const AccountSummaryEvent.initialize(),
        ),
        expect: () => [
          AccountSummaryState.initial(),
        ],
      );

      blocTest<AccountSummaryBloc, AccountSummaryState>(
        'fetchInvoiceSummary for ZP success',
        build: () => ZPAccountSummaryBloc(
          accountSummaryRepository: accountSummaryMockRepository,
        ),
        setUp: () {
          when(
            () => accountSummaryMockRepository.fetchInvoiceSummary(
              custCode: mockCustomerCodeInfo.customerCodeSoldTo,
              salesOrg: salesOrg,
              isMarketPlace: false,
            ),
          ).thenAnswer((invocation) async => Right(outstandingBalance));
        },
        act: (AccountSummaryBloc bloc) => bloc.add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: mockCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: salesOrg,
          ),
        ),
        expect: () => [
          AccountSummaryState.initial().copyWith(
            isFetchingOutstandingBalance: true,
            failureOrSuccessOption: none(),
          ),
          AccountSummaryState.initial().copyWith(
            outstandingBalance: outstandingBalance,
            isFetchingOutstandingBalance: false,
          ),
        ],
      );

      blocTest<AccountSummaryBloc, AccountSummaryState>(
        'fetchInvoiceSummary for MP success',
        build: () => MPAccountSummaryBloc(
          accountSummaryRepository: accountSummaryMockRepository,
        ),
        setUp: () {
          when(
            () => accountSummaryMockRepository.fetchInvoiceSummary(
              custCode: mockCustomerCodeInfo.customerCodeSoldTo,
              salesOrg: salesOrg,
              isMarketPlace: true,
            ),
          ).thenAnswer((_) async => Right(outstandingBalance));
        },
        act: (AccountSummaryBloc bloc) => bloc.add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: mockCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: salesOrg,
          ),
        ),
        expect: () => [
          AccountSummaryState.initial().copyWith(
            isFetchingOutstandingBalance: true,
            failureOrSuccessOption: none(),
          ),
          AccountSummaryState.initial().copyWith(
            outstandingBalance: outstandingBalance,
            isFetchingOutstandingBalance: false,
          ),
        ],
      );

      blocTest<AccountSummaryBloc, AccountSummaryState>(
        'Account Summary "fetchInvoiceSummary" Event failure',
        build: () => ZPAccountSummaryBloc(
          accountSummaryRepository: accountSummaryMockRepository,
        ),
        setUp: () {
          when(
            () => accountSummaryMockRepository.fetchInvoiceSummary(
              custCode: mockCustomerCodeInfo.customerCodeSoldTo,
              salesOrg: salesOrg,
              isMarketPlace: false,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (AccountSummaryBloc bloc) => bloc.add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: mockCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: salesOrg,
          ),
        ),
        expect: () => [
          AccountSummaryState.initial().copyWith(
            isFetchingOutstandingBalance: true,
            failureOrSuccessOption: none(),
          ),
          AccountSummaryState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
            isFetchingOutstandingBalance: false,
          ),
        ],
      );

      blocTest<AccountSummaryBloc, AccountSummaryState>(
        'fetchCreditSummary for ZP success',
        build: () => ZPAccountSummaryBloc(
          accountSummaryRepository: accountSummaryMockRepository,
        ),
        setUp: () {
          when(
            () => accountSummaryMockRepository.fetchCreditSummary(
              custCode: mockCustomerCodeInfo.customerCodeSoldTo,
              salesOrg: salesOrg,
              isMarketPlace: false,
            ),
          ).thenAnswer((invocation) async => Right(creditLimit));
        },
        act: (AccountSummaryBloc bloc) => bloc.add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: mockCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: salesOrg,
          ),
        ),
        expect: () => [
          AccountSummaryState.initial().copyWith(
            isFetchingCreditLimit: true,
            failureOrSuccessOption: none(),
          ),
          AccountSummaryState.initial().copyWith(
            creditLimit: creditLimit,
            isFetchingCreditLimit: false,
          ),
        ],
      );

      blocTest<AccountSummaryBloc, AccountSummaryState>(
        'fetchCreditSummary for MP success',
        build: () => MPAccountSummaryBloc(
          accountSummaryRepository: accountSummaryMockRepository,
        ),
        setUp: () {
          when(
            () => accountSummaryMockRepository.fetchCreditSummary(
              custCode: mockCustomerCodeInfo.customerCodeSoldTo,
              salesOrg: salesOrg,
              isMarketPlace: true,
            ),
          ).thenAnswer((_) async => Right(creditLimit));
        },
        act: (AccountSummaryBloc bloc) => bloc.add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: mockCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: salesOrg,
          ),
        ),
        expect: () => [
          AccountSummaryState.initial().copyWith(
            isFetchingCreditLimit: true,
            failureOrSuccessOption: none(),
          ),
          AccountSummaryState.initial().copyWith(
            creditLimit: creditLimit,
            isFetchingCreditLimit: false,
          ),
        ],
      );

      blocTest<AccountSummaryBloc, AccountSummaryState>(
        'Account Summary "fetchCreditSummary" Event failure',
        build: () => ZPAccountSummaryBloc(
          accountSummaryRepository: accountSummaryMockRepository,
        ),
        setUp: () {
          when(
            () => accountSummaryMockRepository.fetchCreditSummary(
              custCode: mockCustomerCodeInfo.customerCodeSoldTo,
              salesOrg: salesOrg,
              isMarketPlace: false,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (AccountSummaryBloc bloc) => bloc.add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: mockCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: salesOrg,
          ),
        ),
        expect: () => [
          AccountSummaryState.initial().copyWith(
            isFetchingCreditLimit: true,
            failureOrSuccessOption: none(),
          ),
          AccountSummaryState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
            isFetchingCreditLimit: false,
          ),
        ],
      );
    },
  );
}
