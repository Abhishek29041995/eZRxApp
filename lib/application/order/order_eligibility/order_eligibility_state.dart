part of 'order_eligibility_bloc.dart';

@freezed
class OrderEligibilityState with _$OrderEligibilityState {
  const OrderEligibilityState._();

  const factory OrderEligibilityState({
    required List<PriceAggregate> cartItems,
    required SalesOrganisationConfigs configs,
    required SalesOrganisation salesOrg,
    required double grandTotal,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipInfo,
    required DeliveryOption deliveryOption,
    required User user,
    required double zpSubtotal,
    required double mpSubtotal,
    required double subTotal,
    required bool showErrorMessage,
    required UrgentDeliveryTimePickerOption urgentDeliveryOption,
    required String selectedRequestDeliveryDate,
  }) = _OrderEligibilityState;

  factory OrderEligibilityState.initial() => OrderEligibilityState(
        cartItems: <PriceAggregate>[],
        grandTotal: 0.0,
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipInfo: ShipToInfo.empty(),
        configs: SalesOrganisationConfigs.empty(),
        salesOrg: SalesOrganisation.empty(),
        user: User.empty(),
        deliveryOption: DeliveryOption.standardDelivery(),
        mpSubtotal: 0,
        zpSubtotal: 0,
        subTotal: 0,
        showErrorMessage: false,
        urgentDeliveryOption: UrgentDeliveryTimePickerOption(''),
        selectedRequestDeliveryDate: '',
      );

  String get orderEligibleTrackingErrorMessage {
    const invalidItemErrorMessage =
        'The following items have been identified in your cart:';
    if (!isMinOrderValuePassed) {
      final displayMinOrderAmount =
          StringUtils.displayPrice(configs, configs.zpMinOrderAmount);
      final displayMPMinOrderAmount =
          StringUtils.displayPrice(configs, configs.mpMinOrderAmount);

      if (!cartItems.containMPMaterial) {
        return 'Please ensure that minimum order value is at least $displayMinOrderAmount';
      }

      if (!mpMOVEligible && !zpMOVEligible) {
        return 'Please ensure that minimum order value is at least $displayMinOrderAmount for ZP subtotal & $displayMPMinOrderAmount for MP subtotal.';
      } else if (!zpMOVEligible) {
        return 'Please ensure that minimum order value is at least $displayMinOrderAmount for ZP subtotal.';
      } else {
        return 'Please ensure that minimum order value is at least $displayMPMinOrderAmount for MP subtotal.';
      }
    }
    if (cartItems.containInvalidTenderContractMaterial) {
      return 'Tender Contract is no longer available for one or few item(s). Please remove to continue.';
    }
    if (cartItems.hasMandatoryTenderMaterialButUnavailable) {
      return 'Product ${cartItems.mandatoryTenderMaterialButUnavailableMaterialName} need to use tender contract.';
    }
    if (cartItems.isMaxQtyExceedsForAnyTender) {
      return 'One or few item(s) order qty exceed the maximum available tender quantity.';
    }
    if (askUserToAddCommercialMaterial) {
      return 'Your cart must contain other commercial material to proceed checkout';
    }
    if (isGimmickMaterialNotAllowed) {
      return 'Gimmick material $gimmickMaterialCode is not allowed';
    }

    if (isMWPNotAllowedAndPresentInCart) {
      return '$invalidItemErrorMessage Material without price';
    }
    if (!isOOSAllowedIfPresentInCart) {
      return '$invalidItemErrorMessage Out of stock material';
    }
    if (cartContainsSuspendedPrincipal) {
      return '$invalidItemErrorMessage Principle suspended material';
    }
    if (cartContainsSuspendedMaterials) {
      return '$invalidItemErrorMessage Suspended material';
    }
    if (!isBundleQuantitySatisfies) {
      return '$invalidItemErrorMessage Unsatisfied qty bundle';
    }

    return '';
  }

  bool get comboDealEligible {
    if (!configs.enableComboDeals) return false;
    if (customerCodeInfo.salesDeals.isEmpty) return false;

    final comboDealUserRole = configs.comboDealsUserRole;
    final userRole = user.role.type;

    if (comboDealUserRole.isAllUsers) {
      return true;
    }

    if (comboDealUserRole.isCustomerOnly && userRole.isCustomer) {
      return true;
    }

    if (comboDealUserRole.isSalesRepOnly && userRole.isSalesRepRole) {
      return true;
    }

    return false;
  }

  bool get containsRegularMaterials => cartItems
      .any((element) => !element.materialInfo.isSpecialOrderTypeMaterial);

