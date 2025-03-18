import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/tr_object.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/apl_get_total_price.dart';
import 'package:ezrxmobile/domain/order/entities/apl_product.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/repository/i_cart_repository.dart';
import 'package:ezrxmobile/domain/order/repository/i_product_details_repository.dart';
import 'package:ezrxmobile/domain/order/repository/i_stock_info_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/num_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_bloc.freezed.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository repository;
  final IProductDetailRepository productDetailRepository;
  final IStockInfoRepository stockInfoRepository;

  CartBloc(
    this.repository,
    this.productDetailRepository,
    this.stockInfoRepository,
  ) : super(CartState.initial()) {
    on<CartEvent>(_onEvent);
  }

  Future<void> _onEvent(CartEvent event, Emitter<CartState> emit) async {
    await event.map(
      initialized: (e) {
        emit(
          CartState.initial().copyWith(
            salesOrganisation: e.salesOrganisation,
            config: e.salesOrganisationConfigs,
            customerCodeInfo: e.customerCodeInfo,
            shipToInfo: e.shipToInfo,
            user: e.user,
          ),
        );
        add(
          const CartEvent.fetchProductsAddedToCart(),
        );
      },
      verifyMaterialDealBonus: (e) async {
        final material = e.item;
        if (material != PriceAggregate.empty()) {
          emit(
            state.copyWith(
              cartProducts: e.items.priceAggregateWithDiscountedCount,
            ),
          );
          if (!material.refreshAddedBonus) {
            return;
          }
        }
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetchingBonus: true,
          ),
        );

        final failureOrSuccess =
            await stockInfoRepository.updateStockForMaterialDealBonus(
          materials: e.items,
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisationConfigs: state.config,
          salesOrganisation: state.salesOrganisation,
          shipToInfo: state.shipToInfo,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetchingBonus: false,
              ),
            );
          },
          (cartItemList) {
            final newCartProductList = _mappingPreviousInfo(
              currentCartProducts: cartItemList,
            );

            emit(
              state.copyWith(
                cartProducts:
                    newCartProductList.priceAggregateWithDiscountedCount,
                apiFailureOrSuccessOption: none(),
                isFetchingBonus: false,
              ),
            );
          },
        );
      },
      addBonusToCartItem: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            upsertBonusItemInProgressHashCode:
                List.from(state.upsertBonusItemInProgressHashCode)
                  ..add(e.bonusMaterial.hashCode),
            isUpserting: true,
          ),
        );

        final failureOrSuccess = await repository.upsertCart(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          salesOrganisationConfig: state.config,
          shipToInfo: state.shipToInfo,
          materialInfo: e.bonusMaterial,
          quantity: e.bonusMaterial.quantity.intValue,
          language: state.user.preferredLanguage,
          counterOfferDetails: e.counterOfferDetails,
          itemId: e.bonusItemId.getValue(),
          tenderContractNumber: '',
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                upsertBonusItemInProgressHashCode:
                    List.from(state.upsertBonusItemInProgressHashCode)
                      ..remove(e.bonusMaterial.hashCode),
                isUpserting: false,
              ),
            );
          },
          (cartProductList) {
            final cartProductListTemp = List<PriceAggregate>.from(
              cartProductList,
            );
            for (var i = 0; i < cartProductListTemp.length; i++) {
              final priceAggregate = state.cartProducts.firstWhere(
                (element) =>
                    element.materialInfo.materialNumber ==
                    cartProductList[i].materialInfo.materialNumber,
                orElse: () => PriceAggregate.empty(),
              );
              final bonusList = cartProductList[i]
                  .bonusSampleItems
                  .map(
                    (item) => item.copyWith(bonusOverrideFlag: true),
                  )
                  .toList();

              cartProductListTemp[i] = cartProductListTemp[i].copyWith(
                price: priceAggregate.price,
                bonusSampleItems: bonusList,
                bundle: priceAggregate.bundle,
                salesOrgConfig: state.config,
                stockInfoList: priceAggregate.stockInfoList,
              );
            }

            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                cartProducts: cartProductListTemp,
                isUpserting: false,
                upsertBonusItemInProgressHashCode:
                    List.from(state.upsertBonusItemInProgressHashCode)
                      ..remove(e.bonusMaterial.hashCode),
              ),
            );

            add(
              _VerifyMaterialDealBonus(
                item: cartProductListTemp
                        .where((element) {
                          return element.materialInfo.materialNumber ==
                              e.bonusMaterial.materialNumber;
                        })
                        .toList()
                        .firstOrNull ??
                    PriceAggregate.empty(),
                items: cartProductListTemp,
              ),
            );
          },
        );
      },
      removeSampleBonusFromCartConfig: (e) async {
        emit(
          state.copyWith(
            isClearing: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess = await repository.removeSelectedProducts(
          salesOrganisation: state.salesOrganisation,
          salesOrganisationConfig: state.config,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          language: state.user.preferredLanguage,
          products: state.invalidSampleBonusList,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isClearing: false,
              ),
            );
          },
          (products) {
            final newCartProductList = _mappingPreviousInfo(
              currentCartProducts: products,
            );
            emit(
              state.copyWith(
                cartProducts: newCartProductList,
                apiFailureOrSuccessOption: none(),
                isClearing: false,
              ),
            );
          },
        );
      },
      clearCart: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isClearing: true,
          ),
        );

        final failureOrSuccess = await repository.clearCart();
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isClearing: false,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (_) => emit(
            CartState.initial().copyWith(
              config: state.config,
              shipToInfo: state.shipToInfo,
              salesOrganisation: state.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
              user: state.user,
            ),
          ),
        );
      },

      ///TODO: will be used while implementing batch selection

      // updateBatchInCartItem: (e) {
      //   emit(
      //     state.copyWith(
      //       isFetching: true,
      //       apiFailureOrSuccessOption: none(),
      //     ),
      //   );

      /*final failureOrSuccess = await repository.updatedBatchInCartItem(
          item: e.item,
          stockInfo: e.stockInfo,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (cartItemList) {
            emit(
              state.copyWith(
                cartItems: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );*/
      // },
      fetchProductsAddedToCart: (e) async {
        if (state.isFetching) return;

        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
            cartProducts: <PriceAggregate>[],
          ),
        );

        final failureOrSuccess = await repository.getAddedToCartProductList(
          language: state.user.preferredLanguage,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (cart) {
            final isShipToCodeDifferent = cart.cartShipToCustomerCode !=
                state.shipToInfo.shipToCustomerCode;
            final isCustomerCodeDifferent = cart.cartCustomerCode !=
                state.customerCodeInfo.customerCodeSoldTo;

            if ((isCustomerCodeDifferent || isShipToCodeDifferent) &&
                !isClosed) {
              add(const _ClearCart());

              return;
            }

            final priceAggregateAddedToCartList = cart.cartProducts
                .map(
                  (element) => element.toCartProduct,
                )
                .toList();

            emit(
              state.copyWith(
                cartProducts: priceAggregateAddedToCartList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
            if (priceAggregateAddedToCartList.isNotEmpty && !isClosed) {
              add(
                _GetDetailsProductsAddedToCart(
                  cartProducts: priceAggregateAddedToCartList,
                ),
              );
            }
          },
        );
      },
      upsertCart: (e) async {
        final index = state.cartProducts.indexWhere(
          (element) =>
              element.materialInfo.materialNumber ==
              e.priceAggregate.materialInfo.materialNumber,
        );
        final isCounterOfferRequested =
            e.priceAggregate.materialInfo.counterOfferDetails !=
                RequestCounterOfferDetails.empty();
        if (index != -1) {
          final previousQuantity = state.cartProducts.elementAtOrNull(index);
          if (previousQuantity?.quantity == e.priceAggregate.quantity &&
              !isCounterOfferRequested) {
            return;
          }
        }
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isUpserting: true,
          ),
        );

        final failureOrSuccess = await repository.upsertCartWithBonus(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          salesOrganisationConfig: state.config,
          shipToInfo: state.shipToInfo,
          product: e.priceAggregate,
          language: state.user.preferredLanguage,
          counterOfferDetails:
              e.priceAggregate.materialInfo.counterOfferDetails.copyWith(
            counterOfferCurrency: state.config.currency,
          ),
          banner: e.banner,
        );

        await failureOrSuccess.fold(
          (failure) async {
            if (failure == const ApiFailure.cartHasDifferentAddress()) {
              final failureOrSuccess = await repository.clearCart();
              if (isClosed) return;
              failureOrSuccess.fold(
                (failure) => emit(
                  state.copyWith(
                    apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                    isUpserting: false,
                  ),
                ),
                (_) =>
                    add(CartEvent.upsertCart(priceAggregate: e.priceAggregate)),
              );

              return;
            }
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isUpserting: false,
              ),
            );
          },
          (cartProductList) {
            final newCartProductList = _mappingPreviousInfo(
              currentCartProducts: cartProductList,
              isUpserting: true,
            );

            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                cartProducts: newCartProductList,
                isUpserting: false,
              ),
            );
            if (newCartProductList.isNotEmpty) {
              add(const CartEvent.updateProductStock());

              add(const CartEvent.fetchGrandTotalPriceForIdMarket());
            }
          },
        );
      },
      addHistoryItemsToCart: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isBuyAgain: true,
          ),
        );

        final failureOrSuccess = await repository.addHistoryItemsToCart(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          salesOrganisationConfig: state.config,
          shipToInfo: state.shipToInfo,
          materialInfo: e.items
              .map((item) {
                final material = item.materialInfo;
                final addedQty = material.quantity.intValue;

                if (material.type.typeBundle) {
                  final cartQty = state.getQuantityOfBundle(
                    bundleCode: material.parentID,
                    materialNumber: material.materialNumber,
                  );

                  return [
                    material.copyWith(
                      quantity: MaterialQty(cartQty + addedQty),
                    ),
                  ];
                }

                final cartQty = state.getQuantityOfProduct(
                  productNumber: material.materialNumber,
                );
                final newPriceAggregate = item.copyWith(
                  quantity: cartQty + addedQty,
                  materialInfo: material.copyWith(
                    quantity: MaterialQty(cartQty + addedQty),
                  ),
                );

                return [
                  newPriceAggregate.materialInfo,
                  ...newPriceAggregate.dealBonusList,
                ];
              })
              .flattened
              .toList(),
          language: state.user.preferredLanguage,
          counterOfferDetails: e.counterOfferDetails,
          itemId: '',
          tenderContractDetails: e.tenderContractList,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isBuyAgain: false,
              ),
            );
          },
          (cartProductList) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                isBuyAgain: false,
                cartProducts: cartProductList,
              ),
            );
            add(const CartEvent.updateProductStock());
          },
        );
      },
      upsertCartItems: (e) async {
        final index = state.cartProducts.indexWhere(
          (element) =>
              element.materialInfo.materialNumber ==
              e.priceAggregate.materialInfo.materialNumber,
        );

        if (index != -1) {
          final cartItem = state.cartProducts[index];

          final noDifference = cartItem.bundle.materials.every((bundleItem) {
            final item = e.priceAggregate.bundle.materials.firstWhereOrNull(
              (element) => element.materialNumber == bundleItem.materialNumber,
            );

            return item?.quantity == bundleItem.quantity;
          });

          if (noDifference) return;
        }
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isUpserting: true,
          ),
        );

        final failureOrSuccess = await repository.upsertCartItems(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          shipToInfo: state.shipToInfo,
          product: e.priceAggregate,
          language: state.user.preferredLanguage,
          banner: e.banner,
        );

        await failureOrSuccess.fold(
          (failure) async {
            if (failure == const ApiFailure.cartHasDifferentAddress()) {
              final failureOrSuccess = await repository.clearCart();
              if (isClosed) return;
              failureOrSuccess.fold(
                (failure) => emit(
                  state.copyWith(
                    apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                    isUpserting: false,
                  ),
                ),
                (_) => add(
                  CartEvent.upsertCartItems(
                    priceAggregate: e.priceAggregate,
                  ),
                ),
              );

              return;
            }
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isUpserting: false,
              ),
            );
          },
          (cartProductList) {
            final cartProductListTemp = cartProductList.map((cartProduct) {
              final priceAggregate = state.cartProducts
                      .where(
                        (element) =>
                            element.materialInfo.materialNumber ==
                            cartProduct.materialInfo.materialNumber,
                      )
                      .toList()
                      .firstOrNull ??
                  PriceAggregate.empty();

              return cartProduct.copyWith(
                price: priceAggregate.price,
                salesOrgConfig: state.config,
              );
            }).toList();

            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                isUpserting: false,
                cartProducts: cartProductListTemp,
              ),
            );

            add(const _UpdateProductStock());
          },
        );
      },
      getDetailsProductsAddedToCart: (e) async {
        add(const _UpdateProductStock());

        if (state.isFetchingCartProductDetail) return;

        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            config: state.config,
            isFetchingCartProductDetail: true,
          ),
        );

        final materialNumberList = <MaterialNumber>[];

        for (final cartProduct in e.cartProducts) {
          if (cartProduct.materialInfo.type.typeMaterial) {
            materialNumberList.add(cartProduct.getMaterialNumber);
          } else if (cartProduct.materialInfo.type.typeBundle) {
            materialNumberList.addAll(
              cartProduct.bundle.materials
                  .map((material) => material.materialNumber),
            );
          } else if (cartProduct.materialInfo.type.typeCombo) {
            materialNumberList.addAll(
              cartProduct.comboMaterials
                  .map((comboMaterial) => comboMaterial.productId),
            );
          }
          materialNumberList.addAll(
            cartProduct.bonusSampleItems.map((e) => e.materialNumber),
          );
        }

        final failureOrSuccess =
            await productDetailRepository.getProductsMetaData(
          materialNumbers: materialNumberList,
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetchingCartProductDetail: false,
              ),
            );
          },
          (newMetaData) {
            final newProductInfoMap = Map<MaterialNumber, ProductMetaData>.from(
              state.additionInfo,
            )..addAll(newMetaData.metaDataMap);

            emit(
              state.copyWith(
                additionInfo: newProductInfoMap,
                apiFailureOrSuccessOption: none(),
                isFetchingCartProductDetail: false,
              ),
            );
          },
        );
      },
      updatePriceProduct: (e) async {
        emit(
          state.copyWith(
            isMappingPrice: true,
          ),
        );
        var newCartProducts = state.cartProducts;

        if (state.isCounterOfferProductResetRequired) {
          final failureOrSuccess = await repository.removeSelectedProducts(
            salesOrganisation: state.salesOrganisation,
            salesOrganisationConfig: state.config,
            customerCodeInfo: state.customerCodeInfo,
            shipToInfo: state.shipToInfo,
            language: state.user.preferredLanguage,
            products: [
              ...state.productsWithCounterOfferPrice,
              ...state.productsWithCounterOfferDiscount,
            ],
          );
          if (isClosed) return;
          failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                isMappingPrice: false,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            ),
            (updatedCartProducts) => newCartProducts = updatedCartProducts,
          );
        }

        final cartProductList = newCartProducts
            .map((element) {
              final originalPrice =
                  e.priceProducts[element.materialInfo.materialNumber] ??
                      Price.empty();
              final counterOfferDetails =
                  element.materialInfo.counterOfferDetails;
              final updatedPrice = counterOfferDetails.hasCounterOffer
                  ? originalPrice.offerPriceWithDiscount(counterOfferDetails)
                  : originalPrice;

              return element.copyWith(
                salesOrgConfig: state.config,
                price: updatedPrice,
                exceedQuantity: element.materialInfo.materialQtyConfirmZDP5Rule(
                  element.price.zdp5MaxQuota.intValue,
                  element.price.zdp5RemainingQuota.intValue,
                ),
              );
            })
            .toList()
            .priceAggregateWithDiscountedCount;

        emit(
          state.copyWith(
            isMappingPrice: false,
            cartProducts: cartProductList,
          ),
        );

        add(
          _VerifyMaterialDealBonus(
            item: PriceAggregate.empty(),
            items: cartProductList,
          ),
        );
      },
      updateCartProductWithCounterOffer: (e) {
        emit(
          state.copyWith(
            isMappingPrice: true,
          ),
        );

        final cartProductList = state.cartProducts.map((element) {
          final updatedPrice = element.materialInfo.materialNumber ==
                  e.overriddenProductPrice.materialNumber
              ? e.overriddenProductPrice
              : element.price;

          return element.copyWith(
            price: updatedPrice,
          );
        }).toList();

        emit(
          state.copyWith(
            isMappingPrice: false,
            cartProducts: cartProductList,
          ),
        );
      },
      updateProductStock: (e) async {
        emit(
          state.copyWith(
            isUpdatingStock: true,
          ),
        );

        final failureOrSuccess =
            await stockInfoRepository.getMappedStockInfoList(
          items: state.cartProducts
              .map(
                (element) => element.toStockListMaterials,
              )
              .expand((element) => element)
              .toList(),
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisationConfigs: state.config,
          salesOrganisation: state.salesOrganisation,
          shipToInfo: state.shipToInfo,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isUpdatingStock: false,
              ),
            );
          },
          (newStockFetched) {
            final updatedCartStockList = state.cartProducts.map((cartProduct) {
              if (cartProduct.materialInfo.type.typeMaterial) {
                return cartProduct.copyWith(
                  stockInfoList: newStockFetched[
                          cartProduct.materialInfo.materialNumber] ??
                      <StockInfo>[],
                  salesOrgConfig: state.config,
                );
              } else if (cartProduct.materialInfo.type.typeBundle) {
                final materialInfoList =
                    List<MaterialInfo>.from(cartProduct.bundle.materials);
                final updatedMaterialInfoList = materialInfoList.map((info) {
                  return info.copyWithStock(
                    stockInfos:
                        newStockFetched[info.materialNumber] ?? <StockInfo>[],
                  );
                }).toList();

                return cartProduct.copyWith(
                  bundle: cartProduct.bundle.copyWith(
                    materials: updatedMaterialInfoList,
                  ),
                );
              } else if (cartProduct.materialInfo.type.typeCombo) {
                return cartProduct.copyWith(
                  comboMaterials: cartProduct.comboMaterials
                      .map(
                        (comboMaterial) => comboMaterial.copyWith(
                          salesOrgConfig: state.config,
                          materialInfo:
                              comboMaterial.materialInfo.copyWithStock(
                            stockInfos: newStockFetched[comboMaterial
                                    .materialInfo.materialNumber] ??
                                <StockInfo>[],
                          ),
                        ),
                      )
                      .toList(),
                );
              } else {
                return cartProduct;
              }
            }).toList();
            emit(
              state.copyWith(
                cartProducts: updatedCartStockList,
                apiFailureOrSuccessOption: none(),
                isUpdatingStock: false,
              ),
            );
          },
        );
      },
      removeInvalidProducts: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isClearing: true,
          ),
        );

        final failureOrSuccess = await repository.removeSelectedProducts(
          salesOrganisation: state.salesOrganisation,
          salesOrganisationConfig: state.config,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          language: state.user.preferredLanguage,
          products: e.invalidCartItems,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isClearing: false,
              ),
            );
          },
          (products) {
            final newCartProductList = _mappingPreviousInfo(
              currentCartProducts: products,
            );
            emit(
              state.copyWith(
                cartProducts: newCartProductList,
                apiFailureOrSuccessOption: none(),
                isClearing: false,
              ),
            );
          },
        );
      },
      upsertCartItemsWithComboOffers: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isUpserting: true,
            isDeleteCombo: false,
          ),
        );

        final failureOrSuccess =
            await repository.upsertCartItemsWithComboOffers(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          shipToInfo: state.shipToInfo,
          products: e.priceAggregates,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isUpserting: false,
              ),
            );
          },
          (cartProductList) {
            final newCartProductList = _mappingPreviousInfo(
              currentCartProducts: cartProductList,
            );
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                isUpserting: false,
                cartProducts: newCartProductList,
                isDeleteCombo: e.isDeleteCombo,
              ),
            );
          },
        );
      },
      fetchGrandTotalPriceForIdMarket: (_) async {
        if (!state._isID) return;

        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isAplProductLoading: true,
            aplGetTotalPrice: AplGetTotalPrice.empty(),
          ),
        );

        final failureOrSuccess =
            await repository.fetchGrandTotalPriceForIdMarket(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          materialNumbers: state.cartProducts.materialNumbers,
          totalPrice: state.totalMaterialsPrice,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isAplProductLoading: false,
            ),
          ),
          (aplGetTotalPrice) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: none(),
              isAplProductLoading: false,
              aplGetTotalPrice: aplGetTotalPrice,
            ),
          ),
        );
      },
      updatePriceForIdMarket: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isAplProductLoading: true,
            aplSimulatorOrder: AplSimulatorOrder.empty(),
          ),
        );

        final failureOrSuccess = await repository.aplSimulateOrder(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          product: state.cartProducts.materialInfos,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isAplProductLoading: false,
            ),
          ),
          (aplSimulatorOrder) {
            final productDeterminationList =
                aplSimulatorOrder.productDeterminationList(state.cartProducts);
            final productDeterminationEligible =
                productDeterminationList.isNotEmpty;
            final updatedCartItems =
                aplSimulatorOrder.toCartItemList(state.cartProducts);

            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                isAplProductLoading: false,
                cartProducts: productDeterminationEligible
                    ? state.cartProducts
                    : updatedCartItems,
                aplSimulatorOrder: aplSimulatorOrder,
              ),
            );

            if (productDeterminationEligible) {
              add(
                CartEvent.updateProductDetermination(
                  productDeterminationList: productDeterminationList,
                  updatedCartItems: updatedCartItems,
                ),
              );
            }
          },
        );
      },
      updateProductDetermination: (e) async {
        emit(
          state.copyWith(
            isUpdateProductDetermination: true,
            updateFailureOrSuccessOption: none(),
          ),
        );

        final materialDetailFailureOrSuccess =
            await productDetailRepository.getProductListDetail(
          materialNumber:
              e.productDeterminationList.map((e) => e.materialNumber).toList(),
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          language: state.user.preferredLanguage,
          types: e.productDeterminationList
              .map((e) => MaterialInfoType.material())
              .toList(),
        );

        await materialDetailFailureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isUpdateProductDetermination: false,
                updateFailureOrSuccessOption:
                    optionOf(materialDetailFailureOrSuccess),
              ),
            );
          },
          (details) async {
            final detailsMap = {
              for (final item in details) item.materialNumber: item,
            };
            final productDeterminationMaterialInfo =
                e.productDeterminationList.map((e) {
              final materialInfo =
                  detailsMap[e.materialNumber] ?? MaterialInfo.empty();

              return materialInfo.copyWith(
                materialNumber: e.materialNumber,
                quantity: e.productQty,
              );
            }).toList();

            final reorderFailureOrSuccess =
                await repository.updateCartWithProductDetermination(
              productDeterminationList: productDeterminationMaterialInfo,
              updatedCartItems: e.updatedCartItems,
              salesOrganisation: state.salesOrganisation,
              salesOrganisationConfig: state.config,
              customerCodeInfo: state.customerCodeInfo,
              shipToInfo: state.shipToInfo,
              language: state.user.preferredLanguage,
            );

            reorderFailureOrSuccess.fold(
              (failure) {
                emit(
                  state.copyWith(
                    isUpdateProductDetermination: false,
                    updateFailureOrSuccessOption:
                        optionOf(reorderFailureOrSuccess),
                  ),
                );
              },
              (newCartItems) {
                emit(
                  state.copyWith(
                    isUpdateProductDetermination: false,
                    cartProducts: newCartItems,
                  ),
                );
                add(const CartEvent.updateProductStock());
              },
            );
          },
        );
      },
      updateTenderContract: (e) async {
        emit(
          state.copyWith(
            isTenderContractLoading: true,
          ),
        );

        final cartProductList = state.cartProducts.map((cartProduct) {
          final originalTenderContract =
              e.tenderContractList[cartProduct.materialInfo.materialNumber] ??
                  [];

          return cartProduct.copyWith(
            tenderContract: originalTenderContract.firstWhere(
              (element) =>
                  cartProduct.tenderContract.contractNumber ==
                  element.contractNumber,
              orElse: () => TenderContract.empty(),
            ),
          );
        }).toList();

        emit(
          state.copyWith(
            isTenderContractLoading: false,
            cartProducts: cartProductList,
          ),
        );
      },
    );
  }

  List<PriceAggregate> _mappingPreviousInfo({
    required List<PriceAggregate> currentCartProducts,
    bool isUpserting = false,
  }) {
    final previousCartProducts = state.cartProducts;

    return currentCartProducts.map((cartProduct) {
      final priceAggregate = previousCartProducts.firstWhere(
        (element) =>
            element.materialInfo.materialNumber ==
            cartProduct.materialInfo.materialNumber,
        orElse: () => PriceAggregate.empty(),
      );

      final bundleMaterial = cartProduct.bundle.materials.expand((current) {
        return priceAggregate.bundle.materials.where(
          (previous) => current.materialNumber == previous.materialNumber,
        );
      }).toList();
      final tenderContract = isUpserting
          ? cartProduct.tenderContract
          : priceAggregate.tenderContract;

      return cartProduct.copyWith(
        price: priceAggregate.price,
        bundle: cartProduct.bundle.copyWith(materials: bundleMaterial),
        salesOrgConfig: state.config,
        stockInfoList: priceAggregate.stockInfoList,
        tenderContract: tenderContract,
        exceedQuantity: priceAggregate.exceedQuantity
            ? priceAggregate.materialInfo.materialQtyConfirmZDP5Rule(
                priceAggregate.price.zdp5MaxQuota.intValue,
                priceAggregate.price.zdp5RemainingQuota.intValue,
              )
            : false,
        comboMaterials: _updatingComboMaterial(
          currentComboItem: cartProduct.comboMaterials,
          previousComboItem: priceAggregate.comboMaterials,
        ),
      );
    }).toList();
  }

  List<ComboMaterialItem> _updatingComboMaterial({
    required List<ComboMaterialItem> previousComboItem,
    required List<ComboMaterialItem> currentComboItem,
  }) =>
      currentComboItem.map((item) {
        //updated sales org config on material level of combos
        final updatedMaterial = item.copyWith(salesOrgConfig: state.config);

        if (updatedMaterial.materialInfo.productStockInfo.isEmpty) {
          //updated the stock information
          final matchingPreviousMaterial = previousComboItem.firstWhere(
            (previousMaterial) =>
                previousMaterial.materialInfo.materialNumber ==
                updatedMaterial.materialInfo.materialNumber,
            orElse: () => ComboMaterialItem.empty(),
          );

          if (matchingPreviousMaterial != ComboMaterialItem.empty()) {
            return updatedMaterial.copyWith(
              materialInfo: updatedMaterial.materialInfo.copyWith(
                stockInfos: matchingPreviousMaterial.materialInfo.stockInfos,
              ),
            );
          }
        }

        return updatedMaterial;
      }).toList();
}
