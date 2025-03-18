import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_balance.dart';
import 'package:ezrxmobile/domain/payments/repository/i_account_summary_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_summary_event.dart';
part 'account_summary_state.dart';
part 'account_summary_bloc.freezed.dart';

class ZPAccountSummaryBloc extends AccountSummaryBloc {
  ZPAccountSummaryBloc({required super.accountSummaryRepository});

  @override
  bool get isMarketplace => false;
}

class MPAccountSummaryBloc extends AccountSummaryBloc {
  MPAccountSummaryBloc({required super.accountSummaryRepository});

  @override
  bool get isMarketplace => true;
}

abstract class AccountSummaryBloc
    extends Bloc<AccountSummaryEvent, AccountSummaryState> {
  abstract final bool isMarketplace;
  final IAccountSummaryRepository accountSummaryRepository;

  AccountSummaryBloc({required this.accountSummaryRepository})
      : super(AccountSummaryState.initial()) {
    on<AccountSummaryEvent>(_onEvent);
  }

  Future<void> _onEvent(
    AccountSummaryEvent event,
    Emitter<AccountSummaryState> emit,
  ) async {
    await event.map(
      initialize: (e) {
        emit(AccountSummaryState.initial());
      },
      fetchInvoiceSummary: (e) async {
        emit(
          state.copyWith(
            isFetchingOutstandingBalance: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await accountSummaryRepository.fetchInvoiceSummary(
          custCode: e.custCode,
          salesOrg: e.salesOrg,
          isMarketPlace: isMarketplace,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetchingOutstandingBalance: false,
              ),
            );
          },
          (outstandingBalance) {
            emit(
              state.copyWith(
                outstandingBalance: outstandingBalance,
                isFetchingOutstandingBalance: false,
              ),
            );
          },
        );
      },
      fetchCreditSummary: (e) async {
        emit(
          state.copyWith(
            isFetchingCreditLimit: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await accountSummaryRepository.fetchCreditSummary(
          custCode: e.custCode,
          salesOrg: e.salesOrg,
          isMarketPlace: isMarketplace,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetchingCreditLimit: false,
              ),
            );
          },
          (creditLimit) {
            emit(
              state.copyWith(
                creditLimit: creditLimit,
                isFetchingCreditLimit: false,
              ),
            );
          },
        );
      },
    );
  }
}
