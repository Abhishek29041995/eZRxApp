import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/banner/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';

class EZReachBannerLink extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EZReachBannerLink(String input) {
    return EZReachBannerLink._(validateStringNotEmpty(input));
  }

  Uri get uri => getUri(value.getOrElse(() => ''));

  bool get _isValidUrl => validUrl(value.getOrElse(() => ''));
  bool get _isInternalUri => internalUri(value.getOrElse(() => ''));

  bool get isInternalLink => _isValidUrl && _isInternalUri;
  bool get isExternalLink => _isValidUrl && !_isInternalUri;

  String get type => linkType(isInternalLink);

  const EZReachBannerLink._(this.value);
}
