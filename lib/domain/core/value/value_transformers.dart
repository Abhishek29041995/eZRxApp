import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/products/widgets/enum_material_filter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:path/path.dart' as path;

String stringCapitalize(String text) {
  if (text.isEmpty) return '';
  if (text.length == 1) return text;

  return '${text[0].toUpperCase()}${text.characters.getRange(1).toLowerCase()}';
}

bool isNotEmpty(String text) {
  final pattern =
      RegExp(r'^\s*$'); // matches any string is not empty or white space

  return !pattern.hasMatch(text);
}

bool hasLengthN(String text, int n) {
  final pattern = RegExp('^.{$n}\$'); // matches any string of length n

  return pattern.hasMatch(text);
}

bool hasLengthGreaterThanN(String text, int n) {
  final regex = RegExp('^.{$n,}\$'); // matches any string of length n or more

  return regex.hasMatch(text.replaceAll('\n', ' '));
}

bool hasLengthEqualOrGreaterThanN(String text, int n) =>
    hasLengthN(text, n) || hasLengthGreaterThanN(text, n);

// a simple string => A Simple String
// String stringTitleCase(String text) {
//   if (text.isEmpty) return '';
//   if (hasLengthN(text, 1)) return text;

//   return text
//       .trim()
//       .split(' ')
//       .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
//       .join(' ');
// }

String removeLeadingZero(String text) {
  return text.isEmpty ? '' : text.replaceAll(RegExp(r'^0+(?=.)'), '');
}

String naIfEmpty(String text) {
  return text.isEmpty ? 'NA' : text;
}

bool checkIfTrimmedValueNotEmpty(String text) => text.trim().isNotEmpty;

String trimAndRemoveConsecutiveSpace(String text) =>
    text.trim().replaceAll(RegExp(r'\s+'), ' ');

bool getInStock(String text) {
  return isEqualsIgnoreCase(text, 'Yes');
}

String getValidPhoneNumber(String text) {
  return text.replaceAll(RegExp(r'[^\d]+'), '').characters.take(16).toString();
}

bool isMinCharacter({required String input, required int minLength}) =>
    hasLengthEqualOrGreaterThanN(input, minLength);

bool isAtLeastOneLowerCharacter({
  required String input,
}) =>
    RegExp(r'[a-z]').hasMatch(input);

bool isAtLeastOneUpperCharacter({
  required String input,
}) =>
    RegExp(r'[A-Z]').hasMatch(input);

bool isAtLeastOneNumericCharacter({
  required String input,
}) =>
    RegExp(r'[0-9]').hasMatch(input);

bool isAtLeastOneSpecialCharacter({
  required String input,
}) =>
    RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(input);

String getTenderContractNumber(String text) {
  if (text.isEmpty) return text;

  return isEqualsIgnoreCase(text, 'No contract (Price remains same)')
      ? 'Tender Contract available'
      : 'Contract: $text';
}

String displayDateTimeStringIgnoringTimezone(String text, String format) {
  final dateTimeWithoutTimeZoneOffset =
      text.replaceAll(RegExp(r'\+\d{2}:\d{2}$'), '');
  final parsedDate = DateTime.tryParse(dateTimeWithoutTimeZoneOffset);

  return parsedDate == null ? text : DateFormat(format).format(parsedDate);
}

String displayDateTimeString(
  String text,
  String format,
) {
  final parsedDate = tryParseDateTime(text);
  if (parsedDate == null) {
    return text;
  }

  return DateFormat(format)
      .format(parsedDate)
      //remove time part if time is 00:00:00
      .replaceFirst(' 00:00:00', '');
}

bool containsSubstringFromSourceOfSizeThree({
  required String textToValidate,
  required String sourceString,
}) {
  for (var i = 0; i <= sourceString.length - 3; i++) {
    final substring =
        sourceString.characters.getRange(i, i + 3).string.toLowerCase();
    if (textToValidate.toLowerCase().contains(substring)) return true;
  }

  return false;
}

