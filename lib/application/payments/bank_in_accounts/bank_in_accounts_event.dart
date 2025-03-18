part of 'bank_in_accounts_bloc.dart';

@freezed
class BankInAccountsEvent with _$BankInAccountsEvent {
  const factory BankInAccountsEvent.bankInFetch({
    required SalesOrg salesOrg,
  }) = _BankInFetch;
}
