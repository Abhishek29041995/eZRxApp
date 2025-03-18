part of 'eligibility_bloc.dart';

@freezed
class EligibilityState with _$EligibilityState {
  const EligibilityState._();

  const factory EligibilityState({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required CustomerCodeConfig customerCodeConfig,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoadingCustomerCode,
    required bool preSelectShipTo,
    required bool isStockInfoNotAvailable,
    required bool isNetworkAvailable,
  }) = _EligibilityState;

  factory EligibilityState.initial() => EligibilityState(
        user: User.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        salesOrgConfigs: SalesOrganisationConfigs.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        customerCodeConfig: CustomerCodeConfig.empty(),
        failureOrSuccessOption: none(),
        preSelectShipTo: false,
        isLoadingCustomerCode: false,
        isStockInfoNotAvailable: false,
        isNetworkAvailable: true,
      );

  bool get isReturnsEnable {
    // If returns are disabled from
    // 1. User level
    // 2. Customer Code Config
    // return false
    if (user.disableReturns || customerCodeConfig.disableReturns) {
      return false;
    }

    final salesRepRoleAndDisabled =
        user.role.type.isSalesRepRole && salesOrgConfigs.disableReturnsAccessSR;

    final customerAndDisabled =
        user.role.type.isCustomer && salesOrgConfigs.disableReturnsAccess;

    // If returns are disabled at sales org level respective of their role, return false
    if (salesRepRoleAndDisabled || customerAndDisabled) {
      return false;
    }

    return true;
  }

  bool get isPaymentEnabled {
    if (user.role.type.isSalesRepRole) {
      return false;
    }

    if (salesOrg.isSg && customerCodeInfo.paymentTerm.isOutsideOfSystem) {
      return false;
    }

    if (salesOrgConfigs.disablePayment) {
      return false;
    }

    if (customerCodeConfig.disablePayments) {
      return false;
    }

    if (user.isCustomerWithPaymentsDisable) {
      return false;
    }

    return true;
  }

  bool get canOrderCovidMaterial {
    // 1. SG Covid
    return (user.role.type.isCustomer &&
            salesOrganisation.salesOrg.isSg &&
            customerCodeInfo.customerAttr7.isZEV) ||

        // 2. PH Covid
        (user.role.type.isCustomer &&
            salesOrganisation.salesOrg.isPH &&
            customerCodeInfo.customerGrp4.canOrderCovidMaterial);
  }

  bool get isOrderTypeEnable {
    // TH user disable order type
    if (!user.enableOrderType && salesOrganisation.salesOrg.isTH) {
      return false;
    }

    // 1. country must be case 'TH', 'SG', 'TW', 'MY'
    if (salesOrganisation.salesOrg.isValidCountryOrderTypeEligible &&
        isOrderTypeEligible) {
      return true;
    }

    return false;
  }

  bool get isOrderTypeEnableAndSpecialOrderType =>
      !isOrderTypeEnable || !user.selectedOrderType.isSpecialOrderType;

  // ***pickAndPack values***
  String get getPNPValueMaterial {
    // Condition 1: user role type must be SalesRep
    // Condition 2: If SG user then pickAndPack = "include"
    // Condition 3: If TH,MY,TW user then pickAndPack = "include" (isOrderTypeEnable already covers this so can reuse that)
    return user.role.type.isSalesRepRole &&
            (salesOrganisation.salesOrg.isSg || isOrderTypeEnable)
        ? 'include'
        : '';
  }

  String get getPNPValueCovidMaterial {
    // Condition 1: For Covid Tab Materials and Non-SG user, pickAndPack = "only"
    return user.role.type.isSalesRepRole && !salesOrganisation.salesOrg.isSg
        ? 'only'
        : '';
  }

  bool get isAccountSuspended {
    return customerCodeInfo.status.isSuspended || shipToInfo.status.isSuspended;
  }

  String get getPNPValueBonusMaterialSearch {
    // Condition 1: user role type must be SalesRep
    // Condition 2: If SG and MY user, then pickAndPack = "include"
    return user.role.type.isSalesRepRole &&
            (salesOrganisation.salesOrg.isSg || salesOrganisation.salesOrg.isMY)
        ? 'include'
        : '';
  }

  bool get validateOutOfStockValue => salesOrgConfigs.oosValue.isOosValueZero
      ? user.role.type.isSalesRepRole
      : true;

