part of 'bank_in_accounts_bloc.dart';

@freezed
class BankInAccountsState with _$BankInAccountsState {
  const BankInAccountsState._();

  const factory BankInAccountsState({
    required List<BankBeneficiary> bankInAccounts,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _ManageBankBeneficiaryState;

  factory BankInAccountsState.initial() => BankInAccountsState(
        isFetching: false,
        failureOrSuccessOption: none(),
        bankInAccounts: <BankBeneficiary>[],
      );
}
