import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/repository/i_all_credits_and_invoices_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_credits_event.dart';
part 'all_credits_state.dart';
part 'all_credits_bloc.freezed.dart';

class ZPAllCreditsBloc extends AllCreditsBloc {
  ZPAllCreditsBloc({
    required super.allCreditsAndInvoicesRepository,
    required super.config,
  });

  @override
  bool get isMarketPlace => false;
}

class MPAllCreditsBloc extends AllCreditsBloc {
  MPAllCreditsBloc({
    required super.allCreditsAndInvoicesRepository,
    required super.config,
  });

  @override
  bool get isMarketPlace => true;
}

abstract class AllCreditsBloc extends Bloc<AllCreditsEvent, AllCreditsState> {
  final IAllCreditsAndInvoicesRepository allCreditsAndInvoicesRepository;
  final Config config;
  abstract final bool isMarketPlace;

  AllCreditsBloc({
    required this.allCreditsAndInvoicesRepository,
    required this.config,
  }) : super(AllCreditsState.initial()) {
    on<_initialized>(
      (event, emit) async => emit(
        AllCreditsState.initial().copyWith(
          salesOrganisation: event.salesOrganisation,
          customerCodeInfo: event.customerCodeInfo,
        ),
      ),
    );
    on<_Fetch>(
      (e, emit) async {
        if (!e.appliedFilter.searchKey.isValid()) return;

        if (e.appliedFilter == state.appliedFilter &&
            e.appliedFilter.searchKey.validateNotEmpty) {
          return;
        }

        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            items: <CreditAndInvoiceItem>[],
            isLoading: true,
            appliedFilter: e.appliedFilter,
          ),
        );

        final failureOrSuccess =
            await allCreditsAndInvoicesRepository.filterCredits(
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          filter: e.appliedFilter,
          pageSize: config.pageSize,
          offset: 0,
          isMarketPlace: isMarketPlace,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
          (responseData) {
            emit(
              state.copyWith(
                items: responseData,
                canLoadMore: responseData.length >= config.pageSize,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_LoadMore>(
      (e, emit) async {
        if (state.isLoading || !state.canLoadMore) return;

        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await allCreditsAndInvoicesRepository.filterCredits(
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          filter: state.appliedFilter,
          pageSize: config.pageSize,
          offset: state.items.length,
          isMarketPlace: isMarketPlace,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
          (responseData) {
            final updateItemList = List<CreditAndInvoiceItem>.from(state.items)
              ..addAll(responseData);
            emit(
              state.copyWith(
                items: updateItemList,
                canLoadMore: responseData.length >= config.pageSize,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
    );
  }
}
