import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_amount_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_sku_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_tier_rule.dart';
import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/num_utils.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal.freezed.dart';

@freezed
class ComboDeal with _$ComboDeal {
  const ComboDeal._();

  const factory ComboDeal({
    required ComboDealGroupDeal groupDeal,
    required List<ComboDealSKUTier> flexiSKUTier,
    required List<ComboDealQtyTier> flexiQtyTier,
    required List<ComboDealAmountTier> flexiAmountTier,
    required List<ComboDealMaterialSet> materialComboDeals,
    required List<ComboDealTierRule> flexiTierRule,
  }) = _ComboDeal;

  factory ComboDeal.empty() => ComboDeal(
        groupDeal: ComboDealGroupDeal.empty(),
        flexiSKUTier: [],
        flexiQtyTier: [],
        flexiAmountTier: [],
        materialComboDeals: [],
        flexiTierRule: [],
      );

  List<ComboDealQtyTier> get descendingSortedQtyTiers =>
      List<ComboDealQtyTier>.from(flexiQtyTier)
        ..sort(
          (first, second) => second.minQty.compareTo(first.minQty),
        );

  List<ComboDealTierRule> get descendingSortedRateToAbsTiers =>
      List<ComboDealTierRule>.from(flexiTierRule)
        ..sort(
          (first, second) => second.discountInfo.rateToAbs
              .compareTo(first.discountInfo.rateToAbs),
        );

  List<ComboDealTierRule> get descendingSortedMinTotalAmountTiers =>
      List<ComboDealTierRule>.from(flexiTierRule)
        ..sort(
          (first, second) =>
              second.minTotalAmount.compareTo(first.minTotalAmount),
        );

  List<ComboDealTierRule> get sortedMinTotalAmountTiers =>
      List<ComboDealTierRule>.from(flexiTierRule)
        ..sort(
          (first, second) =>
              first.minTotalAmount.compareTo(second.minTotalAmount),
        );

  List<ComboDealSKUTier> get descendingSortedSKUTier =>
      List<ComboDealSKUTier>.from(flexiSKUTier)
        ..sort(
          (first, second) => second.minQty.compareTo(first.minQty),
        );

  List<ComboDealSKUTier> get ascendingSortedSKUTier =>
      List<ComboDealSKUTier>.from(flexiSKUTier)
        ..sort(
          (first, second) => first.minQty.compareTo(second.minQty),
        );

  List<ComboDealMaterial> get allMaterials => materialComboDeals
      .map(
        (e) => e.materials,
      )
      .flattened
      .toList();

  List<MaterialNumber> get allMaterialNumbers => allMaterials
      .map(
        (e) => e.materialNumber,
      )
      .toList();

  ComboDealMaterial singleDeal({
    required MaterialNumber materialNumber,
  }) =>
      allMaterials.firstWhere(
        (deal) => deal.materialNumber == materialNumber,
        orElse: () => ComboDealMaterial.empty(),
      );

  String getSetNo({
    required MaterialNumber materialNumber,
  }) =>
      materialComboDeals
          .firstWhere(
            (comboSetDeal) => comboSetDeal.materialNumbers
                .any((element) => element == materialNumber),
            orElse: () => ComboDealMaterialSet.empty(),
          )
          .setNo;

  bool get _allMaterialWithSuffix =>
      materialComboDeals.isNotEmpty &&
      allMaterials.every((item) => item.suffix.isValid());

  bool get _allFlexiQtyTierWithSuffix =>
      flexiQtyTier.isNotEmpty &&
      flexiQtyTier.every((tier) => tier.suffix.isValid());

  ComboDealScheme get scheme {
    if (_allMaterialWithSuffix && _allFlexiQtyTierWithSuffix) {
      return ComboDealScheme.k42;
    }
    if (materialComboDeals.isNotEmpty &&
        allMaterials.every((item) => item.mandatory)) {
      return ComboDealScheme.k1;
    }

    if (flexiAmountTier.isEmpty && flexiSKUTier.isEmpty) {
      if (groupDeal != ComboDealGroupDeal.empty()) {
        return ComboDealScheme.k21;
      }
      if (flexiQtyTier.length == 1) {
        return ComboDealScheme.k22;
      }
    }

    if (flexiSKUTier.isNotEmpty && flexiQtyTier.isEmpty) {
      return ComboDealScheme.k3;
    }
    if (flexiSKUTier.isEmpty && flexiQtyTier.isNotEmpty) {
      return ComboDealScheme.k4;
    }

    if (!isMaterialDeal && flexiTierRule.isNotEmpty) {
      return ComboDealScheme.k5;
    }

    return ComboDealScheme.k1;
  }

