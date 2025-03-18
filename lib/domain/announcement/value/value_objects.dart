import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';

class AnnouncementType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AnnouncementType(String input) {
    return AnnouncementType._(validateStringNotEmpty(input));
  }

  const AnnouncementType._(this.value);
}

class AnnouncementDislayTime extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AnnouncementDislayTime(String input) {
    return AnnouncementDislayTime._(validateStringNotEmpty(input));
  }

  const AnnouncementDislayTime._(this.value);

  bool get isPre => isEqualsIgnoreCase(value.getOrElse(() => ''), 'Pre');

  bool get isPost => isEqualsIgnoreCase(value.getOrElse(() => ''), 'Post');

  bool get isPreAndPost =>
      isEqualsIgnoreCase(value.getOrElse(() => ''), 'Pre and Post');

  bool get isPreLogin =>
      isEqualsIgnoreCase(value.getOrElse(() => ''), 'Pre Login');

  bool get isPostLogin =>
      isEqualsIgnoreCase(value.getOrElse(() => ''), 'Post Login');

  bool get isPreAndPostLogin =>
      isEqualsIgnoreCase(value.getOrElse(() => ''), 'Pre and Post Login');

  bool get isLogged => isPostLogin || isPreAndPostLogin;

  bool get isPreLog => isPreLogin || isPreAndPostLogin;
}

class AnnouncementDislayModule extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AnnouncementDislayModule(String input) {
    return AnnouncementDislayModule._(validateStringNotEmpty(input));
  }

  const AnnouncementDislayModule._(this.value);

  bool get isOrder => isEqualsIgnoreCase(value.getOrElse(() => ''), 'Orders');

  bool get isPayment =>
      isEqualsIgnoreCase(value.getOrElse(() => ''), 'Payments');

  bool get isReturn => isEqualsIgnoreCase(value.getOrElse(() => ''), 'Returns');
}