  bool get validateRegularOrderType =>
      user.selectedOrderType.isZPOR && !configs.salesOrg.isTH
          ? containsRegularMaterials
          : true;

  bool get displayInvalidItemsWarning =>
      displayInvalidItemsBanner && showErrorMessage;

  /*MWP: Material Without Price*/
  bool get isMWPNotAllowedAndPresentInCart =>
      cartItems.any(
        (e) => e.materialInfo.type.typeMaterial && e.price.finalPrice.isEmpty,
      ) &&
      !configs.materialWithoutPrice;

  bool get isOOSAllowedIfPresentInCart =>
      ((_isOOSOrderPresent && isOOSOrderAllowedToSubmit) ||
          !_isOOSOrderPresent);

  bool get isBundleQuantitySatisfies => cartItems
      .where((element) => element.materialInfo.type.typeBundle)
      .map((e) => e.bundle)
      .every((e) => e.miniumQtySatisfied);

  bool get isOOSOrderAllowedToSubmit => (configs.addOosMaterials
          .getOrDefaultValue(false) &&
      (configs.oosValue.isOosValueZero ? user.role.type.isSalesRepRole : true));

  bool get _isOOSOrderPresent =>
      cartItems.any((element) => element.containOOSItem);

  bool get displayMWPNotAllowedWarning =>
      isMWPNotAllowedAndPresentInCart && showErrorMessage;

  bool get cartContainsSuspendedMaterials =>
      cartItems.any((product) => product.isSuspendedMaterial);

  bool get cartContainsSuspendedPrincipal =>
      cartItems.any((product) => product.materialInfo.isPrincipalSuspended);

  bool get isComboNotAllowedIfPresentInCart =>
      !comboDealEligible &&
      cartItems.any((product) => product.materialInfo.type.typeCombo);

  bool get displayInvalidItemsBanner =>
      cartContainsSuspendedMaterials ||
      isMWPNotAllowedAndPresentInCart ||
      !isOOSAllowedIfPresentInCart ||
      cartContainsSuspendedPrincipal ||
      isComboNotAllowedIfPresentInCart;

  List<MaterialInfo> get invalidMaterialCartItems => cartItems
      .where(
        (item) =>
            item.materialInfo.type.typeMaterial &&
            (item.isSuspendedMaterial ||
                item.materialInfo.isPrincipalSuspended ||
                (item.price.finalPrice.isEmpty &&
                    isMWPNotAllowedAndPresentInCart) ||
                (!item.inStock && !isOOSAllowedIfPresentInCart)),
      )
      .map((item) => item.materialInfo.copyWith(quantity: MaterialQty(0)))
      .toList();

  bool get displayPriceNotAvailableMessage =>
      configs.materialWithoutPrice &&
      cartItems.any(
        (e) => e.materialInfo.type.typeMaterial && e.invalidPrice,
      );

  List<MaterialInfo> get invalidBundleCartItems => cartItems
      .where((element) => element.materialInfo.type.typeBundle)
      .expand(
        (element) => element.bundle.materials
            .where(
              (element) =>
                  (!element.inStock && !isOOSAllowedIfPresentInCart) ||
                  element.isSuspended,
            )
            .map(
              (e) => e.copyWith(
                quantity: MaterialQty(0),
                parentID: element.bundle.bundleCode,
              ),
            ),
      )
      .toList();

  List<PriceAggregate> get invalidComboItems => cartItems
      .where((item) => !comboDealEligible && item.materialInfo.type.typeCombo)
      .expand(
        (item) => item.convertComboItemToPriceAggregateList.map(
          (priceAggregate) => priceAggregate.copyWith(
            quantity: 0,
            price: priceAggregate.price.copyWith(
              comboDeal: priceAggregate.price.comboDeal.copyWith(
                isEligible: false,
              ),
            ),
          ),
        ),
      )
      .toList();

  List<MaterialInfo> get invalidCartItems =>
      [...invalidMaterialCartItems, ...invalidBundleCartItems];

  bool get displayInvalidOOSOnCartItem =>
      !isOOSOrderAllowedToSubmit && configs.hideStockDisplay;

  bool get isNotAvailableToCheckoutForID => cartItems.any(
        (element) => element.showErrorMessageForID,
      );

  bool get isCheckoutDisabled =>
      !isBundleQuantitySatisfies ||
      displayInvalidItemsBanner ||
      isNotAvailableToCheckoutForID ||
      !isMinOrderValuePassed ||
      askUserToAddCommercialMaterial ||
      isGimmickMaterialNotAllowed ||
      hasInvalidTenderMaterial ||
      isMaxQtyExceedsForAnyTender ||
      atLeastOneItemInStockRequired ||
      cartItems.hasMandatoryTenderMaterialButUnavailable ||
      isSelectedRequestDeliveryDateEmpty;