bool isNumericOnly(String text) => RegExp(r'^\d+$').hasMatch(text);

DateTime? tryParseDateTime(String input) {
  if (isNotEmpty(input)) {
    try {
      //Case 'date|time' example: '20230905|1693894295'
      if (RegExp(r'^\d{8}\|\d*$').hasMatch(input)) {
        final parts = input.split('|');
        final dateStr = parts.first;
        final date = DateTime.parse(dateStr);

        final timeStr = parts[1];
        if (timeStr.isEmpty) {
          return DateTime.utc(
            date.year,
            date.month,
            date.day,
          ).toLocal();
        } else {
          final timestamp = int.parse(timeStr);
          final time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

          return DateTime.utc(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
            time.second,
          ).toLocal();
        }
      }

      //Case Date and Time(YYYY-MM-DD HH:mm:ss)example: '2023-11-20 07:36:33'
      if (RegExp(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$').hasMatch(input)) {
        return DateFormat('yyyy-MM-dd HH:mm:ss').parse(input, true).toLocal();
      }

      //Case Date and Time(MM/dd/yyyy HH:mm)example: '01/30/2024 04:32'
      if (RegExp(r'^\d{1,2}/\d{1,2}/\d{4} \d{1,2}:\d{1,2}$').hasMatch(input)) {
        return DateFormat(DateTimeFormatString.announcementDateFormat)
            .parse(input, false)
            .toLocal();
      }

      //Case Date and Time and(MM/dd/yyyy HH:mm a)example: '01/30/2024 04:32 PM'
      if (RegExp(r'^\d{1,2}/\d{1,2}/\d{4} \d{1,2}:\d{1,2} (AM|PM)$')
          .hasMatch(input)) {
        return DateFormat(DateTimeFormatString.announcementDateFormat)
            .parse(input, false)
            .toLocal();
      }

      //input with format yyyyddmmhh
      final intVal = getDateTimeIntValue(input);
      if (intVal > 0) {
        final standardInput = input.padRight(14, '0');
        final year =
            int.parse(standardInput.characters.getRange(0, 4).toString());
        final month =
            int.parse(standardInput.characters.getRange(4, 6).toString());
        final day =
            int.parse(standardInput.characters.getRange(6, 8).toString());
        final hour =
            int.parse(standardInput.characters.getRange(8, 10).toString());
        final minute =
            int.parse(standardInput.characters.getRange(10, 12).toString());
        final second =
            int.parse(standardInput.characters.getRange(12, 14).toString());

        //if length is 10, then it convert dateTime till hour
        //yyyyddmmhh (only for principal Date)
        if (hasLengthN(input, 10)) {
          return DateTime.utc(year, month, day, hour).toLocal();
        }

        return DateTime(year, month, day, hour, minute, second).toLocal();
      } else {
        try {
          //input for announcement date
          return DateFormat.yMd().add_jm().parse(input);
        } catch (_) {
          //input for invoices date string with format yyyy-MM-dd
          return input.replaceAll(RegExp(r'^0+(?=.)'), '') == '0'
              ? null
              : DateTime.parse(input).toLocal();
        }
      }
    } on FormatException {
      return null;
    }
  }

  return null;
}

DateTime getDateTimeByDateString(String value) =>
    tryParseDateTime(value) ?? DateTime.now();

String calculateDifferenceTime(String value) {
  final dateTime = getDateTimeByDateString(value);
  final difference = DateTime.now().difference(dateTime);
  final minutes = difference.inMinutes;
  if (minutes >= 1440) {
    final days = difference.inDays;

    return '$days d';
  } else if (minutes >= 60) {
    final hours = difference.inHours;

    return '$hours h';
  } else {
    return '$minutes m';
  }
}

String getDateStringByDateTime(DateTime dateTime) =>
    DateFormat(DateTimeFormatString.apiDateFormat).format(dateTime);

String emptyIfZero(num value) {
  return value == 0 ? '' : value.toString();
}

int getDateTimeIntValue(String value) =>
    isNumericOnly(value) ? int.parse(value) : 0;

String getTimeZoneAbbreviation(Duration timeZoneOffset) {
  final abbreviationMap = {
    -8: 'PST',
    -7: 'MST',
    -6: 'CST',
    -5: 'EST',
    -4: 'AST',
    -3: 'ADT',
    0: 'GMT',
    1: 'CET',
    7: 'ICT',
    8: 'SGT',
  };

  return abbreviationMap[timeZoneOffset.inHours] ?? '';
}

String dashIfEmpty(String text) {
  return text.isEmpty ? '-' : text;
}

int getIntegerReturnQuantity(String quantity) =>
    quantity.isEmpty ? 0 : int.parse(quantity);

String getNoun(String qty) => int.tryParse(qty) == 1 ? 'item' : 'items';

bool isBundle(String type) => isEqualsIgnoreCase(type, 'bundle');

bool isMaterial(String type) => isEqualsIgnoreCase(type, 'material');

bool isBonus(String type) => isEqualsIgnoreCase(type, 'bonus');

bool isDealsBonus(String type) => isEqualsIgnoreCase(type, 'Deals');

bool isCombo(String type) => isEqualsIgnoreCase(type, 'combo');

bool notZero(int number) => number != 0;

Color getStatusLabelColor(String statusType) {
  final lightSecondary = {
    'processed': ZPColors.lightSecondary,
    'successful': ZPColors.lightSecondary,
    'approved for return': ZPColors.lightSecondary,
    'approved': ZPColors.lightSecondary,
    'reviewed': ZPColors.lightSecondary,
    'bonus': ZPColors.primary,
    'active': ZPColors.lightSecondary,
    'payment received': ZPColors.lightSecondary,
  };

  final lightRedStatusColor = {
    'cancelled': ZPColors.lightRedStatusColor,
    'failed': ZPColors.lightRedStatusColor,
    'cancelled - credit issue': ZPColors.lightRedStatusColor,
    'cancelled - duplicate order': ZPColors.lightRedStatusColor,
    'cancelled - license invalid / expired': ZPColors.lightRedStatusColor,
    'cancelled - stock unavailable': ZPColors.lightRedStatusColor,
    'cancelled by buyer': ZPColors.lightRedStatusColor,
    'cancelled by seller': ZPColors.lightRedStatusColor,
    'overdue': ZPColors.lightRedStatusColor,
    'rejected': ZPColors.lightRedStatusColor,
    'pofailed': ZPColors.lightRedStatusColor,
  };

  final lightYellow = {
    'pending': ZPColors.lightYellow,
    'oos-preorder': ZPColors.lightYellow,
    'picking in progress': ZPColors.lightYellow,
    'out for delivery': ZPColors.lightYellow,
    'pending approval': ZPColors.lightYellow,
    'out for re-delivery': ZPColors.lightYellow,
    'not available': ZPColors.lightYellow,
    'in Process': ZPColors.lightYellow,
    'on the way to you': ZPColors.lightYellow,
    'order being prepared': ZPColors.lightYellow,
    'pending release': ZPColors.lightYellow,
    'pending release - credit check': ZPColors.lightYellow,
    'pending release - license issue': ZPColors.lightYellow,
    'pending release - month end closing': ZPColors.lightYellow,
    'pending release - on backorder': ZPColors.lightYellow,
    'pending release - seller approval required': ZPColors.lightYellow,
    'order pending': ZPColors.lightYellow,
    'order packed and ready for delivery': ZPColors.lightYellow,
    'expiring': ZPColors.lightYellow,
    'in progress': ZPColors.lightYellow,
  };

  final secondary = {
    'completed': ZPColors.secondary,
    'delivered': ZPColors.secondary,
    'delivered - partial rejection': ZPColors.secondary,
    'delivered - rejected upon delivery': ZPColors.secondary,
  };

  final statusTypeMap = {
    ...lightSecondary,
    ...lightRedStatusColor,
    ...lightYellow,
    ...secondary,
    'order created': ZPColors.invoiceStatusBlue,
    'order received': ZPColors.invoiceStatusBlue,
    'cleared': ZPColors.invoiceStatusGreen,
    'open': ZPColors.invoiceStatusBlue,
    'in progress': ZPColors.invoiceStatusOrange,
    // 'In Progress': ZPColors.lightGray,
    'pending': ZPColors.lightRed,
    'out of stock': ZPColors.lightGray,
    'expired': ZPColors.lightGray,
  };

  return statusTypeMap[statusType.toLowerCase()] ?? ZPColors.lightYellow;
}

Color getDueDateColor(String statusType) {
  return isEqualsIgnoreCase(statusType, 'Overdue')
      ? ZPColors.red
      : ZPColors.black;
}

Color getStatusTextColor(String statusType) {
  switch (statusType.toLowerCase()) {
    case 'pending':
    case 'approved':
    case 'failed':
      return ZPColors.returnSummaryStatusTextColor;
    case 'rejected':
      return ZPColors.darkGray;
    case 'oos-preorder':
      return ZPColors.black;
    case 'bonus':
      return ZPColors.white;
    case 'out of stock':
      return ZPColors.black;

    default:
      return ZPColors.white;
  }
}

String getReturnSummaryStatus(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return 'Pending Approval';
    case 'approved':
    case 'failed':
      return 'Approved';
    case 'rejected':
      return 'Rejected';
    default:
      return 'Return Completed';
  }
}

