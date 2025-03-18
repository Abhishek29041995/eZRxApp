import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/apl_get_total_price.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/cart.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

abstract class ICartRepository {
  //TODO: evaluate which methods will be removed with addition to this
  Future<Either<ApiFailure, Unit>> clearCart();

  ///TODO: Might be used while developing ZMG Group discount

  // List<CartItem> updateDiscountQty({
  //   required List<CartItem> items,
  // });

  //TODO: evaluate which methods will be removed with addition to this
  Future<Either<ApiFailure, List<PriceAggregate>>> upsertCart({
    required MaterialInfo materialInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    required int quantity,
    required String itemId,
    required RequestCounterOfferDetails counterOfferDetails,
    required String tenderContractNumber,
  });

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
  });

  //TODO: evaluate which methods can be removed with combo offers
  Future<Either<ApiFailure, List<PriceAggregate>>> upsertCartItems({
    required PriceAggregate product,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    EZReachBanner? banner,
  });

  Future<Either<ApiFailure, Cart>> getAddedToCartProductList({
    required Language language,
  });

  Future<Either<ApiFailure, List<PriceAggregate>>> removeSelectedProducts({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    required List<MaterialInfo> products,
  });

  Future<Either<ApiFailure, List<PriceAggregate>>>
      upsertCartItemsWithComboOffers({
    required List<PriceAggregate> products,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  });

  Future<Either<ApiFailure, AplSimulatorOrder>> aplSimulateOrder({
    required List<MaterialInfo> product,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  });

  Future<Either<ApiFailure, AplGetTotalPrice>> fetchGrandTotalPriceForIdMarket({
    required List<MaterialNumber> materialNumbers,
    required double totalPrice,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  });

  Future<Either<ApiFailure, List<PriceAggregate>>> upsertCartWithBonus({
    required PriceAggregate product,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    required RequestCounterOfferDetails counterOfferDetails,
    EZReachBanner? banner,
  });

  Future<Either<ApiFailure, List<PriceAggregate>>>
      updateCartWithProductDetermination({
    required List<MaterialInfo> productDeterminationList,
    required List<PriceAggregate> updatedCartItems,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
  });
}
