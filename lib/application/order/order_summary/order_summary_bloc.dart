import 'dart:async';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_rep_authorized_details.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:ezrxmobile/domain/order/repository/i_stock_info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/entities/po_documents.dart';

part 'order_summary_event.dart';
part 'order_summary_state.dart';
part 'order_summary_bloc.freezed.dart';

class OrderSummaryBloc extends Bloc<OrderSummaryEvent, OrderSummaryState> {
  final IOrderRepository repository;
  final IStockInfoRepository stockInfoRepository;
  OrderSummaryBloc({
    required this.repository,
    required this.stockInfoRepository,
  }) : super(OrderSummaryState.initial()) {
    on<OrderSummaryEvent>(_onEvent);
  }

  Future<void> _onEvent(
    OrderSummaryEvent event,
    Emitter<OrderSummaryState> emit,
  ) async {
    await event.map(
      initialized: (value) {
        emit(
          OrderSummaryState.initial().copyWith(
            user: value.user,
            shipToInfo: value.shipToInfo,
            customerCodeInfo: value.customerCodeInfo,
            salesOrgConfig: value.salesOrgConfig,
            salesOrganisation: value.salesOrganisation,
          ),
        );
      },
      submitOrder: (value) async {
        if (state.isSubmitting) return;
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isSubmitting: true,
          ),
        );
        final failureOrSuccess = await repository.submitOrder(
          shipToInfo: state.shipToInfo,
          user: state.user,
          cartProducts: value.cartProducts,
          grandTotal: value.grandTotal,
          orderValue: value.orderValue,
          aplSmallOrderFee: value.aplSmallOrderFee,
          mpSmallOrderFee: value.mpSmallOrderFee,
          zpSmallOrderFee: value.zpSmallOrderFee,
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          data: value.data,
          configs: state.salesOrgConfig,
          totalTax: value.totalTax,
          salesRepAuthorizedDetails: value.salesRepAuthorizedDetails,
          deliveryOption: value.deliveryOption,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isSubmitting: false,
              ),
            );
          },
          (submitOrderResponse) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                isSubmitting: false,
                isConfirming: true,
                submitOrderResponse: submitOrderResponse,
                orderHistoryDetailsList: <OrderHistoryDetails>[],
                cartItems: <PriceAggregate>[],
              ),
            );
          },
        );
      },
      orderConfirmationDetail: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isConfirming: true,
            cartItems: e.priceAggregate,
          ),
        );

        final failureOrSuccess = await repository.getOrderConfirmationDetail(
          orderResponse: state.submitOrderResponse,
          user: state.user,
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          cartProducts: e.priceAggregate,
          shipToInfo: state.shipToInfo,
          configs: state.salesOrgConfig,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isConfirming: false,
              ),
            );
          },
          (orderConfirmationDetail) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                isConfirming: true,
                orderHistoryDetailsList: orderConfirmationDetail,
              ),
            );
            add(
              OrderSummaryEvent.confirmedOrderStockInfo(
                orderHistoryDetailList: orderConfirmationDetail,
                priceAggregate: e.priceAggregate,
              ),
            );
          },
        );
      },
      confirmedOrderStockInfo: (e) async {
        final failureOrSuccess = await stockInfoRepository.getStockInfoList(
          customerCodeInfo: state.customerCodeInfo,
          materials: e.orderHistoryDetailList.allItems
              .map((e) => e.materialNumber)
              .toList(),
          salesOrganisation: state.salesOrganisation,
          shipToInfo: state.shipToInfo,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isConfirming: false,
              ),
            );
          },
          (stockInfoList) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                isConfirming: false,
                orderHistoryDetailsList: e.orderHistoryDetailList
                    .map(
                      (item) => item.copyWithStock(
                        stockInfoList: stockInfoList,
                        priceAggregate: e.priceAggregate,
                        salesOrganisationConfigs: state.salesOrgConfig,
                      ),
                    )
                    .toList(),
              ),
            );
          },
        );
      },
      updateIsExpanded: (e) {
        emit(state.copyWith(isExpanded: e.isExpanded));
      },
    );
  }
}