String getPaymentStatus(String status) {
  switch (status.toLowerCase()) {
    case 'open':
      return 'Open';
    case 'overdue':
      return 'Overdue';
    default:
      return status;
  }
}

String getReturnByRequestStatus(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return 'Pending Review';
    case 'reviewed':
      return 'Reviewed';
    case 'failed':
      return 'Failed';
    default:
      return status;
  }
}

String getReturnSummaryFilterByStatus(String filter) =>
    isEqualsIgnoreCase(filter, 'Active')
        ? 'PENDING'
        : isEqualsIgnoreCase(filter, 'All')
            ? ''
            : 'COMPLETED';

String getReturnSummaryStatusInList(String statusType) {
  switch (statusType.toLowerCase()) {
    case 'pending':
      return 'Active';
    case 'approved':
    case 'failed':
    case 'rejected':
      return 'Completed';

    default:
      return statusType;
  }
}

String getThreeDaysAfterString(DateTime dateTime) => DateFormat(
      DateTimeFormatString.defaultDateTimeFormat,
    ).format(dateTime.add(const Duration(days: 3)));

int paymentAttentionExpiryInDays(
  DateTime date,
) =>
    date.add(const Duration(days: 3)).difference(DateTime.now()).inDays;

bool differenceNGTWeek(DateTime date) {
  final diff = DateTime.now().difference(date).inDays;

  return (!diff.isNegative) && diff < 7;
}

