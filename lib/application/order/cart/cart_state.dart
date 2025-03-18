part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    required List<PriceAggregate> cartProducts,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required Option<Either<ApiFailure, dynamic>> updateFailureOrSuccessOption,
    required bool isFetching,
    required bool isClearing,
    required bool isFetchingBonus,
    required bool isFetchingCartProductDetail,
    required bool isUpserting,
    required bool isMappingPrice,
    required bool isUpdatingStock,
    required bool isBuyAgain,
    required bool isAplProductLoading,
    required bool isDeleteCombo,
    required bool isTenderContractLoading,
    required bool isUpdateProductDetermination,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SalesOrganisationConfigs config,
    required User user,
    required Map<MaterialNumber, ProductMetaData> additionInfo,
    required List<int> upsertBonusItemInProgressHashCode,
    required AplGetTotalPrice aplGetTotalPrice,
    required AplSimulatorOrder aplSimulatorOrder,
  }) = _CartState;

  factory CartState.initial() => CartState(
        cartProducts: <PriceAggregate>[],
        apiFailureOrSuccessOption: none(),
        updateFailureOrSuccessOption: none(),
        isFetching: false,
        isClearing: false,
        isFetchingBonus: false,
        isFetchingCartProductDetail: false,
        isUpserting: false,
        isMappingPrice: false,
        isUpdatingStock: false,
        isBuyAgain: false,
        isUpdateProductDetermination: false,
        isTenderContractLoading: false,
        config: SalesOrganisationConfigs.empty(),
        user: User.empty(),
        additionInfo: <MaterialNumber, ProductMetaData>{},
        upsertBonusItemInProgressHashCode: [],
        shipToInfo: ShipToInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        isDeleteCombo: false,
        aplSimulatorOrder: AplSimulatorOrder.empty(),
        isAplProductLoading: false,
        aplGetTotalPrice: AplGetTotalPrice.empty(),
      );

  bool get containFocMaterial =>
      cartProducts.any((e) => e.materialInfo.isFOCMaterial);

  bool get containFocMaterialInCartProduct =>
      cartProducts.any((e) => e.materialInfo.isFOCMaterial);

  bool get containNonFocMaterial =>
      cartProducts.any((e) => !e.materialInfo.isFOCMaterial);

  bool get containNonFocMaterialOT =>
      cartProducts.any((e) => !e.materialInfo.isFOCMaterial);

  bool get containSampleMaterial =>
      cartProducts.any((e) => e.materialInfo.isSampleMaterial);

  bool get containNonSampleMaterial =>
      cartProducts.any((element) => !element.materialInfo.isSampleMaterial);

  bool get containsSampleBonus => cartProducts
      .any((element) => element.convertedSampleBonusList.isNotEmpty);

  bool get containNonRegularMaterial => cartProducts.any(
        (element) =>
            !element.materialInfo.isFOCMaterial ||
            !element.materialInfo.isSampleMaterial,
      );

  bool get containsSpecialOrderTypeMaterials => cartProducts
      .any((element) => element.materialInfo.isSpecialOrderTypeMaterial);

  bool get isBonusRestricted =>
      containsSpecialOrderTypeMaterials || cartProducts.isEmpty;

  int zmgMaterialQuantityForGroupDiscount(PriceAggregate material) {
    return zmgMaterialsQty(
          material.materialInfo.materialGroup2,
        ) -
        totalQty;
  }

  int get totalQty =>
      cartProducts.fold<int>(0, (sum, item) => sum + item.quantity);

  int zmgMaterialsQty(MaterialGroup group2) => cartProducts
      .where(
        (e) => e.price.zmgDiscount && e.materialInfo.materialGroup2 == group2,
      )
      .fold(0, (sum, e) => sum + e.quantity);

  int getQuantityOfProduct({required MaterialNumber productNumber}) {
    return cartProducts
            .where(
              (element) => element.materialInfo.materialNumber == productNumber,
            )
            .elementAtOrNull(0)
            ?.quantity ??
        0;
  }

  int getQuantityOfBundle({
    required String bundleCode,
    required MaterialNumber materialNumber,
  }) {
    return cartProducts
            .where((element) => element.bundle.bundleCode == bundleCode)
            .elementAtOrNull(0)
            ?.bundle
            .materials
            .where((element) => element.materialNumber == materialNumber)
            .elementAtOrNull(0)
            ?.quantity
            .getOrDefaultValue(0) ??
        0;
  }

  //Product tax
  double get taxMaterial => cartProducts
      .where(
        (item) =>
            !item.materialInfo.hidePrice &&
            !item.materialInfo.type.typeBundle &&
            !item.materialInfo.type.typeCombo &&
            !item.materialInfo.taxClassification.isNoTax,
      )
      .fold<double>(
        0,
        (sum, item) =>
            sum +
            (item.finalPrice * item.quantity * _totalTaxPercentInDouble / 100),
      );

  /*
    It's there just as a placeholder but for now we don't have much clarity 
    that we have any tax calculation for bundle materials
  */

  double get taxBundle => cartProducts
      .where((element) => element.materialInfo.type.typeBundle)
      .fold(
        0,
        (previousValue, element) =>
            previousValue +
            (element.bundle.totalPrice * element.salesOrgConfig.vatValue / 100),
      );

  double get taxCombo => cartProducts
      .where(
        (item) => item.materialInfo.type.typeCombo,
      )
      .fold<double>(
        0,
        (sum, item) =>
            sum +
            item.comboMaterials
                .where(
                  (item) => !item.materialInfo.hidePrice,
                )
                .fold<double>(
                  0,
                  (sum, comboMaterial) => sum + comboMaterial.itemTax,
                ),
      );

  double get totalTaxForSubmission =>
      _isID ? aplSimulatorOrder.totalTax : taxMaterial + taxCombo + taxBundle;

  bool get _isID => salesOrganisation.salesOrg.isID;

  //Total product price without tax
  double get totalZPMaterialsPrice =>
      cartProducts.zpMaterialOnly.totalMaterialsPrice;

  double get totalMaterialsPrice => cartProducts.totalMaterialsPrice;

  double get totalZPBundlesPrice =>
      cartProducts.zpMaterialOnly.totalBundlesPrice;

  double get totalBundlesPrice => cartProducts.totalBundlesPrice;

  double get totalZPComboPrice => cartProducts.zpMaterialOnly.totalComboPrice;

  double get totalComboPrice => cartProducts.totalComboPrice;

  double get totalZPMaterialsPriceHidePrice =>
      cartProducts.zpMaterialOnly.totalMaterialsPriceHidePrice;

  double get totalMaterialsPriceHidePrice =>
      cartProducts.totalMaterialsPriceHidePrice;
