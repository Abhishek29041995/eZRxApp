import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:ezrxmobile/domain/core/error/tr_object.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/submit_tender_contract_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_material_item_bonus_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/num_utils.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_override_dto.dart';

import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';

part 'price_aggregate.freezed.dart';
part 'price_aggregate_extension.dart';

@freezed
class PriceAggregate with _$PriceAggregate {
  const PriceAggregate._();

  const factory PriceAggregate({
    required Price price,
    required MaterialInfo materialInfo,
    required Bundle bundle,
    required SalesOrganisationConfigs salesOrgConfig,
    required int quantity,
    @Default(0) int discountedMaterialCount,
    @Default(false) bool exceedQuantity,
    required StockInfo stockInfo,
    required TenderContract tenderContract,
    required ComboDeal comboDeal,
    @Default(false) bool isSpecialOrderType,
    @Default(<StockInfo>[]) List<StockInfo> stockInfoList,
    required List<BonusSampleItem> bonusSampleItems,
    required List<ComboMaterialItem> comboMaterials,
    required int maximumQty,
    @Default(false) bool is26SeriesMaterial,
    @Default(false) bool isCovid,
  }) = _PriceAggregate;

  factory PriceAggregate.empty() => PriceAggregate(
        price: Price.empty(),
        materialInfo: MaterialInfo.empty(),
        bundle: Bundle.empty(),
        salesOrgConfig: SalesOrganisationConfigs.empty(),
        quantity: 1,
        discountedMaterialCount: 0,
        stockInfo: StockInfo.empty(),
        tenderContract: TenderContract.empty(),
        comboDeal: ComboDeal.empty(),
        bonusSampleItems: <BonusSampleItem>[],
        comboMaterials: <ComboMaterialItem>[],
        maximumQty: 0,
      );

  PriceAggregate get toCartProduct {
    var cartProduct = PriceAggregate.empty();
    if (materialInfo.type.typeBundle) {
      cartProduct = cartProduct.copyWith(
        materialInfo: materialInfo,
        bundle: bundle,
        salesOrgConfig: salesOrgConfig,
      );
    }
    if (materialInfo.type.typeMaterial) {
      cartProduct = cartProduct.copyWith(
        materialInfo: materialInfo,
        quantity: materialInfo.quantity.intValue,
        salesOrgConfig: salesOrgConfig,
        bonusSampleItems: bonusSampleItems,
        is26SeriesMaterial: is26SeriesMaterial,
        tenderContract: tenderContract,
        isCovid: isCovid,
      );
    }
    if (materialInfo.type.typeCombo) {
      cartProduct = cartProduct.copyWith(
        materialInfo: materialInfo,
        salesOrgConfig: salesOrgConfig,
        comboMaterials: comboMaterials,
      );
    }

    return cartProduct;
  }

  bool get _isStockQtyExceedsForId =>
      stockQuantity < quantity && stockQuantity != 0;

  bool get isMaxQtyExceedsForId =>
      maximumQty != 0 && maximumQty < quantity && stockQuantity >= quantity;

  bool get isMaxQtyExceedsForTender =>
      salesOrgConfig.enableTenderOrders &&
      tenderContract.isNotEmpty &&
      tenderContract.remainingTenderQuantity != 0 &&
      tenderContract.remainingTenderQuantity < quantity;

  bool get isTenderContractInvalid =>
      salesOrgConfig.enableTenderOrders &&
      tenderContract.isNotEmpty &&
      tenderContract.contractNumber.isContractNumberNotEmpty &&
      tenderContract.isTenderExpired;

  bool get isTenderContractMandatoryButUnavailable =>
      salesOrgConfig.enableTenderOrders &&
      materialInfo.hasMandatoryTenderContract &&
      tenderContract.isEmpty;

  bool get showErrorMessageForID =>
      salesOrgConfig.salesOrg.isID &&
      (_isStockQtyExceedsForId || isMaxQtyExceedsForId);

  List<MaterialInfo> get toStockListMaterials {
    final materialsInfo = <MaterialInfo>[];
    if (materialInfo.type.typeBundle) {
      materialsInfo.addAll(bundle.materials);
    }
    if (materialInfo.type.typeMaterial) {
      materialsInfo.add(materialInfo);
    }
    if (materialInfo.type.typeCombo) {
      materialsInfo.addAll(
        comboMaterials.map(
          (e) => MaterialInfo.empty().copyWith(materialNumber: e.productId),
        ),
      );
    }

    return materialsInfo;
  }

