import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:ezrxmobile/domain/faq/value/value_transformers.dart';

class FAQCategory extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FAQCategory(String input) {
    return FAQCategory._(validateStringNotEmpty(input));
  }

  bool get isAll => isCategoryAll(value.getOrElse(() => ''));

  const FAQCategory._(this.value);
}
