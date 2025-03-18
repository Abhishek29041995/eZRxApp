import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_transformers.dart';
import 'package:ezrxmobile/domain/auth/value/value_transformers.dart';
import 'package:ezrxmobile/domain/auth/value/value_validators.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:flutter/material.dart';

class AppMarket extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static final supportMarkets = [
    AppMarket('kh'),
    AppMarket('hk'),
    AppMarket('id'),
    AppMarket('my'),
    AppMarket('mm'),
    AppMarket('ph'),
    AppMarket('sg'),
    AppMarket('tw'),
    AppMarket('th'),
    AppMarket('vn'),
  ];

  static List<AppMarket> prodSupportedMarkets = supportMarkets.toList()
    ..remove(AppMarket('hk'));

  factory AppMarket(String input) {
    return AppMarket._(validateStringNotEmpty(input));
  }

  factory AppMarket.defaultMarket() => supportMarkets.first;

  AppMarket get defaultMarket => isSupportMarket ? this : supportMarkets.first;

  factory AppMarket.vietnam() => AppMarket('vn');

  String get marketName => getMarketName(value.getOrElse(() => ''));

  String get countryFlag => getCountryFlag(value.getOrElse(() => ''));

  String get marketDomain => getMarketDomain(value.getOrElse(() => ''));

  List<String> get availableMarketDomain =>
      getAvailableMarketDomain(value.getOrElse(() => ''));

  const AppMarket._(this.value);

  String get contactUsItemId => countryContactUsItemId(country);

  Locale get announcementLocale =>
      Locale(helpAndSupportLanguageCode(country), country);

  String get country => value.getOrElse(() => '').toUpperCase();

  bool get isVN => isEqualsIgnoreCase(value.getOrElse(() => ''), 'vn');

  bool get isID => isEqualsIgnoreCase(value.getOrElse(() => ''), 'id');

  bool get isSupportMarket {
    return supportMarkets.any(
      (element) =>
          element.getValue() == value.getOrElse(() => '').toLowerCase(),
    );
  }

  String get currency => getCurrency(value.getOrElse(() => ''));

  String get locale => getLocale(value.getOrElse(() => ''));

  bool get isRegistrationRestricted => isVN || isID;

  bool get isSSOLoginRestricted => isVN || isID;

  SalesOrg get salesOrg => marketToSalesOrg(value.getOrElse(() => ''));
}

class Username extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Username(String input) {
    return Username._(validateStringNotEmpty(input));
  }

  const Username._(this.value);
}

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateStringNotEmpty(input).flatMap(validateEmailAddress),
    );
  }

  factory EmailAddress.optional(String input) {
    return EmailAddress._(
      (validateStringIsEmpty(input).fold(
        (l) => validateEmailAddress(input),
        (r) => Right(r),
      )),
    );
  }

  const EmailAddress._(this.value);

  String get maskedValue => maskEmail(value.getOrElse(() => ''));
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password.login(String input) {
    return Password._(validateStringNotEmpty(input));
  }

  factory Password.reset(String input) {
    return Password._(validateStringNotEmpty(input).flatMap(validatePassword));
  }

  factory Password.resetV2(
    String newPassword,
    String oldPassword,
    String userName,
  ) {
    return Password._(
      validateStringNotEmpty(newPassword)
          .flatMap(atLeastOneLowerCharacter)
          .flatMap(atLeastOneUpperCharacter)
          .flatMap(atLeastOneNumericCharacter)
          .flatMap(atLeastOneSpecialCharacter)
          .flatMap(
            (input) => validateAbsenceOfSourceSubstrings(input, userName),
          )
          .flatMap((input) => validateMinStringLength(input, 10))
          .flatMap((input) => validateOldAndNewPassword(input, oldPassword)),
    );
  }

  factory Password.confirm(String confirmPassword, String newPassword) {
    return Password._(
      validateStringNotEmpty(confirmPassword).flatMap(
        (input) => validateNewAndConfirmPassword(input, newPassword),
      ),
    );
  }

  bool get matchMinCharacter => isMinCharacter(
        input: getValidPassword,
        minLength: 10,
      );

  bool get matchAtLeastOneUpperCharacter => isAtLeastOneUpperCharacter(
        input: getValidPassword,
      );

  bool get matchAtLeastOneLowerCharacter => isAtLeastOneLowerCharacter(
        input: getValidPassword,
      );

  bool get matchAtLeastOneNumericCharacter => isAtLeastOneNumericCharacter(
        input: getValidPassword,
      );

  bool get matchAtLeastOneSpecialCharacter =>
      isAtLeastOneSpecialCharacter(input: getValidPassword);

  String get getValidPassword => value.fold((l) => l.failedValue, (r) => r);

  const Password._(this.value);
}

class JWT extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory JWT(String input) {
    return JWT._(validateJWT(input));
  }

  DateTime get expirationDate {
    return getJWTExpirationDate(value.getOrElse(() => ''));
  }

  Duration get issueTime {
    return getJWTTime(value.getOrElse(() => ''));
  }

  Duration get remainingTime {
    return getJWTRemainingTime(value.getOrElse(() => ''));
  }

  String get userId {
    return getJwtUserId(value.getOrElse(() => ''));
  }

  bool get isExpired {
    return isJWTExpired(value.getOrElse(() => ''));
  }

  List<String> get salesOrgs {
    return getJWTSalesOrg(value.getOrElse(() => ''));
  }

  const JWT._(this.value);
}
