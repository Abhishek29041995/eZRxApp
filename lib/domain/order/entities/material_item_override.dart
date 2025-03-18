import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_item_override.freezed.dart';

@freezed
class MaterialItemOverride with _$MaterialItemOverride {
  const MaterialItemOverride._();

  const factory MaterialItemOverride({
    required String reference,
    required List<ValueOverride> valueOverride,
    required List<PercentageOverride> percentageOverride,
  }) = _MaterialItemOverride;

  factory MaterialItemOverride.empty() => const MaterialItemOverride(
        reference: '',
        valueOverride: [],
        percentageOverride: [],
      );
}

@freezed
class ValueOverride with _$ValueOverride {
  const factory ValueOverride({
    @Default('ZPO1') String code,
    required double price,
    required Currency currency,
  }) = _ValueOverride;

  factory ValueOverride.empty() => ValueOverride(
        price: 0,
        currency: Currency(''),
      );
}

@freezed
class PercentageOverride with _$PercentageOverride {
  const factory PercentageOverride({
    @Default('ZDP8') String code,
    required double percentage,
  }) = _PercentageOverride;
}
