part of 'price_aggregate.dart';

extension ComboDealExtension on PriceAggregate {
  String get comboDealId => '${price.comboDeal.id}-${comboDeal.scheme.name}';

  PriceAggregate copyWithComboDealMinQty(ComboDeal comboDeal) {
    final materialWithDeal = copyWith(
      comboDeal: comboDeal,
    );

    final minQty = materialWithDeal.selfComboDeal.minQty;

    return materialWithDeal.copyWith(
      quantity: minQty == 0 ? 1 : minQty,
    );
  }

  bool containComboDealInCart(String comboDealId) {
    return materialInfo.type.typeCombo &&
        comboMaterials.any(
          (comboMaterial) => comboMaterial.comboDeals.id == comboDealId,
        );
  }

  ComboDealMaterial get selfComboDeal => comboDeal.singleDeal(
        materialNumber: getMaterialNumber,
      );

  double get comboDealListPrice => price.lastPrice.getOrDefaultValue(0);

  double get comboDealTotalListPrice => comboDealListPrice * quantity;

  double comboDealUnitPrice({
    DiscountInfo? discount,
  }) {
    final discountInfo = discount ?? selfComboDeal.discountInfo;

    if (discountInfo.type.isPercent) {
      return NumUtils.priceByRate(
        comboDealListPrice,
        discountInfo.rate,
      );
    }
    if (discountInfo.type.isAmount) {
      return discountInfo.rate;
    }

    return comboDealListPrice;
  }

  double comboDealTotalUnitPrice({
    DiscountInfo? discount,
  }) =>
      comboDealUnitPrice(discount: discount) * quantity;

  bool get selfComboDealEligible => quantity >= selfComboDeal.minQty;

  List<PriceAggregate> get convertComboItemToPriceAggregateList =>
      comboMaterials
          .map(
            (item) => PriceAggregate.empty().copyWith(
              price: price.copyWith(
                comboDeal: item.comboDeals,
                isValid: item.valid,
                lastPrice: MaterialPrice(item.listPrice),
              ),
              quantity: item.quantity,
              materialInfo: materialInfo.copyWith(
                materialNumber: item.productId,
                principalData: item.principalData,
                materialDescription: item.materialDescription,
                parentID: item.parentId,
              ),
            ),
          )
          .toList();

  Map<MaterialNumber, int> get comboMaterialsCurrentQuantity => Map.fromEntries(
        comboMaterials.map(
          (comboMaterialItem) =>
              MapEntry(comboMaterialItem.productId, comboMaterialItem.quantity),
        ),
      );
}

extension PriceAggregateExtension on List<PriceAggregate> {
  List<MaterialNumber> get materialNumbers => map(
        (e) => e.getMaterialNumber,
      ).toList();

  List<MaterialInfo> get materialInfos => map(
        (e) => e.materialInfo,
      ).toList();

  Map<MaterialNumber, PriceAggregate> get mapByMaterialNumber => {
        for (final material in this) material.getMaterialNumber: material,
      };

  ComboDeal get firstComboDeal => isEmpty ? ComboDeal.empty() : first.comboDeal;

  // we need to find the first eligible combo deal in the selected items
  PriceComboDeal get firstPriceComboDealEligible => isEmpty
      ? PriceComboDeal.empty()
      : firstWhere(
          (priceAggregate) => priceAggregate.price.comboDeal.isEligible,
          orElse: () => PriceAggregate.empty(),
        ).price.comboDeal;

  List<PriceAggregate> get preOrderItems =>
      expand((e) => [e, ...e.bonusMaterialPriceAggregate])
          .where((e) => e.isPreOrder)
          .toList();

  List<PriceAggregate> get priceAggregateWithDiscountedCount => map((item) {
        if (item.price.zmgDiscount) {
          return item.copyWith(
            discountedMaterialCount:
                _zmgDiscountedMaterialCount(item.materialInfo),
          );
        }

        return item.price.isTireDiscountEligible
            ? item.copyWith(
                discountedMaterialCount: item.quantity,
              )
            : item;
      }).toList();

  int _zmgDiscountedMaterialCount(MaterialInfo materialInfo) {
    final materialsWithZMGDiscount = where(
      (element) =>
          element.price.zmgDiscount &&
          materialInfo.materialGroup2 == element.materialInfo.materialGroup2,
    );

    return materialsWithZMGDiscount.fold<int>(
      0,
      (previousValue, element) => previousValue + element.quantity,
    );
  }

