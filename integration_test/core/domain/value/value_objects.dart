import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';

import 'value_transformer.dart';

class ZephyrStatus extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ZephyrStatus(String input) {
    return ZephyrStatus._(validateStringNotEmpty(input));
  }

  String get getStatus => getZephyrStatus(value.getOrElse(() => ''));

  const ZephyrStatus._(this.value);
}
