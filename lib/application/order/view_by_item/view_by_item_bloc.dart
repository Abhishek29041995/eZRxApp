import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_item_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_item_bloc.freezed.dart';
part 'view_by_item_event.dart';
part 'view_by_item_state.dart';

class ViewByItemsBloc extends Bloc<ViewByItemsEvent, ViewByItemsState> {
  final IViewByItemRepository viewByItemRepository;
  final Config config;

  ViewByItemsBloc({
    required this.viewByItemRepository,
    required this.config,
  }) : super(ViewByItemsState.initial()) {
    on<_Initialized>(
      (e, emit) {
        emit(
          ViewByItemsState.initial().copyWith(
            salesOrgConfigs: e.salesOrgConfigs,
            customerCodeInfo: e.customerCodeInfo,
            shipToInfo: e.shipToInfo,
            user: e.user,
            salesOrganisation: e.salesOrganisation,
          ),
        );

        add(
          _Fetch(
            viewByItemFilter: state.appliedFilter,
            searchKey: state.searchKey,
          ),
        );
      },
    );
    on<_Fetch>(
      (e, emit) async {
        if (!e.searchKey.isValid()) return;

        emit(
          state.copyWith(
            isFetching: true,
            orderHistory: OrderHistory.empty(),
            nextPageIndex: 0,
            failureOrSuccessOption: none(),
            searchKey: e.searchKey,
            appliedFilter: e.viewByItemFilter,
          ),
        );

        final failureOrSuccess = await viewByItemRepository.getViewByItems(
          salesOrgConfig: state.salesOrgConfigs,
          soldTo: state.customerCodeInfo,
          shipTo: state.shipToInfo,
          user: state.user,
          pageSize: config.pageSize,
          offset: 0,
          viewByItemFilter: e.viewByItemFilter,
          searchKey: e.searchKey,
          salesOrganisation: state.salesOrganisation,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (orderHistory) {
            emit(
              state.copyWith(
                orderHistory: orderHistory,
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                canLoadMore:
                    orderHistory.orderHistoryItems.length >= config.pageSize,
                nextPageIndex: 1,
                appliedFilter: e.viewByItemFilter,
              ),
            );
            if (!isClosed) {
              add(
                _FetchOrdersInvoiceData(
                  orderHistoryItems: orderHistory.orderHistoryItems,
                ),
              );
            }
          },
        );
      },
      transformer: restartable(),
    );
    on<_LoadMore>(
      (e, emit) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(state.copyWith(isFetching: true, failureOrSuccessOption: none()));

        final failureOrSuccess = await viewByItemRepository.getViewByItems(
          salesOrgConfig: state.salesOrgConfigs,
          soldTo: state.customerCodeInfo,
          shipTo: state.shipToInfo,
          user: state.user,
          pageSize: config.pageSize,
          offset: state.orderHistory.orderHistoryItems.length,
          viewByItemFilter: state.appliedFilter,
          searchKey: state.searchKey,
          salesOrganisation: state.salesOrganisation,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (orderHistory) {
            final newOrderHistoryList = List<OrderHistoryItem>.from(
              state.orderHistory.orderHistoryItems,
            )..addAll(orderHistory.orderHistoryItems);

            emit(
              state.copyWith(
                orderHistory: state.orderHistory.copyWith(
                  orderHistoryItems: newOrderHistoryList,
                ),
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                canLoadMore:
                    orderHistory.orderHistoryItems.length >= config.pageSize,
                nextPageIndex: state.nextPageIndex + 1,
              ),
            );

            if (!isClosed) {
              add(
                _FetchOrdersInvoiceData(
                  orderHistoryItems: orderHistory.orderHistoryItems,
                ),
              );
            }
          },
        );
      },
    );
    on<_FetchOrdersInvoiceData>(
      (e, emit) async {
        final orderNumbers =
            e.orderHistoryItems.map((e) => e.orderNumber).toList();

        if (orderNumbers.isEmpty) return;

        emit(
          state.copyWith(
            isFetchingInvoices: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await viewByItemRepository.getOrdersInvoiceData(
          orderNumbers: orderNumbers,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetchingInvoices: false,
              ),
            );
          },
          (invoiceDataMap) {
            final orderHistoryItemsList = List<OrderHistoryItem>.from(
              state.orderHistory.orderHistoryItems,
            )
                .map(
                  (orderItem) => orderItem.copyWith(
                    invoiceNumber:
                        invoiceDataMap[orderItem.hashId]?.invoiceNumber ??
                            orderItem.invoiceNumber,
                  ),
                )
                .toList();

            emit(
              state.copyWith(
                orderHistory: state.orderHistory.copyWith(
                  orderHistoryItems: orderHistoryItemsList,
                ),
                failureOrSuccessOption: none(),
                isFetchingInvoices: false,
              ),
            );
          },
        );
      },
    );
  }
}