  double get originalTotalAmount => fold<double>(
        0,
        (previousValue, element) => previousValue + element.listPriceTotal,
      );

  int get totalComboQuantity => fold<int>(
        0,
        (previousValue, element) => previousValue + element.quantity,
      );

  List<ComboMaterialItem> get comboMaterialItemList => map(
        (product) {
          final materialComboDeal = product.selfComboDeal;

          final totalQuantityUnit =
              product.comboDeal.scheme == ComboDealScheme.k3
                  ? length
                  : totalComboQuantity;

          final comboMaterialItemRate = product.comboDeal.getMaterialComboRate(
            materialNumber: product.getMaterialNumber,
            currentTotalAmount: originalTotalAmount,
            totalQuantityUnit: totalQuantityUnit,
          );

          return ComboMaterialItem(
            comboDeals: product.price.comboDeal,
            isComboEligible: product.price.comboDeal.isEligible,
            valid: product.price.isValid,
            quantity: product.quantity,
            listPrice: product.listPrice,
            finalIndividualPrice: product.getComboOfferPriceWithDiscount(
              comboDealRate: comboMaterialItemRate,
            ),
            productId: product.getMaterialNumber,
            principalData: product.materialInfo.principalData,
            materialDescription: product.materialInfo.materialDescription,
            minQty: materialComboDeal.minQty,
            conditionNumber: materialComboDeal.conditionNumber,
            mandatory: materialComboDeal.mandatory,
            suffix: materialComboDeal.suffix.stringValue,
            setNo: product.comboDeal.getSetNo(
              materialNumber: product.getMaterialNumber,
            ),
            comboDealType: product.comboDeal.scheme.comboDealType,
            parentId: product.materialInfo.parentID,
            rate: comboMaterialItemRate,
            materialInfo: product.materialInfo,
            salesOrgConfig: product.salesOrgConfig,
          );
        },
      ).toList();

  List<PriceAggregate> get zpMaterialOnly =>
      where((e) => !e.materialInfo.isMarketPlace).toList();

  List<PriceAggregate> get mpMaterialOnly =>
      where((e) => e.materialInfo.isMarketPlace).toList();

  bool get containMPMaterial => any((e) => e.materialInfo.isMarketPlace);

  bool get isMOVExclusion => any((e) => e.price.isMOVExclusion);

  bool get containInvalidTenderContractMaterial =>
      any((e) => e.isTenderContractInvalid);

  bool get isMaxQtyExceedsForAnyTender =>
      any((e) => e.isMaxQtyExceedsForTender);

  double get totalMaterialsPrice => where(
        (item) =>
            !item.materialInfo.type.typeBundle &&
            !item.materialInfo.type.typeCombo,
      ).fold<double>(
        0,
        (sum, item) => sum + item.finalPriceTotal,
      );

  double get totalMaterialsPriceHidePrice => where(
        (item) =>
            !item.materialInfo.type.typeBundle &&
            !item.materialInfo.type.typeCombo &&
            !item.materialInfo.hidePrice,
      ).fold<double>(
        0,
        (sum, item) => sum + item.finalPriceTotal,
      );

  double get totalBundlesPrice =>
      where((element) => element.materialInfo.type.typeBundle).fold(
        0,
        (previousValue, element) => previousValue + element.bundle.totalPrice,
      );

  double get totalComboPrice =>
      where((element) => element.materialInfo.type.typeCombo).fold(
        0,
        (previousValue, element) =>
            previousValue + element.comboSubTotalExclTax,
      );

  // Used for validating small order fee
  // Small order fee will be applied if subtotal of all in-stock items in cart < SAP MOV
  double get subtotalWithInStockOnly =>
      fold<double>(0, (sum, e) => sum + e.totalPriceWithInStockOnly);

  List<PriceAggregate> get sortToDisplay {
    return toList()
      ..sort((a, b) {
        final aType = a.materialInfo.type;
        final bType = b.materialInfo.type;

        // First, compare by sortPriority
        final priorityComparison =
            bType.sortPriority.compareTo(aType.sortPriority);
        if (priorityComparison != 0) {
          return priorityComparison;
        }

        // If sortPriority is the same, compare by manufacturer if both items are commercial or bonus materials
        if ((aType.typeMaterial || aType.typeDealOrOverrideBonus) &&
            (bType.typeMaterial || bType.typeDealOrOverrideBonus) &&
            a.materialInfo.getManufactured.isNotEmpty &&
            b.materialInfo.getManufactured.isNotEmpty) {
          return a.materialInfo.getManufactured
              .compareTo(b.materialInfo.getManufactured);
        }

        return 0;
      });
  }

