import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_detail.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_item_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/order/repository/i_product_details_repository.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_history_details_repository.dart';

part 'view_by_order_details_event.dart';
part 'view_by_order_details_state.dart';
part 'view_by_order_details_bloc.freezed.dart';

class ViewByOrderDetailsBloc
    extends Bloc<ViewByOrderDetailsEvent, ViewByOrderDetailsState> {
  final IViewByOrderDetailsRepository viewByOrderDetailsRepository;
  final IProductDetailRepository productDetailRepository;
  final IViewByItemRepository viewByItemRepository;
  final Config config;

  ViewByOrderDetailsBloc({
    required this.viewByOrderDetailsRepository,
    required this.productDetailRepository,
    required this.viewByItemRepository,
    required this.config,
  }) : super(ViewByOrderDetailsState.initial()) {
    on<ViewByOrderDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ViewByOrderDetailsEvent event,
    Emitter<ViewByOrderDetailsState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(
          ViewByOrderDetailsState.initial().copyWith(
            customerCodeInfo: e.customerCodeInfo,
            salesOrganisation: e.salesOrganisation,
            user: e.user,
            shipToInfo: e.shipToInfo,
            configs: e.configs,
          ),
        );
      },
      fetch: (e) async {
        add(
          _FetchOrdersInvoiceData(
            orderNumber: e.orderNumber,
          ),
        );
        emit(
          state.copyWith(
            isLoading: true,
            orderHistoryDetails: OrderHistoryDetails.empty(),
          ),
        );

        final failureOrSuccess =
            await viewByOrderDetailsRepository.getViewByOrderDetails(
          user: state.user,
          orderNumber: e.orderNumber,
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          shipToInfo: state.shipToInfo,
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
          (orderHistoryDetails) {
            emit(
              state.copyWith(
                orderHistoryDetails: orderHistoryDetails,
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
                materials: {
                  for (final item in orderHistoryDetails.items)
                    item.orderItem.queryInfo: item.toPriceAggregate,
                },
                isLoadingTenderContract: {
                  for (final item in orderHistoryDetails.items)
                    if (item.orderItem.isTenderContractMaterial)
                      item.orderItem.queryInfo: true,
                },
              ),
            );

            add(const _UpdateBundle());
          },
        );
      },
      setOrderDetails: (e) {
        add(
          _FetchOrdersInvoiceData(
            orderNumber: e.orderHistoryDetails.orderNumber,
          ),
        );
        emit(
          state.copyWith(
            orderHistoryDetails: e.orderHistoryDetails,
            materials: {
              for (final item in e.orderHistoryDetails.items)
                item.orderItem.queryInfo: item.toPriceAggregate,
            },
            isLoadingTenderContract: {
              for (final item in e.orderHistoryDetails.items)
                if (item.orderItem.isTenderContractMaterial)
                  item.orderItem.queryInfo: true,
            },
          ),
        );
        add(const _UpdateBundle());
      },
      updateMaterialTenderContract: (e) async {
        final materialsWithUpdatedTenderContract = state.materials.map(
          (queryInfo, material) {
            if (queryInfo == e.queryInfo) {
              return MapEntry(
                queryInfo,
                material.copyWith(tenderContract: e.selectedTenderContract),
              );
            }

            return MapEntry(queryInfo, material);
          },
        );

        final loadingTenderContractStatus = state.isLoadingTenderContract.map(
          (queryInfo, isLoading) {
            if (queryInfo == e.queryInfo) return MapEntry(queryInfo, false);

            return MapEntry(queryInfo, isLoading);
          },
        );

        emit(
          state.copyWith(
            materials: materialsWithUpdatedTenderContract,
            isLoadingTenderContract: loadingTenderContractStatus,
          ),
        );
      },
      expandAttachments: (e) {
        emit(
          state.copyWith(
            isExpanded: !state.isExpanded,
            orderHistoryDetails: state.orderHistoryDetails,
          ),
        );
      },
      updateBundle: (_UpdateBundle e) async {
        if (state.bundleCodes.isEmpty) return;
        emit(
          state.copyWith(
            isLoadingBundleDetail: true,
          ),
        );
        final productDetails =
            await productDetailRepository.getBundleListDetail(
          customerCodeInfo: state.customerCodeInfo,
          bundleCodes: state.bundleCodes,
          salesOrganisation: state.salesOrganisation,
          shipToInfo: state.shipToInfo,
          language: state.user.preferredLanguage,
        );
        if (isClosed) return;
        emit(
          state.copyWith(
            isLoadingBundleDetail: false,
            orderHistoryDetails: state.orderHistoryDetails.copyWith(
              orderHistoryDetailsOrderItem: state
                  .orderHistoryDetails.orderHistoryDetailsOrderItem
                  .map(
                    (e) => e.copyWith(
                      material: productDetails[MaterialNumber(e.parentId)] ??
                          MaterialInfo.empty(),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
      fetchOrdersInvoiceData: (_FetchOrdersInvoiceData e) async {
        if (!e.orderNumber.isValid()) return;

        emit(
          state.copyWith(
            isFetchingInvoices: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await viewByItemRepository.getInvoiceDetailsForOrder(
          orderNumber: e.orderNumber,
          customerCodeInfo: state.customerCodeInfo,
          language: state.user.preferredLanguage,
          offset: 0,
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
          (invoiceDetail) {
            emit(
              state.copyWith(
                invoiceDetail: invoiceDetail,
                failureOrSuccessOption: none(),
                isFetchingInvoices: false,
                canLoadMoreInvoices:
                    invoiceDetail.invoiceDetails.length >= config.pageSize,
              ),
            );
          },
        );
      },
      loadMoreInvoices: (e) async {
        if (state.isFetchingInvoices || !state.canLoadMoreInvoices) return;
        emit(
          state.copyWith(
            isFetchingInvoices: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await viewByItemRepository.getInvoiceDetailsForOrder(
          orderNumber: state.orderHistoryDetails.orderNumber,
          customerCodeInfo: state.customerCodeInfo,
          language: state.user.preferredLanguage,
          offset: state.invoiceDetail.invoiceDetails.length,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isFetchingInvoices: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (moreInvoiceDetail) {
            final invoiceDetail = state.invoiceDetail.copyWith(
              invoiceDetails:
                  List<InvoiceDetail>.from(state.invoiceDetail.invoiceDetails)
                    ..addAll(moreInvoiceDetail.invoiceDetails),
            );
            emit(
              state.copyWith(
                isFetchingInvoices: false,
                invoiceDetail: invoiceDetail,
                failureOrSuccessOption: none(),
                canLoadMoreInvoices:
                    moreInvoiceDetail.invoiceDetails.length >= config.pageSize,
              ),
            );
          },
        );
      },
    );
  }
}
