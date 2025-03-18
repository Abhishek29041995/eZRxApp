import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_cart_repository.dart';
import 'package:ezrxmobile/domain/order/repository/i_stock_info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/repository/i_material_list_repository.dart';

import 'package:ezrxmobile/domain/order/entities/principal_data.dart';

import 'package:ezrxmobile/domain/account/entities/user.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';

part 'bonus_material_bloc.freezed.dart';
part 'bonus_material_event.dart';
part 'bonus_material_state.dart';

class BonusMaterialBloc extends Bloc<BonusMaterialEvent, BonusMaterialState> {
  final IMaterialListRepository materialListRepository;
  final ICartRepository cartRepository;
  final Config config;
  final IStockInfoRepository stockInfoRepository;
  BonusMaterialBloc({
    required this.materialListRepository,
    required this.cartRepository,
    required this.config,
    required this.stockInfoRepository,
  }) : super(BonusMaterialState.initial()) {
    on<_Fetch>(
      (e, emit) async {
        if (e.searchKey.isValueEmpty) {
          emit(BonusMaterialState.initial());

          return;
        }
        if ((e.searchKey == state.searchKey) || !e.searchKey.isValid()) return;

        emit(
          BonusMaterialState.initial().copyWith(
            isFetching: true,
            searchKey: e.searchKey,
          ),
        );

        final failureOrSuccess =
            await materialListRepository.getMaterialBonusList(
          customerCodeInfo: e.customerCodeInfo,
          offset: 0,
          pageSize: config.pageSize,
          salesOrgConfig: e.configs,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
          principalData: e.principalData,
          user: e.user,
          enableGimmickMaterial: e.isGimmickMaterialEnabled,
          searchKey: e.searchKey,
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
          (bonus) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                bonusItemList: bonus.products,
                isFetching: false,
              ),
            );
            add(
              _UpdateProductStock(
                items: bonus.products,
                salesOrganisation: e.salesOrganisation,
                configs: e.configs,
                shipToInfo: e.shipToInfo,
                customerCodeInfo: e.customerCodeInfo,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );

    on<_LoadMoreBonusItem>(
      (e, emit) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );
        final failureOrSuccess =
            await materialListRepository.getMaterialBonusList(
          salesOrganisation: e.salesOrganisation,
          salesOrgConfig: e.configs,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          pageSize: config.pageSize,
          offset: state.bonusItemList.length,
          principalData: e.principalData,
          user: e.user,
          enableGimmickMaterial: e.isGimmickMaterialEnabled,
          searchKey: state.searchKey,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (bonusItems) {
            emit(
              state.copyWith(
                bonusItemList: List<MaterialInfo>.from(state.bonusItemList)
                  ..addAll(bonusItems.products),
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                canLoadMore: bonusItems.products.length >= config.pageSize,
              ),
            );
            add(
              _UpdateProductStock(
                items: bonusItems.products,
                salesOrganisation: e.salesOrganisation,
                configs: e.configs,
                shipToInfo: e.shipToInfo,
                customerCodeInfo: e.customerCodeInfo,
              ),
            );
          },
        );
      },
    );

    on<_ValidateBonusQuantity>(
      (e, emit) {
        emit(
          state.copyWith(
            isBonusQtyValidated: e.bonusMaterial.quantity.intValue > 0,
          ),
        );
      },
    );

    on<_UpdateBonusItemQuantity>(
      (e, emit) {
        final updatedBonusItemList = state.bonusItemList
            .map(
              (element) =>
                  element.materialNumber == e.updatedBonusItem.materialNumber
                      ? element.copyWith(quantity: e.updatedBonusItem.quantity)
                      : element,
            )
            .toList();
        emit(
          state.copyWith(
            bonusItemList: updatedBonusItemList,
          ),
        );
      },
    );

    on<_UpdateAddedBonusItems>(
      (e, emit) {
        emit(
          state.copyWith(
            addedBonusItemsList: [
              ...state.addedBonusItemsList,
              ...e.addedBonusItemList,
            ],
          ),
        );
      },
    );

    on<_UpdateProductStock>(
      (e, emit) async {
        emit(
          state.copyWith(
            isUpdatingStock: true,
          ),
        );

        final failureOrSuccess =
            await stockInfoRepository.getMappedStockInfoList(
          items: e.items,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisationConfigs: e.configs,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
        );
        if (isClosed) return;

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isUpdatingStock: false,
              ),
            );
          },
          (newStockFetched) {
            final updatedItemList = state.bonusItemList.map((product) {
              return product.copyWith(
                stockInfos: product.stockInfos.isNotEmpty
                    ? product.stockInfos
                    : (newStockFetched[product.materialNumber] ??
                        <StockInfo>[]),
              );
            }).toList();
            emit(
              state.copyWith(
                bonusItemList: updatedItemList,
                failureOrSuccessOption: none(),
                isUpdatingStock: false,
              ),
            );
          },
        );
      },
    );
  }
}
