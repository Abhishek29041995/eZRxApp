import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/apl_get_total_price.dart';
import 'package:ezrxmobile/domain/order/entities/cart.dart';
import 'package:ezrxmobile/domain/order/entities/cart_product_request.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/repository/i_cart_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/material_banner_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_request_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_product_request_dto.dart';

import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';

class CartRepository implements ICartRepository {
  final Config config;
  final CartLocalDataSource cartLocalDataSource;
  final CartRemoteDataSource cartRemoteDataSource;
  final StockInfoLocalDataSource stockInfoLocalDataSource;
  final StockInfoRemoteDataSource stockInfoRemoteDataSource;
  final MixpanelService mixpanelService;
  final DeviceStorage deviceStorage;
  final MaterialBannerStorage materialBannerStorage;

  CartRepository({
    required this.config,
    required this.stockInfoLocalDataSource,
    required this.stockInfoRemoteDataSource,
    required this.mixpanelService,
    required this.cartLocalDataSource,
    required this.cartRemoteDataSource,
    required this.deviceStorage,
    required this.materialBannerStorage,
  });

  @override
  Future<Either<ApiFailure, Unit>> clearCart() async {
    if (config.appFlavor == Flavor.mock) {
      return const Right(unit);
    }

    try {
      await cartRemoteDataSource.deleteCart();
      await materialBannerStorage.clear();

      return const Right(unit);
    } on Exception catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  /*Future<CartItem> _verifyZdp5Discount({
    required CartItem cartItem,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    var updatedCartItem = cartItem;

    if (cartItem.materials.first.isPriceUpdateAvailable) {
      final newPrice = await getMaterialPriceWithZdp5Discount(
        customerCodeInfo: customerCodeInfo,
        item: cartItem,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
      );
      final overRidenPrice =
          newPrice.fold((failure) => Price.empty(), (newPrice) => newPrice);

      updatedCartItem = cartItem.copyWithPrice(
        exceedQty: cartItem.totalQty >
            cartItem.materials.first.price.zdp5RemainingQuota.intValue,
        newPrice: overRidenPrice.zdp5RemainingQuota.isValidValue
            ? overRidenPrice
            : overRidenPrice.copyWith(
                zdp5RemainingQuota:
                    updatedCartItem.materials.first.price.zdp5RemainingQuota,
              ),
      );
    }

    return updatedCartItem;
  }*/

  ///TODO: Might be used while developing ZMG group discount

  // @override
  // List<CartItem> updateDiscountQty({
  //   required List<CartItem> items,
  // }) =>
  //     items.map((item) {
  //       switch (item.itemType) {
  //         case CartItemType.material:
  //           final material = item.materials.first;
  //           var updatedMaterial = material.copyWith(discountedMaterialCount: 0);
  //           if (material.price.zmgDiscount) {
  //             updatedMaterial = material.copyWith(
  //               discountedMaterialCount: items.zmgMaterialsQty(
  //                 material.materialInfo.materialGroup2,
  //               ),
  //             );
  //           } else if (material.price.isTireDiscountEligible) {
  //             updatedMaterial = material.copyWith(
  //               discountedMaterialCount: material.quantity,
  //             );
  //           }
  //           return item.copyWith(
  //             materials: [updatedMaterial],
  //           );

  //         case CartItemType.bundle:
  //         case CartItemType.comboDeal:
  //           return item;
  //       }
  //     }).toList();

  /*void _trackAddToCartSuccessEvent(CartItem cartItem) {
    final isBannerClicked = cartItem.materials.firstWhere(
          (item) => item.banner != BannerItem.empty(),
          orElse: () => PriceAggregate.empty(),
        ) !=
        PriceAggregate.empty();
    final props = <String, dynamic>{
      TrackProps.productName:
          cartItem.materials.first.materialInfo.materialDescription,
      TrackProps.productNumber: cartItem
          .materials.first.materialInfo.materialNumber
          .getOrDefaultValue(''),
      TrackProps.productManufacturer: cartItem
          .materials.first.materialInfo.principalData.principalName
          .getOrDefaultValue(''),
      TrackProps.productCategory: cartItem
          .materials.first.materialInfo.materialGroup4.getMaterialGroup4Type,
      TrackProps.productTotalPrice:
          cartItem.materials.first.price.finalTotalPrice.getOrDefaultValue(0.0),
      TrackProps.productQty: cartItem.materials.first.quantity,
      TrackProps.bonusName: cartItem.materials.first.addedBonusList
          .map(
            (e) => e.materialDescription,
          )
          .toList(),
      TrackProps.bonusManufacturer: cartItem.materials.first.addedBonusList
          .map(
            (e) => e.materialInfo.principalData.principalName
                .getOrDefaultValue(''),
          )
          .toList(),
      TrackProps.bannerClicked: isBannerClicked,
      TrackProps.bannerId: cartItem.materials.first.banner.id.toString(),
      TrackProps.bannerTitle: cartItem.materials.first.banner.title,
      TrackProps.bannerType: cartItem.materials.first.banner.category,
    };

    mixpanelService.trackEvent(
      eventName: TrackEvents.addToCartSuccess,
      properties: props,
    );
  }*/

  /*StockInfo _getStockInfo({
    required List<StockInfo> stockInfoList,
    required MaterialNumber materialNumber,
  }) =>
      stockInfoList.firstWhere(
        (element) => element.materialNumber == materialNumber,
        orElse: () => StockInfo.empty(),
      );*/

  ///TODO: might be used while ZDP5 Discount implementation

  // Future<Either<ApiFailure, Price>> getMaterialPriceWithZdp5Discount({
  //   required SalesOrganisation salesOrganisation,
  //   required CustomerCodeInfo customerCodeInfo,
  //   required ShipToInfo shipToInfo,
  //   required CartItem item,
  // }) async {
  //   try {
  //     final salesOrgCode = salesOrganisation.salesOrg.getOrCrash();
  //     final customerCode = customerCodeInfo.customerCodeSoldTo;
  //     final shipToCode = shipToInfo.shipToCustomerCode;
  //     final price = item.materials.first.price;
  //     final exceedQuantity = item.materials.first.hasZdp5Validation;

  //     final priceData =
  //         await discountOverrideRemoteDataSource.getMaterialOverridePriceList(
  //       salesOrgCode: salesOrgCode,
  //       customerCode: customerCode,
  //       shipToCode: shipToCode,
  //       materialQuery: PriceDto.fromDomain(price)
  //           .materialQueryWithExceedQty(exceedQuantity),
  //     );

  //     return Right(priceData.first);
  //   } catch (e) {
  //     return Left(FailureHandler.handleFailure(e));
  //   }
  // }

  @override
  Future<Either<ApiFailure, Cart>> getAddedToCartProductList({
    required Language language,
  }) async {
    try {
      if (config.appFlavor == Flavor.mock) {
        try {
          final savedCartList =
              await cartLocalDataSource.getAddedToCartProductList();

          return Right(savedCartList);
        } catch (e) {
          return Left(FailureHandler.handleFailure(e));
        }
      }
      final savedCartList =
          await cartRemoteDataSource.getAddedToCartProductList(
        market: deviceStorage.currentMarket(),
        language: language.languageCode,
      );

      return Right(savedCartList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> upsertCart({
    required MaterialInfo materialInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    required String itemId,
    required int quantity,
    required RequestCounterOfferDetails counterOfferDetails,
    required String tenderContractNumber,
  }) async {
    if (quantity > config.maximumCartQuantity) {
      return Left(
        ApiFailure.maximumCartQuantityExceed(
          config.maximumCartQuantity.toString(),
        ),
      );
    }
    if (config.appFlavor == Flavor.mock) {
      try {
        final productList = await cartLocalDataSource.upsertCart();

        return Right(productList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final upsertCartRequest = CartProductRequest.toMaterialRequest(
        salesOrg: salesOrganisation.salesOrg,
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCustomerCode: shipToInfo.shipToCustomerCode,
        language: language.languageCode,
        materialInfo: materialInfo,
        itemId: itemId,
        quantity: quantity,
        counterOfferDetails: counterOfferDetails,
        tenderContractNumber: tenderContractNumber,
      );

      final productList = await cartRemoteDataSource.upsertCart(
        requestParams:
            CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
        market: deviceStorage.currentMarket(),
      );

      return Right(productList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> upsertCartWithBonus({
    required PriceAggregate product,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    required RequestCounterOfferDetails counterOfferDetails,
    EZReachBanner? banner,
  }) async {
    try {
      final products = [
        product.materialInfo.copyWith(
          quantity: MaterialQty(product.quantity),
        ),
        ...product.dealBonusList,
      ];
      var productList = <PriceAggregate>[];

      for (var i = 0; i < products.length; i++) {
        final upserCartResult = await upsertCart(
          materialInfo: products[i],
          salesOrganisation: salesOrganisation,
          salesOrganisationConfig: salesOrganisationConfig,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          language: language,
          itemId: products[i].sampleBonusItemId,
          quantity: products[i].quantity.intValue,
          counterOfferDetails: products[i].counterOfferDetails,
          tenderContractNumber:
              product.tenderContract.contractNumber.getOrDefaultValue(''),
        );

        if (upserCartResult.isLeft()) return upserCartResult;
        productList = upserCartResult.getOrElse(() => <PriceAggregate>[]);
      }

      if (product.quantity == 0) {
        if (product.materialInfo.type.typeBundle) {
          await materialBannerStorage.delete(
            materialNumbers: product.bundle.materials
                .map(
                  (e) =>
                      '${product.id.displayMatNo}_${e.materialNumber.displayMatNo}',
                )
                .toList(),
          );
        } else {
          await materialBannerStorage.delete(
            materialNumbers: [product.id.displayMatNo],
          );
        }
      } else {
        if (banner != null) {
          await materialBannerStorage.set(
            materialNumbers: [product.id.displayMatNo],
            banner: banner,
          );
        }
      }

      return Right(productList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> addHistoryItemsToCart({
    required List<MaterialInfo> materialInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    required String itemId,
    required RequestCounterOfferDetails counterOfferDetails,
    required Map<MaterialNumber, TenderContract> tenderContractDetails,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final productList = await cartLocalDataSource.upsertCart(
          type: UpsertCartLocalType.upsertCartItemsReorder,
        );

        return Right(productList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final productList = await cartRemoteDataSource.upsertCartItems(
        market: deviceStorage.currentMarket(),
        requestParams: materialInfo.map((materialInfo) {
          final tenderContractNumber =
              tenderContractDetails[materialInfo.materialNumber]
                      ?.contractNumber
                      .getOrDefaultValue('') ??
                  '';
          // For Reordering we are using [convertToMaterialRequest] it has all
          // the cases covered for materials, bundles, bonuses and combo's,
          // for bundles we are using this one because the [ParentID] and the
          // [Material Type] we are already receiving inside Material Info
          final upsertCartRequest = CartProductRequest.toMaterialRequest(
            salesOrg: salesOrganisation.salesOrg,
            customerCode: customerCodeInfo.customerCodeSoldTo,
            shipToCustomerCode: shipToInfo.shipToCustomerCode,
            language: language.languageCode,
            materialInfo: materialInfo,
            itemId: itemId,
            quantity: materialInfo.quantity.intValue,
            counterOfferDetails: counterOfferDetails,
            tenderContractNumber: tenderContractNumber,
          );

          return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
        }).toList(),
      );

      return Right(productList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> upsertCartItems({
    required PriceAggregate product,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    EZReachBanner? banner,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final productList = await cartLocalDataSource.upsertCart(
          type: UpsertCartLocalType.upsertCartItems,
        );

        return Right(productList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final productList = await cartRemoteDataSource.upsertCartItems(
        market: deviceStorage.currentMarket(),
        requestParams: product.bundle.materials.map((materialInfo) {
          final upsertCartRequest = CartProductRequest.toBundlesRequest(
            salesOrg: salesOrganisation.salesOrg,
            customerCode: customerCodeInfo.customerCodeSoldTo,
            shipToCustomerCode: shipToInfo.shipToCustomerCode,
            language: language,
            materialInfo: materialInfo,
            bundleCode: product.bundle.bundleCode,
          );

          return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
        }).toList(),
      );
      await materialBannerStorage.delete(
        materialNumbers: product.bundle.materials
            .where((item) => item.quantity.intValue == 0)
            .map(
              (e) =>
                  '${product.id.displayMatNo}_${e.materialNumber.displayMatNo}',
            )
            .toList(),
      );

      if (banner != null) {
        await materialBannerStorage.set(
          materialNumbers: product.bundle.materials
              .map(
                (e) =>
                    '${MaterialNumber(product.bundle.bundleCode).displayMatNo}_${e.materialNumber.displayMatNo}',
              )
              .toList(),
          banner: banner,
        );
      }

      return Right(productList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> removeSelectedProducts({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    required List<MaterialInfo> products,
  }) async {
    try {
      if (config.appFlavor == Flavor.mock) {
        final productList = await cartLocalDataSource.upsertCart();

        return Right(productList);
      }

      final productList = await cartRemoteDataSource.upsertCartItems(
        market: deviceStorage.currentMarket(),
        requestParams: products.map((materialInfo) {
          final upsertCartRequest = CartProductRequest.toMaterialRequest(
            salesOrg: salesOrganisation.salesOrg,
            customerCode: customerCodeInfo.customerCodeSoldTo,
            shipToCustomerCode: shipToInfo.shipToCustomerCode,
            language: language.languageCode,
            materialInfo: materialInfo,
            itemId: materialInfo.sampleBonusItemId,
            quantity: materialInfo.quantity.intValue,
            counterOfferDetails: materialInfo.counterOfferDetails,
            tenderContractNumber: '',
          );

          return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
        }).toList(),
      );

      return Right(productList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>>
      upsertCartItemsWithComboOffers({
    required List<PriceAggregate> products,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final productList = await cartLocalDataSource.upsertCart(
          type: UpsertCartLocalType.upsertCartItemsComboOffer,
        );

        return Right(productList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final productList = await cartRemoteDataSource.upsertCartItems(
        market: deviceStorage.currentMarket(),
        requestParams: products.comboMaterialItemList
            .map(
              (productUpsertRequest) => ComboProductRequestDto.fromDomain(
                comboProductRequest: productUpsertRequest,
                salesOrg: salesOrganisation.salesOrg.getOrDefaultValue(''),
                customerCode: customerCodeInfo.customerCodeSoldTo,
                shipToId: shipToInfo.shipToCustomerCode,
              ).toMap(),
            )
            .toList(),
      );

      return Right(productList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, AplSimulatorOrder>> aplSimulateOrder({
    required List<MaterialInfo> product,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final aplSimulatorOrder = await cartLocalDataSource.aplSimulateOrder();

        return Right(aplSimulatorOrder);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final materialQuantityPairList = product.map((item) {
        return {
          'material': item.materialNumber.getOrCrash(),
          'quantity': item.quantity.intValue.toString(),
        };
      }).toList();

      final aplSimulatorOrder = await cartRemoteDataSource.aplSimulateOrder(
        customerCode: customerCodeInfo.customerCodeSoldTo,
        salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
        materialQuantityPairList: materialQuantityPairList,
      );

      return Right(aplSimulatorOrder);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, AplGetTotalPrice>> fetchGrandTotalPriceForIdMarket({
    required List<MaterialNumber> materialNumbers,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required double totalPrice,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final aplGetTotalPrice = await cartLocalDataSource.aplGetTotalPrice();

        return Right(aplGetTotalPrice);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final materialNumberList =
          materialNumbers.map((item) => item.getOrCrash()).toList();

      final aplSimulatorOrder = await cartRemoteDataSource.aplGetTotalPrice(
        customerCode: customerCodeInfo.customerCodeSoldTo,
        salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
        materialNumbers: materialNumberList,
        totalPrice: totalPrice,
      );

      return Right(aplSimulatorOrder);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>>
      updateCartWithProductDetermination({
    required List<MaterialInfo> productDeterminationList,
    required List<PriceAggregate> updatedCartItems,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final productList = await cartLocalDataSource.upsertCart(
          type: UpsertCartLocalType.upsertCartItemsReorder,
        );

        return Right(productList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      await cartRemoteDataSource.deleteCart();
      final materialInfo = [
        ...productDeterminationList,
        ...updatedCartItems
            .map(
              (e) => [
                e.materialInfo.copyWith(quantity: MaterialQty(e.quantity)),
                ...e.existingProductDealBonus,
              ],
            )
            .flattened,
      ];

      final productList = await cartRemoteDataSource.upsertCartItems(
        market: deviceStorage.currentMarket(),
        requestParams: materialInfo.map((materialInfo) {
          final upsertCartRequest = CartProductRequest.toMaterialRequest(
            salesOrg: salesOrganisation.salesOrg,
            customerCode: customerCodeInfo.customerCodeSoldTo,
            shipToCustomerCode: shipToInfo.shipToCustomerCode,
            language: language.languageCode,
            materialInfo: materialInfo,
            itemId: materialInfo.sampleBonusItemId,
            quantity: materialInfo.quantity.intValue,
            counterOfferDetails: materialInfo.counterOfferDetails,
            tenderContractNumber: '',
          );

          return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
        }).toList(),
      );

      return Right(productList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