  bool showManufacturerName(int index) =>
      index == 0 ||
      this[index].materialInfo.getManufactured !=
          this[index - 1].materialInfo.getManufactured;

  bool get isGimmickMaterialOnlyInCart =>
      isNotEmpty && every((element) => element.materialInfo.isGimmick);

  bool get containGimmickMaterial => any((e) => e.materialInfo.isGimmick);

  bool get containSampleMaterial => any((e) => e.materialInfo.isSampleMaterial);

  List<String> get manufacturers => expand<String>((e) {
        if (e.materialInfo.type.typeBundle) {
          return e.bundle.materials.map((e) => e.getManufactured).toList();
        }

        if (e.materialInfo.type.typeCombo) {
          return e.comboMaterials
              .map((e) => e.principalData.principalName.name);
        }

        return [e.materialInfo.getManufactured];
      }).toSet().toList();

  bool get hasTenderContract => any(
        (element) =>
            element.tenderContract.tenderOrderReason.isNotEmpty &&
            element.tenderContract.contractNumber.isValid(),
      );
  bool get hasTenderContractWithReason730 => any(
        (element) =>
            (element.materialInfo.hasValidTenderContract &&
                element.tenderContract.contractNumber.isValid()) &&
            element.tenderContract.tenderOrderReason.is730,
      );

  bool get hasNonMandatoryTenderContract => any(
        (element) =>
            element.tenderContract.contractNumber.isValid() &&
            !element.materialInfo.hasMandatoryTenderContract,
      );

  bool get hasMandatoryTenderContract => any(
        (element) =>
            element.tenderContract.contractNumber.isValid() &&
            element.materialInfo.hasMandatoryTenderContract,
      );

  bool get hasNonTenderContractMaterials => any(
        (element) =>
            !element.tenderContract.contractNumber.isValid() ||
            element.tenderContract.tenderOrderReason.isEmpty,
      );

  List<String> get tenderReasons => map(
        (e) => e.tenderContract.tenderOrderReason.displayTenderContractReason,
      ).toSet().toList();

  PriceAggregate getFirstCartProductWithNumber(MaterialNumber materialNumber) =>
      firstWhere(
        (e) => e.materialInfo.materialNumber == materialNumber,
        orElse: () => PriceAggregate.empty(),
      );

  TenderContract get tenderContractSubmitted => lastWhere(
        (e) =>
            e.tenderContract.isNotEmpty &&
            e.tenderContract.contractNumber.isContractNumberNotEmpty,
        orElse: () => PriceAggregate.empty(),
      ).tenderContract;

  bool get containCovidMaterial => any(
        (element) => element.isCovid,
      );

  bool get containPoisonMaterial => any((e) => e.materialInfo.isPoison);

  bool get containMinistryOfHealthMaterial => any(
        (element) =>
            element.materialInfo.principalData.principalCode.isMinistryOfHealth,
      );

  List<Map<String, String>> get cartMaterialInfoListForTrackEvent {
    final materialInfoList = <Map<String, String>>[];

    for (final e in this) {
      if (e.materialInfo.type.typeCombo) {
        materialInfoList.addAll(
          [
            for (final comboMaterialItem in e.comboMaterials)
              {
                TrackingProps.productNumber:
                    comboMaterialItem.productId.displayMatNo,
                TrackingProps.productName:
                    comboMaterialItem.materialDescription,
              },
          ],
        );
      } else if (e.materialInfo.type.typeBundle) {
        materialInfoList.addAll(
          [
            for (final bundleMaterials in e.bundle.materials)
              {
                TrackingProps.productNumber:
                    bundleMaterials.materialNumber.displayMatNo,
                TrackingProps.productName: bundleMaterials.displayDescription,
              },
          ],
        );
      } else {
        materialInfoList.add({
          TrackingProps.productNumber:
              e.materialInfo.materialNumber.displayMatNo,
          TrackingProps.productName: e.materialInfo.displayDescription,
        });
      }
    }

    return materialInfoList;
  }

  bool get hasMandatoryTenderMaterialButUnavailable =>
      isNotEmpty && any((e) => e.isTenderContractMandatoryButUnavailable);

  String get mandatoryTenderMaterialButUnavailableMaterialName => where(
        (element) => element.isTenderContractMandatoryButUnavailable,
      ).map((e) => e.materialInfo.displayDescription).toList().join(',');
}
