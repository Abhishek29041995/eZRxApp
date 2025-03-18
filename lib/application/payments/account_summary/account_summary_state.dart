part of 'account_summary_bloc.dart';

@freezed
class AccountSummaryState with _$AccountSummaryState {
  const AccountSummaryState._();

  const factory AccountSummaryState({
    required OutstandingBalance outstandingBalance,
    required CreditLimit creditLimit,
    required bool isFetchingOutstandingBalance,
    required bool isFetchingCreditLimit,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _AccountSummaryState;

  factory AccountSummaryState.initial() => AccountSummaryState(
        outstandingBalance: OutstandingBalance.empty(),
        creditLimit: CreditLimit.empty(),
        isFetchingOutstandingBalance: false,
        isFetchingCreditLimit: false,
        failureOrSuccessOption: none(),
      );
}