  bool get doNotAllowOutOfStockMaterials =>
      !(salesOrgConfigs.addOosMaterials.getOrDefaultValue(false) &&
          validateOutOfStockValue);

  bool get isBonusOverrideEnable => user.role.type.isSalesRepRole
      ? user.hasBonusOverride
      : salesOrgConfigs.priceOverride;

  bool get isSalesRepAndBonusEligible =>
      salesOrganisation.salesOrg.isMY &&
      user.role.type.isSalesRepRole &&
      user.hasBonusOverride;

  bool get isBillToInfo =>
      customerCodeInfo.hasBillToInfo && salesOrgConfigs.enableBillTo;

  bool get isZDP8Override =>
      user.role.type.isSalesRepRole && salesOrgConfigs.enableZDP8Override;

  bool get isPriceOverrideEnable => user.role.type.isSalesRepRole
      ? user.hasPriceOverride
      : salesOrgConfigs.priceOverride;

  bool get showGreenDeliveryBox {
    final gdEligibleRole = salesOrgConfigs.greenDeliveryUserRole;
    final roleType = user.role.type;

    if (!salesOrgConfigs.enableGreenDelivery) {
      return false;
    }

    if (gdEligibleRole.isAllUsers) {
      return true;
    }

    if (gdEligibleRole.isCustomer && roleType.isCustomer) {
      return true;
    }

    if (gdEligibleRole.isSalesReps && roleType.isSalesRepRole) {
      return true;
    }

    return false;
  }