bool checkIfDateMoreThanAWeekAway(DateTime date) {
  final diff = date.difference(DateTime.now()).inDays;

  return diff > 7;
}

bool isApproved(String status) {
  return isEqualsIgnoreCase(status, 'approved');
}

bool isRejected(String status) => isEqualsIgnoreCase(status, 'rejected');

bool isBapiStatusSuccess(String status) =>
    isEqualsIgnoreCase(status, 'success');

String bapiStatusType(String bapiStatus) {
  switch (bapiStatus.toLowerCase()) {
    case 'failed':
      return 'Request Failed';
    case 'pending':
      return 'Pending';
    case 'success':
      return 'Success';
    case '':
      return '-';

    default:
      return '-';
  }
}

bool isBapiStatusFailed(String status) {
  return isEqualsIgnoreCase(status, 'failed');
}

IconData getReturnStatusIcon(String status) {
  switch (status.toLowerCase()) {
    case 'return request submitted':
      return Icons.inventory_outlined;
    case 'pending review':
      return Icons.query_builder;
    case 'reviewed':
    case 'approved':
      return Icons.check;
    case 'rejected':
    case 'failed':
      return Icons.cancel;
    default:
      return Icons.inventory_outlined;
  }
}

List<StatusType> getReturnByItemStatusDetail(String status) => [
      if (!isEqualsIgnoreCase(status, 'Pending Approval')) StatusType(status),
      StatusType('Pending review'),
      StatusType('Return request submitted'),
    ];

