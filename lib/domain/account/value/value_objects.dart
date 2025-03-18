import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/bu_contact.dart';
import 'package:ezrxmobile/domain/account/value/value_transformers.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:flutter/material.dart';

class CustomerCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerCode(String input) {
    return CustomerCode._(validateStringNotEmpty(input));
  }

  String get checkAllOrCustomerCode {
    return checkAllOrDash(value.getOrElse(() => ''));
  }

  const CustomerCode._(this.value);
}

class SalesOrg extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SalesOrg(String input) {
    return SalesOrg._(validateStringNotEmpty(input.trim()));
  }

  String get buName {
    return salesOrgBuName(value.getOrElse(() => ''));
  }

  String get fullName {
    return '${value.getOrElse(() => '')} - $buName';
  }

  String get languageCode {
    return salesOrgLanguageCode(country);
  }

  String get languageCodeForHelpAndSupport {
    return helpAndSupportLanguageCode(country);
  }

  String get defaultBannerPath => getDefaultBannerPath(country);

  String get country {
    return salesOrgCountry(value.getOrElse(() => ''));
  }

  AppMarket get appMarket => AppMarket(country);

  String get contactEmail {
    return salesOrgEmail(value.getOrElse(() => ''));
  }

  BuContact get contact {
    return salesOrgContact(value.getOrElse(() => ''));
  }

  String get contactPersonName {
    return salesOrgContactPerson(value.getOrElse(() => ''));
  }

  String get taxCode {
    return salesOrgTaxCode(country);
  }

  String get subTotalText {
    return subTotalTextString(country);
  }

  bool get isVN {
    return country == 'VN';
  }

  bool get isMaterialTax => isVN || isMM;

  bool get isSg {
    return country == 'SG';
  }

  bool get isPH {
    return country == 'PH';
  }

  bool get isTH {
    return country == 'TH';
  }

  bool get isMY {
    return country == 'MY';
  }

  bool get isTW {
    return country == 'TW';
  }

  bool get isID {
    return country == 'ID';
  }

  bool get isMM {
    return country == 'MM';
  }

  bool get isKH {
    return country == 'KH';
  }

  bool get isKR {
    return country == 'KR';
  }

  bool get isHK => country == 'HK';

  bool get isPhMdi => salesOrgIsPhMdi(value.getOrElse(() => ''));

  bool get needUpdatePaymentGateway => isMY || isVN;

  bool get isPaymentNeedOpenWebView => !isSg;

  bool get isValidCountryOrderTypeEligible {
    return countrySupportOrderType(country);
  }

  bool get isPaymentClaimEnabled => isPH;

  bool get isPDOSealEnabled => isPH;

  bool get isAboutUsEnabled => !isVN;

  int get countWhenValid => isValid() ? 1 : 0;

  Locale get announcementLocale =>
      Locale(languageCodeForHelpAndSupport, country);

  String get announcementVariablePath => countryAnnouncementPath(country);

  String get articleTagVariablePath => countryArticleTagPath(country);

  String get announcementTagVariablePath => countryAnnouncementTagPath(country);

  String get articleVariablePath => countryArticlePath(country);

  String get aboutUsVariablePath => countryAboutUsPath(country);

  String get countryFlag => getCountryFlag(country);

  String get faqVariablePath => countryFaqPath(country);

  String get customerPaymentResponsePath =>
      countryCustomerPaymentResponsePath(country);

  String get paymentInfoResponsePath => countryPaymentInfoResponsePath(country);

  String get paymentIdPretext => getPaymentIdPretext(country);

  int get cutOffTime => countryCutOffTime(country);

  double get smallOrderThreshold => countrySmallOrderThreshold(country);

  bool get showSmallOrderFee => isID;

  bool get showManualFee => isID;
  bool get showReturnTypeSection => isTH;

  bool get showTaxDescription => isTH || isMM || isKH;

  String get taxTitle => isMaterialTax ? 'Tax' : 'Tax at';

  bool get showTotalSaving => isID;

  bool get showGovNumber => isVN;

  bool get showBonus => !isID;

  bool get isProductDeterminationApplicable => isID;

  bool get checkMOVonSubTotal => isTH || isSg;

  bool get bypassMovWithEligibleOrderType => !isHK;

  String get maintenanceBannerPathId =>
      countryToMaintenanceBannerPathId(country);

  String get maintenancePathId {
    if (isPH) return 'C6B6D79B-3D53-4AF8-812C-AC83472F1';

    if (isSg) return '1FFEC4CB-D518-42B9-AE58-952CC0984DF0';

    if (isID) return '25256DFD-D111-43F1-B29A-2FABB6B45E42';

    if (isKH) return 'B4444BCE-4508-4F34-B150-5DD4C5D1A74F';

    if (isKR) return 'E64D62D9-69A2-4610-AA8C-37B1C1C77DEA';

    if (isMM) return '4A238A3A-1840-414F-882B-A64F21842384';

    if (isTH) return 'F3A68975-2A83-4859-90E7-7226DD9DA614';

    if (isTW) return 'CA38B790-5B32-4895-9656-D3ECEAC274C9';

    if (isVN) return 'B895ED50-F741-4266-869C-E5D21911639B';

    return '294DBC60-6394-4284-9D2B-B3270D0459EF';
  }

  List<StatusType> get orderHistoryFilterStatusList =>
      getOrderHistoryFilterStatusList(isID);

  bool get displayViewByOrderFilterByStatus => isID;

  String get aboutUsMockFile => 'aboutUs${country}marketStaticContent.json';

  const SalesOrg._(this.value);
}

