import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/payment_notification.dart';
import 'package:ezrxmobile/domain/account/entities/privacy_control.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/settings.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/access_right_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/payment_advice_expiry_notification_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/privacy_control_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/role_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_dto.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const UserDto._();

  const factory UserDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'username', defaultValue: '') required String username,
    @JsonKey(name: 'email', defaultValue: '') required String email,
    @JsonKey(name: 'firstName', defaultValue: '') required String firstName,
    @JsonKey(name: 'lastName', defaultValue: '') required String lastName,
    @Default(RoleDto.emptyRoleDto) @JsonKey(name: 'role') RoleDto role,
    @JsonKey(name: 'customerCode', defaultValue: '')
    required String customerCode,
    @JsonKey(name: 'userSalesOrganisationList', defaultValue: [])
    required List<SalesOrganisationDto> userSalesOrganisations,
    @JsonKey(name: 'salesOrganisations', defaultValue: [])
    required List<String> salesOrganisations,
    @Default(AccessRightDto.emptyAccessRightDto)
    @JsonKey(name: 'accessRight')
    AccessRightDto accessRight,
    @JsonKey(name: 'emailNotifications', defaultValue: false)
    required bool emailNotifications,
    @JsonKey(name: 'mobileNotifications', defaultValue: false)
    required bool mobileNotifications,
    @JsonKey(
      name: 'languagePreference',
      readValue: JsonReadValueHelper.handleEmptyLanguagePreference,
    )
    required String languagePreference,
    @JsonKey(name: 'enableOrderType', defaultValue: false)
    required bool enableOrderType,
    @JsonKey(name: 'acceptTC', defaultValue: true)
    required bool acceptPrivacyPolicy,
    @JsonKey(name: 'hasBonusOverride', defaultValue: false)
    required bool hasBonusOverride,
    @JsonKey(name: 'disableCreateOrder', defaultValue: false)
    required bool disableCreateOrder,
    @JsonKey(name: 'disableReturns', defaultValue: false)
    required bool disableReturns,
    @JsonKey(name: 'disablePaymentAccess', defaultValue: false)
    required bool disablePaymentAccess,
    @JsonKey(name: 'hasPriceOverride', defaultValue: false)
    required bool hasPriceOverride,
    @JsonKey(name: 'disablePaymentNotification', defaultValue: false)
    required bool disablePaymentNotification,
    @JsonKey(
      name: 'paymentNotification',
      defaultValue: <PaymentAdviceExpiryNotificationDto>[],
    )
    required List<PaymentAdviceExpiryNotificationDto> paymentNotification,
    @JsonKey(
      name: 'preferredLanguage',
      readValue: JsonReadValueHelper.handleEmptyLanguagePreference,
    )
    required String preferredLanguage,
    @JsonKey(
      name: 'supportedLanguages',
      readValue: JsonReadValueHelper.handleSupportedLanguages,
      defaultValue: <String>[],
    )
    required List<String> supportedLanguages,
    @JsonKey(name: 'mobileNumber', defaultValue: '')
    required String mobileNumber,
    @JsonKey(name: 'countryCode', defaultValue: '') required String countryCode,
    @JsonKey(
      name: 'acceptMPTC',
      readValue: JsonReadValueHelper.handleMarketPlaceTnCAcceptance,
    )
    required String acceptMPTC,
    @JsonKey(name: 'isResetUserPassword', defaultValue: false)
    required bool isResetUserPassword,
    @JsonKey(name: 'isPPATriggerMaintained', defaultValue: false)
    required bool isPPATriggerMaintained,
    @Default(PrivacyControlDto.emptyPrivacyControlDto)
    @JsonKey(name: 'privacyControls')
    PrivacyControlDto privacyControl,
    @JsonKey(name: 'selectedOrderType', defaultValue: '')
    required String selectedOrderType,
  }) = _UserDto;

  factory UserDto.fromDomain(User user) {
    return UserDto(
      id: user.id,
      username: user.username.getOrCrash(),
      email: user.email.getOrCrash(),
      firstName: user.fullName.firstName,
      lastName: user.fullName.lastName,
      role: RoleDto.fromDomain(user.role),
      customerCode: user.customerCode.getOrCrash(),
      userSalesOrganisations: _splitSalesOrg(user.userSalesOrganisations),
      salesOrganisations:
          user.salesOrganisations.map((e) => e.getOrDefaultValue('')).toList(),
      accessRight: AccessRightDto.fromDomain(user.accessRight),
      emailNotifications: user.settings.emailNotifications,
      mobileNotifications: user.settings.mobileNotifications,
      languagePreference: user.settings.languagePreference.languageCode,
      enableOrderType: user.enableOrderType,
      selectedOrderType: user.selectedOrderType.getOrDefaultValue(''),
      acceptPrivacyPolicy: user.acceptPrivacyPolicy,
      hasBonusOverride: user.hasBonusOverride,
      disableCreateOrder: user.disableCreateOrder,
      disableReturns: user.disableReturns,
      disablePaymentAccess: user.disablePaymentAccess,
      hasPriceOverride: user.hasPriceOverride,
      disablePaymentNotification:
          user.settings.paymentNotification.disablePaymentNotification,
      paymentNotification: user
          .settings.paymentNotification.paymentAdviceExpiryNotificationList
          .map((e) => PaymentAdviceExpiryNotificationDto.fromDomain(e))
          .toList(),
      preferredLanguage: user.preferredLanguage.languageCode,
      mobileNumber: user.mobileNumber.getOrDefaultValue(''),
      countryCode: user.countryCode.getOrDefaultValue(''),
      supportedLanguages: <String>[],
      acceptMPTC: user.acceptMPTC.getOrDefaultValue(''),
      isResetUserPassword: user.isResetUserPassword,
      isPPATriggerMaintained: user.isPPATriggerMaintained,
      privacyControl: PrivacyControlDto.fromDomain(user.privacyControl),
    );
  }
  static const emptyUserDto = UserDto(
    acceptPrivacyPolicy: false,
    customerCode: '',
    email: '',
    emailNotifications: false,
    enableOrderType: false,
    firstName: '',
    hasBonusOverride: false,
    id: '',
    languagePreference: 'EN',
    lastName: '',
    mobileNotifications: false,
    username: '',
    userSalesOrganisations: [],
    disableCreateOrder: false,
    disableReturns: false,
    disablePaymentAccess: false,
    hasPriceOverride: false,
    disablePaymentNotification: true,
    paymentNotification: <PaymentAdviceExpiryNotificationDto>[],
    preferredLanguage: 'EN',
    mobileNumber: '',
    countryCode: '',
    supportedLanguages: <String>[],
    salesOrganisations: <String>[],
    acceptMPTC: '',
    isResetUserPassword: false,
    isPPATriggerMaintained: false,
    privacyControl: PrivacyControlDto.emptyPrivacyControlDto,
    selectedOrderType: '',
  );

  User toDomain() {
    return User(
      id: id,
      username: Username(username),
      email: EmailAddress(email),
      fullName: FullName(firstName: firstName, lastName: lastName),
      role: Role(
        id: role.id,
        name: role.name,
        type: RoleType(role.type),
        description: role.description,
      ),
      customerCode: CustomerCode(customerCode),
      userSalesOrganisations: _mergeSalesOrg(userSalesOrganisations),
      salesOrganisations: salesOrganisations.map((e) => SalesOrg(e)).toList(),
      accessRight: accessRight.toDomain(),
      settings: Settings(
        emailNotifications: emailNotifications,
        mobileNotifications: mobileNotifications,
        languagePreference: Language(
          languagePreference,
        ),
        paymentNotification: PaymentNotification(
          disablePaymentNotification: disablePaymentNotification,
          paymentAdviceExpiryNotificationList:
              paymentNotification.map((e) => e.toDomain()).toList(),
        ),
      ),
      acceptPrivacyPolicy: acceptPrivacyPolicy,
      enableOrderType: enableOrderType,
      selectedOrderType: DocumentType(selectedOrderType),
      hasBonusOverride: hasBonusOverride,
      disableCreateOrder: disableCreateOrder,
      disablePaymentAccess: disablePaymentAccess,
      disableReturns: disableReturns,
      hasPriceOverride: hasPriceOverride,
      preferredLanguage: Language(preferredLanguage),
      mobileNumber: PhoneNumber(mobileNumber),
      countryCode: CountryCode(countryCode),
      supportedLanguages: supportedLanguages.map((e) => Language(e)).toList(),
      acceptMPTC: MarketPlaceTnCAcceptance(acceptMPTC),
      isResetUserPassword: isResetUserPassword,
      isPPATriggerMaintained: isPPATriggerMaintained,
      privacyControl: PrivacyControl(
        automatedPersonalisation: privacyControl.automatedPersonalisation,
        directMarketing: privacyControl.directMarketing,
        viaEmails: privacyControl.viaEmails,
        viaPushNotification: privacyControl.viaPushNotification,
        viaSMS: privacyControl.viaSMS,
      ),
    );
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

//======================================================================
// From response we might receive same salesOrg but have different customer
// We need to merge those saleOrg become single object
//
//======================================================================
List<SalesOrganisation> _mergeSalesOrg(
  List<SalesOrganisationDto> salesOrganisations,
) {
  final saleOrgs = <SalesOrganisation>[];

  for (final e in salesOrganisations) {
    // find the coming salesOrg DTO have the same salesOrg code exist on
    // salesOrgList or not, if yes return the existing SalesOrg domain object
    // else will return empty
    final customerExistsSalesOrg = saleOrgs.firstWhere(
      (f) => f.salesOrg.getOrCrash() == e.salesOrg,
      orElse: () => SalesOrganisation.empty(),
    );

    if (customerExistsSalesOrg == SalesOrganisation.empty()) {
      // New customer directly add to the salesOrg List
      saleOrgs.add(e.toDomain());
    } else {
      // Customer exist in the salesOrg List will merge together
      final index = saleOrgs.indexOf(customerExistsSalesOrg);
      final newSalesOrg = customerExistsSalesOrg.copyWith(
        customerInfos: [
          ...customerExistsSalesOrg.customerInfos,
          SalesOrgCustomerInfo(
            customerCodeSoldTo: CustomerCode(e.customerCode),
            shipToInfos: e.shipToCodes
                .map((e) => SalesOrgShipToInfo(shipToCustomerCode: e))
                .toList(),
          ),
        ],
      );
      saleOrgs[index] = newSalesOrg;
    }
  }

  return saleOrgs;
}

//======================================================================
// From saleOrg Entity we might have more than one customer
// Need to split to two different DTO
//
//======================================================================
List<SalesOrganisationDto> _splitSalesOrg(
  List<SalesOrganisation> salesOrganisations,
) {
  final saleOrgs = <SalesOrganisationDto>[];

  for (final e in salesOrganisations) {
    for (var i = 0; e.customerInfos.length > i; i++) {
      saleOrgs.add(SalesOrganisationDto.fromDomain(e, index: i));
    }
  }

  return saleOrgs;
}

String handleMarketPlaceTnCAcceptance(Map json, String key) {
  final value = json[key];
  if (value == null) return '';

  return value.toString();
}

String handleEmptyLanguagePreference(Map json, String key) {
  final String languagePreference = json[key] ?? '';
  if (languagePreference.isEmpty) {
    return Language.english().languageCode;
  }

  return languagePreference;
}

List<String> handleSupportedLanguages(Map json, String key) {
  final List supportedLanguages = json[key] ?? [];

  return supportedLanguages.isEmpty
      ? [Language.english().languageCode]
      : supportedLanguages.map((e) => e['language'].toString()).toList();
}