// This getter is used for MOV check
  double get zpSubtotal =>
      totalZPMaterialsPrice + totalZPBundlesPrice + totalZPComboPrice;

  double get mpSubtotal => subTotal - zpSubtotal;

  double get subTotal =>
      totalBundlesPrice + totalMaterialsPrice + totalComboPrice;

  //Total product price with tax
  double get totalBundlePriceWithTax => totalBundlesPrice + taxBundle;

  double get totalMaterialsPriceWithTax => totalMaterialsPrice + taxMaterial;

  double get totalMaterialsPriceHidePriceWithTax =>
      totalMaterialsPriceHidePrice + taxMaterial;

  double get totalComboPriceWithTax => totalComboPrice + taxCombo;

//This getter is used for MOV check
  double get grandTotal =>
      totalBundlePriceWithTax +
      totalMaterialsPriceWithTax +
      totalComboPriceWithTax;

  //This getter is used for submit order API
  double get totalPriceWithTaxExcludeSmallOrderFees => _isID
      ? aplSimulatorOrder.grandTotal
      : totalBundlePriceWithTax +
          totalComboPriceWithTax +
          totalMaterialsPriceHidePriceWithTax;

  //This getter is used for displaying subtotal value in
  // cart and for Order Submission
  double get mpSubTotalHidePriceMaterial =>
      subTotalHidePriceMaterial - zpSubTotalHidePriceMaterial;

  double get zpSubTotalHidePriceMaterial =>
      totalZPBundlesPrice + totalZPComboPrice + totalZPMaterialsPriceHidePrice;

  double get subTotalHidePriceMaterial => config.displaySubtotalTaxBreakdown
      ? totalBundlesPrice + totalComboPrice + totalMaterialsPriceHidePrice
      : totalPriceWithTaxExcludeSmallOrderFees;

  double get subTotalHidePriceMaterialForSubmission => _isID
      ? aplSimulatorOrder.totalPriceWithoutTax
      : totalBundlesPrice + totalComboPrice + totalMaterialsPriceHidePrice;

  double _getSubtotalForID(bool displayIDPriceOnCheckout) {
    if (displayIDPriceOnCheckout) {
      return config.displaySubtotalTaxBreakdown
          ? aplSimulatorOrder.totalPriceWithoutTax
          : aplSimulatorOrder.subTotalPriceInclTax;
    }

    return config.displaySubtotalTaxBreakdown
        ? totalBundlesPrice + totalComboPrice + totalMaterialsPriceHidePrice
        : aplGetTotalPrice.subtotalPriceInclTax;
  }

  double _getSubtotalForNonID() {
    return config.displaySubtotalTaxBreakdown
        ? totalBundlesPrice + totalComboPrice + totalMaterialsPriceHidePrice
        : totalBundlePriceWithTax +
            totalComboPriceWithTax +
            totalMaterialsPriceHidePriceWithTax;
  }

