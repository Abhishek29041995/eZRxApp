import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/errors.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:ezrxmobile/domain/order/value/value_transformers.dart';
import 'package:ezrxmobile/presentation/products/widgets/enum_material_filter.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  T getOrDefaultValue(T defaultValue) {
    return value.fold((f) => defaultValue, id);
  }

  T getValue() => value.fold((f) => f.failedValue, (r) => r);

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class SearchKey extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SearchKey.empty() => SearchKey._(right(''));

  factory SearchKey.search(String searchText) {
    return SearchKey._(
      (validateStringIsEmpty(searchText).fold(
        (l) => validateMinStringLength(l.failedValue, 2),
        (r) => Right(r),
      )),
    );
  }

  bool get validateNotEmpty => searchValueOrEmpty.isNotEmpty;

  String get searchValueOrEmpty => value.getOrElse(() => '');

  int get countWhenValid => validateNotEmpty ? 1 : 0;

  bool get isValueEmpty => value.fold((l) => l.failedValue, (r) => r).isEmpty;

  String get upperCaseValue => getUpperCaseValue(searchValueOrEmpty);

  bool get isInvalidSearchKey => isValueEmpty || !isValid();

  const SearchKey._(this.value);
}

class DateTimeStringValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory DateTimeStringValue(String input) {
    return DateTimeStringValue._(validateDateString(input));
  }

  String get _valueOrEmpty => value.getOrElse(() => '');

  String get _valueOrDash => value.getOrElse(() => '-');

  String get _valueOrNa => value.getOrElse(() => 'NA');

  bool get isNotEmpty => _valueOrEmpty.isNotEmpty;

  bool get isEmpty => _valueOrEmpty.isEmpty;

  String get dateOrNaString => displayDateTimeString(
        _valueOrNa,
        DateTimeFormatString.displayDateFormat,
      );

  String get dateTimeOrNaString => displayDateTimeString(
        _valueOrNa,
        DateTimeFormatString.displayDateFormat,
      );

  String get dateOrDashString => displayDateTimeString(
        _valueOrDash,
        DateTimeFormatString.displayDateFormat,
      );

  String get dateTimeOrDashString => displayDateTimeString(
        _valueOrDash,
        DateTimeFormatString.displayDateTimeFormat,
      );

  String get dateString => displayDateTimeString(
        _valueOrEmpty,
        DateTimeFormatString.displayDateFormat,
      );

  String get dateStringIgnoreTimezone => displayDateTimeStringIgnoringTimezone(
        _valueOrEmpty,
        DateTimeFormatString.displayDateFormat,
      );

  String get simpleDateString => displayDateTimeString(
        _valueOrEmpty,
        DateTimeFormatString.displaySimpleDateFormat,
      );

  String get dateTime12HoursString => displayDateTimeString(
        _valueOrEmpty,
        DateTimeFormatString.displayDateTime12HoursFormat,
      );

  String get dateTimeWithTimeZone =>
      '$dateTime12HoursString ${getTimeZoneAbbreviation(dateTime.timeZoneOffset)}';

  String get time12HoursStringIgnoreTimezone =>
      displayDateTimeStringIgnoringTimezone(
        _valueOrEmpty,
        DateTimeFormatString.displayTime12HoursFormat,
      );

  String get dateTimeWithWeekDayString => displayDateTimeString(
        _valueOrEmpty,
        DateTimeFormatString.displayDateTimeWithWeekDayFormat,
      );

  String get fullDateTimeWithTimeZone =>
      '$dateTimeWithWeekDayString ${getTimeZoneAbbreviation(dateTime.timeZoneOffset)}';

  String get apiDateTimeString => displayDateTimeString(
        _valueOrEmpty,
        DateTimeFormatString.apiDateFormat,
      );

  String get apiDateWithDashString => displayDateTimeString(
        _valueOrEmpty,
        DateTimeFormatString.apiDateWithDashFormat,
      );

  int get intValue => getDateTimeIntValue(_valueOrEmpty);

  DateTime get dateTime => getDateTimeByDateString(_valueOrEmpty);

  DateTime? get dateTimeOrNull => tryParseDateTime(_valueOrEmpty);

  String get differenceTime => calculateDifferenceTime(_valueOrEmpty);

  String get notificationDateTime => displayDateTimeString(
        _valueOrEmpty,
        DateTimeFormatString.displayNotificationDateTimeFormat,
      );

  bool get aWeekDifference => differenceNGTWeek(dateTime);

  bool get isDateMoreThanAWeekAway => checkIfDateMoreThanAWeekAway(dateTime);

  DateTimeStringValue get threeDaysAfter => DateTimeStringValue(
        getThreeDaysAfterString(
          dateTime,
        ),
      );

  int get paymentAttentionExpiry => paymentAttentionExpiryInDays(dateTime);

  bool get withinAYearFromNow => dateTimeOrNull != null
      ? dateTimeOrNull!.difference(DateTime.now()).inDays <= 365
      : false;

  const DateTimeStringValue._(this.value);
}

class StringValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StringValue(String input) =>
      StringValue._(validateStringNotEmpty(input));

  factory StringValue.trimmed(String input) =>
      StringValue._(validateTrimmedStringNotEmpty(input));

  String get displayDashIfEmpty => dashIfEmpty((value.getOrElse(() => '')));

  String get displayNAIfEmpty => naIfEmpty(value.getOrElse(() => ''));

  bool get isNotEmpty => value.getOrElse(() => '').isNotEmpty;

  bool get isTrimmedValueNotEmpty =>
      checkIfTrimmedValueNotEmpty(value.getOrElse(() => ''));

  String get formattedValue =>
      trimAndRemoveConsecutiveSpace(value.getOrElse(() => ''));

  const StringValue._(this.value);
}

class RangeValue extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory RangeValue(String input) => RangeValue._(validateDoubleValue(input));

  String get apiParameterValue =>
      value.isLeft() ? '' : value.getOrElse(() => 0).toString();

  int get intValue => value.getOrElse(() => 0).toInt();

  double get doubleValue => value.getOrElse(() => 0);

  String get apiParameterValueIfNegative =>
      value.isLeft() ? '' : (-1 * value.getOrElse(() => 0)).toString();

  static bool checkIfRangeIsValid(RangeValue from, RangeValue to) =>
      (!from.isValid() && !to.isValid()) ||
      from.isValid() &&
          to.isValid() &&
          (to.getOrDefaultValue(0) >= from.getOrDefaultValue(0));

  static bool checkIfAnyIsEmpty(RangeValue from, RangeValue to) =>
      !from.isValid() && to.isValid() || from.isValid() && !to.isValid();

  const RangeValue._(this.value);
}

class IntegerValue extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory IntegerValue(String input) =>
      IntegerValue._(validateIntegerValue(input));

  String get apiParameterValue => emptyIfZero(value.getOrElse(() => 0));

  String get stringValue => value.getOrElse(() => 0).toString();

  bool get isGreaterThanZero => value.getOrElse(() => 0) > 0;

  bool get isZero => value.getOrElse(() => 0) == 0;

  const IntegerValue._(this.value);
}