List<StatusType> getReturnStatusDetails(String status) {
  final returnStatusList = <StatusType>[
    StatusType('Pending review'),
    StatusType('Return request submitted'),
  ];
  switch (status.toLowerCase()) {
    case 'failed':
      return [
        StatusType('Failed'),
        ...returnStatusList,
      ];

    case 'pending':
      return returnStatusList;
    case 'reviewed':
      return [
        StatusType('Reviewed'),
        ...returnStatusList,
      ];

    default:
      final normalizedStatus = bapiStatusType(status).toLowerCase();

      return returnStatusList
          .skipWhile(
            (item) =>
                item.getOrDefaultValue('').toLowerCase() != normalizedStatus,
          )
          .toList();
  }
}

String getMarketName(String country) {
  final marketNameMap = {
    'hk': 'Hong Kong',
    'kh': 'Cambodia',
    'kr': 'Korea',
    'mm': 'Myanmar',
    'ph': 'Philippines',
    'sg': 'Singapore',
    'th': 'Thailand',
    'tw': 'Taiwan',
    'vn': 'Vietnam',
    'my': 'Malaysia',
    'id': 'Indonesia',
  };

  return marketNameMap[country] ?? 'Malaysia';
}

String getMarketDomain(String country) {
  final marketDomainMap = {
    'hk': 'hk',
    'kh': 'kh',
    'kr': 'kr2',
    'mm': 'mm',
    'ph': 'ph',
    'sg': 'sg',
    'th': 'th',
    'tw': 'tw',
    'vn': 'vn',
    'my': 'my',
    'id': 'id',
  };

  return marketDomainMap[country] ?? 'my';
}

List<String> getAvailableMarketDomain(String country) {
  final marketDomainMap = {
    'hk': ['hk'],
    'kh': ['kh'],
    'kr': ['kr2'],
    'mm': ['mm'],
    'ph': ['ph'],
    'sg': ['sg'],
    'th': ['th'],
    'tw': ['tw'],
    'vn': ['vn', 'vns', 'vnm', 'vnp'],
    'my': ['my'],
    'id': ['id'],
  };

  return marketDomainMap[country] ?? [];
}

String getCurrency(String country) {
  final marketCurrencyMap = {
    'sg': 'SGD',
    'my': 'MYR',
    'hk': 'HKD',
    'th': 'THB',
    'vn': 'VND',
    'ph': 'PHP',
    'mm': 'MMK',
    'kh': 'USD',
    'kr': 'KRW',
    'tw': 'TWD',
    'id': 'IDR',
    'bn': 'BTN',
  };

  return marketCurrencyMap[country] ?? 'MYR';
}

String getLocale(String country) {
  final marketLocaleMap = {
    'sg': 'en-US',
    'my': 'en-US',
    'hk': 'en-US',
    'th': 'th-TH',
    'vn': 'vi-VN',
    'ph': 'en-US',
    'mm': 'my-MM',
    'kh': 'km-KH',
    'kr': 'ko-KR',
    'tw': 'zh-TW',
    'id': 'id-ID',
    'bn': 'ms-BN',
  };

  return marketLocaleMap[country] ?? 'en-US';
}

