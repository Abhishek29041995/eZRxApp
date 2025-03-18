import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/repository/i_bank_beneficiary_repository.dart';
part 'bank_in_accounts_event.dart';
part 'bank_in_accounts_state.dart';
part 'bank_in_accounts_bloc.freezed.dart';

class BankInAccountsBloc
    extends Bloc<BankInAccountsEvent, BankInAccountsState> {
  final IBankBeneficiaryRepository bankBeneficiaryRepository;
  BankInAccountsBloc({required this.bankBeneficiaryRepository})
      : super(BankInAccountsState.initial()) {
    on<BankInAccountsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    BankInAccountsEvent event,
    Emitter<BankInAccountsState> emit,
  ) async {
    await event.map(
      bankInFetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );
        final failureOrSuccess = await bankBeneficiaryRepository
            .getBankBeneficiariesBySaleOrg(salesOrg: e.salesOrg);

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (bankInAccounts) {
            emit(
              state.copyWith(
                bankInAccounts: bankInAccounts,
                failureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
    );
  }
}
