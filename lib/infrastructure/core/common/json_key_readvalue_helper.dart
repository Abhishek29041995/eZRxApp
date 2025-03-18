import 'dart:convert';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:intl/intl.dart';

class JsonReadValueHelper {
  static Map<String, dynamic> readValueMapDynamic(Map json, String key) =>
      json[key] ?? <String, dynamic>{};

  // Need toString() here because in User object received from login API, the roleId is int, not String
  static String convertRoleId(Map json, String key) =>
      (json[key] ?? '').toString();

  static String readValueString(Map json, String key) =>
      json[key]?['value'] ?? '';

  static String readString(Map json, String key) => json[key] ?? '';

  static String readEndCursorValue(Map json, String key) =>
      json[key]?['endCursor'] ?? '';

  static String readValueDateISO(Map json, String key) =>
      json[key]?['isoValue'] ?? '';

  static String readProductType(Map json, String key) =>
      json[key] == null || json[key] == '' ? 'material' : json[key];

  static String readMaterialNumberValue(Map json, String key) =>
      json[key] ?? (json['materialCode'] ?? '');

  static String readUrl(Map json, String key) => json['Url'] ?? json[key] ?? '';

  static String readFileName(Map json, String key) =>
      json[key] ?? json['Name'] ?? json['filename'] ?? '';

  static String readCreatedDateTimeValue(Map json, String _) {
    final createdDate = json['createdDate'] ?? '';
    final createdTime = json['createdTime'] ?? '';

    // Concatenation is necessary to convert 'createdDate' and 'createdTime' into
    // the 'yyyyMMddHHmmss' format.
    return '$createdDate$createdTime';
  }

  static String readUserRestrictionOverride(Map json, String _) =>
      json['addRestriction']?['status'] ??
      json['deleteRestriction']?['status'] ??
      '';

  static bool readUserReturnApprovalLimitOverride(Map json, String _) =>
      json['addReturnApprovalLimit']?['status'] ??
      json['deleteReturnApprovalLimit']?['status'] ??
      false;

  static String createdAtDate(Map json, String key) =>
      json[key]?.replaceAll('-', '') ?? '';

  static String readHyperLink(Map json, String key) =>
      json[key]?['jsonValue']?['value']?['href'] ?? '';

  static String readName(Map json, String key) => json[key]?['name'] ?? '';

  static String readSrcValue(Map json, String key) =>
      json[key]?['jsonValue']?['value']?['src'] ?? json[key]?['src'] ?? '';

  static String readTag(Map json, String key) =>
      json[key]?['value']?['displayName'] ?? '';

  static String readVaName(Map json, String _) =>
      json['paymentDetails']?['vaName'] ?? '';
  static String readVaNumber(Map json, String _) =>
      json['paymentDetails']?['vaNumber'] ?? '';

  static String readCategory(Map json, String key) =>
      json[key]?['displayName'] ?? '';

  static String readTagName(Map json, String key) =>
      json[key]?['value']?['name'] ?? '';

  static String readDateTimeStringFormat(Map json, String key) =>
      (json[key] ?? '').isNotEmpty
          ? DateFormat('yMMMMd').format(DateTime.parse(json[key]))
          : '';

  static List<dynamic> readDocumentsList(Map json, String key) {
    final urlList = json[key]?['jsonValue'] ?? [];

    return urlList.map((e) => e['url'] ?? '').toList();
  }

  static List<dynamic> readValueList(Map json, String key) =>
      json[key]?['value'] ?? [];

  static List<dynamic> readList(Map json, String key) => json[key] ?? [];

  static List<dynamic> readRawMetaDataOverride(Map json, String key) =>
      json[key]?['usernames'] ?? [];

  static bool readPinToTop(Map json, String key) =>
      json[key]?['boolValue'] ?? false;

  static bool readBoolStringFormat(Map json, String key) =>
      json[key] == null || json[key] == '' ? false : json[key];

  static bool readValueBoolean(Map json, String key) =>
      json[key]?['value'] ?? false;

  static bool mappingIsMarketPlace(Map json, String _) {
    final parsedJson = makeResponseCamelCase(jsonEncode(json));
    if (parsedJson['isMarketPlace'] != null) return parsedJson['isMarketPlace'];
    if (parsedJson['isMarketplace'] != null) return parsedJson['isMarketplace'];

    return false;
  }

  static int readMaximumOfItem(Map json, String key) =>
      json[key]?['intValue'] ?? 0;

  static double handleTax(Map json, String key) {
    final taxList = json[key] ?? [];

    if (taxList.isEmpty) {
      return 0.0;
    }

    return double.tryParse(taxList.first) ?? 0.0;
  }

  static String handleMinQty(Map json, String key) {
    final value = double.tryParse(json[key]) ?? 0.0;

    return value > 0.0 ? json[key] : '1.0';
  }

  static int handlevalidateQuantity(Map json, String key) {
    return (json[key] ?? 0) > 0
        ? json[key]
        : (json['qty'] ?? 0) > 0
            ? json['qty']
            : 0;
  }

  static List handleEmptyMaterialList(Map json, String key) {
    if (json[key] == null || json[key].isEmpty) {
      return [];
    }

    return json[key];
  }

  static String handleMarketPlaceTnCAcceptance(Map json, String key) {
    final value = json[key];
    if (value == null) return '';

    return value.toString();
  }

  static String handleEmptyLanguagePreference(Map json, String key) {
    final String languagePreference = json[key] ?? '';
    if (languagePreference.isEmpty) {
      return Language.english().languageCode;
    }

    return languagePreference;
  }

  static List<String> handleSupportedLanguages(Map json, String key) {
    final List supportedLanguages = json[key] ?? [];

    return supportedLanguages.isEmpty
        ? [Language.english().languageCode]
        : supportedLanguages.map((e) => e['language'].toString()).toList();
  }

  //_convertAccessToken performs conversion with two different keys:
//If it is login api call, then it will extract access token value from 'eZRxJWT'
//If it is getAccessToken call, it will extract access token value from 'eZRxAccessToken'
  static String convertAccessToken(Map json, String key) =>
      json[key] ?? json['eZRxAccessToken'];

//_convertRefreshToken performs conversion with two different keys:
//If it is login api call, then it will extract access token value from 'eZRxRefreshJWT'
//If it is getAccessToken call, it will extract access token value from 'eZRxRefreshToken'
  static String convertRefreshToken(Map json, String key) =>
      json[key] ?? json['eZRxRefreshToken'] ?? '';
}