  bool get isMaterialDeal =>
      groupDeal != ComboDealGroupDeal.empty() ||
      flexiAmountTier.isNotEmpty ||
      flexiQtyTier.isNotEmpty ||
      flexiSKUTier.isNotEmpty ||
      materialComboDeals.isNotEmpty;

  ComboDealMaterial selectedSuffix({
    required MaterialNumber materialNumber,
    required ComboDealQtyTier eligibleComboDealQtyTier,
  }) =>
      allMaterials.firstWhere(
        (element) =>
            element.materialNumber == materialNumber &&
            eligibleComboDealQtyTier.suffix == element.suffix,
        orElse: () => ComboDealMaterial.empty(),
      );

  double getMaterialComboRate({
    required MaterialNumber materialNumber,
    required int totalQuantityUnit,
    double? currentTotalAmount,
  }) {
    final materialSingleDeal = singleDeal(materialNumber: materialNumber);
    switch (scheme) {
      case ComboDealScheme.k1:
        return materialSingleDeal.discountInfo.rateToAbs;
      case ComboDealScheme.k21:
        return groupDeal.discountInfo.rateToAbs;
      case ComboDealScheme.k22:
        return descendingSortedQtyTiers.firstOrNull?.discountInfo.rateToAbs ??
            0;
      case ComboDealScheme.k3:
        return descendingSortedSKUTier
            .firstWhere(
              (tier) => tier.minQty <= totalQuantityUnit,
              orElse: () => ComboDealSKUTier.empty(),
            )
            .discountInfo
            .rateToAbs;
      case ComboDealScheme.k4:
        return descendingSortedQtyTiers
            .firstWhere(
              (tier) => tier.minQty <= totalQuantityUnit,
              orElse: () => ComboDealQtyTier.empty(),
            )
            .discountInfo
            .rateToAbs;
      case ComboDealScheme.k42:
        final eligibleComboDealQtyTier = descendingSortedQtyTiers.firstWhere(
          (tier) => tier.minQty <= totalQuantityUnit,
          orElse: () => ComboDealQtyTier.empty(),
        );

        return selectedSuffix(
          materialNumber: materialNumber,
          eligibleComboDealQtyTier: eligibleComboDealQtyTier,
        ).discountInfo.rateToAbs;
      case ComboDealScheme.k5:
        if (currentTotalAmount == null) {
          return descendingSortedRateToAbsTiers
                  .firstOrNull?.discountInfo.rateToAbs ??
              0;
        }

        return descendingSortedMinTotalAmountTiers
                .firstWhereOrNull(
                  (minAmountTier) =>
                      minAmountTier.minTotalAmount <= currentTotalAmount,
                )
                ?.discountInfo
                .rateToAbs ??
            0;
    }
  }

  int get minPurchaseQty {
    const minPurchaseOptional = 1;

    switch (scheme) {
      case ComboDealScheme.k21:
        return minPurchaseOptional;
      case ComboDealScheme.k22:
        return descendingSortedQtyTiers.firstOrNull?.minQty ?? 0;
      case ComboDealScheme.k3:
        return descendingSortedSKUTier.last.minQty;
      case ComboDealScheme.k4:
      case ComboDealScheme.k42:
        return descendingSortedQtyTiers.last.minQty;

      default:
        return 0;
    }
  }

  ComboDealTierRule nextK5Discount(double currentTotalAmount) =>
      sortedMinTotalAmountTiers.firstWhere(
        (tierRule) => currentTotalAmount < tierRule.minTotalAmount,
        orElse: () => ComboDealTierRule.empty(),
      );