SalesOrg marketToSalesOrg(String market) {
  final marketSalesOrgMap = {
    'my': '2001',
    'mm': '2200',
    'ph': '2500',
    'sg': '2601',
    'tw': '2800',
    'th': '2900',
    'vn': '3000',
    'kr': '3101',
    'kh': '1500',
    'id': '1900',
    'hk': '1700',
  };

  return SalesOrg(marketSalesOrgMap[market] ?? 'Unknown');
}

String getCountryFlag(String country) {
  return 'assets/svg/flags/${country.toLowerCase()}.svg';
}

String getOosMaterialTag(bool value) => value ? 'OOS-Preorder' : 'Out of stock';

Color getOosMaterialTagColor(bool value) =>
    value ? ZPColors.lightYellowColor : ZPColors.lightGray;

String getOosTag() => 'Out of stock';

Color getOosTagLabelColor() => ZPColors.black;

bool isSuccessfulOrProcessed(String status) =>
    isEqualsIgnoreCase(status, 'Successful') ||
    isEqualsIgnoreCase(status, 'Processed') ||
    isEqualsIgnoreCase(status, 'Payment received') ||
    isEqualsIgnoreCase(status, 'success') ||
    getExpiredOrCanceled(status);

bool getExpiredOrCanceled(String status) =>
    isEqualsIgnoreCase(status, 'expired') ||
    isEqualsIgnoreCase(status, 'canceled');

Color getDisplayStatusTextColor(String status) =>
    isSuccessfulOrProcessed(status) ? ZPColors.black : ZPColors.red;

Color getAdviceExpiryColor(String status) =>
    isSuccessfulOrProcessed(status) ? ZPColors.white : ZPColors.red;

bool isFailed(String status) => isEqualsIgnoreCase(status, 'Failed');

bool isPending(String status) => isEqualsIgnoreCase(status, 'Pending');

bool isInProgress(String status) =>
    isEqualsIgnoreCase(status, 'creating') ||
    isEqualsIgnoreCase(status, 'In Progress') ||
    isEqualsIgnoreCase(status, 'waiting') ||
    isEqualsIgnoreCase(status, 'processing');

Color getAdviceExpiryColorFailed(String status) {
  return isInProgress(status) ||
          isFailed(status) ||
          getExpiredOrCanceled(status)
      ? ZPColors.red
      : ZPColors.white;
}

String getSortLabel(String sort) {
  switch (sort.toLowerCase()) {
    case 'completed':
      return 'Completed';
    case 'all':
      return 'All';

    default:
      return 'Pending Review';
  }
}

String covertApiSortValue(String value) =>
    value.isNotEmpty && isEqualsIgnoreCase(value, 'ALL') ? '' : value;

List<String> getApiSatuses(String statusText) {
  switch (statusText.toLowerCase()) {
    case 'in progress':
      return <String>[
        'waiting',
        'creating',
        'processing',
      ];
    case 'expired':
      return <String>[
        'expired',
      ];
    case 'successful':
      return <String>[
        'success',
        'failed',
      ];
    case 'cancelled':
      return <String>[
        'canceled',
      ];
    default:
      return <String>[
        statusText,
      ];
  }
}

String getStatusText(String apiStatus) {
  switch (apiStatus.toLowerCase()) {
    case 'canceled':
      return 'Cancelled';
    case 'success':
      return 'Successful';
    case 'failed':
      return 'Failed';
    case 'expired':
      return 'Expired';
    case 'waiting':
    case 'creating':
    case 'processing':
      return 'In Progress';
    default:
      return apiStatus;
  }
}

String getUpperCaseValue(String value) => value.toUpperCase();