  List<bool> get activeErrorsList => [
        displayMovWarning,
        displayInvalidItemsWarning,
        isNotAvailableToCheckoutForID,
        askUserToAddCommercialMaterial,
        isGimmickMaterialNotAllowed,
        hasInvalidTenderMaterial,
        isMaxQtyExceedsForAnyTender,
        atLeastOneItemInStockRequired,
        cartItems.hasMandatoryTenderMaterialButUnavailable,
      ].where((condition) => condition).toList();

  bool get hasMultipleErrors => activeErrorsList.length > 1;

  bool get is26SeriesMaterialOnlyInCart =>
      cartItems.isNotEmpty &&
      cartItems.every((element) => element.is26SeriesMaterial);

  String get gimmickMaterialCode => cartItems
      .where((element) => element.materialInfo.isGimmick)
      .map((e) => e.materialInfo.materialNumber.displayMatNo)
      .toList()
      .join(',');

  bool get hasInvalidTenderMaterial =>
      cartItems.isNotEmpty && cartItems.containInvalidTenderContractMaterial;

  bool get isMaxQtyExceedsForAnyTender =>
      cartItems.isNotEmpty && cartItems.isMaxQtyExceedsForAnyTender;

  bool get isGimmickMaterialNotAllowed =>
      cartItems.containGimmickMaterial &&
      (!configs.enableGimmickMaterial || !user.role.type.isSalesRepRole);

  bool get askUserToAddCommercialMaterial =>
      is26SeriesMaterialOnlyInCart ||
      (configs.enableGimmickMaterial && cartItems.isGimmickMaterialOnlyInCart);

  //============================================================
  // Minimum order value
  //
  //============================================================

  TRObject get movNotEligibleMessage {
    final displayZPMinOrderAmount = StringUtils.displayPrice(
      configs,
      configs.zpMinOrderAmount,
    );

    var errorMessage = TRObject(
      'Please ensure that minimum order value is at least {mov}',
      arguments: {'mov': displayZPMinOrderAmount},
    );

    if (cartItems.containMPMaterial) {
      final displayMPMinOrderAmount = StringUtils.displayPrice(
        configs,
        configs.mpMinOrderAmount,
      );

      if (!zpMOVEligible && !mpMOVEligible) {
        errorMessage = TRObject(
          'Please ensure that minimum order value is at least {zpMOV} for ZP subtotal & {mpMOV} for MP subtotal.',
          arguments: {
            'zpMOV': displayZPMinOrderAmount,
            'mpMOV': displayMPMinOrderAmount,
          },
        );
      } else if (!zpMOVEligible) {
        errorMessage = TRObject(
          'Please ensure that minimum order value is at least {mov} for ZP subtotal.',
          arguments: {
            'mov': displayZPMinOrderAmount,
          },
        );
      } else {
        errorMessage = TRObject(
          'Please ensure that minimum order value is at least {mov} for MP subtotal.',
          arguments: {
            'mov': displayMPMinOrderAmount,
          },
        );
      }
    }

    return errorMessage;
  }

  bool get displayMovWarning =>
      !isMinOrderValuePassed && showErrorMessage && !isAccountSuspended;

  bool get isMinOrderValuePassed {
    if (_hasPrincipal) {
      return true;
    }
    if (_eligibleOrderType) {
      return true;
    }
    if (_hasMinistryOfHealthProduct) {
      return true;
    }
    if (_isCartItemsContainsFOCMaterial) {
      return true;
    }
    if (cartItems.hasTenderContract) {
      return true;
    }

    return !isAccountSuspended ? isTotalGreaterThanMinOrderAmount : false;
  }

  bool get isAccountSuspended {
    if (salesOrg.salesOrg.isID) return shipInfo.customerBlock.isCustomerBlocked;

    return customerCodeInfo.status.isSuspended || shipInfo.status.isSuspended;
  }

  bool get _hasMinistryOfHealthProduct =>
      cartItems.containMinistryOfHealthMaterial;

  bool get _hasPrincipal =>
      user.role.type.isExternalSalesRep &&
      cartItems.where((e) => e.hasSalesRepPrincipal).isNotEmpty;

  bool get _eligibleOrderType =>
      (user.selectedOrderType.isZPFC || user.selectedOrderType.isZPFB) &&
      salesOrg.salesOrg.bypassMovWithEligibleOrderType;