  String materialNextSuffixDiscountRate({
    required int totalQty,
    required MaterialNumber materialNumber,
  }) {
    final nextDiscountTier = flexiQtyTier.firstWhere(
      (tier) => totalQty < tier.minQty,
      orElse: () => ComboDealQtyTier.empty(),
    );

    return selectedSuffix(
      materialNumber: materialNumber,
      eligibleComboDealQtyTier: nextDiscountTier,
    ).discountInfo.rateDisplay;
  }

  String get buyMoreInfoKey {
    switch (scheme) {
      case ComboDealScheme.k1:
      case ComboDealScheme.k21:
      case ComboDealScheme.k22:
        return '';
      case ComboDealScheme.k3:
        return 'Buy {unit} more items to get {discount}% discount';
      case ComboDealScheme.k4:
        return 'Buy {unit} more to get {discount}% discount';
      case ComboDealScheme.k42:
        return 'Buy {unit} more quantity to achieve next tier discount';
      case ComboDealScheme.k5:
        return 'Buy \${unit} more to get {discount}% discount';
    }
  }

  String buyMoreInfoUnit({
    required double totalAmount,
    required int totalQty,
  }) {
    switch (scheme) {
      case ComboDealScheme.k1:
      case ComboDealScheme.k21:
      case ComboDealScheme.k22:
        return '';
      case ComboDealScheme.k3:
      case ComboDealScheme.k4:
      case ComboDealScheme.k42:
        final discountInfo = getNextEligibleComboDiscount(
          totalQty: totalQty,
          totalAmount: totalAmount,
        );

        return (discountInfo.minQty - totalQty).toString();
      case ComboDealScheme.k5:
        return NumUtils.roundToPlaces(
          nextK5Discount(totalAmount).minTotalAmount - totalAmount,
        ).toString();
    }
  }

  String getcomboDealNotEligibleMessage(
    BuildContext context,
  ) {
    switch (scheme) {
      case ComboDealScheme.k1:
      case ComboDealScheme.k22:
      case ComboDealScheme.k4:
        return context.tr(
          'You must select at least {unit} items.',
          namedArgs: {
            'unit': minPurchaseQty.toString(),
          },
        );
      case ComboDealScheme.k42:
        return context.tr(
          'You must select minimum {unit} QTYs.',
          namedArgs: {
            'unit': minPurchaseQty.toString(),
          },
        );
      case ComboDealScheme.k3:
      case ComboDealScheme.k21:
        return context.tr(
          'You must select at least {unit} more product.',
          namedArgs: {
            'unit': minPurchaseQty.toString(),
          },
        );
      case ComboDealScheme.k5:
        final firstDiscount = sortedMinTotalAmountTiers.firstOrNull;

        return context.tr(
          'Buy within \${minTotalAmount} and \${maxTotalAmount} to get {percent}% Discount',
          namedArgs: {
            'minTotalAmount':
                NumUtils.roundToPlaces(firstDiscount?.minTotalAmount ?? 0)
                    .toString(),
            'maxTotalAmount':
                NumUtils.roundToPlaces(firstDiscount?.maxTotalAmount ?? 0)
                    .toString(),
            'percent': firstDiscount?.discountInfo.rateDisplay ?? '',
          },
        );
    }
  }

  String materialComboRateDisplay({
    required MaterialNumber materialNumber,
    required int totalQuantityUnit,
    required double currentTotalAmount,
  }) {
    final comboRate = getMaterialComboRate(
      materialNumber: materialNumber,
      currentTotalAmount: currentTotalAmount,
      totalQuantityUnit: totalQuantityUnit,
    );

    if (comboRate == 0) {
      return '';
    }

    if (comboRate == comboRate.toInt()) {
      return comboRate.toInt().toString();
    }

    return comboRate.toString();
  }

  String get displayCombosMaximumDiscount {
    switch (scheme) {
      case ComboDealScheme.k1:
      case ComboDealScheme.k42:
        return materialsMaximumDiscount;
      case ComboDealScheme.k21:
        return groupDeal.discountInfo.rateDisplay;
      case ComboDealScheme.k22:
        return descendingSortedQtyTiers.firstOrNull?.discountInfo.rateDisplay ??
            '';
      case ComboDealScheme.k3:
        return k3MaximumDiscount;
      case ComboDealScheme.k4:
        return k4MaximumDiscount;
      case ComboDealScheme.k5:
        return k5MaximumDiscountRate;
    }
  }

