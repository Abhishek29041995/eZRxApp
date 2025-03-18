import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/bank_in_accounts/bank_in_accounts_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_local.dart';
import 'package:ezrxmobile/infrastructure/account/repository/bank_beneficiary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common_mock_data/sales_organsiation_mock.dart';

class BankBeneficiaryRepositoryMock extends Mock
    implements BankBeneficiaryRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  late BankBeneficiaryRepository bankBeneficiaryRepositoryMock;
  late List<BankBeneficiary> bankInAccountList;
  final bankAccountState = BankInAccountsState.initial();

  group(
    'Bank In Accounts Bloc Testing',
    () {
      setUp(() async {
        bankBeneficiaryRepositoryMock = BankBeneficiaryRepositoryMock();
        bankInAccountList = await BankBeneficiaryLocalDataSource()
            .getBankBeneficiariesBySaleOrg();
      });

      blocTest<BankInAccountsBloc, BankInAccountsState>(
        'For "bankInFetch" Event with Success',
        setUp: () => when(
          () => bankBeneficiaryRepositoryMock.getBankBeneficiariesBySaleOrg(
            salesOrg: fakeSalesOrg,
          ),
        ).thenAnswer(
          (invocation) async => Right(bankInAccountList),
        ),
        build: () => BankInAccountsBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          BankInAccountsEvent.bankInFetch(
            salesOrg: fakeSalesOrg,
          ),
        ),
        expect: () => [
          bankAccountState.copyWith(
            isFetching: true,
          ),
          bankAccountState.copyWith(
            isFetching: false,
            bankInAccounts: bankInAccountList,
          ),
        ],
      );

      blocTest<BankInAccountsBloc, BankInAccountsState>(
        'For "bankInFetch" Event with Failed',
        setUp: () => when(
          () => bankBeneficiaryRepositoryMock.getBankBeneficiariesBySaleOrg(
            salesOrg: fakeSalesOrg,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        ),
        build: () => BankInAccountsBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          BankInAccountsEvent.bankInFetch(
            salesOrg: fakeSalesOrg,
          ),
        ),
        expect: () => [
          bankAccountState.copyWith(
            isFetching: true,
          ),
          bankAccountState.copyWith(
            isFetching: false,
            failureOrSuccessOption:optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );
    },
  );
}
