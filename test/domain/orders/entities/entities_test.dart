import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PriceBonus entities', () {
    test(
      'should return true when price bonus item is empty',
      () async {
        final emptyPriceBonus = PriceBonus.empty();
        expect(emptyPriceBonus.items.isEmpty, true);
      },
    );

    test(
      'should return list of sorted price bonus item based on higher qualifyingQuantity',
      () async {
        final input = <PriceBonusItem>[
          PriceBonusItem.empty().copyWith(qualifyingQuantity: 1),
          PriceBonusItem.empty().copyWith(qualifyingQuantity: 2),
        ];
        final bonus = PriceBonus(items: input);
        final result = bonus.items;
        expect(result, input);
      },
    );

    test(
      'should return list of first element of bonus material item based on sorted price bonus item',
      () async {
        final input = <PriceBonusItem>[
          PriceBonusItem.empty().copyWith(
            qualifyingQuantity: 1,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(bonusQuantity: 2),
              BonusMaterial.empty().copyWith(bonusQuantity: 4),
            ],
          ),
          PriceBonusItem.empty().copyWith(
            qualifyingQuantity: 2,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(bonusQuantity: 2),
              BonusMaterial.empty().copyWith(bonusQuantity: 4),
            ],
          ),
        ];
        final bonus = PriceBonus(items: input);
        final result = bonus.items;
        expect(result, [
          input.first,
          input.last,
        ]);
      },
    );
  });

  group('Price entities', () {
    test(
      'should return list of sorted price bonus item based on higher qualifyingQuantity',
      () async {
        final priceBonusItemList = <PriceBonusItem>[
          PriceBonusItem.empty().copyWith(
            qualifyingQuantity: 1,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(bonusQuantity: 2),
              BonusMaterial.empty().copyWith(bonusQuantity: 4),
            ],
          ),
          PriceBonusItem.empty().copyWith(
            qualifyingQuantity: 2,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(bonusQuantity: 2),
              BonusMaterial.empty().copyWith(bonusQuantity: 4),
            ],
          ),
        ];

        final bonuses = <PriceBonus>[
          PriceBonus.empty().copyWith(
            items: priceBonusItemList,
          ),
        ];
        final price = Price.empty().copyWith(
          bonuses: bonuses,
        );
        final result = price.priceBonusItem;
        expect(result, priceBonusItemList);
      },
    );

    test(
      'should return list of material number of bonus material item which is same as price material number',
      () async {
        final priceBonusItemList = <PriceBonusItem>[
          PriceBonusItem.empty().copyWith(
            qualifyingQuantity: 1,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(
                bonusQuantity: 2,
                materialNumber: MaterialNumber('00000001234'),
              ),
              BonusMaterial.empty().copyWith(bonusQuantity: 4),
            ],
          ),
          PriceBonusItem.empty().copyWith(
            qualifyingQuantity: 2,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(bonusQuantity: 2),
              BonusMaterial.empty().copyWith(bonusQuantity: 4),
            ],
          ),
        ];

        final bonuses = <PriceBonus>[
          PriceBonus.empty().copyWith(
            items: priceBonusItemList,
          ),
        ];
        final price = Price.empty().copyWith(
          bonuses: bonuses,
          materialNumber: MaterialNumber('00000001234'),
        );

        final result = price.sameMaterialBonus;
        expect(result, [priceBonusItemList.first.bonusMaterials.first]);
      },
    );

    test(
      'should return list of material number of bonus material item which is different as price material number',
      () async {
        final priceBonusItemList = <PriceBonusItem>[
          PriceBonusItem.empty().copyWith(
            qualifyingQuantity: 1,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(
                bonusQuantity: 2,
                materialNumber: MaterialNumber('00000001234'),
              ),
              BonusMaterial.empty().copyWith(
                bonusQuantity: 4,
                materialNumber: MaterialNumber('00000001236'),
              ),
            ],
          ),
          PriceBonusItem.empty().copyWith(
            qualifyingQuantity: 2,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(
                bonusQuantity: 2,
                materialNumber: MaterialNumber('00000001235'),
              ),
              BonusMaterial.empty().copyWith(
                bonusQuantity: 4,
                materialNumber: MaterialNumber('00000001234'),
              ),
            ],
          ),
        ];

        final bonuses = <PriceBonus>[
          PriceBonus.empty().copyWith(
            items: priceBonusItemList,
          ),
        ];
        final price = Price.empty().copyWith(
          bonuses: bonuses,
          materialNumber: MaterialNumber('00000001234'),
        );

        final result = price.otherMaterialBonus;
        expect(result, [
          priceBonusItemList.first.bonusMaterials.last,
          priceBonusItemList.last.bonusMaterials.first,
        ]);
      },
    );
  });

  group('MaterialItemBonus entities', () {
    test(
      'check bonus quanity, material number and material description for bonus material',
      () async {
        final bonusMaterial = BonusMaterial.empty().copyWith(
          bonusQuantity: 2,
          materialNumber: MaterialNumber('00000001234'),
          materialDescription: 'It is a good material',
        );

        final materialItemBonus =
            MaterialItemBonus.fromBonusMaterial(bonusMaterial);

        final bonusQuantity = materialItemBonus.qty;
        expect(bonusQuantity, 2);
        final materialNumber = materialItemBonus.materialNumber.getOrCrash();
        expect(materialNumber, '00000001234');
        final materialDescription = materialItemBonus.materialDescription;
        expect(materialDescription, 'It is a good material');
      },
    );

    test(
      'get material number when bonus material is not empty',
      () async {
        final bonusMaterial = MaterialItemBonus.empty().copyWith(
          materialInfo: MaterialInfo.empty()
              .copyWith(materialNumber: MaterialNumber('00000001234')),
        );
        final result = bonusMaterial.materialNumber;
        expect(result, MaterialNumber('00000001234'));
      },
    );
  });

  group('MaterialInfo entities', () {
    test(
      'display default material description when material description is empty',
      () async {
        final materialInfo = MaterialInfo.empty();
        final result = materialInfo.displayDescription;
        expect(result, '');
      },
    );

    test(
      'display material description when material description is not empty',
      () async {
        final materialInfo = MaterialInfo.empty().copyWith(
          materialDescription: 'It is a good material',
          data: [
            MaterialData.empty().copyWith(
              defaultMaterialDescription: 'It is a good material(Default)',
            ),
          ],
        );

        final result = materialInfo.displayDescription;
        expect(result, 'It is a good material(Default)');
      },
    );
  });
}