  String get materialsMaximumDiscount => allMaterials
      .fold<double>(
        0,
        (previousValue, element) =>
            element.discountInfo.rateToAbs > previousValue
                ? element.discountInfo.rateToAbs
                : previousValue,
      )
      .toString();

  String get k3MaximumDiscount => flexiSKUTier
      .fold<double>(
        0,
        (previousValue, element) =>
            element.discountInfo.rateToAbs > previousValue
                ? element.discountInfo.rateToAbs
                : previousValue,
      )
      .toString();

  String get k4MaximumDiscount => flexiQtyTier
      .fold<double>(
        0,
        (previousValue, element) =>
            element.discountInfo.rateToAbs > previousValue
                ? element.discountInfo.rateToAbs
                : previousValue,
      )
      .toString();

  String get k5MaximumDiscountRate =>
      (descendingSortedRateToAbsTiers.firstOrNull?.discountInfo.rateDisplay ??
          '');

  DiscountInfo getNextEligibleComboDiscount({
    required int totalQty,
    required double totalAmount,
  }) {
    switch (scheme) {
      case ComboDealScheme.k1:
        return DiscountInfo.empty();
      case ComboDealScheme.k21:
        return DiscountInfo.empty();
      case ComboDealScheme.k22:
        return descendingSortedQtyTiers
            .firstWhere(
              (tier) => totalQty < tier.minQty,
              orElse: () => ComboDealQtyTier.empty(),
            )
            .discountInfo;
      case ComboDealScheme.k3:
        return ascendingSortedSKUTier
            .firstWhere(
              (tier) => totalQty < tier.minQty,
              orElse: () => ComboDealSKUTier.empty(),
            )
            .discountInfo;
      case ComboDealScheme.k4:
      case ComboDealScheme.k42:
        return flexiQtyTier
            .firstWhere(
              (tier) => totalQty < tier.minQty,
              orElse: () => ComboDealQtyTier.empty(),
            )
            .discountInfo;
      case ComboDealScheme.k5:
        return nextK5Discount(totalAmount).discountInfo;
    }
  }

  bool isBestDealAvailableOnCombo({
    required int totalQty,
    required double totalAmount,
  }) {
    final discountInfo = getNextEligibleComboDiscount(
      totalQty: totalQty,
      totalAmount: totalAmount,
    );

    return discountInfo == DiscountInfo.empty();
  }

  bool get isNextComboDealVisible {
    switch (scheme) {
      case ComboDealScheme.k21:
        return false;
      case ComboDealScheme.k1:
      case ComboDealScheme.k22:
      case ComboDealScheme.k3:
      case ComboDealScheme.k4:
      case ComboDealScheme.k42:
      case ComboDealScheme.k5:
        return true;
    }
  }

  String get schemeMinimumQtyRequirement {
    if (scheme == ComboDealScheme.k22) {
      return descendingSortedQtyTiers.firstOrNull?.minQty.toString() ?? '';
    }
    if (scheme == ComboDealScheme.k4 || scheme == ComboDealScheme.k42) {
      return descendingSortedQtyTiers.last.minQty.toString();
    }

    return '';
  }
}

enum ComboDealScheme { k1, k21, k22, k3, k4, k42, k5 }

extension ComboDealSchemeExt on ComboDealScheme {
  bool get comboDealCanLoadmore => this == ComboDealScheme.k5;

  bool get haveFixedMaterials => this == ComboDealScheme.k21;

  String getTotalUnitMessage(
    BuildContext context, {
    required int totalUnit,
  }) {
    switch (this) {
      case ComboDealScheme.k1:
      case ComboDealScheme.k21:
      case ComboDealScheme.k3:
      case ComboDealScheme.k5:
        return context
            .tr('{qty} items', namedArgs: {'qty': totalUnit.toString()});
      case ComboDealScheme.k22:
      case ComboDealScheme.k4:
      case ComboDealScheme.k42:
        return '${context.tr('Total qty')}: $totalUnit';
    }
  }

