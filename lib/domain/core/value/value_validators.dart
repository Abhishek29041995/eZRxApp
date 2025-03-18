import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  return input.isNotEmpty
      ? right(input)
      : left(ValueFailure.empty(failedValue: input));
}

Either<ValueFailure<String>, String> validateTrimmedStringNotEmpty(
  String input,
) =>
    input.trim().isNotEmpty
        ? right(input)
        : left(ValueFailure.empty(failedValue: input));

Either<ValueFailure<Map<String, String>>, Map<String, String>>
    validateMapNotEmpty(
  Map<String, String> input,
) {
  return input.isNotEmpty
      ? right(input)
      : left(ValueFailure.empty(failedValue: input));
}

Either<ValueFailure<String>, String> validateDateString(String input) {
  final dateTime = tryParseDateTime(input);

  return dateTime != null
      ? right(input)
      : left(ValueFailure.invalidDateValue(failedValue: input));
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  return RegExp(emailRegex).hasMatch(input)
      ? right(input)
      : left(ValueFailure.invalidEmail(failedValue: input));
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  // Password should be alphanumeric and consist of at least one upper case letter,
  // one special character and should be 10-20 characters long
  const passwordRegex =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{10,20}$';

  return RegExp(passwordRegex).hasMatch(input)
      ? right(input)
      : left(ValueFailure.passwordNotMatchRequirements(failedValue: input));
}

Either<ValueFailure<String>, String> validateMinStringLength(
  String input,
  int minLength,
) {
  return isMinCharacter(input: input, minLength: minLength)
      ? right(input)
      : left(ValueFailure.subceedLength(failedValue: input, min: minLength));
}

Either<ValueFailure<String>, String> atLeastOneUpperCharacter(String input) {
  return isAtLeastOneUpperCharacter(input: input)
      ? right(input)
      : left(ValueFailure.mustOneUpperCaseCharacter(failedValue: input));
}

Either<ValueFailure<String>, String> atLeastOneLowerCharacter(String input) {
  return isAtLeastOneLowerCharacter(input: input)
      ? right(input)
      : left(ValueFailure.mustOneLowerCaseCharacter(failedValue: input));
}

Either<ValueFailure<String>, String> atLeastOneNumericCharacter(String input) {
  return isAtLeastOneNumericCharacter(input: input)
      ? right(input)
      : left(ValueFailure.mustOneNumericCharacter(failedValue: input));
}

Either<ValueFailure<String>, String> atLeastOneSpecialCharacter(String input) {
  return isAtLeastOneSpecialCharacter(input: input)
      ? right(input)
      : left(ValueFailure.mustOneSpecialCharacter(failedValue: input));
}

Either<ValueFailure<String>, String> validateAbsenceOfSourceSubstrings(
  String textToValidate,
  String sourceText,
) {
  return containsSubstringFromSourceOfSizeThree(
    textToValidate: textToValidate,
    sourceString: sourceText,
  )
      ? left(
          ValueFailure.containsForbiddenSubstring(failedValue: textToValidate),
        )
      : right(textToValidate);
}

Either<ValueFailure<String>, String> validateStringIsEmpty(String input) {
  return input.isEmpty
      ? right(input)
      : left(ValueFailure.empty(failedValue: input));
}

Either<ValueFailure<double>, double> validateNumberIsBiggerThanZero(
  double input,
) {
  return input > 0.0
      ? right(input)
      : left(ValueFailure.numberMustBiggerThanZero(failedValue: input));
}

Either<ValueFailure<String>, String> validateStringIsBiggerThanZero(
  String input,
) {
  return double.parse(input) > 0.0
      ? right(input)
      : left(ValueFailure.numberMustBiggerThanZero(failedValue: input));
}

// Check if input does not exceed maxValue
Either<ValueFailure<String>, String> validateInputNotExceedMaxValue(
  String input,
  int maxValue,
) {
  return int.parse(input) <= maxValue
      ? right(input)
      : left(
          ValueFailure.exceedingMaxValue(
            failedValue: maxValue.toString(),
          ),
        );
}

// Check if input is less than maxValue
Either<ValueFailure<String>, String> validateInputIsLessThanMaxValue(
  String input,
  double maxValue,
) {
  return double.parse(input) < maxValue
      ? right(input)
      : left(
          ValueFailure.exceedingMaxValue(
            failedValue: maxValue.toString(),
          ),
        );
}

Either<ValueFailure<double>, double> validateDoubleValue(
  String input,
) {
  if (double.tryParse(input) == null) {
    return left(const ValueFailure.invalidDoubleValue(failedValue: 0));
  }

  return Right(double.parse(input));
}

Either<ValueFailure<int>, int> validateIntegerValue(
  String input,
) {
  input = input.split('.').first;
  if (int.tryParse(input) == null) {
    return left(const ValueFailure.invalidIntegerValue(failedValue: 0));
  }

  return Right(int.parse(input));
}
