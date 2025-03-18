import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_override_exception.freezed.dart';

@freezed
class PriceException with _$PriceException {
  const factory PriceException.priceNotFound() = _PriceNotFound;
}