  SubmitMaterialInfo toSubmitMaterialInfo() {
    return SubmitMaterialInfo(
      batch:
          salesOrgConfig.enableBatchNumber ? stockInfo.batch : StringValue(''),
      bonuses: bonuses,
      comment: materialInfo.remarks,
      materialNumber: materialInfo.materialNumber,
      quantity: quantity,
      materialItemOverride:
          MaterialItemOverrideDto.fromPriceAggregate(this).toDomain(),
      price: _priceSubmitted,
      productType: materialInfo.type.getValue().toUpperCase(),
      parentID: materialInfo.type.typeBundle
          ? bundle.bundleCode
          : materialInfo.parentID,
      mrp: price.getListPrice,
      tax: salesOrgConfig.salesOrg.isID ? materialInfo.tax : individualItemTax,
      promoStatus: promoStatus,
      promoType: materialInfo.promoType,
      principalData: materialInfo.principalData,
      isCounterOffer: materialInfo.counterOfferDetails.hasCounterOffer,
      contract: salesOrgConfig.enableTenderOrders &&
              tenderContract.tenderOrderReason.isNotEmpty
          ? SubmitTenderContract(
              contractLineItemNumber:
                  tenderContract.contractItemNumber.getOrDefaultValue(''),
              contractNumber: tenderContract.contractNumber,
              contractPONumber:
                  tenderContract.contractReference.getOrDefaultValue(''),
              contractPrice: tenderContract.tenderPrice,
              contractUnitOfMeasurement: tenderContract.pricingUnit,
              currency: salesOrgConfig.currency.code,
            )
          : SubmitTenderContract.empty(),
      salesDistrict: tenderContract.salesDistrict.getOrDefaultValue(''),
    );
  }

  double get _priceSubmitted {
    if (materialInfo.type.typeBundle) {
      return bundle.currentBundleInfo.rate;
    }
    if (materialInfo.hidePrice) {
      return 0.0;
    }

    return salesOrgConfig.salesOrg.isID
        ? price.finalPrice.getOrDefaultValue(0.0)
        : finalPrice;
  }

  double vatCalculation(double value) {
    // VN Tax
    if (salesOrgConfig.enableVat &&
        salesOrgConfig.enableTaxClassification &&
        salesOrgConfig.currency.isVN) {
      return value + (value * (materialInfo.tax / 100));
    }

    // Non VN VAT
    if (salesOrgConfig.enableVat &&
        salesOrgConfig.enableTaxClassification &&
        !materialInfo.taxClassification.isNoTax) {
      return value + (value * (salesOrgConfig.vatValue / 100));
    }

    return value;
  }

  bool get promoStatus {
    if (tenderContract.isNotEmpty && bonuses.isNotEmpty) {
      return true;
    }

    if (tenderContract.isNotEmpty) {
      return false;
    }

    return materialInfo.promoStatus ||
        price.tiers.isNotEmpty ||
        price.bonuses.isNotEmpty;
  }

  double get listPrice {
    return NumUtils.roundToPlaces(vatCalculation(price.lastPrice.getOrCrash()));
  }

  bool get isSpecialOrderTypeNotTH =>
      isSpecialOrderType && !salesOrgConfig.salesOrg.isTH;

  bool get isSpecialMaterial =>
      !materialInfo.isFOCMaterial || !materialInfo.isSampleMaterial;

  double get finalPrice {
    var finalPrice = 0.0;

    if (tenderContract.tenderUnitPrice != 0) {
      finalPrice = tenderContract.tenderUnitPrice;
    } else if (isSpecialOrderTypeNotTH) {
      finalPrice = 0.0;
    } else if (price.isDiscountEligible && !isSpecialOrderType) {
      finalPrice = discountedListPrice;
    } else {
      finalPrice = price.finalPrice.getOrDefaultValue(0);
    }

    return NumUtils.roundToPlaces(finalPrice);
  }

