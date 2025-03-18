import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

void main() {
  final englishMarketUser = fakeClient.copyWith(
    userSalesOrganisations: [fakeMYSalesOrganisation],
  );
  final nonEnglishMarket = fakeIDSalesOrg.country;
  final nonEnglishMarketUser = fakeClient.copyWith(
    userSalesOrganisations: [fakeIDSalesOrganisation],
  );
  final vnMarket = fakeVNSalesOrg.country;
  final vnMarketUser = fakeClient.copyWith(
    userSalesOrganisations: [fakeVNSalesOrganisation],
  );

  group('Term of use getter -', () {
    test('Should retun English translation file path for EN market', () {
      expect(
        englishMarketUser.tncFile,
        'assets/html/eZRxTermsOfUse.html',
      );
      expect(
        englishMarketUser.tncStaticFile,
        'assets/html/eZRxTermsOfUseStatic.html',
      );
    });

    test(
        'Should retun English translation file path for non EN market when language is english',
        () {
      expect(
        nonEnglishMarketUser.tncFile,
        'assets/html/eZRxTermsOfUse.html',
      );
      expect(
        nonEnglishMarketUser.tncStaticFile,
        'assets/html/eZRxTermsOfUseStatic.html',
      );
    });

    test(
        'Should retun localized translation file path for non EN market when language is local',
        () {
      final userWithLocalLanguage = nonEnglishMarketUser.copyWith(
        preferredLanguage: Language(nonEnglishMarket),
      );
      expect(
        userWithLocalLanguage.tncFile,
        'assets/html/${nonEnglishMarket.toLowerCase()}/eZRxTermsOfUseTranslated.html',
      );
      expect(
        userWithLocalLanguage.tncStaticFile,
        'assets/html/${nonEnglishMarket.toLowerCase()}/eZRxTermsOfUseStaticTranslated.html',
      );
    });

    test(
        'Should return english translation custom file path for VN market when language is EN',
        () async {
      expect(
        vnMarketUser.tncFile,
        'assets/html/${vnMarket.toLowerCase()}/eZRxTermsOfUse.html',
      );
      expect(
        vnMarketUser.tncStaticFile,
        'assets/html/${vnMarket.toLowerCase()}/eZRxTermsOfUseStatic.html',
      );
    });
  });

  group('Privacy policy getter -', () {
    test('Should retun English translation file path for EN market', () {
      expect(
        englishMarketUser.privacyPolicyFile,
        'assets/html/eZRxPrivacyPolicy.html',
      );
      expect(
        englishMarketUser.privacyPolicyStaticFile,
        'assets/html/eZRxPrivacyPolicyStatic.html',
      );
    });

    test(
        'Should retun English translation file path for non EN market when language is english',
        () {
      expect(
        nonEnglishMarketUser.privacyPolicyFile,
        'assets/html/eZRxPrivacyPolicy.html',
      );
      expect(
        nonEnglishMarketUser.privacyPolicyStaticFile,
        'assets/html/eZRxPrivacyPolicyStatic.html',
      );
    });

    test(
        'Should retun localized translation file path for non EN market when language is local',
        () {
      final userWithLocalLanguage = nonEnglishMarketUser.copyWith(
        preferredLanguage: Language(nonEnglishMarket),
      );
      expect(
        userWithLocalLanguage.privacyPolicyFile,
        'assets/html/${nonEnglishMarket.toLowerCase()}/eZRxPrivacyPolicyTranslated.html',
      );
      expect(
        userWithLocalLanguage.privacyPolicyStaticFile,
        'assets/html/${nonEnglishMarket.toLowerCase()}/eZRxPrivacyPolicyStaticTranslated.html',
      );
    });

    test(
        'Should return english translation custom file path for VN market when language is EN',
        () async {
      expect(
        vnMarketUser.privacyPolicyFile,
        'assets/html/${vnMarket.toLowerCase()}/eZRxPrivacyPolicy.html',
      );
      expect(
        vnMarketUser.privacyPolicyStaticFile,
        'assets/html/${vnMarket.toLowerCase()}/eZRxPrivacyPolicyStatic.html',
      );
    });
  });

  group('Acceptable use policy getter -', () {
    test('Should retun English translation file path for EN market', () {
      expect(
        englishMarketUser.acceptableUsePolicyFile,
        'assets/html/eZRxAcceptableUsePolicy.html',
      );
    });

    test(
        'Should retun English translation file path for non EN market when language is english',
        () {
      expect(
        nonEnglishMarketUser.acceptableUsePolicyFile,
        'assets/html/eZRxAcceptableUsePolicy.html',
      );
    });

    test(
        'Should retun localized translation file path for non EN market when language is local',
        () {
      final userWithLocalLanguage = nonEnglishMarketUser.copyWith(
        preferredLanguage: Language(nonEnglishMarket),
      );
      expect(
        userWithLocalLanguage.acceptableUsePolicyFile,
        'assets/html/${nonEnglishMarket.toLowerCase()}/eZRxAcceptableUsePolicyTranslated.html',
      );
    });

    test(
        'Should return english translation custom file path for VN market when language is EN',
        () async {
      expect(
        vnMarketUser.acceptableUsePolicyFile,
        'assets/html/${vnMarket.toLowerCase()}/eZRxAcceptableUsePolicy.html',
      );
    });
  });

  test('Market place privacy policy getter', () {
    const path = 'assets/html/eZRxMarketPlacePrivacyPolicy.html';
    expect(englishMarketUser.marketPlacePrivacyPolicyFile, path);
    expect(nonEnglishMarketUser.marketPlacePrivacyPolicyFile, path);
    expect(vnMarketUser.marketPlacePrivacyPolicyFile, path);
  });

  test('Phone number with country code', () {
    const phoneNumber = '888888888';
    const countryCode = '+84';

    final userWithMobile = fakeClient.copyWith(
      mobileNumber: PhoneNumber(phoneNumber),
      countryCode: CountryCode(countryCode),
    );
    expect(userWithMobile.phoneWithCountryCode, '$countryCode$phoneNumber');
  });
}
