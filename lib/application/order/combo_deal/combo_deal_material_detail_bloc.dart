import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_list_repository.dart';
import 'package:ezrxmobile/domain/order/repository/i_product_details_repository.dart';
import 'package:ezrxmobile/domain/order/repository/i_stock_info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_material_detail_event.dart';
part 'combo_deal_material_detail_state.dart';
part 'combo_deal_material_detail_bloc.freezed.dart';

class ComboDealMaterialDetailBloc
    extends Bloc<ComboDealMaterialDetailEvent, ComboDealMaterialDetailState> {
  final IProductDetailRepository productDetailRepository;
  final IMaterialListRepository materialListRepository;
  final Config config;
  final IStockInfoRepository stockInfoRepository;

  ComboDealMaterialDetailBloc({
    required this.productDetailRepository,
    required this.materialListRepository,
    required this.config,
    required this.stockInfoRepository,
  }) : super(ComboDealMaterialDetailState.initial()) {
    on<ComboDealMaterialDetailEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ComboDealMaterialDetailEvent event,
    Emitter<ComboDealMaterialDetailState> emit,
  ) async {
    await event.map(
      initialize: (e) {
        emit(
          ComboDealMaterialDetailState.initial().copyWith(
            customerCodeInfo: e.customerCodeInfo,
            salesOrganisation: e.salesOrganisation,
            shipToInfo: e.shipToInfo,
          ),
        );
      },
      setPriceInfo: (e) {
        final itemsWithPriceInfo =
            Map<MaterialNumber, PriceAggregate>.from(state.items);

        e.priceMap.forEach(
          (key, value) {
            if (itemsWithPriceInfo[key] != null) {
              itemsWithPriceInfo[key] = itemsWithPriceInfo[key]!.copyWith(
                price: value.price,
              );
            }
          },
        );
        emit(
          state.copyWith(
            isFetchingPrice: false,
            items: itemsWithPriceInfo,
          ),
        );
      },
      updateItemQuantity: (e) {
        final items = Map<MaterialNumber, PriceAggregate>.from(state.items);

        if (items[e.item] == null) return;

        final comboItem =
            items[e.item]!.comboDeal.singleDeal(materialNumber: e.item);

        if (e.qty > comboItem.minQty) {
          items[e.item] = items[e.item]!.copyWith(quantity: e.qty);
        } else {
          items[e.item] = items[e.item]!.copyWith(quantity: comboItem.minQty);
        }

        emit(
          state.copyWith(
            items: items,
          ),
        );
      },
      updateItemSelection: (e) {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
          ),
        );
        final selectionStatus =
            Map<MaterialNumber, bool>.from(state.selectedItems);

        selectionStatus[e.item] = !(selectionStatus[e.item] ?? false);

        switch (state.currentDeal.scheme) {
          case ComboDealScheme.k1:
            final selectAllItems =
                selectionStatus.entries.every((element) => element.value);

            if (selectAllItems) {
              emit(
                state.copyWith(
                  selectedItems: selectionStatus,
                ),
              );
            } else {
              emit(
                state.copyWith(
                  apiFailureOrSuccessOption: optionOf(
                    const Left(
                      ApiFailure.other(
                        'All items in this combo are mandatory.',
                      ),
                    ),
                  ),
                ),
              );
            }
            break;
          case ComboDealScheme.k21:
          case ComboDealScheme.k22:
          case ComboDealScheme.k3:
          case ComboDealScheme.k4:
          case ComboDealScheme.k42:
          case ComboDealScheme.k5:
            emit(
              state.copyWith(
                selectedItems: selectionStatus,
              ),
            );
            break;
        }
      },
      fetchComboDealDetail: (e) async {
        final items = e.comboDeal.allMaterialNumbers.fold(
          <MaterialNumber, PriceAggregate>{},
          (
            Map<MaterialNumber, PriceAggregate> map,
            MaterialNumber materialNumber,
          ) {
            map[materialNumber] = PriceAggregate.empty()
                .copyWith(salesOrgConfig: state.salesConfigs);

            return map;
          },
        );

        emit(
          state.copyWith(
            items: items,
            isFetchingComboInfo: true,
            isFetchingPrice: true,
            searchKey: SearchKey.empty(),
          ),
        );

        final materialsInfo = await _getMaterialsInfo(
          e.comboDeal.allMaterialNumbers,
          state.user.preferredLanguage,
        );

        if (materialsInfo.isNotEmpty) {
          for (final materialInfo in materialsInfo) {
            if (items[materialInfo.materialNumber] != null) {
              items[materialInfo.materialNumber] =
                  items[materialInfo.materialNumber]!
                      .copyWith(
                        materialInfo: materialInfo.copyWith(
                          parentID:
                              e.parentMaterialNumber.getOrDefaultValue(''),
                        ),
                      )
                      .copyWithComboDealMinQty(e.comboDeal);
            }
          }
        }

        final stockInfoList = await _getStockInfoList(materialsInfo);
        if (isClosed) return;
        if (stockInfoList.isNotEmpty) {
          for (final materialStockInfo in stockInfoList) {
            final material = items[materialStockInfo.materialNumber];

            if (material != null && materialStockInfo.stockInfos.isNotEmpty) {
              items[materialStockInfo.materialNumber] = material
                  .copyWith(
                    stockInfo: materialStockInfo.stockInfos.first,
                    stockInfoList: materialStockInfo.stockInfos,
                  )
                  .copyWithComboDealMinQty(e.comboDeal);
            }
          }
        }

        final currentQuantityMap = e.comboMaterialsCurrentQuantity;
        if (currentQuantityMap.isNotEmpty) {
          currentQuantityMap.forEach((key, value) {
            items[key] = items[key]!.copyWith(quantity: value);
          });
        }

        final selectedItems = <MaterialNumber, bool>{};

        selectedItems.addAll(
          {
            for (final item in items.values)
              item.getMaterialNumber: _isMaterialSelected(
                cartComboMaterialsSelected: currentQuantityMap,
                item: item,
              ),
          },
        );

        emit(
          state.copyWith(
            items: items,
            selectedItems: selectedItems,
            isFetchingComboInfo: false,
          ),
        );
      },
      clearSearch: (_) {
        emit(
          state.copyWith(
            searchKey: SearchKey.empty(),
          ),
        );
      },
      search: (e) {
        if (!e.searchKey.isValid()) return;

        emit(state.copyWith(searchKey: e.searchKey));
      },
      cartContainsCurrentCombo: (e) {
        emit(
          state.copyWith(
            isUpdateCart: e.contain,
            items: e.contain
                ? state.items
                : state.resetCurrentDealQuantityMapItems,
          ),
        );
      },
      fetchComboDealPrincipal: (e) async {
        emit(
          state.copyWith(
            items: {},
            isFetchingComboInfo: true,
            isFetchingPrice: true,
            searchKey: SearchKey.empty(),
            nextPageIndex: 0,
            canLoadMore: true,
            materialCount: 0,
          ),
        );

        final items = <MaterialNumber, PriceAggregate>{};
        final selectedItems = <MaterialNumber, bool>{};
        final currentQuantityMap = e.comboMaterialsCurrentQuantity;

        final materialsNextPage = currentQuantityMap.keys.toList();

        if (materialsNextPage.isNotEmpty) {
          items.addAll({
            for (final material in materialsNextPage)
              material: PriceAggregate.empty(),
          });
          selectedItems.addAll({
            for (final material in materialsNextPage) material: true,
          });

          final materialsInfo = await _getMaterialsInfo(
            materialsNextPage,
            state.user.preferredLanguage,
          );

          if (materialsInfo.isNotEmpty) {
            for (final materialInfo in materialsInfo) {
              if (items[materialInfo.materialNumber] != null) {
                items[materialInfo.materialNumber] =
                    items[materialInfo.materialNumber]!.copyWith(
                  materialInfo: materialInfo,
                  comboDeal: e.comboDeal,
                  salesOrgConfig: state.salesConfigs,
                );
              }
            }
          }
        }

        final failureOrSuccess =
            await materialListRepository.getComboDealMaterials(
          user: state.user,
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          pageSize: config.pageSize,
          offset: 0,
          principles: e.principles,
          salesOrgConfig: state.salesConfigs,
        );
        await failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetchingComboInfo: false,
                isFetchingPrice: false,
              ),
            );
          },
          (materialResponse) async {
            items.addAll(
              materialResponse.products
                  .map(
                    (material) => PriceAggregate.empty().copyWith(
                      materialInfo: material,
                      salesOrgConfig: state.salesConfigs,
                      comboDeal: e.comboDeal,
                    ),
                  )
                  .toList()
                  .mapByMaterialNumber,
            );
            emit(
              state.copyWith(
                items: items,
                materialCount: materialResponse.count,
                canLoadMore:
                    materialResponse.products.length >= config.pageSize,
                nextPageIndex: 1,
              ),
            );

            final stockInfoList =
                await _getStockInfoList(state.allMaterialsInfo);
            if (isClosed) return;
            if (stockInfoList.isNotEmpty) {
              for (final materialStockInfo in stockInfoList) {
                final material = items[materialStockInfo.materialNumber];

                if (material != null &&
                    materialStockInfo.stockInfos.isNotEmpty) {
                  items[materialStockInfo.materialNumber] = material.copyWith(
                    stockInfo: materialStockInfo.stockInfos.first,
                    stockInfoList: materialStockInfo.stockInfos,
                    materialInfo: material.materialInfo.copyWith(
                      parentID: e.parentMaterialNumber.getOrDefaultValue(''),
                    ),
                  );
                }
              }
            }

            if (currentQuantityMap.isNotEmpty) {
              currentQuantityMap.forEach((key, value) {
                if (items.containsKey(key)) {
                  items[key] = items[key]!.copyWith(quantity: value);
                }
              });
            }

            selectedItems.addAll(
              {
                for (final item in items.values)
                  item.getMaterialNumber: _isMaterialSelected(
                    cartComboMaterialsSelected: currentQuantityMap,
                    item: item,
                  ),
              },
            );

            emit(
              state.copyWith(
                items: items,
                selectedItems: selectedItems,
                isFetchingComboInfo: false,
              ),
            );
          },
        );
      },
      loadMoreComboDealPrincipal: (e) async {
        if (state.isLoadMore || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isLoadMore: true,
          ),
        );
        final failureOrSuccess =
            await materialListRepository.getComboDealMaterials(
          user: state.user,
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          pageSize: config.pageSize,
          offset: state.nextPageIndex * config.pageSize,
          principles: e.principles,
          salesOrgConfig: state.salesConfigs,
        );
        await failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isLoadMore: false,
              ),
            );
          },
          (materialResponse) async {
            final parentMaterialNumber =
                state.items.values.first.materialInfo.parentID;
            final newItems = materialResponse.products
                .map(
                  (material) => PriceAggregate.empty().copyWith(
                    materialInfo: material.copyWith(
                      parentID: parentMaterialNumber,
                    ),
                    salesOrgConfig: state.salesConfigs,
                    comboDeal: e.comboDeal,
                  ),
                )
                .toList()
                .mapByMaterialNumber;

            final items = Map<MaterialNumber, PriceAggregate>.from(state.items);

            final selectedItems =
                Map<MaterialNumber, bool>.from(state.selectedItems);

            for (final item in newItems.values) {
              if (!items.containsKey(item.getMaterialNumber)) {
                items.putIfAbsent(item.getMaterialNumber, () => item);
                selectedItems.putIfAbsent(
                  item.getMaterialNumber,
                  () => _isMaterialSelected(
                    cartComboMaterialsSelected: {},
                    item: item,
                  ),
                );
              }
            }

            final stockInfoList = await _getStockInfoList(
              newItems.entries.map((e) => e.value.materialInfo).toList(),
            );
            if (isClosed) return;
            if (stockInfoList.isNotEmpty) {
              for (final materialStockInfo in stockInfoList) {
                final material = items[materialStockInfo.materialNumber];

                if (material != null &&
                    materialStockInfo.stockInfos.isNotEmpty) {
                  items[materialStockInfo.materialNumber] = material.copyWith(
                    stockInfo: materialStockInfo.stockInfos.first,
                    stockInfoList: materialStockInfo.stockInfos,
                  );
                }
              }
            }

            emit(
              state.copyWith(
                items: items,
                selectedItems: selectedItems,
                isLoadMore: false,
                canLoadMore: newItems.length >= config.pageSize,
                nextPageIndex: state.nextPageIndex + 1,
              ),
            );
          },
        );
      },
      clearSelectedItem: (_) {
        final selectedItems = <MaterialNumber, bool>{};

        selectedItems.addAll(
          {
            for (final item in state.items.values)
              item.getMaterialNumber: _isMaterialSelected(
                cartComboMaterialsSelected: {},
                item: item,
              ),
          },
        );

        emit(
          state.copyWith(
            selectedItems: selectedItems,
          ),
        );
      },
    );
  }

  Future<List<MaterialStockInfo>> _getStockInfoList(
    List<MaterialInfo> materialsInfo,
  ) async {
    final failureOrSuccessStockList =
        await stockInfoRepository.getStockInfoList(
      customerCodeInfo: state.customerCodeInfo,
      salesOrganisation: state.salesOrganisation,
      materials: materialsInfo.map((e) => e.materialNumber).toList(),
      shipToInfo: state.shipToInfo,
    );

    return failureOrSuccessStockList.fold(
      (failure) async => [],
      (materialsStockInfo) => materialsStockInfo,
    );
  }

  Future<List<MaterialInfo>> _getMaterialsInfo(
    List<MaterialNumber> items,
    Language language,
  ) async {
    final failureOrSuccessProductDetails =
        await productDetailRepository.getProductListDetail(
      customerCodeInfo: state.customerCodeInfo,
      language: language,
      materialNumber: items,
      salesOrganisation: state.salesOrganisation,
      shipToInfo: state.shipToInfo,
      types: items.map((e) => MaterialInfoType('material')).toList(),
    );

    return failureOrSuccessProductDetails.fold(
      (failure) => [],
      (materialsInfo) => materialsInfo,
    );
  }

  bool _isMaterialSelected({
    required Map<MaterialNumber, int> cartComboMaterialsSelected,
    required PriceAggregate item,
  }) {
    return cartComboMaterialsSelected.containsKey(item.getMaterialNumber)
        ? true
        : item.selfComboDeal.mandatory;
  }
}