class OosValue extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory OosValue(int input) {
    return OosValue._(Right(input));
  }

  bool get isOosValueZero {
    return isZero(value.getOrElse(() => 0));
  }

  const OosValue._(this.value);
}

class RoleType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RoleType(String input) {
    return RoleType._(validateStringNotEmpty(input));
  }

  factory RoleType.clientAdmin() => RoleType('client_admin');
  factory RoleType.clientUser() => RoleType('client_user');

  bool get canLoginOnBehalf {
    return isAdmin(value.getOrElse(() => ''));
  }

  bool get hasReturnsAdminAccess {
    return isAdmin(value.getOrElse(() => ''));
  }

  bool get hasAdminAccess {
    return isAdmin(value.getOrElse(() => ''));
  }

  String get purchaseOrderType {
    return roleOrderType(value.getOrElse(() => ''));
  }

  bool get isZPAdmin {
    return value.getOrElse(() => '') == 'zp_admin';
  }

  bool get isRootAdmin {
    return value.getOrElse(() => '') == 'root_admin';
  }

  bool get isEligibleLoginRoleForZPAdmin {
    return roleCanLoginOnBehalfByZPAdmin(value.getOrElse(() => ''));
  }

  bool get isReturnAdmin {
    return value.getOrElse(() => '') == 'return_admin';
  }

  bool get isClientAdmin {
    return value.getOrElse(() => '') == 'client_admin';
  }

  bool get isZpAdminAttachments {
    return value.getOrElse(() => '') == 'zp_admin_attachments';
  }

  // it indicate both check the customer with role type as user or client user
  bool get isClientUser {
    return value.getOrElse(() => '') == 'client_user' || isUser;
  }

  // it indicate the customer with role type as user
  bool get isUser {
    return value.getOrElse(() => '') == 'user';
  }

  bool get isInternalSalesRep {
    return value.getOrElse(() => '') == 'internal_sales_rep';
  }

  bool get isExternalSalesRep {
    return value.getOrElse(() => '') == 'external_sales_rep';
  }

  bool get isReturnRequestor {
    return value.getOrElse(() => '') == 'return_requestor';
  }

  bool get isReturnApprover {
    return value.getOrElse(() => '') == 'return_approver';
  }

  bool get isReturnRole {
    return isReturnApprover || isReturnAdmin || isReturnRequestor;
  }

  bool get isCustomer {
    return isClientAdmin || isClientUser;
  }

  bool get isSalesRepRole {
    return isInternalSalesRep || isExternalSalesRep;
  }

  bool get isReturnApproverAccount =>
      isReturnApprover || isRootAdmin || isReturnAdmin;

  bool get isPaymentsAccessible =>
      isRootAdmin || isZPAdmin || isClientAdmin || isClientUser;

  bool get isReturnsOverviewAccessible =>
      isRootAdmin ||
      isReturnAdmin ||
      isZPAdmin ||
      isClientUser ||
      isSalesRepRole ||
      isReturnRequestor;

  // eZReach User role table: https://zuelligpharma.atlassian.net/browse/EZRX-21928
  String get getEZReachRoleType => isCustomer ? 'customer' : 'salesrep';

  bool get canAccessMarketPlace =>
      isRootAdmin || isZPAdmin || isClientUser || isClientAdmin;

  String get smallOrderFeeRole =>
      transformToSmallOrderFeeRole(value.getOrElse(() => ''));

  String get submitTicketRole =>
      transformToSubmitTicketRole(value.getOrElse(() => ''));

  const RoleType._(this.value);
}