  bool get _isCartItemsContainsFOCMaterial => cartItems
      .where((element) => element.materialInfo.isFOCMaterial)
      .isNotEmpty;

  bool get isTotalGreaterThanMinOrderAmount => zpMOVEligible && mpMOVEligible;

  // If small order fee is enabled, will validate MOV using value from SAP instead of from SalesConfig
  bool get zpMOVEligible {
    if (cartItems.zpMaterialOnly.isEmpty) return true;

    if (zpSmallOrderFeeEnable) {
      if (user.role.type.isExternalSalesRep) {
        return _extSalesRepMOVEligible;
      }

      return true;
    }

    if (atLeastOneZPItemInStockRequired) {
      return true;
    }

    if (isIntSalesRepWithSmallOrderFeeForCustomer) {
      return zpSubtotalInStockGreaterThanSAPMOV;
    }

    if (cartItems.containMPMaterial || user.role.type.isInternalSalesRep) {
      return zpSubtotal >= configs.zpMinOrderAmount;
    }

    if (salesOrg.salesOrg.checkMOVonSubTotal) {
      return subTotal >= configs.zpMinOrderAmount;
    }

    return grandTotal >= configs.zpMinOrderAmount;
  }

  bool get mpMOVEligible =>
      cartItems.mpMaterialOnly.isEmpty ||
      mpSubtotal >= configs.mpMinOrderAmount ||
      mpSmallOrderFeeEnable;

  bool get zpSubtotalInStockGreaterThanSAPMOV =>
      cartItems.zpMaterialOnly.subtotalWithInStockOnly >=
      configs.sapMinOrderAmount;

  //============================================================
  // Small order fee
  //
  //============================================================
  TRObject get smallOrderFeeAppliedMessage {
    final zpSAPMOV =
        StringUtils.displayPrice(configs, configs.sapMinOrderAmount);
    final mpSAPMOV =
        StringUtils.displayPrice(configs, configs.mpSAPMinOrderAmount);

    if (showSmallOrderFeeForID) {
      return TRObject(
        'A small order fee applies to orders with ZP in-stock items that are under the minimum order value of {smallOrderFee} for ZP subtotal.',
        arguments: {
          'smallOrderFee': StringUtils.priceComponentDisplayPrice(
            configs,
            salesOrg.salesOrg.smallOrderThreshold,
            false,
          ),
        },
      );
    }

    if (zpSmallOrderFeeApplied && mpSmallOrderFeeApplied) {
      return TRObject(
        'A small order fee applies to orders with ZP and MP in-stock items separately that are under the minimum order value of {zpSmallOrderFee} ZP subtotal & {mpSmallOrderFee} for MP subtotal.',
        arguments: {
          'zpSmallOrderFee': zpSAPMOV,
          'mpSmallOrderFee': mpSAPMOV,
        },
      );
    }

    if (zpSmallOrderFeeApplied) {
      return TRObject(
        'A small order fee applies to orders with ZP in-stock items that are under the minimum order value of {smallOrderFee} for ZP subtotal.',
        arguments: {'smallOrderFee': zpSAPMOV},
      );
    }

    if (mpSmallOrderFeeApplied) {
      return TRObject(
        'A small order fee applies to orders with MP in-stock items that are under the minimum order value of {smallOrderFee} for MP subtotal.',
        arguments: {'smallOrderFee': mpSAPMOV},
      );
    }

    return TRObject(
      'Small order fee is applied to orders with in-stock items that are under the minimum order value of {smallOrderFee}. This will be charged to client.',
      arguments: {'smallOrderFee': zpSAPMOV},
    );
  }

  bool get showSmallOrderFeeForID => salesOrg.salesOrg.showSmallOrderFee;

  bool get smallOrderFeeApplied =>
      zpSmallOrderFeeApplied ||
      mpSmallOrderFeeApplied ||
      showSmallOrderFeeForID;

  double get smallOrderFee => zpSmallOrderFee + mpSmallOrderFee;

  double get zpSmallOrderFee =>
      zpSmallOrderFeeApplied ? configs.smallOrderFee : 0.0;

  double get mpSmallOrderFee =>
      mpSmallOrderFeeApplied ? configs.mpSmallOrderFee : 0.0;

  bool get zpSmallOrderFeeApplied {
    if (!zpSmallOrderFeeEnable) return false;

    if (atLeastOneZPItemInStockRequired) return false;

    if (cartItems.zpMaterialOnly.isMOVExclusion) return false;

    if (user.role.type.isExternalSalesRep) {
      return false;
    }

    if (cartItems.zpMaterialOnly.containCovidMaterial) return false;

    if (cartItems.zpMaterialOnly.containMinistryOfHealthMaterial &&
        configs.salesOrg.isSg) return false;

    return !zpSubtotalInStockGreaterThanSAPMOV;
  }