class StatusType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StatusType(String input) =>
      StatusType._(validateStringNotEmpty(input));

  String get displayStatusText => getStatusText(value.getOrElse(() => ''));

  String get displayStatusInList =>
      getReturnSummaryStatusInList(value.getOrElse(() => ''));

  Color get displayStatusLabelColor =>
      getStatusLabelColor(value.getOrElse(() => ''));

  Color get displayDueDateColor => getDueDateColor(value.getOrElse(() => ''));

  String get label => getReturnSummaryFilterByStatus(value.getOrElse(() => ''));

  String get displayStringValue {
    return dashIfEmpty((value.getOrElse(() => '')));
  }

  String get displayStatus => getReturnSummaryStatus(value.getOrElse(() => ''));

  List<StatusType> get returnItemStatusDetail =>
      getReturnByItemStatusDetail(displayStatus);

  String get displayPaymentStatus =>
      getPaymentStatus(value.getOrElse(() => ''));

  String get displayStatusForViewByRequest =>
      getReturnByRequestStatus(value.getOrElse(() => ''));

  bool get isApprovedStatus => isApproved(value.getOrElse(() => ''));

  bool get isRejectedStatus => isRejected(value.getOrElse(() => ''));

  bool get showApprovalDetails => isApprovedStatus || isRejectedStatus;

  bool get getIsBapiStatusFailed =>
      isBapiStatusFailed(value.getOrElse(() => ''));

  bool get isSuccess => isBapiStatusSuccess(value.getOrElse(() => ''));

  IconData get displayReturnStatusIcon =>
      getReturnStatusIcon(value.getOrElse(() => ''));

  List<StatusType> get displayReturnStatusDetails =>
      getReturnStatusDetails(value.getOrElse(() => ''));

  Color get displayStatusTextColor =>
      getStatusTextColor(value.getOrElse(() => ''));

  String get statusLabel => getOrderSAPStatus(value.getOrElse(() => ''));

  bool get isStatusTagValid => value.getOrElse(() => '').isNotEmpty;

  const StatusType._(this.value);
}

class OosMaterial extends ValueObject<bool> {
  @override
  final Either<ValueFailure<bool>, bool> value;

  factory OosMaterial(bool input) => OosMaterial._(Right(input));

  String get oosMaterialTag => getOosMaterialTag(value.getOrElse(() => false));

  bool get isOutOfStockMaterialAllowed => value.getOrElse(() => false);

  Color get oosMaterialTagColor =>
      getOosMaterialTagColor(value.getOrElse(() => false));

  Color get oosMaterialTagLabelColor => ZPColors.black;

  String productTag(bool isValidated) => isValidated ? oosMaterialTag : oosTag;

  Color productTagColor(bool isValidated) =>
      isValidated ? oosMaterialTagColor : oosTagColor;

  Color productTagLabelColor(bool isValidated) =>
      isValidated ? oosMaterialTagLabelColor : oosTagLabelColor;

  String get oosTag => getOosTag();

  Color get oosTagColor => getStatusLabelColor(getOosTag());

  Color get oosTagLabelColor => getOosTagLabelColor();

  const OosMaterial._(this.value);
}

class PoNumberRequired extends ValueObject<bool> {
  @override
  final Either<ValueFailure<bool>, bool> value;

  factory PoNumberRequired(bool input) => PoNumberRequired._(Right(input));

  const PoNumberRequired._(this.value);

  String get poReferenceHintText =>
      getPoReferenceHintText(value.getOrElse(() => false));
}

class Remarks extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Remarks(String input) {
    return Remarks._(validateStringNotEmpty(input.trim()));
  }

  String get displayText => value.getOrElse(() => '-');

  const Remarks._(this.value);
}

class FilterStatus extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FilterStatus(String input) =>
      FilterStatus._(validateStringNotEmpty(input));

  String get _valueOrEmpty => value.getOrElse(() => '');

  String get stringValue => dashIfEmpty(_valueOrEmpty);

  String get sortLabel => getSortLabel(_valueOrEmpty);

  List<String> get apiStatuses => getApiSatuses(_valueOrEmpty);

  String get apiSortValueOrEmpty => covertApiSortValue(
        value.getOrElse(() => ''),
      );

  String get displayStatusText => getStatusText(value.getOrElse(() => ''));

  Color get displayStatusTextColor =>
      getStatusTextColor(value.getOrElse(() => ''));

  Color get displayStatusLabelColor =>
      getStatusLabelColor(value.getOrElse(() => ''));

  bool get getIsSuccessfulOrProcessed =>
      isSuccessfulOrProcessed(value.getOrElse(() => ''));

  bool get isExpiredOrCanceled =>
      getExpiredOrCanceled(value.getOrElse(() => ''));

  Color get getPaymentDisplayStatusTextColor =>
      getDisplayStatusTextColor(value.getOrElse(() => ''));

  Color get getAdviceExpiryTextColor =>
      getAdviceExpiryColor(value.getOrElse(() => ''));

  bool get getIsFailed => isFailed(value.getOrElse(() => ''));

  Color get getAdviceExpiryTextColorForFailed =>
      getAdviceExpiryColorFailed(value.getOrElse(() => ''));

  bool get getIsPending => isPending(value.getOrElse(() => ''));

  bool get getIsInProgress => isInProgress(value.getOrElse(() => ''));

  const FilterStatus._(this.value);
}