class Currency extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Currency(String input) {
    return Currency._(validateStringNotEmpty(input));
  }

  String get symbol {
    return currencySymbol(value.getOrElse(() => ''));
  }

  String get code {
    return currencyCode(value.getOrElse(() => ''));
  }

  bool get isVN {
    return isEqualsIgnoreCase(value.getOrElse(() => ''), 'vnd');
  }

  bool get isTH {
    return isEqualsIgnoreCase(value.getOrElse(() => ''), 'thb');
  }

  bool get isSG {
    return isEqualsIgnoreCase(value.getOrElse(() => ''), 'sgd');
  }

  bool get isMM {
    return isEqualsIgnoreCase(value.getOrElse(() => ''), 'mmk') ||
        isEqualsIgnoreCase(value.getOrElse(() => ''), 'usd');
  }

  bool get isKH {
    return isEqualsIgnoreCase(value.getOrElse(() => ''), 'khr') ||
        isEqualsIgnoreCase(value.getOrElse(() => ''), 'cop') ||
        isEqualsIgnoreCase(value.getOrElse(() => ''), 'usd');
  }

  bool get isPH {
    return isEqualsIgnoreCase(value.getOrElse(() => ''), 'php');
  }

  const Currency._(this.value);
}

class CustomerAttr7 extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerAttr7(String input) {
    return CustomerAttr7._(validateStringNotEmpty(input));
  }

  bool get isZEV {
    return isEqualsIgnoreCase(value.getOrElse(() => ''), 'ZEV');
  }

  const CustomerAttr7._(this.value);
}

class CustomerGrp4 extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerGrp4(String input) {
    return CustomerGrp4._(validateStringNotEmpty(input));
  }

  bool get isVR {
    return isEqualsIgnoreCase(value.getOrElse(() => ''), 'VR');
  }

  bool get isVP {
    return isEqualsIgnoreCase(value.getOrElse(() => ''), 'VP');
  }

  bool get canOrderCovidMaterial => isVR || isVP;

  const CustomerGrp4._(this.value);
}

class Status extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Status(String input) {
    return Status._(validateStringNotEmpty(input));
  }

  bool get isContain01 {
    return value.getOrElse(() => '').contains('01');
  }

  bool get isContainZ1 {
    return isContainIgnoreCase(value.getOrElse(() => ''), 'z1');
  }

  bool get isCustomerBlocked =>
      checkIfCustomerIsBlocked(value.getOrElse(() => ''));

  bool get isEDI {
    return isEqualsIgnoreCase(value.getOrElse(() => ''), 'EDI');
  }

  bool get isSuspended => isContain01 || isContainZ1 || isCustomerBlocked;

  const Status._(this.value);
}

class FutureDeliveryDay extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FutureDeliveryDay(String input) =>
      FutureDeliveryDay._(validateStringNotEmpty(input));

  const FutureDeliveryDay._(this.value);

  int get intValue => getIntValue(value.getOrElse(() => ''));
}

class SalesDealNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SalesDealNumber(String input) {
    return SalesDealNumber._(validateStringNotEmpty(input));
  }

  const SalesDealNumber._(this.value);
}

class GreenDeliveryUserRole extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory GreenDeliveryUserRole(int input) {
    return GreenDeliveryUserRole._(Right(input));
  }

  bool get isAllUsers {
    return value.getOrElse(() => 0) == 1;
  }

  bool get isCustomer {
    return value.getOrElse(() => 0) == 2;
  }

  bool get isSalesReps {
    return value.getOrElse(() => 0) == 3;
  }

  const GreenDeliveryUserRole._(this.value);
}

class ComboDealUserRole extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory ComboDealUserRole(int input) {
    return ComboDealUserRole._(Right(input));
  }

  bool get isAllUsers {
    return value.getOrElse(() => 0) == 1;
  }

  bool get isCustomerOnly {
    return value.getOrElse(() => 0) == 2;
  }

  bool get isSalesRepOnly {
    return value.getOrElse(() => 0) == 3;
  }

  const ComboDealUserRole._(this.value);
}

class PaymentMethod extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentMethod(String input) {
    return PaymentMethod._(validateStringNotEmpty(input));
  }

  const PaymentMethod._(this.value);
}

class PaymentAdviceResponseMessage extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentAdviceResponseMessage(String input) {
    return PaymentAdviceResponseMessage._(validateStringNotEmpty(input));
  }

  bool get isEdit => paymentAdviceEdit(value.getOrElse(() => ''));

  const PaymentAdviceResponseMessage._(this.value);
}

class NotificationSetting extends ValueObject<bool> {
  @override
  final Either<ValueFailure<bool>, bool> value;

  factory NotificationSetting(bool input) =>
      NotificationSetting._(Right(input));

  const NotificationSetting._(this.value);
}

class CustomerBlock extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerBlock(String input) {
    return CustomerBlock._(Right(input));
  }

  bool get isCustomerBlocked =>
      checkIfCustomerIsBlocked(value.getOrElse(() => ''));

  const CustomerBlock._(this.value);
}

