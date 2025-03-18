import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/repository/i_product_search_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/material_info.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';

import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';

import 'package:ezrxmobile/domain/order/entities/product_suggestion_history.dart';

part 'product_search_event.dart';
part 'product_search_state.dart';
part 'product_search_bloc.freezed.dart';

class ProductSearchBloc extends Bloc<ProductSearchEvent, ProductSearchState> {
  final IProductSearchRepository productSearchRepository;
  final Config config;
  ProductSearchBloc({
    required this.productSearchRepository,
    required this.config,
  }) : super(ProductSearchState.initial()) {
    Future<void> fetchSearchKeys(
      Emitter<ProductSearchState> emit,
    ) async {
      final failureOrSuccess = await productSearchRepository.getSearchKeys();
      failureOrSuccess.fold(
        (failure) => emit(
          state.copyWith(
            apiFailureOrSuccessOption: optionOf(failureOrSuccess),
          ),
        ),
        (searchKeyList) => emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            productSuggestionHistory: searchKeyList,
          ),
        ),
      );
    }

    on<_Initialized>((event, emit) {
      emit(
        state.copyWith(
          salesOrganization: event.salesOrganization,
          configs: event.configs,
          customerCodeInfo: event.customerCodeInfo,
          shipToInfo: event.shipToInfo,
          user: event.user,
        ),
      );
      fetchSearchKeys(emit);
    });
    on<_SearchProduct>(
      (event, emit) async {
        if (event.searchKey == state.searchKey) return;
        if (!event.searchKey.isValid()) {
          emit(state.copyWith(searchKey: event.searchKey));

          return;
        }
        emit(
          state.copyWith(
            searchKey: event.searchKey,
            materialFilter: event.materialFilter,
            suggestedProductList: <MaterialInfo>[],
            isSearching: true,
            canLoadMore: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await productSearchRepository.searchProductList(
          salesOrganization: state.salesOrganization,
          salesOrgConfig: state.configs,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          searchKey: event.searchKey,
          pageSize: config.pageSize,
          offset: state.suggestedProductList.length,
          materialFilter: state.materialFilter,
          user: state.user,
        );

        failureOrSuccess.fold(
          (failure) {
            if (emit.isDone) return;
            emit(
              state.copyWith(
                isSearching: false,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (productResponse) {
            if (emit.isDone) return;
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                suggestedProductList: productResponse.products,
                isSearching: false,
              ),
            );
            add(_SaveSearchHistory(searchKey: event.searchKey));
          },
        );
      },
      transformer: restartable(),
    );

    on<_LoadMoreProductList>(
      (event, emit) async {
        if (state.isSearching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isSearching: true,
          ),
        );

        final failureOrSuccess =
            await productSearchRepository.searchProductList(
          salesOrganization: state.salesOrganization,
          salesOrgConfig: state.configs,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          searchKey: state.searchKey,
          pageSize: config.pageSize,
          offset: state.suggestedProductList.length,
          materialFilter: state.materialFilter,
          user: state.user,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isSearching: false,
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (productResponse) {
            final finalProductList =
                List<MaterialInfo>.from(state.suggestedProductList)
                  ..addAll(productResponse.products);
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                suggestedProductList: finalProductList,
                canLoadMore: productResponse.products.length >= config.pageSize,
                isSearching: false,
              ),
            );
          },
        );
      },
    );

    on<_ClearSearch>(
      (event, emit) {
        emit(
          state.copyWith(
            searchKey: SearchKey.empty(),
            apiFailureOrSuccessOption: none(),
            canLoadMore: false,
            suggestedProductList: <MaterialInfo>[],
          ),
        );
        fetchSearchKeys(emit);
      },
    );

    on<_ClearProductSearchSuggestionHistory>(
      (e, emit) async {
        final failureOrSuccess =
            await productSearchRepository.clearSearchHistory();
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (clearedHistory) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: none(),
              productSuggestionHistory: ProductSuggestionHistory.empty(),
            ),
          ),
        );
      },
    );
    on<_SaveSearchHistory>((event, emit) async {
      final failureOrSuccess =
          await productSearchRepository.saveSearchHistory(event.searchKey);
      if (isClosed) return;
      failureOrSuccess.fold(
        (failure) => emit(
          state.copyWith(
            apiFailureOrSuccessOption: optionOf(failureOrSuccess),
          ),
        ),
        (searchKeyList) => emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
          ),
        ),
      );
    });
  }
}