//********These below prices we display on cart & checkout except small order fees for other market except ID */
  String subTotalPriceDisplay({bool displayIDPriceOnCheckout = false}) => (_isID
          ? _getSubtotalForID(displayIDPriceOnCheckout)
          : _getSubtotalForNonID())
      .toString();

  double aplSmallOrderFees({bool displayIDPriceOnCheckout = false}) =>
      displayIDPriceOnCheckout
          ? aplSimulatorOrder.smallOrderFee
          : aplGetTotalPrice.smallOrderFee.toDouble();

  String totalTaxDisplayed({bool displayIDPriceOnCheckout = false}) {
    if (_isID && !displayIDPriceOnCheckout) {
      return aplGetTotalPrice.totalTax.toString();
    }

    return totalTaxForSubmission.toString();
  }

  //This getter is used for displaying grandTotal value in cart, checkout page
  num grandTotalPriceDisplayed({
    double smallOrderFee = 0,
    double deliveryFee = 0,
    bool displayIDPriceOnCheckout = false,
  }) {
    //For ID checkout page, We take aplGetTotalPrice.grandTotal as grand total price
    if (_isID && displayIDPriceOnCheckout) {
      return aplSimulatorOrder.grandTotal;
    }
    //For ID cart page, We take aplGetTotalPrice.grandTotal as grand total price
    if (_isID) {
      return aplGetTotalPrice.grandTotal;
    }

    return totalBundlePriceWithTax +
        totalComboPriceWithTax +
        totalMaterialsPriceHidePriceWithTax +
        smallOrderFee +
        deliveryFee;
  }

  //Todo : Need to implement for other market, Implemented only for ID market
  String totalSavingDisplayed({bool displayPriceOnCheckout = false}) {
    var totalSaving = 0.0;
    if (_isID && displayPriceOnCheckout) {
      totalSaving = aplSimulatorOrder.totalDiscountValue;
    } else if (_isID) {
      totalSaving = NumUtils.roundToPlaces(
        cartProducts.fold(0, (sum, e) => sum + e.savingAmount),
        0,
      );
    }

    return totalSaving.toString();
  }