class MarketPlaceTnCAcceptance extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MarketPlaceTnCAcceptance(String input) =>
      MarketPlaceTnCAcceptance._(Right(input));

  factory MarketPlaceTnCAcceptance.unknown() => MarketPlaceTnCAcceptance('0');

  factory MarketPlaceTnCAcceptance.accept() => MarketPlaceTnCAcceptance('1');

  factory MarketPlaceTnCAcceptance.reject() => MarketPlaceTnCAcceptance('2');

  bool get isUnknown => this == MarketPlaceTnCAcceptance.unknown();

  bool get isAccept => this == MarketPlaceTnCAcceptance.accept();

  bool get isReject => this == MarketPlaceTnCAcceptance.reject();

  int get apiValue => int.tryParse(getOrDefaultValue('')) ?? 0;

  const MarketPlaceTnCAcceptance._(this.value);
}

class CustomerTicketType extends ValueObject<String> {
  static final supportedTypes = [
    CustomerTicketType.creditCustomerAccount(),
    CustomerTicketType.orderRelated(),
    CustomerTicketType.others(),
    CustomerTicketType.systemApplications(),
  ];

  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerTicketType(String input) =>
      CustomerTicketType._(validateStringNotEmpty(input));

  factory CustomerTicketType.creditCustomerAccount() =>
      CustomerTicketType('credit / customer account');

  factory CustomerTicketType.orderRelated() =>
      CustomerTicketType('order related');

  factory CustomerTicketType.others() => CustomerTicketType('others');

  factory CustomerTicketType.systemApplications() =>
      CustomerTicketType('system applications');

  bool get isCreditCustomerAccount =>
      this == CustomerTicketType.creditCustomerAccount();

  bool get isOrderRelated => this == CustomerTicketType.orderRelated();

  String get customerTicketTitle =>
      getCustomerTicketTypeDisplay(getOrDefaultValue(''));

  bool get isEmpty => getOrDefaultValue('').isEmpty;

  const CustomerTicketType._(this.value);
}

class CustomerTicketSubCategoryType extends ValueObject<String> {
  static final supportedTypes = [
    CustomerTicketSubCategoryType.accountOpeningCreation(),
    CustomerTicketSubCategoryType.accountStatusUpdate(),
    CustomerTicketSubCategoryType.creditFacility(),
    CustomerTicketSubCategoryType.doctorAPCPharmacistLicense(),
    CustomerTicketSubCategoryType.payment(),
    CustomerTicketSubCategoryType.requestForInvoiceCnCopy(),
    CustomerTicketSubCategoryType.statementOfAccount(),
  ];

  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerTicketSubCategoryType(String input) =>
      CustomerTicketSubCategoryType._(validateStringNotEmpty(input));

  factory CustomerTicketSubCategoryType.accountOpeningCreation() =>
      CustomerTicketSubCategoryType('account opening/creation - credit');

  factory CustomerTicketSubCategoryType.accountStatusUpdate() =>
      CustomerTicketSubCategoryType('account status/update - collection');

  factory CustomerTicketSubCategoryType.creditFacility() =>
      CustomerTicketSubCategoryType('credit facility - credit');

  factory CustomerTicketSubCategoryType.doctorAPCPharmacistLicense() =>
      CustomerTicketSubCategoryType("doctor's apc/pharmacist license - credit");

  factory CustomerTicketSubCategoryType.payment() =>
      CustomerTicketSubCategoryType('payment - collection');

  factory CustomerTicketSubCategoryType.requestForInvoiceCnCopy() =>
      CustomerTicketSubCategoryType(
        'request for invoice / cn copy - collection',
      );

  factory CustomerTicketSubCategoryType.statementOfAccount() =>
      CustomerTicketSubCategoryType('statement of account - collection');

  String get customerTicketSubCategoryTitle =>
      getCustomerTicketSubCategoryTypeDisplay(getOrDefaultValue(''));

  const CustomerTicketSubCategoryType._(this.value);
}

class TicketPriority extends ValueObject<int> {
  static final supportedTypes = [
    TicketPriority.low(),
    TicketPriority.medium(),
    TicketPriority.high(),
    TicketPriority.urgent(),
  ];

  @override
  final Either<ValueFailure<int>, int> value;

  factory TicketPriority(int input) => TicketPriority._(Right(input));

  factory TicketPriority.low() => TicketPriority(1);

  factory TicketPriority.medium() => TicketPriority(2);

  factory TicketPriority.high() => TicketPriority(3);

  factory TicketPriority.urgent() => TicketPriority(4);

  int get apiValue => getOrDefaultValue(1);

  String get priorityTitle => getPriorityTitleDisplay(apiValue);

  const TicketPriority._(this.value);
}