String getLanguageString(String apiLanguageCode) {
  final languageString = {
    'TH': 'ภาษาไทย',
    'ZH': '繁體中文',
    'MY': 'ဗမာဘာသာစကား',
    'VI': 'Tiếng Việt',
    'KM': 'ភាសាខ្មែរ',
    'ID': 'Indonesia',
  };

  return languageString[apiLanguageCode] ?? 'English';
}

String languageCodeToLanguageCumCountryCode(String languageCode) {
  final languageCodesMap = {
    'en': 'en-US',
    'th': 'th-TH',
    'vi': 'vi-VN',
    'my': 'my-MM',
    'km': 'km-KH',
    'ko': 'ko-KR',
    'zh': 'zh-TW',
    'id': 'id-ID',
    'ms': 'ms-BN',
  };

  return languageCodesMap[languageCode.toLowerCase()] ??
      languageCode.toLowerCase();
}

bool checkIfMandarin(String languageCode) => languageCode == 'ZH';

bool checkIfIndonesian(String languageCode) => languageCode == 'ID';

String toSupportedLanguage(String value) {
  final supportedLanguageList = ['TH', 'ZH', 'MY', 'VI', 'ID', 'KM'];

  return supportedLanguageList.contains(value) ? value : 'EN';
}

Locale toLocale(String apiLanguageCode) =>
    Locale(apiLanguageCode.toLowerCase());

String fileNameFromPath(String source) => path.basename(source);

String fileTypeFromPath(String source) {
  return path.extension(source);
}

/// Filters and extracts the query parameter from the provided [uri] that contains ezrx domain.
/// This is necessary when the redirecting URI is passed as a query parameter
/// to the original URI.
/// Example url -> EZRX://clicktime.symantec.com/15tStdWWRBCjGxB6bujRD?h=zRUjvnB-oJ7CeZWGKRQJobPyV8b1EJMcAlvzEMzuV0Y=&amp;u=https://uat-my.ezrxplus.com/login/set-password?username%3D****%26token%3D******
Uri getFilteredResetPasswordUri(Uri uri) {
  final link = uri.queryParameters.values.firstWhere(
    (element) => element.contains(GetIt.instance<Config>().domain),
    orElse: () => uri.toString(),
  );

  return Uri.parse(link);
}

bool isResetPasswordLink(String path) => path == '/login/set-password';

bool isDealOrOverrideBonus(String type) =>
    isEqualsIgnoreCase(type, 'Deals') || isEqualsIgnoreCase(type, 'Bonus');

String getPoReferenceHintText(bool value) =>
    value ? 'Enter your PO reference' : 'Enter your PO reference (Optional)';

bool isProductDetailLink(String path) => path.startsWith('/product-details');

bool isProductListLink(String path) => path == '/product-listing';

bool isBundleDetailLink(String path) => path.startsWith('/bundle-details');

bool isOrderDetailLink(String path) =>
    path == '/my-account/orders/order-detail';

bool isReturnSummaryDetailLink(String path) =>
    path == '/my-account/return-summary-details';

bool isZPPaymentSummaryDetailLink(String path) =>
    path == '/payments/payment-summary/invoice-details';

bool isMPPaymentSummaryDetailLink(String path) =>
    path == '/marketplace-payments/payment-summary/invoice-details';

bool isZPInvoiceDetailLink(String path) =>
    path == '/payments/account-summary/invoice-details';

bool isMPInvoiceDetailLink(String path) =>
    path == '/marketplace-payments/account-summary/invoice-details';

bool isZPMyAccountPaymentLink(String path) => path == '/my-account/payments';

bool isMPMyAccountPaymentLink(String path) =>
    path == '/my-account/marketplace-payments';

bool isContactUsLink(String path) => path == '/contact-us';

bool isFaqLink(String path) => path == '/faq';

bool isAboutUsLink(String path) => path == '/about-us';

bool isUserGuideLink(String path) => path == '/user-guide';

bool isOrderLink(String path) => path == '/my-account/Orders';

bool isSettingLink(String path) => path == '/my-account/Settings';