//********These above prices we display on cart & checkout except small order fees for other market except ID */

  double get materialLevelFinalPriceWithTaxForFullTax => cartProducts
      .where(
        (element) => !element.materialInfo.taxClassification.isNoTax,
      )
      .fold<double>(
        0.0,
        (previousValue, element) =>
            previousValue + (element.finalPrice * element.materialInfo.tax),
      );

  double get materialLevelEligibleTotalFinalPrice => cartProducts
      .where(
        (element) => !element.materialInfo.taxClassification.isNoTax,
      )
      .fold<double>(
        0.0,
        (previousValue, element) => previousValue + element.finalPrice,
      );

  String get totalTaxPercent => _totalTaxPercentInDouble
      .toString()
      .replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');

  double get _totalTaxPercentInDouble {
    if (!config.salesOrg.isMaterialTax) {
      return config.vatValue.toDouble();
    }

    final taxPercent = materialLevelFinalPriceWithTaxForFullTax /
        materialLevelEligibleTotalFinalPrice;

    if (taxPercent.isNaN) {
      // Handle the case where the division results in NaN.
      return 0.0; // or any other suitable value
    }

    return taxPercent;
  }

  bool get priceUnderLoadingShimmer =>
      isUpserting || isUpdatingStock || isMappingPrice;

  List<MaterialInfo> get invalidSampleBonusList =>
      cartProducts.expand((item) => item.convertedSampleBonusList).toList();

  bool get isCartDetailsFetching =>
      isUpdatingStock ||
      isUpserting ||
      isFetchingBonus ||
      isAplProductLoading ||
      isUpdateProductDetermination ||
      isClearing ||
      isMappingPrice;

  List<MaterialInfo> get productsWithCounterOfferPrice => cartProducts
      .where(
        (element) =>
            isPriceOverrideDisabled &&
            element.materialInfo.counterOfferDetails.counterOfferPrice
                .isValid(),
      )
      .map(
        (e) => e.materialInfo.copyWith(
          counterOfferDetails: e.materialInfo.counterOfferDetails
              .copyWith(counterOfferPrice: CounterOfferValue('0')),
        ),
      )
      .toList();

  List<MaterialInfo> get productsWithCounterOfferDiscount => cartProducts
      .where(
        (element) =>
            !config.enableZDP8Override &&
            element.materialInfo.counterOfferDetails.discountOverridePercentage
                .isValid(),
      )
      .map(
        (e) => e.materialInfo.copyWith(
          counterOfferDetails: e.materialInfo.counterOfferDetails.copyWith(
            discountOverridePercentage: CounterOfferDiscountValue('0'),
          ),
        ),
      )
      .toList();

  bool get isPriceOverrideDisabled => user.role.type.isSalesRepRole
      ? !user.hasPriceOverride
      : !config.priceOverride;

  bool get isCounterOfferProductResetRequired =>
      productsWithCounterOfferPrice.isNotEmpty ||
      productsWithCounterOfferDiscount.isNotEmpty;

  PriceAggregate getCurrentComboItemByComboDealId(
    String comboDealId,
  ) =>
      cartProducts.firstWhere(
        (item) => (item.containComboDealInCart(comboDealId)),
        orElse: () => PriceAggregate.empty(),
      );

  List<BonusSampleItem> getNewlyAddedBonusItems(PriceAggregate product) {
    return cartProducts
        .firstWhere(
          (element) =>
              element.getMaterialNumber == product.materialInfo.materialNumber,
          orElse: () => PriceAggregate.empty(),
        )
        .getNewlyAddedItems(product.bonusSampleItems);
  }

  String get taxTitlePercent =>
      config.salesOrg.isMaterialTax ? '' : ' $totalTaxPercent%';

  List<BonusSampleItem> productBonusList(MaterialNumber material) =>
      cartProducts
          .firstWhere(
            (element) => element.materialInfo.materialNumber == material,
            orElse: () => PriceAggregate.empty(),
          )
          .bonusSampleItems;

  // The [_getTotalCount] helps to extract the count of the materials present
  // inside the cart based on material type
  int _getTotalCount(
    bool Function(PriceAggregate) typeCheck,
    int Function(PriceAggregate) countExtractor,
  ) {
    return cartProducts.where(typeCheck).fold(
          0,
          (previousValue, product) => previousValue + countExtractor(product),
        );
  }

  int get totalMaterialsCount => _getTotalCount(
        (product) => product.materialInfo.type.typeMaterial,
        (product) => 1,
      );

  int get totalBundleItemsCount => _getTotalCount(
        (product) => product.materialInfo.type.typeBundle,
        (product) => product.bundle.materials.length,
      );

  int get totalComboCount => _getTotalCount(
        (product) => product.materialInfo.type.typeCombo,
        (product) => product.comboMaterials.length,
      );

  int get totalBonusCount => _getTotalCount(
        (product) => product.materialInfo.type.typeMaterial,
        (product) => product.bonusSampleItems.length,
      );

  int get totalCartCount =>
      totalMaterialsCount +
      totalBonusCount +
      totalBundleItemsCount +
      totalComboCount;
  RequestCounterOfferDetails productCounterOfferDetails(
    MaterialNumber material,
  ) =>
      cartProducts
          .firstWhere(
            (element) => element.materialInfo.materialNumber == material,
            orElse: () => PriceAggregate.empty(),
          )
          .materialInfo
          .counterOfferDetails;

  bool get isProductDeterminationFailed =>
      cartProducts.any((e) => e.isIDProductStockInvalid);

  String deleteSuccessMessage(CartState previousCartState) {
    final previousAllMaterialNumbers = previousCartState._allMaterialNumbers;

    if (previousAllMaterialNumbers.isNotEmpty && _allMaterialNumbers.isEmpty) {
      return 'Cart has been emptied.';
    }

    for (final entry in previousAllMaterialNumbers.entries) {
      final previousProduct = previousCartState.findItemById(entry.key);
      final currentProduct = findItemById(entry.key);
      final previousProductChildren = entry.value;
      final currentProductChildren = _allMaterialNumbers[entry.key] ?? [];

      if (currentProduct == PriceAggregate.empty()) {
        if (previousProduct.materialInfo.type.typeBundle) {
          return 'Bundle has been removed from cart.';
        }

        if (previousProduct.materialInfo.type.typeCombo) {
          return 'Combo has been removed from cart.';
        }

        return 'Item has been removed from cart.';
      }

      if (previousProductChildren.length > currentProductChildren.length) {
        if (previousProduct.materialInfo.type.typeBundle) {
          return 'Item has been removed from bundle.';
        }

        return 'Item has been removed from cart.';
      }
    }

    return '';
  }

  Map<MaterialNumber, List<MaterialNumber>> get _allMaterialNumbers => {
        for (final item in cartProducts)
          item.id: [
            ...item.bonusSampleItems.map((e) => e.materialNumber),
            ...item.bundle.materials.map((e) => e.materialNumber),
            ...item.comboMaterials.map((e) => e.materialInfo.materialNumber),
          ],
      };

  PriceAggregate findItemById(MaterialNumber matNumber) =>
      cartProducts.firstWhere(
        (element) => element.id == matNumber,
        orElse: () => PriceAggregate.empty(),
      );

  List<TRObject> aplPromotionLabel(MaterialNumber materialNumber) {
    return aplSimulatorOrder.aplProducts
        .firstWhere(
          (element) => element.materialNumber == materialNumber,
          orElse: () => AplProduct.empty(),
        )
        .promotionValue;
  }

  bool get showSmallOrderFeeBottomSheet =>
      salesOrganisation.salesOrg.showSmallOrderFee &&
      aplGetTotalPrice.smallOrderFee > 0;
}
