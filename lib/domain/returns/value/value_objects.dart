import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:ezrxmobile/domain/returns/value/value_transformers.dart';

class RefundTotal extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RefundTotal(String input) {
    return RefundTotal._(validateStringNotEmpty(input));
  }

  double get refundTotal =>
      refundTotalStringAsFixed(value.getOrElse(() => '0'));

  const RefundTotal._(this.value);
}

class ReturnQuantity extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ReturnQuantity(String input) {
    return ReturnQuantity._(Right(input));
  }

  factory ReturnQuantity.validatedValue(
    int balanceQuantity,
    String inputValue,
  ) {
    return ReturnQuantity._(
      validateStringNotEmpty(inputValue).flatMap(
        (input) => validateInputNotExceedMaxValue(
          inputValue,
          balanceQuantity,
        ),
      ),
    );
  }

  String get noun => getNoun(value.getOrElse(() => '0'));

  int get getIntValue => getIntegerReturnQuantity(value.getOrElse(() => ''));

  const ReturnQuantity._(this.value);
}

class FileSize extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory FileSize(int input) {
    return FileSize._(Right(input));
  }

  String get displayText => getFileSizeString(value.getOrElse(() => 0));

  const FileSize._(this.value);
}

class OverrideRole extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory OverrideRole(String input) {
    return OverrideRole._(validateStringNotEmpty(input));
  }

  bool get isUser {
    return isUserOverride(value.getOrElse(() => ''));
  }

  bool get isApprover {
    return isApproverOverride(value.getOrElse(() => ''));
  }

  const OverrideRole._(this.value);
}

class StatusReason extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StatusReason(String input) {
    return StatusReason._(validateStringNotEmpty(input));
  }

  String get getOrDefault => statusReason(value.getOrElse(() => ''));

  const StatusReason._(this.value);
}

class ReturnType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ReturnType(String input) {
    return ReturnType._(validateStringNotEmpty(input));
  }
  factory ReturnType.returnItem() => ReturnType('500');
  factory ReturnType.exchangeItem() => ReturnType('505');

  String get returnTypeValue => getReturnValue(value.getOrElse(() => ''));

  bool get isCounterOfferElegible =>
      getisCounterOfferElegible(value.getOrElse(() => ''));

  String get quantityHeading => getQuantityHeading(value.getOrElse(() => ''));

  String get quantityHintText => getQuantityHintText(value.getOrElse(() => ''));
  String get returnTypeBottomASheetBodyText =>
      getreturnTypeBottomASheetBodyText(value.getOrElse(() => ''));

  const ReturnType._(this.value);
}

class StorageCondition extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StorageCondition(String input) {
    return StorageCondition._(validateStringNotEmpty(input.trim()));
  }

  String get displayStorageCondition =>
      getStorageCondition(value.getOrElse(() => ''));

  const StorageCondition._(this.value);
}