class Language extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Language(String input) {
    return Language._(validateStringNotEmpty(input));
  }

  factory Language.english() {
    return const Language._(Right('EN'));
  }

  factory Language.shortEnglish() {
    return const Language._(Right('E'));
  }

  factory Language.vietnamese() {
    return const Language._(Right('VI'));
  }

  factory Language.mandarin() {
    return const Language._(Right('ZH'));
  }

  String get languageString => getLanguageString(value.getOrElse(() => ''));

  String get languageCode => toSupportedLanguage(value.getOrElse(() => 'EN'));

  String get languageCumCountryCode =>
      languageCodeToLanguageCumCountryCode(value.getOrElse(() => ''));

  bool get isMandarin => checkIfMandarin(value.getOrElse(() => ''));

  bool get isIndonesian => checkIfIndonesian(value.getOrElse(() => ''));

  Locale get locale => toLocale(languageCode);

  const Language._(this.value);
}

class EzrxLink extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EzrxLink(String input) {
    return EzrxLink._(validateStringNotEmpty(input));
  }

  Uri get uri => Uri.parse(value.getOrElse(() => ''));

  Uri get resetPasswordFilteredUri => getFilteredResetPasswordUri(uri);

  bool get isResetPassword =>
      isResetPasswordLink(resetPasswordFilteredUri.path);

  bool get isProductDetail => isProductDetailLink(uri.path);

  bool get isProductListing => isProductListLink(uri.path);

  bool get isBundleDetail => isBundleDetailLink(uri.path);

  bool get isOrderDetail => isOrderDetailLink(uri.path);

  bool get isReturnSummaryDetail => isReturnSummaryDetailLink(uri.path);

  bool get isZPPaymentSummaryDetail => isZPPaymentSummaryDetailLink(uri.path);

  bool get isMPPaymentSummaryDetail => isMPPaymentSummaryDetailLink(uri.path);

  bool get isZPInvoiceDetail => isZPInvoiceDetailLink(uri.path);

  bool get isMPInvoiceDetail => isMPInvoiceDetailLink(uri.path);

  bool get isZPMyAccountPayment => isZPMyAccountPaymentLink(uri.path);

  bool get isMPMyAccountPayment => isMPMyAccountPaymentLink(uri.path);

  bool get isContactUs => isContactUsLink(uri.path);

  bool get isFaq => isFaqLink(uri.path);

  bool get isAboutUs => isAboutUsLink(uri.path);

  bool get isUserGuide => isUserGuideLink(uri.path);

  bool get isOrder => isOrderLink(uri.path);

  bool get isSetting => isSettingLink(uri.path);

  bool get isCart => isCartLink(uri.path);

  bool get isOrderItemDetail => isOrderItemDetailLink(uri.path);

  bool get isTnC => isTnCLink(uri.path);

  bool get isPrivacy => isPrivacyLink(uri.path);

  bool get isAnnouncement => isAnnouncementLink(uri.path);

  bool get isArticle => isArticleLink(uri.path);

  bool get isReturn => isReturnLink(uri.path);

  bool get isZPCreditDetail => isZPCreditDetailLink(uri.path);

  bool get isMPCreditDetail => isMPCreditDetailLink(uri.path);

  bool get isClaimSubmission => isClaimSubmissionLink(uri.path);

  bool get isNewReturnRequest => isNewReturnRequestLink(uri.path);

  bool get isRaiseTicket => isRaiseTicketLink(uri.path);

  const EzrxLink._(this.value);
}