  String getDiscountOnMessage(BuildContext context) {
    switch (this) {
      case ComboDealScheme.k1:
      case ComboDealScheme.k21:
      case ComboDealScheme.k42:
        return context.tr('Per item');
      case ComboDealScheme.k22:
      case ComboDealScheme.k4:
        return context.tr('Total Quantity');
      case ComboDealScheme.k3:
        return context.tr('Total SKUs');
      case ComboDealScheme.k5:
        return context.tr('Total Order Amount');
    }
  }

  String getRequirementMessage(
    BuildContext context, {
    required String minQty,
    required String minAmountK5,
  }) {
    switch (this) {
      case ComboDealScheme.k1:
        return context.tr('Purchase all items with min. of its quantity.');
      case ComboDealScheme.k21:
        return context.tr(
          'Purchase FIXED product with min. of its quantity and any product in the list.',
        );
      case ComboDealScheme.k22:
        return context.tr(
          'Purchase any products with min. {minQty} of total quantity.',
          namedArgs: {
            'minQty': minQty,
          },
        );
      case ComboDealScheme.k3:
        return context.tr(
          'Purchase different products with min. of its quantity. Buy more save more.',
        );
      case ComboDealScheme.k4:
        return context.tr(
          'Purchase min. {minQty} items from any of these products. Buy more save more.',
          namedArgs: {
            'minQty': minQty,
          },
        );
      case ComboDealScheme.k42:
        return context.tr(
          'Purchase min. {minQty} QTYs from any of these products. Buy more save more.',
          namedArgs: {
            'minQty': minQty,
          },
        );
      case ComboDealScheme.k5:
        return context.tr(
          'Purchase min. \${amount} from these products. Buy more save more.',
          namedArgs: {
            'amount': minAmountK5,
          },
        );
    }
  }

  String get comboDealTitleAppbar {
    var title = '';
    switch (this) {
      case ComboDealScheme.k1:
        title = 'Combo K1';
        break;
      case ComboDealScheme.k21:
        title = 'Combo K2.1';
        break;
      case ComboDealScheme.k22:
        title = 'Combo K2.2';
        break;
      case ComboDealScheme.k3:
        title = 'Combo K3';
        break;
      case ComboDealScheme.k4:
        title = 'Combo K4';
        break;
      case ComboDealScheme.k42:
        title = 'Combo K4.2';
        break;
      case ComboDealScheme.k5:
        title = 'Combo K5';
        break;
    }

    return title;
  }

  String get comboDealType {
    switch (this) {
      case ComboDealScheme.k1:
        return 'K1';
      case ComboDealScheme.k21:
      case ComboDealScheme.k22:
        return 'K2';
      case ComboDealScheme.k3:
        return 'K3';

      case ComboDealScheme.k4:
        return 'K4';
      case ComboDealScheme.k42:
        return 'K4.2';
      case ComboDealScheme.k5:
        return 'K5';
    }
  }

  bool get displayDiscountedPrice => this == ComboDealScheme.k1;

  bool get displayNextTierDiscount => this == ComboDealScheme.k42;

  bool get displayDiscountedSubTotal =>
      this == ComboDealScheme.k21 || this == ComboDealScheme.k42;

  bool get displayOriginalPrice =>
      this != ComboDealScheme.k1 &&
      this != ComboDealScheme.k21 &&
      this != ComboDealScheme.k42;

  bool get displayDiscountedTotal =>
      this == ComboDealScheme.k22 ||
      this == ComboDealScheme.k3 ||
      this == ComboDealScheme.k5;