bool isCartLink(String path) => path == '/cart';

bool isOrderItemDetailLink(String path) =>
    path == '/my-account/orders/item-detail';

bool isTnCLink(String path) => path == '/tnc';

bool isPrivacyLink(String path) => path == '/privacy';

bool isAnnouncementLink(String path) =>
    path == '/announcement/view-all/announcements' || path == '/announcement';

bool isArticleLink(String path) => path == '/announcement/view-all/articles';

bool isReturnLink(String path) => path == '/my-account/returns';

bool isZPCreditDetailLink(String path) =>
    path == '/payments/account-summary/creditnote-details';

bool isMPCreditDetailLink(String path) =>
    path == '/marketplace-payments/account-summary/creditnote-details';

bool isClaimSubmissionLink(String path) =>
    path == '/my-account/payments/claim-submission';

bool isNewReturnRequestLink(String path) =>
    path == '/my-account/new-return-request';

bool isRaiseTicketLink(String path) => path == '/raise-ticket';

String getViewByItemTitle(int value) {
  switch (value) {
    case 0:
      return 'All';
    case 1:
      return 'MP items';
    case 2:
      return 'ZP items';
    default:
      return '';
  }
}

//ignore: code-duplication
String getViewByOrderHistoryTitle(int value) {
  switch (value) {
    case 0:
      return 'All';
    case 1:
      return 'MP orders';
    case 2:
      return 'ZP orders';
    default:
      return '';
  }
}

bool isEqualsIgnoreCase(String value, String matcher) =>
    value.trim().toLowerCase() == matcher.trim().toLowerCase();

bool isContainIgnoreCase(String value, String containValue) =>
    value.trim().toLowerCase().contains(containValue.trim().toLowerCase());

//query params from deep linking

//******************* common methods ****************************************/
List<String> _getListFromQueryParameter(
  Map<String, String> queryParameters,
  String key,
) =>
    queryParameters[key]?.split('+') ?? [];

bool _getBooleanFromQueryParameter(
  Map<String, String> queryParameters,
  String key,
) =>
    bool.tryParse(queryParameters[key] ?? 'false') ?? false;

//******************* common methods ****************************************/

String getMaterialNumber(Map<String, String> queryParameters) =>
    queryParameters['q'] ?? '';

List<String> getManufacturerList(Map<String, String> queryParameters) =>
    _getListFromQueryParameter(queryParameters, 'manufacturer');

List<String> getCountryList(Map<String, String> queryParameters) =>
    _getListFromQueryParameter(queryParameters, 'country');

bool checkMaterialFavorite(Map<String, String> queryParameters) =>
    _getBooleanFromQueryParameter(queryParameters, 'favourite');

bool checkProductOffer(Map<String, String> queryParameters) =>
    _getBooleanFromQueryParameter(queryParameters, 'itemsWithOffers');

bool checkBundleOffer(Map<String, String> queryParameters) =>
    _getBooleanFromQueryParameter(queryParameters, 'bundleOffers');

bool checkMarketPlace(Map<String, String> queryParameters) =>
    _getBooleanFromQueryParameter(queryParameters, 'marketPlace');

bool checkComboOffer(Map<String, String> queryParameters) =>
    _getBooleanFromQueryParameter(queryParameters, 'combo');

bool checkTender(Map<String, String> queryParameters) =>
    _getBooleanFromQueryParameter(queryParameters, 'tender');

bool checkCovid(Map<String, String> queryParameters) =>
    _getBooleanFromQueryParameter(queryParameters, 'covid');

Sort getSortBy(Map<String, String> queryParameters) {
  final sortOptions = {
    'price_asc': Sort.priceLowToHigh,
    'price_desc': Sort.priceHighToLow,
    'materialDescription_asc': Sort.az,
    'materialDescription_desc': Sort.za,
  };

  return sortOptions[queryParameters['sort']] ?? Sort.az;
}