  bool get comboDealEligible {
    if (!salesOrgConfigs.enableComboDeals) return false;
    if (customerCodeInfo.salesDeals.isEmpty) return false;

    final comboDealUserRole = salesOrgConfigs.comboDealsUserRole;
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

  bool get bundleMaterialEnabled =>
      !salesOrgConfigs.disableBundles && !salesOrgConfigs.disablePromotion;

  bool get isBundleMaterialEnable =>
      !salesOrgConfigs.disableBundles &&
      !user.selectedOrderType.isSpecialOrderType;

  //============================================================
  // 1. user role type must be SalesRep
  // 2. sales org config OrderType feature toggle enable
  //============================================================
  bool get isOrderTypeEligible =>
      user.role.type.isSalesRepRole && !salesOrgConfigs.disableOrderType;

  bool get isBonusSampleItemVisible =>
      isBonusOverrideEnable && !user.selectedOrderType.isSpecialOrderType;

  bool get _isOrderTypeEligibleAndSpecialOrderType =>
      isOrderTypeEligible && user.selectedOrderType.isSpecialOrderType;

  bool get isCounterOfferVisible =>
      !_isOrderTypeEligibleAndSpecialOrderType &&
      (isPriceOverrideEnable || isZDP8Override);

  bool get isMYExternalSalesRepUser =>
      salesOrganisation.salesOrg.isMY && user.role.type.isExternalSalesRep;

  SalesOrg get salesOrg => salesOrganisation.salesOrg;

  bool get haveShipTo => shipToInfo != ShipToInfo.empty();

  bool get isReturnsOverrideEnable {
    if (user.role.type.isSalesRepRole &&
        salesOrgConfigs.disableOverrideFieldSR) {
      return false;
    }

    if (user.role.type.isCustomer &&
        salesOrgConfigs.disableOverrideFieldCustomer) {
      return false;
    }

    return true;
  }

  bool get isZDP5eligible =>
      salesOrgConfigs.salesOrg.isVN && salesOrgConfigs.enableZDP5;

  bool get isNotificationSettingsEnable =>
      user.userCanAccessOrderHistory || isPaymentEnabled || isReturnsEnable;

  bool get disableCreateOrder =>
      !user.userCanCreateOrder ||
      customerBlockOrSuspended ||
      customerCodeInfo.status.isEDI;

  bool get showMaterialDescInMandarin =>
      salesOrg.isTW && user.preferredLanguage.isMandarin;

  bool get haveCustomerCodeInfo =>
      customerCodeInfo != CustomerCodeInfo.empty() &&
      customerCodeInfo.customerCodeSoldTo.isNotEmpty;

  String get displayShipToCustomerCode =>
      haveShipTo ? shipToInfo.shipToCustomerCode : 'NA';

  String get displayShipTo =>
      haveCustomerCodeInfo ? shipToInfo.fullDeliveryAddress : 'NA';

  StatusType get outOfStockProductStatus => StatusType(
        validateOutOfStockValue
            ? salesOrgConfigs.addOosMaterials.oosMaterialTag
            : salesOrgConfigs.addOosMaterials.oosTag,
      );

  bool get disablePaymentTermsDisplayForCustomer =>
      salesOrgConfigs.disablePaymentTermsDisplay && user.role.type.isCustomer;

  //============================================================
  // MARKETPLACE
  //
  //============================================================
  bool get marketPlacePaymentEligible =>
      user.acceptMPTC.isAccept && customerCodeInfo.isMarketPlace;

  bool get marketPlaceEligible {
    if (!isMarketPlaceEnabled) return false;
    if (!user.acceptMPTC.isAccept) return false;

    return true;
  }

  bool get showMarketPlaceTnc {
    if (!user.acceptPrivacyPolicy) return false;
    if (!isMarketPlaceEnabled) return false;
    if (!user.acceptMPTC.isUnknown) return false;

    return true;
  }

  bool get isMarketPlaceEnabled {
    if (!salesOrgConfigs.enableMarketPlace) return false;
    if (!customerCodeInfo.isMarketPlace) return false;
    if (!user.role.type.canAccessMarketPlace) return false;

    return true;
  }

  String get productManufacturerFilterTitle =>
      marketPlaceEligible ? 'Manufacturers & Sellers' : 'Manufacturer';

  String get atLeastOneStockItemInStockMessage => marketPlaceEligible
      ? 'To proceed, at least one (1) ZP or MP item must be in stock.'
      : 'To proceed, at least one (1) item must be in stock.';

  //============================================================
  //============================================================

  bool get customerBlockOrSuspended {
    if (salesOrg.isID) return shipToInfo.customerBlock.isCustomerBlocked;

    return isAccountSuspended || shipToInfo.customerBlock.isCustomerBlocked;
  }

  // Used in listenWhen for BlocListener for sections in home page to refresh the data
  // when pulling to refresh or selecting a new shipTo
  bool isRefreshed(
    EligibilityState previous, {
    bool onOrderTypeChanged = true,
  }) {
    final isLoadShipToSuccess =
        previous.isLoadingCustomerCode != isLoadingCustomerCode &&
            !isLoadingCustomerCode;
    final isSelectNewShipTo = previous.shipToInfo != shipToInfo && haveShipTo;
    final isSelectNewLanguage =
        previous.user.preferredLanguage != user.preferredLanguage &&
            user != User.empty();
    final isUpdateMarketPlaceTnC =
        previous.user.acceptMPTC != user.acceptMPTC && user != User.empty();
    final isSelectNewOrderType =
        previous.user.selectedOrderType != user.selectedOrderType &&
            user.selectedOrderType.isValid();

    return isLoadShipToSuccess ||
        isSelectNewShipTo ||
        isSelectNewLanguage ||
        isUpdateMarketPlaceTnC ||
        (isSelectNewOrderType && onOrderTypeChanged);
  }

  double get paymentHomeItemWidthRatio => salesOrg.isPaymentClaimEnabled ||
          !salesOrgConfigs.statementOfAccountEnabled
      ? 0.45
      : 0.3;

  //============================================================
  // Order type
  //
  //============================================================

  bool get gimmickMaterialEnabled =>
      user.role.type.isSalesRepRole &&
      (salesOrgConfigs.salesOrg.isTH || salesOrgConfigs.enableGimmickMaterial);

  bool get sampleMaterialEnabled =>
      isShowOrderType &&
      user.selectedOrderType.isZPFB &&
      salesOrgConfigs.orderTypes.any((e) => e.categoryId.isZPFB && e.enabled);

  bool get poisonMaterialEnabled => salesOrg.isHK;

  bool get isInvalidSelectedOrderType =>
      !salesOrgConfigs.orderTypes
          .any((e) => e.categoryId == user.selectedOrderType && e.enabled) &&
      isShowOrderType;

  OrderType get selectedOrderTypeInfo => salesOrgConfigs.orderTypes.firstWhere(
        (e) => e.categoryId == user.selectedOrderType,
        orElse: () =>
            OrderType.empty().copyWith(categoryId: user.selectedOrderType),
      );

  bool get isShowOrderType =>
      user.role.type.isSalesRepRole &&
      !salesOrgConfigs.disableOrderType &&
      user.enableOrderType &&
      salesOrgConfigs.orderTypes
          .where((element) => !element.categoryId.isZPOR)
          .isNotEmpty;

  //============================================================
  //============================================================
}