  bool isComboDealEligible(List<PriceAggregate> materials) {
    final comboDeal = materials.firstComboDeal;

    if (materials.any((item) => !item.selfComboDealEligible)) return false;

    switch (comboDeal.scheme) {
      case ComboDealScheme.k1:
        return true;
      case ComboDealScheme.k21:
        final mandatoryComboDeal = comboDeal.materialComboDeals
            .where(
              (materialComboDeal) => materialComboDeal.materials
                  .every((material) => material.mandatory),
            )
            .toList();

        final optionalComboDeal = comboDeal.materialComboDeals
            .where(
              (materialComboDeal) => materialComboDeal.materials
                  .every((material) => !material.mandatory),
            )
            .toList();

        final selectAllMandatory = mandatoryComboDeal.every(
          (setItem) {
            final totalSetQty = materials
                .where(
                  (material) => setItem.materialNumbers
                      .contains(material.getMaterialNumber),
                )
                .fold<int>(0, (sum, item) => sum + item.quantity);

            return totalSetQty != 0;
          },
        );

        final selectAtLeastOneOptional = optionalComboDeal.any(
          (setItem) {
            final totalSetQty = materials
                .where(
                  (material) => setItem.materialNumbers
                      .contains(material.getMaterialNumber),
                )
                .fold<int>(0, (sum, item) => sum + item.quantity);

            return totalSetQty != 0;
          },
        );

        return selectAllMandatory && selectAtLeastOneOptional;
      case ComboDealScheme.k22:
        return getEligibleComboDealQtyTier(materials) !=
            ComboDealQtyTier.empty();

      case ComboDealScheme.k3:
        return getEligibleComboDealSKUTier(materials) !=
            ComboDealSKUTier.empty();
      case ComboDealScheme.k4:
      case ComboDealScheme.k42:
        return getEligibleComboDealQtyTier(materials) !=
            ComboDealQtyTier.empty();
      case ComboDealScheme.k5:
        return getEligibleComboDealTierRule(materials) !=
            ComboDealTierRule.empty();
    }
  }

  ComboDealQtyTier getEligibleComboDealQtyTier(List<PriceAggregate> materials) {
    final totalQty = materials.fold<int>(0, (sum, item) => sum + item.quantity);
    if (materials.isEmpty) return ComboDealQtyTier.empty();
    final comboDeal = materials.first.comboDeal;

    return comboDeal.descendingSortedQtyTiers.firstWhere(
      (tier) => totalQty >= tier.minQty,
      orElse: () => ComboDealQtyTier.empty(),
    );
  }

  ComboDealTierRule getEligibleComboDealTierRule(
    List<PriceAggregate> materials,
  ) {
    if (materials.isEmpty) return ComboDealTierRule.empty();
    final comboDeal = materials.first.comboDeal;

    final comboDealTotal = materials.fold<double>(
      0,
      (sum, item) => sum + item.comboDealTotalListPrice,
    );

    return comboDeal.descendingSortedMinTotalAmountTiers.firstWhere(
      (tier) => tier.minTotalAmount <= comboDealTotal,
      orElse: () => ComboDealTierRule.empty(),
    );
  }

  ComboDealSKUTier getEligibleComboDealSKUTier(
    List<PriceAggregate> materials,
  ) {
    if (materials.isEmpty) return ComboDealSKUTier.empty();
    final comboDeal = materials.first.comboDeal;

    return comboDeal.descendingSortedSKUTier.firstWhere(
      (tier) => materials.length >= tier.minQty,
      orElse: () => ComboDealSKUTier.empty(),
    );
  }

  String get comboDealMockResponsePath {
    switch (this) {
      case ComboDealScheme.k1:
        return 'get_combo_deal_for_material/getComboDealForMaterialResponseK1.json';
      case ComboDealScheme.k21:
        return 'get_combo_deal_for_material/getComboDealForMaterialResponseK2.1.json';
      case ComboDealScheme.k22:
        return 'get_combo_deal_for_material/getComboDealForMaterialResponseK2.2.json';
      case ComboDealScheme.k3:
        return 'get_combo_deal_for_material/getComboDealForMaterialResponseK3.json';
      case ComboDealScheme.k4:
        return 'get_combo_deal_for_material/getComboDealForMaterialResponseK4.json';
      case ComboDealScheme.k42:
        return 'get_combo_deal_for_material/getComboDealForMaterialResponseK4.2.json';
      case ComboDealScheme.k5:
        return 'get_combo_deal_for_principal/getComboDealForPrincipalK5Response.json';
    }
  }
}
