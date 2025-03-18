part of 'combo_deal_material_detail_bloc.dart';

@freezed
class ComboDealMaterialDetailState with _$ComboDealMaterialDetailState {
  const ComboDealMaterialDetailState._();
  const factory ComboDealMaterialDetailState({
    required Map<MaterialNumber, PriceAggregate> items,
    required Map<MaterialNumber, bool> selectedItems,
    required bool isFetchingPrice,
    required bool isFetchingComboInfo,
    required bool isUpdateCart,
    required bool isLoadMore,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required SalesOrganisationConfigs salesConfigs,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required SearchKey searchKey,
    required bool canLoadMore,
    required int nextPageIndex,
    required int materialCount,
  }) = _ComboDealDetailState;

  factory ComboDealMaterialDetailState.initial() =>
      ComboDealMaterialDetailState(
        items: {},
        selectedItems: {},
        isFetchingPrice: false,
        isUpdateCart: false,
        isFetchingComboInfo: false,
        isLoadMore: false,
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        apiFailureOrSuccessOption: none(),
        searchKey: SearchKey.search(''),
        user: User.empty(),
        salesConfigs: SalesOrganisationConfigs.empty(),
        canLoadMore: true,
        materialCount: 0,
        nextPageIndex: 0,
      );

  Map<MaterialNumber, PriceAggregate> get searchableList {
    final searchableList = <MaterialNumber, PriceAggregate>{};

    if (currentDeal.scheme == ComboDealScheme.k21) {
      final optionalComboMaterials = <MaterialNumber>{};

      final optionalComboDeals = currentDeal.materialComboDeals
          .where(
            (materialComboDeal) => materialComboDeal.materials
                .every((material) => !material.mandatory),
          )
          .toList();

      for (final comboDeal in optionalComboDeals) {
        optionalComboMaterials.addAll(
          comboDeal.materials
              .where((material) => !material.mandatory)
              .map((material) => material.materialNumber),
        );
      }

      for (final entry in items.entries) {
        if (optionalComboMaterials.contains(entry.key)) {
          searchableList[entry.key] = entry.value;
        }
      }
    } else {
      searchableList.addAll(items);
    }

    if (searchKey.searchValueOrEmpty.isEmpty) return searchableList;

    return Map<MaterialNumber, PriceAggregate>.fromEntries(
      searchableList.entries.where(
        (entry) =>
            entry.value.getMaterialNumber.displayMatNo
                .contains(searchKey.searchValueOrEmpty) ||
            entry.value.materialInfo.displayDescription
                .toLowerCase()
                .contains(searchKey.searchValueOrEmpty),
      ),
    );
  }

  Map<MaterialNumber, PriceAggregate> get mandatoryMaterials {
    final mandatoryItemsSet = <MaterialNumber, PriceAggregate>{};

    if (currentDeal.scheme == ComboDealScheme.k21) {
      final mandatoryComboDeals = currentDeal.materialComboDeals
          .where(
            (materialComboDeal) => materialComboDeal.materials
                .every((material) => material.mandatory),
          )
          .toList();

      for (final comboDeal in mandatoryComboDeals) {
        for (final comboDealMaterial in comboDeal.materials) {
          if (items[comboDealMaterial.materialNumber] != null) {
            mandatoryItemsSet.putIfAbsent(
              comboDealMaterial.materialNumber,
              () => items[comboDealMaterial.materialNumber]!,
            );
          }
        }
      }
    }

    return mandatoryItemsSet;
  }

  int get totalQuantityUnit {
    switch (currentDeal.scheme) {
      case ComboDealScheme.k1:
      case ComboDealScheme.k21:
      case ComboDealScheme.k3:
      case ComboDealScheme.k5:
        return allSelectedItems.length;
      case ComboDealScheme.k22:
      case ComboDealScheme.k4:
      case ComboDealScheme.k42:
        return totalSelectedQuantity;
    }
  }

  List<PriceAggregate> get allSelectedItems {
    final selectedMaterials = Map<MaterialNumber, PriceAggregate>.from(items)
      ..removeWhere(
        (key, value) => selectedItems[key] == false,
      );

    return selectedMaterials.values.toList();
  }

  bool isMaterialSelected(MaterialNumber materialNumber) =>
      (selectedItems[materialNumber] ?? false);

  double get totalPriceSelectedItems => allSelectedItems.fold<double>(
        0,
        (previousValue, element) =>
            previousValue +
            element.getComboOfferPriceSubTotal(
              currentDeal.getMaterialComboRate(
                materialNumber: element.getMaterialNumber,
                totalQuantityUnit: totalQuantityUnit,
                currentTotalAmount: originalPriceSelectedItems,
              ),
            ),
      );

  double get originalPriceSelectedItems => allSelectedItems.fold<double>(
        0,
        (previousValue, element) => previousValue + element.listPriceTotal,
      );

  double get totalPriceDisplay =>
      isEnableAddToCart ? totalPriceSelectedItems : originalPriceSelectedItems;

  List<MaterialNumber> get allMaterialsNumber =>
      items.entries.map((e) => e.key).toList();

  List<MaterialInfo> get allMaterialsInfo =>
      items.entries.map((e) => e.value.materialInfo).toList();

  int get totalSelectedQuantity => allSelectedItems.fold<int>(
        0,
        (previousValue, element) => previousValue + element.quantity,
      );

  ComboDeal get currentDeal => items.values.toList().firstComboDeal;

  Map<MaterialNumber, PriceAggregate> get resetCurrentDealQuantityMapItems =>
      Map.fromEntries(
        items.entries.map(
          (entry) => MapEntry(
            entry.key,
            entry.value.copyWithComboDealMinQty(currentDeal),
          ),
        ),
      );

  String get currentPrincipalCode =>
      items.values
          .toList()
          .comboMaterialItemList
          .firstOrNull
          ?.materialInfo
          .principalData
          .principalCode
          .getOrDefaultValue('') ??
      '';

  bool get isEnableAddToCart {
    if (isFetchingPrice || isFetchingComboInfo || allSelectedItems.isEmpty) {
      return false;
    }

    return currentDeal.scheme.isComboDealEligible(allSelectedItems);
  }

  bool get displayNextComboDealMessage =>
      !isFetchingComboInfo && isEnableAddToCart;

  bool get displayMinPurchaseQtyMessage =>
      !isFetchingComboInfo && !isEnableAddToCart;
}
