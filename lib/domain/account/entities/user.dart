import 'package:ezrxmobile/domain/account/entities/access_right.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/payment_notification.dart';
import 'package:ezrxmobile/domain/account/entities/privacy_control.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/settings.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required String id,
    required Username username,
    required EmailAddress email,
    required FullName fullName,
    required Role role,
    required CustomerCode customerCode,
    required List<SalesOrganisation> userSalesOrganisations,
    required List<SalesOrg> salesOrganisations,
    required AccessRight accessRight,
    required Settings settings,
    required bool acceptPrivacyPolicy,
    required bool enableOrderType,
    required DocumentType selectedOrderType,
    required bool hasBonusOverride,
    required bool disableCreateOrder,
    required bool disableReturns,
    required bool disablePaymentAccess,
    required bool hasPriceOverride,
    required Language preferredLanguage,
    required List<Language> supportedLanguages,
    required PhoneNumber mobileNumber,
    required CountryCode countryCode,
    required MarketPlaceTnCAcceptance acceptMPTC,
    required bool isResetUserPassword,
    required bool isPPATriggerMaintained,
    required PrivacyControl privacyControl,
  }) = _User;

  factory User.empty() => User(
        id: '',
        username: Username(''),
        email: EmailAddress(''),
        fullName: FullName.empty(),
        role: Role(id: '', name: '', type: RoleType(''), description: ''),
        customerCode: CustomerCode(''),
        userSalesOrganisations: <SalesOrganisation>[],
        salesOrganisations: <SalesOrg>[],
        accessRight: AccessRight.empty(),
        settings: Settings(
          emailNotifications: false,
          mobileNotifications: false,
          languagePreference: Language.english(),
          paymentNotification: PaymentNotification.empty(),
        ),
        acceptPrivacyPolicy: false,
        enableOrderType: false,
        selectedOrderType: DocumentType(''),
        hasBonusOverride: false,
        disableCreateOrder: false,
        disableReturns: false,
        disablePaymentAccess: false,
        hasPriceOverride: false,
        preferredLanguage: Language.english(),
        supportedLanguages: <Language>[],
        mobileNumber: PhoneNumber(''),
        countryCode: CountryCode(''),
        acceptMPTC: MarketPlaceTnCAcceptance(''),
        isResetUserPassword: false,
        isPPATriggerMaintained: false,
        privacyControl: PrivacyControl.empty(),
      );

  bool get userCanCreateOrder {
    // For Root / ZP admin the it will always return true
    if (role.type.hasAdminAccess) {
      return true;
    }
    // For Return admin/ requestor/ approver the it will always return false
    if (role.type.isReturnRole) {
      return false;
    }
    // For Client admin/user we check the flags
    // [accessRight.orders] should be true & disableCreateOrder should be false
    if (role.type.isCustomer) {
      return !disableCreateOrder;
    }

    // For Other user we check only [accessRight.orders]
    return true;
  }

  bool get userCanAccessOrderHistory {
    // For Root / ZP admin the it will always return true
    if (role.type.hasAdminAccess) {
      return true;
    }
    // For Return admin/ requestor/ approver it will always return false
    if (role.type.isReturnRole) {
      return false;
    }

    // For Client admin/user and Other user we only check the flag
    // [accessRight.orders]  should be true
    return accessRight.orders;
  }

  bool get userCanAccessProducts {
    // For Root / ZP admin the it will always return true
    if (role.type.hasAdminAccess) {
      return true;
    }
    // For Return admin/ requestor/ approver it will always return false
    if (role.type.isReturnRole) {
      return false;
    }

    // For Client admin/user and Other user we only check the flag
    // [accessRight.products]  should be true
    return accessRight.products;
  }

  bool get supportMultipleLanguage => supportedLanguages.length > 1;

  String get userPreferredLanguageCode => preferredLanguage.languageCode;

  String get tncFile => _getUserFilePath(_UserFile.termOfUse);

  String get tncStaticFile => _getUserFilePath(_UserFile.termOfUseStatic);

  String get marketPlacePrivacyPolicyFile =>
      'assets/html/eZRxMarketPlacePrivacyPolicy.html';

  String get privacyPolicyFile => _getUserFilePath(_UserFile.privacyPolicy);

  String get privacyPolicyStaticFile =>
      _getUserFilePath(_UserFile.privacyPolicyStatic);

  String get acceptableUsePolicyFile =>
      _getUserFilePath(_UserFile.acceptableUsePolicy);

  String _getUserFilePath(_UserFile type) {
    final regionalEnglishTranslatedFile =
        'assets/html/${type.englishTranslatedName}';

    if (_supportedMarketLanguageFile.contains(_userCountry)) {
      if (userPreferredLanguageCode == _userCountryLanguage) {
        return 'assets/html/${_userCountry.toLowerCase()}/${type.marketTranslatedName}';
      }

      if (_supportedMarketCustomEnglishFile.contains(_userCountry)) {
        return 'assets/html/${_userCountry.toLowerCase()}/${type.englishTranslatedName}';
      }

      return regionalEnglishTranslatedFile;
    }

    return regionalEnglishTranslatedFile;
  }

  List<String> get _supportedMarketLanguageFile => <String>[
        'ID',
        'KH',
        'VN',
        'MM',
        'TH',
        'TW',
        //TODO: Cover in another ticket
        // 'KR',
      ];

  List<String> get _supportedMarketCustomEnglishFile => <String>['VN'];

  String get _userCountry =>
      userSalesOrganisations.firstOrNull?.salesOrg.country ?? '';

  String get _userCountryLanguage =>
      userSalesOrganisations.firstOrNull?.salesOrg.languageCode.toUpperCase() ??
      '';

  bool get isCustomerWithPaymentsDisable =>
      role.type.isCustomer && disablePaymentAccess;

  bool get isMultiSalesOrgs => userSalesOrganisations.length > 1;

  String get phoneWithCountryCode =>
      '${countryCode.getOrDefaultValue('')}${mobileNumber.validPhoneNumber}';
}

enum _UserFile {
  termOfUse(
    'eZRxTermsOfUse.html',
    'eZRxTermsOfUseTranslated.html',
  ),
  termOfUseStatic(
    'eZRxTermsOfUseStatic.html',
    'eZRxTermsOfUseStaticTranslated.html',
  ),
  acceptableUsePolicy(
    'eZRxAcceptableUsePolicy.html',
    'eZRxAcceptableUsePolicyTranslated.html',
  ),
  privacyPolicy(
    'eZRxPrivacyPolicy.html',
    'eZRxPrivacyPolicyTranslated.html',
  ),
  privacyPolicyStatic(
    'eZRxPrivacyPolicyStatic.html',
    'eZRxPrivacyPolicyStaticTranslated.html',
  );

  final String englishTranslatedName;
  final String marketTranslatedName;

  const _UserFile(this.englishTranslatedName, this.marketTranslatedName);
}
