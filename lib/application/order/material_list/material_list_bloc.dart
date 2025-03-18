import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_stock_info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_favourites_repository.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_list_repository.dart';

part 'material_list_bloc.freezed.dart';
part 'material_list_event.dart';
part 'material_list_state.dart';

class MaterialListBloc extends Bloc<MaterialListEvent, MaterialListState> {
  final IMaterialListRepository materialListRepository;
  final IFavouriteRepository favouriteRepository;
  final Config config;
  final IStockInfoRepository stockInfoRepository;
  StreamSubscription<MaterialInfo>? _favoriteStatusStreamSubscription;

  MaterialListBloc({
    required this.materialListRepository,
    required this.favouriteRepository,
    required this.config,
    required this.stockInfoRepository,
  }) : super(MaterialListState.initial()) {
    on<_Initialized>((e, emit) {
      emit(
        MaterialListState.initial().copyWith(
          user: e.user,
          salesOrganisation: e.salesOrganisation,
          configs: e.configs,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
        ),
      );

      add(_Fetch(selectedMaterialFilter: e.selectedMaterialFilter));
    });
    on<_UpdateSearchKey>(
      (e, emit) {
        emit(
          state.copyWith(
            searchKey: SearchKey.search(e.searchKey),
          ),
        );
      },
    );
    on<_Fetch>(
      (e, emit) async {
        emit(
          state.copyWith(
            isFetching: true,
            materialList: <MaterialInfo>[],
            nextPageIndex: 0,
            apiFailureOrSuccessOption: none(),
            isScanFromBarcode: false,
            selectedMaterialFilter: state.selectedMaterialFilter.copyWith(
              isFavourite: e.selectedMaterialFilter.isFavourite,
              isTender: e.selectedMaterialFilter.isTender,
              isCovidSelected: e.selectedMaterialFilter.isCovidSelected,
              bundleOffers: e.selectedMaterialFilter.bundleOffers,
              isProductOffer: e.selectedMaterialFilter.isProductOffer,
              sortBy: e.selectedMaterialFilter.sortBy,
              countryListSelected: e.selectedMaterialFilter.countryListSelected,
              brandList: e.selectedMaterialFilter.brandList,
              manufactureListSelected:
                  e.selectedMaterialFilter.manufactureListSelected,
              comboOffers: e.selectedMaterialFilter.comboOffers,
              isMarketPlace: e.selectedMaterialFilter.isMarketPlace,
              isSample: e.selectedMaterialFilter.isSample,
              isGimmick: e.selectedMaterialFilter.isGimmick,
              isPoison: e.selectedMaterialFilter.isPoison,
            ),
          ),
        );
        final failureOrSuccess = await materialListRepository.getMaterialList(
          salesOrganisation: state.salesOrganisation,
          salesOrgConfig: state.configs,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          pageSize: config.productTabPageSize,
          offset: 0,
          selectedMaterialFilter: e.selectedMaterialFilter,
          user: state.user,
          searchKey: state.searchKey,
        );
        if (emit.isDone || isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (productResponse) {
            emit(
              state.copyWith(
                materialCount: productResponse.count,
                materialList: productResponse.products,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                canLoadMore: productResponse.products.length >=
                    config.productTabPageSize,
                nextPageIndex: 1,
              ),
            );

            add(
              MaterialListEvent.fetchStock(
                materials: productResponse.products,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_LoadMore>((e, emit) async {
      if (state.isFetching || !state.canLoadMore) return;
      emit(
        state.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
          isScanFromBarcode: false,
        ),
      );
      final failureOrSuccess = await materialListRepository.getMaterialList(
        salesOrganisation: state.salesOrganisation,
        salesOrgConfig: state.configs,
        customerCodeInfo: state.customerCodeInfo,
        shipToInfo: state.shipToInfo,
        pageSize: config.productTabPageSize,
        offset: state.materialList.length,
        selectedMaterialFilter: state.selectedMaterialFilter,
        user: state.user,
        searchKey: state.searchKey,
      );

      if (isClosed) return;
      failureOrSuccess.fold(
        (failure) => emit(
          state.copyWith(
            apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            isFetching: false,
          ),
        ),
        (moreProduct) {
          final productList = List<MaterialInfo>.from(state.materialList)
            ..addAll(moreProduct.products);
          emit(
            state.copyWith(
              materialCount: moreProduct.count,
              materialList: productList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
              canLoadMore:
                  moreProduct.products.length >= config.productTabPageSize,
              nextPageIndex: state.nextPageIndex + 1,
            ),
          );

          add(
            MaterialListEvent.fetchStock(
              materials: moreProduct.products,
            ),
          );
        },
      );
    });
    on<_FetchStock>((e, emit) async {
      final failureOrSuccess = await stockInfoRepository.getStockInfoList(
        materials: e.materials
            .where((element) => element.isValidMaterial)
            .map((e) => e.materialNumber)
            .toList(),
        customerCodeInfo: state.customerCodeInfo,
        salesOrganisation: state.salesOrganisation,
        shipToInfo: state.shipToInfo,
      );
      if (isClosed) return;
      failureOrSuccess.fold(
        (failure) => emit(
          state.copyWith(
            apiFailureOrSuccessOption: optionOf(failureOrSuccess),
          ),
        ),
        (stockInfoList) {
          final updatedItems = state.materialList.map((material) {
            final stockInfo = stockInfoList.firstWhere(
              (e) => e.materialNumber == material.materialNumber,
              orElse: () => MaterialStockInfo.empty(),
            );

            return material.stockInfos.isEmpty
                ? material.copyWithStock(stockInfos: stockInfo.stockInfos)
                : material;
          }).toList();

          emit(
            state.copyWith(
              materialList: updatedItems,
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
        },
      );
    });
    on<_WatchFavoriteStatus>((e, emit) async {
      await _favoriteStatusStreamSubscription?.cancel();
      _favoriteStatusStreamSubscription =
          favouriteRepository.watchFavoriteStatus().listen(
        (event) {
          if (!isClosed) {
            add(_UpdateFavoriteStatus(updatedMaterial: event));
          }
        },
      );
    });
    on<_UpdateFavoriteStatus>((e, emit) {
      emit(
        state.copyWith(
          materialList: state.materialList
              .map(
                (item) => item.materialNumber ==
                        e.updatedMaterial.materialNumber
                    ? item.copyWith(isFavourite: e.updatedMaterial.isFavourite)
                    : item,
              )
              .toList(),
        ),
      );
    });
    on<_AddFavourite>(
      (e, emit) async {
        final failureOrSuccess = await favouriteRepository.addToFavourites(
          materialNumber: e.item.materialNumber,
          list: state.materialList,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (updatedFavouritesList) {
            emit(
              state.copyWith(
                materialList: updatedFavouritesList
                    .map((e) => e as MaterialInfo)
                    .toList(),
                isFetching: false,
              ),
            );
          },
        );
      },
    );
    on<_DeleteFavourite>(
      ((e, emit) async {
        final failureOrSuccess = await favouriteRepository.removeFromFavourites(
          materialNumber: e.item.materialNumber,
          list: state.materialList,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (updatedFavouritesList) {
            emit(
              state.copyWith(
                materialList: updatedFavouritesList
                    .map((e) => e as MaterialInfo)
                    .toList(),
                isFetching: false,
              ),
            );
          },
        );
      }),
    );
    add(const _WatchFavoriteStatus());
  }

  @override
  Future<void> close() async {
    await _favoriteStatusStreamSubscription?.cancel();

    return super.close();
  }
}
