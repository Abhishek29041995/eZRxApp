import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/payments/repository/i_new_payment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_credits_event.dart';
part 'available_credits_state.dart';
part 'available_credits_bloc.freezed.dart';

class AvailableCreditsBloc
    extends Bloc<AvailableCreditsEvent, AvailableCreditsState> {
  final INewPaymentRepository newPaymentRepository;
  final Config config;
  AvailableCreditsBloc({
    required this.newPaymentRepository,
    required this.config,
  }) : super(AvailableCreditsState.initial()) {
    on<_initialized>(
      (e, emit) => emit(
        AvailableCreditsState.initial().copyWith(
          salesOrganization: e.salesOrganization,
          customerCodeInfo: e.customerCodeInfo,
        ),
      ),
    );
    on<_Fetch>(
      (value, emit) async {
        if (!value.searchKey.isValid()) return;

        if (value.searchKey == state.searchKey &&
            value.searchKey.validateNotEmpty) {
          return;
        }

        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            items: <CustomerOpenItem>[],
            isLoading: true,
            appliedFilter: value.appliedFilter,
            searchKey: value.searchKey,
          ),
        );

        final failureOrSuccess =
            await newPaymentRepository.getAvailableCreditNotes(
          salesOrganisation: state.salesOrganization,
          customerCodeInfo: state.customerCodeInfo,
          pageSize: config.pageSize,
          offset: 0,
          appliedFilter: value.appliedFilter,
          searchKey: value.searchKey,
          isMarketPlace: value.isMarketPlace,
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
          (data) {
            emit(
              state.copyWith(
                items: data,
                canLoadMore: data.length >= config.pageSize,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );

    on<_LoadMore>((value, emit) async {
      if (state.isLoading || !state.canLoadMore) return;

      emit(
        state.copyWith(
          isLoading: true,
          failureOrSuccessOption: none(),
        ),
      );

      final failureOrSuccess =
          await newPaymentRepository.getAvailableCreditNotes(
        salesOrganisation: state.salesOrganization,
        customerCodeInfo: state.customerCodeInfo,
        pageSize: config.pageSize,
        offset: state.items.length,
        appliedFilter: state.appliedFilter,
        searchKey: state.searchKey,
        isMarketPlace: value.isMarketPlace,
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
        (data) {
          final updateItemList = List<CustomerOpenItem>.from(state.items)
            ..addAll(data);
          emit(
            state.copyWith(
              items: updateItemList,
              canLoadMore: data.length >= config.pageSize,
              failureOrSuccessOption: none(),
              isLoading: false,
            ),
          );
        },
      );
    });
  }
}