  bool get mpSmallOrderFeeApplied {
    if (!mpSmallOrderFeeEnable) return false;
    if (atLeastOneMPItemInStockRequired) return false;

    return cartItems.mpMaterialOnly.subtotalWithInStockOnly <
        configs.mpSAPMinOrderAmount;
  }

  bool get atLeastOneItemInStockRequired =>
      atLeastOneMPItemInStockRequired || atLeastOneZPItemInStockRequired;

  bool get atLeastOneMPItemInStockRequired =>
      cartItems.mpMaterialOnly.every((e) => e.containAllOOSItem) &&
      mpSmallOrderFeeEnable;

  bool get atLeastOneZPItemInStockRequired =>
      cartItems.zpMaterialOnly.every((e) => e.containAllOOSItem) &&
      (zpSmallOrderFeeEnable || isIntSalesRepWithSmallOrderFeeForCustomer);

  bool get mpSmallOrderFeeEnable =>
      cartItems.mpMaterialOnly.isNotEmpty &&
      configs.enableMPSmallOrderFee &&
      configs.mpSmallOrderFeeUserRoles
          .contains(user.role.type.smallOrderFeeRole);

  bool get zpSmallOrderFeeEnable =>
      cartItems.zpMaterialOnly.isNotEmpty &&
      configs.enableSmallOrderFee &&
      configs.smallOrderFeeUserRoles.contains(user.role.type.smallOrderFeeRole);

  bool get isIntSalesRepWithSmallOrderFeeForCustomer =>
      user.role.type.isInternalSalesRep &&
      configs.enableSmallOrderFee &&
      [
        RoleType.clientUser().smallOrderFeeRole,
        RoleType.clientAdmin().smallOrderFeeRole,
      ].any((role) => configs.smallOrderFeeUserRoles.contains(role));

  bool get _isAuthorizedExternalSalesRep =>
      configs.authorizedExtSalesRep.any((e) => e.userId.toString() == user.id);

  bool get smallOrderFeeForExtSalesRep =>
      user.role.type.isExternalSalesRep &&
      zpSmallOrderFeeEnable &&
      !zpSubtotalInStockGreaterThanSAPMOV &&
      !cartItems.zpMaterialOnly.isMOVExclusion;

  bool get agreeSmallOrderFeeForExtSalesRep =>
      smallOrderFeeForExtSalesRep && _isAuthorizedExternalSalesRep;

  bool get _extSalesRepMOVEligible =>
      cartItems.zpMaterialOnly.isMOVExclusion ||
      _isAuthorizedExternalSalesRep ||
      user.isPPATriggerMaintained ||
      zpSubtotalInStockGreaterThanSAPMOV;

  SalesRepAuthorizedDetails get getSalesRepAuthorizedDetails {
    if (!smallOrderFeeForExtSalesRep || zpSubtotalInStockGreaterThanSAPMOV) {
      return SalesRepAuthorizedDetails.empty();
    }

    if (cartItems.isMOVExclusion) {
      return SalesRepAuthorizedDetails.isMOVExclusion();
    }

    return _isAuthorizedExternalSalesRep
        ? SalesRepAuthorizedDetails.authorizedExtSalesRep(
            user.username.getValue(),
          )
        : SalesRepAuthorizedDetails.empty(
            sendPayload: user.isPPATriggerMaintained,
          );
  }

  bool get isSelectedRequestDeliveryDateEmpty =>
      deliveryOption == DeliveryOption.requestDeliveryDate() &&
      selectedRequestDeliveryDate.isEmpty;

  String get submittedDeliveryOption => configs.displayDeliveryOptions
      ? deliveryOption == DeliveryOption.urgentDelivery()
          ? urgentDeliveryOption.getOrDefaultValue('')
          : deliveryOption.getOrDefaultValue('')
      : '';

  double get deliveryFee =>
      deliveryOption == DeliveryOption.urgentDelivery() ? urgentDeliveryFee : 0;

  double get urgentDeliveryFee {
    if (urgentDeliveryOption == UrgentDeliveryTimePickerOption.today()) {
      return configs.todayDeliveryFee;
    }
    if (urgentDeliveryOption == UrgentDeliveryTimePickerOption.tomorrow()) {
      return configs.tomorrowDeliveryFee;
    }
    if (urgentDeliveryOption == UrgentDeliveryTimePickerOption.saturday()) {
      return configs.saturdayDeliveryFee;
    }

    return 0.0;
  }
}