class EzrxLinkQueryParameter extends ValueObject<Map<String, String>> {
  @override
  final Either<ValueFailure<Map<String, String>>, Map<String, String>> value;

  factory EzrxLinkQueryParameter(Map<String, String> input) {
    return EzrxLinkQueryParameter._(validateMapNotEmpty(input));
  }

  String get extractMaterialNumber =>
      getMaterialNumber(value.getOrElse(() => {}));

  List<String> get manufacturerList =>
      getManufacturerList(value.getOrElse(() => {}));

  List<String> get countryList => getCountryList(value.getOrElse(() => {}));

  bool get isFavorite => checkMaterialFavorite(value.getOrElse(() => {}));

  Sort get sortBy => getSortBy(value.getOrElse(() => {}));

  bool get isProductOffer => checkProductOffer(value.getOrElse(() => {}));

  bool get isBundleOffer => checkBundleOffer(value.getOrElse(() => {}));

  bool get isMarketPlace => checkMarketPlace(value.getOrElse(() => {}));

  bool get isComboOffer => checkComboOffer(value.getOrElse(() => {}));

  bool get isTender => checkTender(value.getOrElse(() => {}));

  bool get isCovid => checkCovid(value.getOrElse(() => {}));

  const EzrxLinkQueryParameter._(this.value);
}

class MaterialOriginFilter extends ValueObject<int> {
  static final supportedTypes = [
    MaterialOriginFilter.all(),
    MaterialOriginFilter.mp(),
    MaterialOriginFilter.zp(),
  ];

  @override
  final Either<ValueFailure<int>, int> value;

  factory MaterialOriginFilter(int input) =>
      MaterialOriginFilter._(Right(input));

  factory MaterialOriginFilter.all() => MaterialOriginFilter(0);

  factory MaterialOriginFilter.mp() => MaterialOriginFilter(1);

  factory MaterialOriginFilter.zp() => MaterialOriginFilter(2);

  const MaterialOriginFilter._(this.value);

  String get titleViewByItem => getViewByItemTitle(value.getOrElse(() => -1));

  String get titleViewByOrder =>
      getViewByOrderHistoryTitle(value.getOrElse(() => -1));
}

class FilterOption extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FilterOption(String input) =>
      FilterOption._(validateStringNotEmpty(input));

  factory FilterOption.documentDate() => FilterOption('documentDate');

  factory FilterOption.dueDate() => FilterOption('dueDate');

  factory FilterOption.amountRange() => FilterOption('amountRange');

  factory FilterOption.status() => FilterOption('status');

  const FilterOption._(this.value);
}

class PaymentTab extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentTab(String input) =>
      PaymentTab._(validateStringNotEmpty(input));

  factory PaymentTab.accountSummary() => PaymentTab('account-summary');

  factory PaymentTab.paymentSummary() => PaymentTab('payment-summary');

  factory PaymentTab.statementOfAccs() => PaymentTab('statementOfAccs');

  factory PaymentTab.claimManagement() => PaymentTab('claim-management');

  const PaymentTab._(this.value);
}

class PaymentSubTab extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentSubTab(String input) =>
      PaymentSubTab._(validateStringNotEmpty(input));

  factory PaymentSubTab.allInvoices() => PaymentSubTab('all-invoices');

  factory PaymentSubTab.allCreditNotes() => PaymentSubTab('all-creditnotes');

  factory PaymentSubTab.fullSummary() => PaymentSubTab('full-summary');

  const PaymentSubTab._(this.value);
}