  double getComboOfferPriceWithDiscount({double comboDealRate = 0}) {
    var comboOfferPrice = 0.0;

    comboOfferPrice = comboDealRate != 0
        ? listPrice - NumUtils.roundToPlaces((listPrice * comboDealRate / 100))
        : listPrice;

    return NumUtils.roundToPlaces(comboOfferPrice);
  }

  double get unitPrice {
    return NumUtils.roundToPlaces(vatCalculation(finalPrice));
  }

  int get totalComboQuantity {
    final scheme = comboMaterials.firstOrNull?.getScheme(comboMaterials) ??
        ComboDealScheme.k1;
    if (scheme == ComboDealScheme.k3) {
      return comboMaterials.length;
    }

    return comboMaterials.fold(
      0,
      (previousValue, element) => previousValue + element.quantity,
    );
  }

  double get comboOriginalSubTotal {
    var comboOriginalTotal = 0.0;

    comboOriginalTotal = comboMaterials.fold(
      0,
      (previousValue, element) => previousValue + element.originalSubTotal,
    );

    return NumUtils.roundToPlaces(comboOriginalTotal);
  }

  double get comboSubTotalExclTax {
    var comboSubTotalExclTax = 0.0;

    comboSubTotalExclTax = comboMaterials.fold(
      0,
      (previousValue, element) => previousValue + element.discountedSubTotal,
    );

    return NumUtils.roundToPlaces(comboSubTotalExclTax);
  }

  double get unitPriceForTotal {
    final value = finalPrice;

    // VN Tax
    if (salesOrgConfig.enableVat &&
        salesOrgConfig.enableTaxClassification &&
        salesOrgConfig.currency.isVN) {
      return value + (value * (materialInfo.tax / 100));
    }

    // VN Tax total
    if (salesOrgConfig.enableTaxAtTotalLevelOnly &&
        salesOrgConfig.currency.isVN) {
      return value + (value * (materialInfo.tax / 100));
    }

    // Non VN VAT
    if (salesOrgConfig.enableVat &&
        salesOrgConfig.enableTaxClassification &&
        !materialInfo.taxClassification.isNoTax) {
      return value + (value * (salesOrgConfig.vatValue / 100));
    }

    // Non VN Total
    if (salesOrgConfig.enableTaxAtTotalLevelOnly &&
        !salesOrgConfig.currency.isVN) {
      return value + (value * (salesOrgConfig.vatValue / 100));
    }

    return value;
  }

  double get listPriceTotal {
    return listPrice * quantity;
  }

  double get finalPriceTotal {
    return finalPrice * quantity;
  }

  double get aplFinalPriceTotal {
    return price.finalPrice.getOrDefaultValue(0) * quantity;
  }

  double get savingAmount =>
      (price.lastPrice.getOrDefaultValue(0) -
          price.finalPrice.getOrDefaultValue(0)) *
      quantity;

  double getComboOfferPriceSubTotal(double comboDealRate) {
    return getComboOfferPriceWithDiscount(comboDealRate: comboDealRate) *
        quantity;
  }

  String get finalPriceTotalForAllMaterial {
    return materialInfo.isFOCMaterial
        ? 'Price Not Available'
        : display(PriceType.finalPriceTotal);
  }

  String get finalCheckoutTotalForAllMaterial => salesOrgConfig.salesOrg.isID
      ? display(PriceType.aplFinalPriceTotal)
      : finalPriceTotalForAllMaterial;

  double get finalPriceTotalWithTax => finalPriceTotal + itemTax;

  double get finalPriceTotalWithTaxForCheckout => salesOrgConfig.salesOrg.isID
      ? (aplFinalPriceTotal + itemTaxForCheckout)
      : finalPriceTotalWithTax;

  double get itemTaxForCheckout {
    if (salesOrgConfig.salesOrg.isID) {
      return materialInfo.tax;
    }

    return (finalPriceTotal * itemTaxPercent) / 100;
  }

  String get itemUnitPriceForCheckout => salesOrgConfig.salesOrg.isID
      ? price.finalPrice.getOrDefaultValue(0).toString()
      : display(PriceType.finalPrice);

  double get itemTaxPercent {
    if (materialInfo.taxClassification.isNoTax) {
      return 0.0;
    }

    if (salesOrgConfig.salesOrg.isMaterialTax) {
      return materialInfo.tax;
    }

    return salesOrgConfig.vatValue.toDouble();
  }

