import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_sku_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_tier_rule.dart';
import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final requiredMaterial = ComboDealMaterial.empty().copyWith(
    minQty: 4,
    materialNumber: MaterialNumber('fake-material'),
    rate: -10,
    mandatory: true,
  );
  final requiredMaterial2 = ComboDealMaterial.empty().copyWith(
    minQty: 2,
    materialNumber: MaterialNumber('fake-material2'),
    rate: -5,
    mandatory: true,
  );
  final optionalMaterial = ComboDealMaterial.empty().copyWith(
    minQty: 0,
    materialNumber: MaterialNumber('fake-optional-material'),
    rate: -5,
    mandatory: false,
  );
  final optionalMaterial2 = ComboDealMaterial.empty().copyWith(
    minQty: 0,
    materialNumber: MaterialNumber('fake-optional-material2'),
    rate: -8,
    mandatory: false,
  );
  var eligibleMaterialsCombo = <PriceAggregate>[];
  var notEligibleMaterialsCombo = <PriceAggregate>[];

  group('Combo Deal', () {
    test('K1 case', () {
      final comboDeal = ComboDeal.empty().copyWith(
        materialComboDeals: [
          ComboDealMaterialSet(
            materials: [requiredMaterial, requiredMaterial2],
            setNo: 'fake-set',
          ),
        ],
      );
      eligibleMaterialsCombo = [
        PriceAggregate.empty().copyWith(
          quantity: 4,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-material'),
          ),
          comboDeal: comboDeal,
        ),
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-material2'),
          ),
          comboDeal: comboDeal,
        ),
      ];
      notEligibleMaterialsCombo = [
        PriceAggregate.empty().copyWith(
          quantity: 4,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-material'),
          ),
          comboDeal: comboDeal,
        ),
      ];

      expect(comboDeal.scheme, ComboDealScheme.k1);
      expect(comboDeal.allMaterials, [requiredMaterial, requiredMaterial2]);
      expect(
        comboDeal.singleDeal(
          materialNumber: MaterialNumber('fake-material'),
        ),
        requiredMaterial,
      );
      expect(
        comboDeal.singleDeal(
          materialNumber: MaterialNumber('fake-number'),
        ),
        ComboDealMaterial.empty(),
      );
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-material'),
          totalQuantityUnit: 6,
        ),
        10,
      );
      expect(comboDeal.minPurchaseQty, 0);
      expect(comboDeal.scheme.comboDealTitleAppbar, 'Combo K1');
      expect(comboDeal.scheme.comboDealType, 'K1');
      expect(comboDeal.isNextComboDealVisible, true);
      expect(comboDeal.schemeMinimumQtyRequirement, '');
      expect(comboDeal.scheme.comboDealCanLoadmore, false);
      expect(comboDeal.scheme.haveFixedMaterials, false);
      expect(comboDeal.buyMoreInfoKey, '');
      expect(comboDeal.buyMoreInfoUnit(totalAmount: 100, totalQty: 6), '');
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 6,
          totalAmount: 100,
        ),
        DiscountInfo.empty(),
      );
      expect(
        comboDeal.displayCombosMaximumDiscount,
        '10.0',
      );
      expect(
        comboDeal.isBestDealAvailableOnCombo(
          totalQty: 6,
          totalAmount: 100,
        ),
        true,
      );
      expect(
        comboDeal.scheme.isComboDealEligible(
          eligibleMaterialsCombo,
        ),
        true,
      );
      expect(
        comboDeal.scheme.isComboDealEligible(
          notEligibleMaterialsCombo,
        ),
        true,
      );
    });

    test('K2.1 case', () {
      final comboDeal = ComboDeal.empty().copyWith(
        groupDeal: ComboDealGroupDeal.empty().copyWith(
          rate: -15,
        ),
        materialComboDeals: [
          ComboDealMaterialSet(
            materials: [requiredMaterial],
            setNo: 'fake-set',
          ),
          ComboDealMaterialSet(
            materials: [optionalMaterial],
            setNo: 'fake-set-optional',
          ),
        ],
      );

      eligibleMaterialsCombo = [
        PriceAggregate.empty().copyWith(
          quantity: 4,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-material'),
          ),
          comboDeal: comboDeal,
        ),
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-optional-material'),
          ),
          comboDeal: comboDeal,
        ),
      ];
      notEligibleMaterialsCombo = [
        PriceAggregate.empty().copyWith(
          quantity: 4,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-material'),
          ),
          comboDeal: comboDeal,
        ),
      ];

      expect(comboDeal.scheme, ComboDealScheme.k21);
      expect(comboDeal.allMaterials, [requiredMaterial, optionalMaterial]);
      expect(
        comboDeal.singleDeal(
          materialNumber: MaterialNumber('fake-optional-material'),
        ),
        optionalMaterial,
      );
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-material'),
          totalQuantityUnit: 6,
        ),
        15,
      );
      expect(comboDeal.minPurchaseQty, 1);
      expect(comboDeal.scheme.comboDealTitleAppbar, 'Combo K2.1');
      expect(comboDeal.scheme.comboDealType, 'K2');
      expect(comboDeal.isNextComboDealVisible, false);
      expect(comboDeal.schemeMinimumQtyRequirement, '');
      expect(comboDeal.scheme.comboDealCanLoadmore, false);
      expect(comboDeal.scheme.haveFixedMaterials, true);
      expect(comboDeal.buyMoreInfoKey, '');
      expect(comboDeal.buyMoreInfoUnit(totalAmount: 80, totalQty: 6), '');
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 6,
          totalAmount: 80,
        ),
        DiscountInfo.empty(),
      );
      expect(
        comboDeal.displayCombosMaximumDiscount,
        '15',
      );
      expect(
        comboDeal.isBestDealAvailableOnCombo(
          totalQty: 6,
          totalAmount: 80,
        ),
        true,
      );
      expect(
        comboDeal.scheme.isComboDealEligible(
          eligibleMaterialsCombo,
        ),
        true,
      );
      expect(
        comboDeal.scheme.isComboDealEligible(
          notEligibleMaterialsCombo,
        ),
        false,
      );
    });

    test('K2.2 case', () {
      final comboDeal = ComboDeal.empty().copyWith(
        flexiQtyTier: [
          ComboDealQtyTier.empty().copyWith(minQty: 3, rate: -12),
        ],
        materialComboDeals: [
          ComboDealMaterialSet(
            materials: [optionalMaterial, optionalMaterial2],
            setNo: 'fake-set',
          ),
        ],
      );

      eligibleMaterialsCombo = [
        PriceAggregate.empty().copyWith(
          quantity: 4,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-material'),
          ),
          comboDeal: comboDeal,
        ),
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-optional-material'),
          ),
          comboDeal: comboDeal,
        ),
      ];
      notEligibleMaterialsCombo = [
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-material'),
          ),
          comboDeal: comboDeal,
        ),
      ];

      expect(comboDeal.scheme, ComboDealScheme.k22);
      expect(comboDeal.allMaterials, [optionalMaterial, optionalMaterial2]);
      expect(
        comboDeal.singleDeal(
          materialNumber: MaterialNumber('fake-optional-material'),
        ),
        optionalMaterial,
      );
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-material'),
          totalQuantityUnit: 4,
        ),
        12,
      );
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-material'),
          totalQuantityUnit: 0,
        ),
        12,
      );
      expect(comboDeal.minPurchaseQty, 3);
      expect(comboDeal.scheme.comboDealTitleAppbar, 'Combo K2.2');
      expect(comboDeal.scheme.comboDealType, 'K2');
      expect(comboDeal.isNextComboDealVisible, true);
      expect(comboDeal.schemeMinimumQtyRequirement, '3');
      expect(comboDeal.scheme.comboDealCanLoadmore, false);
      expect(comboDeal.scheme.haveFixedMaterials, false);
      expect(comboDeal.buyMoreInfoKey, '');
      expect(comboDeal.buyMoreInfoUnit(totalAmount: 100, totalQty: 3), '');
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 2,
          totalAmount: 80,
        ),
        DiscountInfo.empty().copyWith(minQty: 3, rate: -12),
      );
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 3,
          totalAmount: 100,
        ),
        DiscountInfo.empty(),
      );
      expect(
        comboDeal.displayCombosMaximumDiscount,
        '12',
      );
      expect(
        comboDeal.isBestDealAvailableOnCombo(
          totalQty: 3,
          totalAmount: 60,
        ),
        true,
      );
      expect(
        comboDeal.isBestDealAvailableOnCombo(
          totalQty: 2,
          totalAmount: 40,
        ),
        false,
      );
      expect(
        comboDeal.scheme.isComboDealEligible(
          eligibleMaterialsCombo,
        ),
        true,
      );
      expect(
        comboDeal.scheme.isComboDealEligible(
          notEligibleMaterialsCombo,
        ),
        false,
      );
    });

    test('K3 case', () {
      final firstSKUTier =
          ComboDealSKUTier.empty().copyWith(minQty: 3, rate: -12);
      final secondSKUTier =
          ComboDealSKUTier.empty().copyWith(minQty: 7, rate: -20);
      final comboDeal = ComboDeal.empty().copyWith(
        flexiSKUTier: [
          firstSKUTier,
          secondSKUTier,
        ],
        materialComboDeals: [
          ComboDealMaterialSet(
            materials: [optionalMaterial, optionalMaterial2],
            setNo: 'fake-set',
          ),
        ],
      );

      eligibleMaterialsCombo = [
        PriceAggregate.empty().copyWith(
          quantity: 4,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-optional-material'),
          ),
          comboDeal: comboDeal,
        ),
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-optional-material2'),
          ),
          comboDeal: comboDeal,
        ),
        PriceAggregate.empty().copyWith(
          quantity: 1,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-material'),
          ),
          comboDeal: comboDeal,
        ),
      ];
      notEligibleMaterialsCombo = [
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-optional-material'),
          ),
          comboDeal: comboDeal,
        ),
      ];

      expect(comboDeal.scheme, ComboDealScheme.k3);
      expect(comboDeal.allMaterials, [optionalMaterial, optionalMaterial2]);
      expect(
        comboDeal.descendingSortedSKUTier,
        [secondSKUTier, firstSKUTier],
      );

      expect(
        comboDeal.singleDeal(
          materialNumber: MaterialNumber('fake-optional-material'),
        ),
        optionalMaterial,
      );
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-optional-material'),
          totalQuantityUnit: 1,
        ),
        0,
      );
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-optional-material'),
          totalQuantityUnit: 4,
        ),
        12,
      );
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-optional-material'),
          totalQuantityUnit: 10,
        ),
        20,
      );
      expect(comboDeal.minPurchaseQty, 3);
      expect(comboDeal.scheme.comboDealTitleAppbar, 'Combo K3');
      expect(comboDeal.scheme.comboDealType, 'K3');
      expect(comboDeal.isNextComboDealVisible, true);
      expect(comboDeal.schemeMinimumQtyRequirement, '');
      expect(comboDeal.scheme.comboDealCanLoadmore, false);
      expect(comboDeal.scheme.haveFixedMaterials, false);
      expect(
        comboDeal.buyMoreInfoKey,
        'Buy {unit} more items to get {discount}% discount',
      );
      expect(comboDeal.buyMoreInfoUnit(totalAmount: 40, totalQty: 1), '2');
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 2,
          totalAmount: 80,
        ),
        DiscountInfo.empty().copyWith(minQty: 3, rate: -12),
      );
      expect(comboDeal.buyMoreInfoUnit(totalAmount: 80, totalQty: 3), '4');
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 5,
          totalAmount: 120,
        ),
        DiscountInfo.empty().copyWith(minQty: 7, rate: -20),
      );
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 7,
          totalAmount: 150,
        ),
        DiscountInfo.empty(),
      );
      expect(
        comboDeal.displayCombosMaximumDiscount,
        '20.0',
      );
      expect(
        comboDeal.isBestDealAvailableOnCombo(
          totalQty: 7,
          totalAmount: 150,
        ),
        true,
      );
      expect(
        comboDeal.isBestDealAvailableOnCombo(
          totalQty: 2,
          totalAmount: 40,
        ),
        false,
      );
      expect(
        comboDeal.scheme.isComboDealEligible(
          eligibleMaterialsCombo,
        ),
        true,
      );
      expect(
        comboDeal.scheme.isComboDealEligible(
          notEligibleMaterialsCombo,
        ),
        false,
      );
    });

    test('K4 case', () {
      final firstQtyTier =
          ComboDealQtyTier.empty().copyWith(minQty: 3, rate: -12);
      final secondQtyTier =
          ComboDealQtyTier.empty().copyWith(minQty: 7, rate: -20);
      final comboDeal = ComboDeal.empty().copyWith(
        flexiQtyTier: [
          firstQtyTier,
          secondQtyTier,
        ],
        materialComboDeals: [
          ComboDealMaterialSet(
            materials: [optionalMaterial, optionalMaterial2],
            setNo: 'fake-set',
          ),
        ],
      );

      eligibleMaterialsCombo = [
        PriceAggregate.empty().copyWith(
          quantity: 4,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-optional-material'),
          ),
          comboDeal: comboDeal,
        ),
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-optional-material2'),
          ),
          comboDeal: comboDeal,
        ),
      ];
      notEligibleMaterialsCombo = [
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-optional-material'),
          ),
          comboDeal: comboDeal,
        ),
      ];

      expect(comboDeal.scheme, ComboDealScheme.k4);
      expect(comboDeal.allMaterials, [optionalMaterial, optionalMaterial2]);
      expect(
        comboDeal.descendingSortedQtyTiers,
        [secondQtyTier, firstQtyTier],
      );

      expect(
        comboDeal.singleDeal(
          materialNumber: MaterialNumber('fake-optional-material'),
        ),
        optionalMaterial,
      );
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-optional-material'),
          totalQuantityUnit: 1,
        ),
        0,
      );
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-optional-material'),
          totalQuantityUnit: 4,
        ),
        12,
      );
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-optional-material'),
          totalQuantityUnit: 10,
        ),
        20,
      );
      expect(comboDeal.minPurchaseQty, 3);
      expect(comboDeal.scheme.comboDealTitleAppbar, 'Combo K4');
      expect(comboDeal.scheme.comboDealType, 'K4');
      expect(comboDeal.isNextComboDealVisible, true);
      expect(comboDeal.schemeMinimumQtyRequirement, '3');
      expect(comboDeal.scheme.comboDealCanLoadmore, false);
      expect(comboDeal.scheme.haveFixedMaterials, false);
      expect(
        comboDeal.buyMoreInfoKey,
        'Buy {unit} more to get {discount}% discount',
      );
      expect(comboDeal.buyMoreInfoUnit(totalAmount: 40, totalQty: 1), '2');
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 2,
          totalAmount: 80,
        ),
        DiscountInfo.empty().copyWith(minQty: 3, rate: -12),
      );
      expect(comboDeal.buyMoreInfoUnit(totalAmount: 140, totalQty: 6), '1');
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 5,
          totalAmount: 120,
        ),
        DiscountInfo.empty().copyWith(minQty: 7, rate: -20),
      );
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 7,
          totalAmount: 150,
        ),
        DiscountInfo.empty(),
      );
      expect(
        comboDeal.displayCombosMaximumDiscount,
        '20.0',
      );
      expect(
        comboDeal.isBestDealAvailableOnCombo(
          totalQty: 7,
          totalAmount: 160,
        ),
        true,
      );
      expect(
        comboDeal.isBestDealAvailableOnCombo(
          totalQty: 3,
          totalAmount: 60,
        ),
        false,
      );
      expect(
        comboDeal.scheme.isComboDealEligible(
          eligibleMaterialsCombo,
        ),
        true,
      );
      expect(
        comboDeal.scheme.isComboDealEligible(
          notEligibleMaterialsCombo,
        ),
        false,
      );
    });

    test('K4.2 case', () {
      final firstQtyTier = ComboDealQtyTier.empty().copyWith(
        minQty: 3,
        suffix: ComboSuffix('1'),
      );
      final secondQtyTier = ComboDealQtyTier.empty().copyWith(
        minQty: 7,
        suffix: ComboSuffix('2'),
      );
      final fakeSuffixMaterial1 = ComboDealMaterial.empty().copyWith(
        minQty: 0,
        materialNumber: MaterialNumber('fake-optional-material'),
        rate: -4,
        mandatory: false,
        suffix: ComboSuffix('1'),
      );

      final fakeSuffixMaterial2 = ComboDealMaterial.empty().copyWith(
        minQty: 0,
        materialNumber: MaterialNumber('fake-optional-material'),
        rate: -8,
        mandatory: false,
        suffix: ComboSuffix('2'),
      );

      final comboDeal = ComboDeal.empty().copyWith(
        flexiQtyTier: [
          firstQtyTier,
          secondQtyTier,
        ],
        materialComboDeals: [
          ComboDealMaterialSet(
            materials: [fakeSuffixMaterial1, fakeSuffixMaterial2],
            setNo: 'fake-set',
          ),
        ],
      );

      eligibleMaterialsCombo = [
        PriceAggregate.empty().copyWith(
          quantity: 4,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-optional-material'),
          ),
          comboDeal: comboDeal,
        ),
      ];
      notEligibleMaterialsCombo = [
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-optional-material'),
          ),
          comboDeal: comboDeal,
        ),
      ];

      expect(comboDeal.scheme, ComboDealScheme.k42);
      expect(
        comboDeal.allMaterials,
        [fakeSuffixMaterial1, fakeSuffixMaterial2],
      );
      expect(
        comboDeal.descendingSortedQtyTiers,
        [secondQtyTier, firstQtyTier],
      );

      expect(
        comboDeal.singleDeal(
          materialNumber: MaterialNumber('fake-optional-material'),
        ),
        fakeSuffixMaterial1,
      );
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-optional-material'),
          totalQuantityUnit: 1,
        ),
        0,
      );
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-optional-material'),
          totalQuantityUnit: 4,
        ),
        4,
      );
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-optional-material'),
          totalQuantityUnit: 10,
        ),
        8,
      );

      expect(
        comboDeal.selectedSuffix(
          materialNumber: MaterialNumber('fake-optional-material'),
          eligibleComboDealQtyTier: firstQtyTier,
        ),
        fakeSuffixMaterial1,
      );
      expect(
        comboDeal.selectedSuffix(
          materialNumber: MaterialNumber('fake-optional-material'),
          eligibleComboDealQtyTier: secondQtyTier,
        ),
        fakeSuffixMaterial2,
      );
      expect(comboDeal.minPurchaseQty, 3);
      expect(comboDeal.scheme.comboDealTitleAppbar, 'Combo K4.2');
      expect(comboDeal.scheme.comboDealType, 'K4.2');
      expect(comboDeal.isNextComboDealVisible, true);
      expect(comboDeal.schemeMinimumQtyRequirement, '3');
      expect(comboDeal.scheme.comboDealCanLoadmore, false);
      expect(comboDeal.scheme.haveFixedMaterials, false);
      expect(comboDeal.scheme.displayNextTierDiscount, true);
      expect(comboDeal.scheme.displayDiscountedSubTotal, true);
      expect(comboDeal.scheme.displayOriginalPrice, false);

      expect(
        comboDeal.buyMoreInfoKey,
        'Buy {unit} more quantity to achieve next tier discount',
      );
      expect(comboDeal.buyMoreInfoUnit(totalAmount: 40, totalQty: 1), '2');
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 2,
          totalAmount: 80,
        ),
        DiscountInfo.empty().copyWith(minQty: 3, rate: 0),
      );
      expect(comboDeal.buyMoreInfoUnit(totalAmount: 140, totalQty: 6), '1');
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 5,
          totalAmount: 120,
        ),
        DiscountInfo.empty().copyWith(minQty: 7, rate: 0),
      );
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 7,
          totalAmount: 150,
        ),
        DiscountInfo.empty(),
      );
      expect(
        comboDeal.displayCombosMaximumDiscount,
        '8.0',
      );
      expect(
        comboDeal.isBestDealAvailableOnCombo(
          totalQty: 7,
          totalAmount: 160,
        ),
        true,
      );
      expect(
        comboDeal.isBestDealAvailableOnCombo(
          totalQty: 3,
          totalAmount: 60,
        ),
        false,
      );
      expect(
        comboDeal.scheme.isComboDealEligible(
          eligibleMaterialsCombo,
        ),
        true,
      );
      expect(
        comboDeal.scheme.isComboDealEligible(
          notEligibleMaterialsCombo,
        ),
        false,
      );
    });

    test('K5 case', () {
      final firstAmountTier =
          ComboDealTierRule.empty().copyWith(minTotalAmount: 50, rate: -12);
      final secondAmountTier =
          ComboDealTierRule.empty().copyWith(minTotalAmount: 160, rate: -20);
      final comboDeal = ComboDeal.empty().copyWith(
        flexiTierRule: [
          firstAmountTier,
          secondAmountTier,
        ],
      );
      eligibleMaterialsCombo = [
        PriceAggregate.empty().copyWith(
          quantity: 4,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-optional-material'),
          ),
          price: Price.empty().copyWith(lastPrice: MaterialPrice(18)),
          comboDeal: comboDeal,
        ),
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-optional-material2'),
          ),
          price: Price.empty().copyWith(lastPrice: MaterialPrice(10)),
          comboDeal: comboDeal,
        ),
      ];
      notEligibleMaterialsCombo = [
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-optional-material'),
          ),
          price: Price.empty().copyWith(lastPrice: MaterialPrice(18)),
          comboDeal: comboDeal,
        ),
      ];

      expect(comboDeal.scheme, ComboDealScheme.k5);
      expect(
        comboDeal.descendingSortedMinTotalAmountTiers,
        [secondAmountTier, firstAmountTier],
      );
      //Display maximum percent on product detail
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-optional-material'),
          totalQuantityUnit: 0,
        ),
        20,
      );
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-optional-material'),
          totalQuantityUnit: 4,
          currentTotalAmount: 72,
        ),
        12,
      );
      expect(
        comboDeal.getMaterialComboRate(
          materialNumber: MaterialNumber('fake-optional-material'),
          totalQuantityUnit: 10,
          currentTotalAmount: 180,
        ),
        20,
      );
      expect(comboDeal.minPurchaseQty, 0);
      expect(comboDeal.scheme.comboDealTitleAppbar, 'Combo K5');
      expect(comboDeal.scheme.comboDealType, 'K5');
      expect(comboDeal.isNextComboDealVisible, true);
      expect(comboDeal.schemeMinimumQtyRequirement, '');
      expect(comboDeal.scheme.comboDealCanLoadmore, true);
      expect(comboDeal.scheme.haveFixedMaterials, false);
      expect(
        comboDeal.buyMoreInfoKey,
        'Buy \${unit} more to get {discount}% discount',
      );
      expect(comboDeal.buyMoreInfoUnit(totalAmount: 30, totalQty: 1), '20.0');
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 2,
          totalAmount: 40,
        ),
        DiscountInfo.empty().copyWith(minQty: 0, rate: -12),
      );
      expect(comboDeal.buyMoreInfoUnit(totalAmount: 100, totalQty: 3), '60.0');
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 5,
          totalAmount: 140,
        ),
        DiscountInfo.empty().copyWith(minQty: 0, rate: -20),
      );
      expect(
        comboDeal.getNextEligibleComboDiscount(
          totalQty: 7,
          totalAmount: 180,
        ),
        DiscountInfo.empty(),
      );
      expect(
        comboDeal.displayCombosMaximumDiscount,
        '20',
      );
      expect(
        comboDeal.isBestDealAvailableOnCombo(
          totalQty: 7,
          totalAmount: 180,
        ),
        true,
      );
      expect(
        comboDeal.isBestDealAvailableOnCombo(
          totalQty: 3,
          totalAmount: 60,
        ),
        false,
      );
      expect(
        comboDeal.scheme.isComboDealEligible(
          eligibleMaterialsCombo,
        ),
        true,
      );
      expect(
        comboDeal.scheme.isComboDealEligible(
          notEligibleMaterialsCombo,
        ),
        false,
      );
    });

    test('Check material deal', () {
      final materialComboDeal = ComboDeal.empty().copyWith(
        flexiQtyTier: [
          ComboDealQtyTier.empty(),
        ],
      );
      final principleComboDeal = ComboDeal.empty().copyWith(
        flexiTierRule: [
          ComboDealTierRule.empty(),
        ],
      );

      expect(materialComboDeal.isMaterialDeal, true);
      expect(principleComboDeal.isMaterialDeal, false);
    });
  });
}