  double get itemTaxPercentPadded => double.parse(
        itemTaxPercent.toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), ''),
      );

  double get itemTax {
    final tax = (finalPriceTotal * itemTaxPercent) / 100;

    if (salesOrgConfig.salesOrg.isID) {
      return tax.floorToDouble();
    }

    return tax;
  }

  double get individualItemTax => (_priceSubmitted * itemTaxPercent) / 100;

  double get totalVatForBundle =>
      salesOrgConfig.shouldShowTax ? salesOrgConfig.vatValue / 100 : 0.0;

  double get unitPriceTotal {
    return salesOrgConfig.enableTaxAtTotalLevelOnly
        ? unitPriceForTotal * quantity
        : unitPrice * quantity;
  }

  double get discountedListPrice => price.tiers
      .firstWhere(
        (element) => discountedMaterialCount >= element.quantity,
        orElse: () => price.tiers.lastOrNull ?? PriceTierItem.empty(),
      )
      .rate;

  String get displayZdp5Price {
    return price.tiers
        .firstWhere(
          (element) => materialInfo.quantity.intValue >= element.quantity,
          orElse: () => PriceTierItem.empty(),
        )
        .rate
        .toString();
  }

  String display(PriceType priceType) {
    final applyCounterOfferOnFinalPrice = price.isCounterOfferRequested &&
        (priceType == PriceType.finalPrice ||
            priceType == PriceType.finalPriceTotal);

    final showListPriceAsPriceNotAvailable =
        listPrice == 0 && priceType == PriceType.listPrice;

    if (_displayPriceFree) return 'FREE';

    if (_displayPriceNotAvailable ||
        (!price.isValid && !applyCounterOfferOnFinalPrice) ||
        showListPriceAsPriceNotAvailable) {
      return 'Price Not Available';
    }

    double result;
    switch (priceType) {
      case PriceType.finalPrice:
        result = finalPrice;
        break;
      case PriceType.unitPrice:
        result =
            salesOrgConfig.enableTaxAtTotalLevelOnly ? finalPrice : unitPrice;
        break;
      case PriceType.finalPriceTotal:
        result = finalPriceTotal;
        break;
      case PriceType.unitPriceTotal:
        result = salesOrgConfig.enableTaxAtTotalLevelOnly
            ? finalPriceTotal
            : unitPriceTotal;
        break;
      case PriceType.listPriceTotal:
        result = listPriceTotal;
        break;
      case PriceType.aplFinalPriceTotal:
        result = aplFinalPriceTotal;
        break;
      case PriceType.discountedPrice:
        result = price.discountedValue.getOrDefaultValue(0);
      case PriceType.listPrice:
      default:
        result = listPrice;
        break;
    }

    return result.toString();
  }

  bool get isDefaultMDEnabled {
    return salesOrgConfig.enableDefaultMD &&
        materialInfo.defaultMaterialDescription.isNotEmpty;
  }

  MaterialNumber get id {
    if (materialInfo.type.typeCombo) {
      return MaterialNumber(comboMaterials.firstOrNull?.comboDeals.id ?? '');
    }
    if (materialInfo.type.typeBundle) {
      return MaterialNumber(bundle.bundleCode);
    }

    return materialInfo.materialNumber;
  }

  MaterialNumber get getMaterialNumber => materialInfo.materialNumber;

  String get taxDetails {
    return salesOrgConfig.currency.isVN
        ? materialInfo.getTotalTax(salesOrgConfig.enableTaxDisplay)
        : materialInfo.getTaxClassification(
            salesOrgConfig.enableTaxDisplay,
            salesOrgConfig.enableTaxClassification,
          );
  }

  bool get refreshAddedBonus =>
      calculateMaterialItemBonus.length != bonusSampleItems.length ||
      calculateMaterialItemBonus.any(
        (BonusMaterial calculatedBonus) =>
            calculatedBonus.bonusQuantity !=
            bonusSampleItems
                .firstWhere(
                  (availableBonus) =>
                      availableBonus.materialNumber ==
                      calculatedBonus.materialNumber,
                  orElse: () => BonusSampleItem.empty(),
                )
                .qty
                .intValue,
      );

  PriceBonusItem get _bonusItem => price.priceBonusItem.firstWhere(
        (PriceBonusItem element) => quantity >= element.qualifyingQuantity,
        orElse: () => PriceBonusItem.empty(),
      );

  List<BonusMaterial> get calculateMaterialItemBonus {
    switch (_bonusItem.calculation.getCalculationEnum) {
      case BonusMaterialCalculationEnum.calculation915:
        return _bonusItem.bonusMaterials
            .map(
              (BonusMaterial element) => element.copyWith(
                bonusQuantity:
                    (quantity / _bonusItem.qualifyingQuantity).truncate() *
                        element.bonusQuantity,
              ),
            )
            .toList();
      case BonusMaterialCalculationEnum.calculation914:
        return _bonusItem.bonusMaterials
            .map(
              (BonusMaterial element) => element.copyWith(
                bonusQuantity: ((quantity / _bonusItem.qualifyingQuantity) *
                        element.bonusQuantity)
                    .truncate(),
              ),
            )
            .toList();
      case BonusMaterialCalculationEnum.calculation913:
        final bonusMaterial = <MaterialNumber, BonusMaterial>{};
        price.priceBonusItem.fold<int>(quantity, (remainQty, element) {
          if (remainQty >= element.qualifyingQuantity) {
            final ratio = (remainQty / element.qualifyingQuantity).truncate();
            for (final newBonus in element.bonusMaterials) {
              bonusMaterial.update(
                newBonus.materialNumber,
                (BonusMaterial oldBonus) => oldBonus.copyWith(
                  bonusQuantity:
                      oldBonus.bonusQuantity + (newBonus.bonusQuantity * ratio),
                ),
                ifAbsent: () => newBonus.copyWith(
                  bonusQuantity: newBonus.bonusQuantity * ratio,
                ),
              );
            }

            return remainQty - (ratio * element.qualifyingQuantity);
          } else {
            return remainQty;
          }
        });

        return bonusMaterial.values.toList();
      case BonusMaterialCalculationEnum.calculation911:
      case BonusMaterialCalculationEnum.apl001:
      case BonusMaterialCalculationEnum.apl002:
        return _bonusItem.bonusMaterials
            .map(
              (BonusMaterial element) => element.copyWith(
                bonusQuantity: (quantity / element.bonusRatio).truncate() *
                    element.bonusQuantity,
              ),
            )
            .toList();

      case BonusMaterialCalculationEnum.calculation912:
        return _bonusItem.bonusMaterials;
    }
  }

  List<MaterialItemBonus> get getMaterialItemBonus {
    return calculateMaterialItemBonus.map((BonusMaterial element) {
      final ratio = (quantity / element.qualifyingQuantity).floor();
      final remainingQty = quantity - (element.qualifyingQuantity * ratio);

      return MaterialItemBonus.fromBonusMaterial(element).copyWith(
        remainingQty: remainingQty,
        additionalBonusFlag: false,
        bonusOverrideFlag: true,
      );
    }).toList();
  }

  List<MaterialInfo> get existingProductDealBonus => bonusSampleItems
      .where(
        (element) => element.type.typeDealBonus,
      )
      .map(
        (e) => MaterialInfo.empty().copyWith(
          materialNumber: e.materialNumber,
          quantity: e.qty,
          type: e.type,
          parentID: materialInfo.materialNumber.getValue(),
          sampleBonusItemId: e.itemId.getValue(),
        ),
      )
      .toList();

  List<MaterialInfo> get dealBonusList {
    final existingBonus = existingProductDealBonus.firstWhere(
      (element) => element.quantity.isValid(),
      orElse: () => MaterialInfo.empty(),
    );

    final applicableBonus = _applicableProductDealBonus.firstWhere(
      (element) => element.quantity.isValid(),
      orElse: () => MaterialInfo.empty(),
    );

    if (existingBonus.quantity == applicableBonus.quantity) {
      return <MaterialInfo>[];
    }

    final exhaustedBonus = existingProductDealBonus
        .where(
          (e) => !_applicableProductDealBonus.any(
            (applicableBonus) =>
                e.sampleBonusItemId == applicableBonus.sampleBonusItemId,
          ),
        )
        .map((e) => e.copyWith(quantity: MaterialQty(0)))
        .toList();

    return [..._applicableProductDealBonus, ...exhaustedBonus];
  }

  List<MaterialInfo> get _applicableProductDealBonus => getMaterialItemBonus
      .map(
        (e) => e.materialInfo.copyWith(
          quantity: MaterialQty(e.qty),
          type: MaterialInfoType('Deals'),
          parentID: materialInfo.materialNumber.getValue(),
          sampleBonusItemId: existingProductDealBonus
              .firstWhere(
                (element) => element.materialNumber == e.materialNumber,
                orElse: () => MaterialInfo.empty(),
              )
              .sampleBonusItemId,
        ),
      )
      .toList();

  StockInfo get stockInfoValid => stockInfoList.firstWhere(
        (element) => element.expiryDate.isValid() || element.batch.isValid(),
        orElse: () => StockInfo.empty(),
      );

  PriceAggregate copyWithPrice({
    required Price newPrice,
    required bool exceedQty,
  }) =>
      copyWith(
        price: newPrice,
        exceedQuantity: exceedQty,
      );

  bool get isBonusEligibleForNonMYPnGSalesRep =>
      isEligibleForAdditionalBonus && !materialInfo.hidePrice;

  bool get isEligibleForAdditionalBonus =>
      !materialInfo.isFOCMaterial &&
      (salesOrgConfig.netPriceOverride || price.additionalBonusEligible);

  bool get hasSalesRepPrincipal =>
      materialInfo.principalData.principalCode.salesRepSubmitAllowed;

  bool get displayGenericMaterialName =>
      salesOrgConfig.enableGMN && materialInfo.genericMaterialName.isNotEmpty;

  bool get notHavingContract =>
      tenderContract == TenderContract.empty() ||
      tenderContract == TenderContract.noContract();

  bool get isPnGPrinciple => materialInfo.principalData.principalCode.isPnG;

  PriceAggregate copyWithIncreasedQty({required int qty}) => copyWith(
        quantity: quantity + qty,
      );

  List<StockInfo> get batchNumbers => List<StockInfo>.from(stockInfoList)
      .where((StockInfo element) => element.batch.isValid())
      .toList();

  bool get checkSalesCutOff {
    final salesOrgPrincipal = salesOrgConfig.checkIsPrincipalCodeForAllMaterial;
    if (salesOrgPrincipal != SalesOrganisationConfigsPrincipal.empty()) {
      return salesOrgPrincipal.date.dateTime.isBefore(DateTime.now());
    }
    for (final salesOrgPrincipal in salesOrgConfig.principalList) {
      if (materialInfo.principalData.principalCode ==
          salesOrgPrincipal.principalCode) {
        return salesOrgPrincipal.date.dateTime.isBefore(DateTime.now());
      }
    }

    return false;
  }

  MaterialQty totalCartProductBonusQty(
    StringValue bonusItemId,
    MaterialQty qty,
  ) {
    final totalQuantity = bonusSampleItems
            .firstWhere(
              (element) => element.itemId == bonusItemId,
              orElse: () => BonusSampleItem.empty(),
            )
            .qty
            .intValue +
        qty.intValue;

    return MaterialQty(totalQuantity);
  }

  StringValue bonusMaterialItemId(MaterialNumber bonusMatNumber) =>
      bonusSampleItems
          .firstWhere(
            (element) => element.materialNumber == bonusMatNumber,
            orElse: () => BonusSampleItem.empty(),
          )
          .itemId;

  bool get isZdp5DiscountEligible =>
      salesOrgConfig.salesOrg.isVN &&
      salesOrgConfig.enableZDP5 &&
      price.zdp5RemainingQuota.isValidValue &&
      price.zdp5MaxQuota.isValidValue;

  bool get showDiscountListPrice =>
      (salesOrgConfig.enableListPrice && !checkListPrice) &&
      tireItemPriceDisplay;

  bool get hasZdp5Validation =>
      isZdp5DiscountEligible && quantity > price.zdp5RemainingQuota.intValue;

  bool get isRemainingQuantityExceeded =>
      !exceedQuantity && quantity > price.zdp5RemainingQuota.intValue;

  bool get isRemainingQuantityNotExceeded =>
      exceedQuantity && quantity <= price.zdp5RemainingQuota.intValue;

  bool get hasRemainingQuotaReached =>
      isRemainingQuantityNotExceeded || isRemainingQuantityExceeded;

  bool get isPriceUpdateAvailable =>
      isZdp5DiscountEligible && hasRemainingQuotaReached;

  bool get isPreOrder =>
      containOOSItem &&
      salesOrgConfig.addOosMaterials.getOrDefaultValue(false) &&
      !salesOrgConfig.hideStockDisplay;

  StockInfo get productStockInfo => stockInfoList.firstWhere(
        (element) => element.materialNumber.isValid(),
        orElse: () => StockInfo.empty(),
      );

  bool get inStock => stockInfoList.inStock;

  // getter to check if there is any item present in cart which is out of stock
  bool get containOOSItem {
    if (materialInfo.type.typeBundle) {
      return bundle.materials.any((e) => !e.stockInfos.inStock);
    } else if (materialInfo.type.typeCombo) {
      return comboMaterials.any((e) => !e.materialInfo.stockInfos.inStock);
    } else {
      return !inStock;
    }
  }

  bool get containAllOOSItem {
    if (materialInfo.type.typeBundle) {
      return bundle.materials.every((e) => !e.stockInfos.inStock);
    } else if (materialInfo.type.typeCombo) {
      return comboMaterials.every((e) => !e.materialInfo.stockInfos.inStock);
    } else {
      return !inStock;
    }
  }

  double get totalPriceWithInStockOnly {
    final type = materialInfo.type;
    if (type.typeBundle) {
      final currentRate = bundle.currentBundleInfo.rate;
      final totalInStockQty = bundle.materials
          .where((e) => e.stockInfos.inStock)
          .fold<double>(0, (sum, e) => sum + e.quantity.intValue);

      return totalInStockQty * currentRate;
    }

    if (type.typeCombo) {
      return copyWith(
        comboMaterials: comboMaterials
            .where((e) => e.materialInfo.stockInfos.inStock)
            .toList(),
      ).comboSubTotalExclTax;
    }

    return inStock ? finalPriceTotal : 0;
  }

  List<BonusSampleItem> getNewlyAddedItems(List<BonusSampleItem> oldBonusList) {
    final oldOverrideBonusIds = oldBonusList
        .where((element) => !element.type.typeDealBonus)
        .map((e) => e.itemId)
        .toSet();

    return bonusSampleItems
        .where((element) => !element.type.typeDealBonus)
        .where((e) => !oldOverrideBonusIds.contains(e.itemId))
        .toList();
  }

  bool get showTaxBreakDown =>
      salesOrgConfig.displayItemTaxBreakdown && !invalidPrice;

  List<MaterialInfo> get convertedSampleBonusList {
    return bonusSampleItems
        .where((element) => !element.type.typeDealBonus)
        .map(
          (e) => MaterialInfo.empty().copyWith(
            materialNumber: e.materialNumber,
            parentID: materialInfo.materialNumber.getValue(),
            quantity: MaterialQty(0),
            sampleBonusItemId: bonusMaterialItemId(e.materialNumber).getValue(),
          ),
        )
        .toList();
  }

  List<SubmitMaterialItemBonus> get bonuses => bonusSampleItems
      .map(
        (e) => SubmitMaterialItemBonusDto.fromBonusOvveride(e).toDomain(),
      )
      .toList();

  bool get invalidPrice =>
      price.finalPrice.isEmpty ||
      materialInfo.hidePrice ||
      materialInfo.isFOCMaterial;

  bool get displayCutOffListPrice {
    // Check if tenderContract is not empty
    if (tenderContract.isNotEmpty) {
      return false;
    }

    // Check if counter offer is requested and the price should not be hidden
    if (price.isCounterOfferRequested && !materialInfo.hidePrice) {
      return true;
    }

    // Check if zdp5MaxQuota and zdp5RemainingQuota have valid values and material quantity is at least 2
    if (price.zdp5MaxQuota.isValidValue &&
        price.zdp5RemainingQuota.isValidValue &&
        materialInfo.quantity.intValue >= 2) {
      return true;
    }

    return showMaterialListPrice;
  }

  int get stockQuantity => productStockInfo.stockQuantity;

  bool get tireItemPriceDisplay =>
      (price.tiers.isNotEmpty && materialInfo.quantity.intValue >= 1);

  bool get isBundleMinimumQuantitySatisfies => bundle.miniumQtySatisfied;

  bool get checkListPrice {
    final regex = RegExp(r'[a-zA-Z]');
    final listPrice = display(PriceType.listPrice);
    final finalPrice = display(PriceType.finalPrice);

    return !(regex.hasMatch(listPrice) || regex.hasMatch(finalPrice)) &&
        double.parse(listPrice) > double.parse(finalPrice);
  }

  bool get showMaterialListPrice =>
      salesOrgConfig.enableListPrice && checkListPrice;

  List<MaterialInfo> get bonusListToMaterialInfo => bonusSampleItems
      .map(
        (e) => MaterialInfo.empty().copyWith(
          materialNumber: e.materialNumber,
          quantity: e.qty,
        ),
      )
      .toList();

  List<BonusSampleItem> get sortedBonusList =>
      List<BonusSampleItem>.from(bonusSampleItems)
        ..sort(
          (a, b) => a.itemId
              .getOrDefaultValue('')
              .compareTo(b.itemId.getOrDefaultValue('')),
        );

  bool get isIDProductStockInvalid =>
      salesOrgConfig.salesOrg.isProductDeterminationApplicable &&
      (!inStock || _isStockQtyExceedsForId);

  int get totalBonusCount => bonusSampleItems.fold<int>(
        0,
        (sum, bonus) => sum + bonus.qty.intValue,
      );

  List<PriceAggregate> get bonusMaterialPriceAggregate => bonusSampleItems
      .map(
        (e) => PriceAggregate.empty().copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            type: e.type,
            materialNumber: e.materialNumber,
            materialDescription: e.materialDescription,
            defaultMaterialDescription: e.materialDescription,
            principalData: e.principalData,
            itemRegistrationNumber: e.itemRegistrationNumber,
          ),
          salesOrgConfig: salesOrgConfig,
          stockInfoList: [e.stockInfo],
          quantity: e.qty.intValue,
        ),
      )
      .toList();

  // Used for suspended material validation in cart page
  bool get isSuspendedMaterial {
    if (materialInfo.isSuspended) return true;
    // This case happens when we had MP materials in cart but salesOrg may disable marketplace
    if (materialInfo.isMarketPlace) return !salesOrgConfig.enableMarketPlace;

    return false;
  }

  List<TRObject> get promotionValue {
    return price.tiers
        .where((element) => element.promotionAmount.abs() > 0)
        .map((element) {
      return element.percentage > 0
          ? TRObject(
              '{discountValue} discount',
              arguments: {'discountValue': '${element.promotionAmount.abs()}%'},
            )
          : TRObject(
              'IDR ${element.promotionAmount.abs()}',
            );
    }).toList();
  }

  bool get displayPromotionalDiscountForID =>
      promotionValue.isNotEmpty && salesOrgConfig.salesOrg.isID;

  bool get bonusPriceOverrideEligible =>
      !materialInfo.isMarketPlace && !is26SeriesMaterial && !isCovid;

  bool get isListPriceNotAvailableForProduct =>
      _displayPriceNotAvailable || !price.isValid;

  bool get _displayPriceNotAvailable =>
      invalidPrice || price.finalPrice.isUnavailable;

  bool get _displayPriceFree {
    if (!price.finalPrice.isEmpty) return false;

    return materialInfo.isGimmick ||
        materialInfo.isSampleMaterial ||
        price.isFOC;
  }

  bool get _additionalBonusOverride => bonusSampleItems.any(
        (element) =>
            element.bonusOverrideFlag && !price.additionalBonusEligible,
      );

  bool get _didPriceOrBonusOverride =>
      price.isPriceOverride || _additionalBonusOverride;

  bool get isMaterialItemOverride =>
      _didPriceOrBonusOverride || materialInfo.type.typeBundle;
}

enum PriceType {
  listPrice,
  unitPrice,
  finalPrice,
  finalPriceTotal,
  unitPriceTotal,
  listPriceTotal,
  aplFinalPriceTotal,
  discountedPrice,
}
