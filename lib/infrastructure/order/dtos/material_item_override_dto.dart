import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_override.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_item_override_dto.freezed.dart';
part 'material_item_override_dto.g.dart';

@freezed
class MaterialItemOverrideDto with _$MaterialItemOverrideDto {
  const MaterialItemOverrideDto._();
  const factory MaterialItemOverrideDto({
    @JsonKey(name: 'reference', defaultValue: '') required String reference,
    @JsonKey(
      name: 'valueOverride',
      defaultValue: <ValueOverrideDto>[],
      includeIfNull: false,
      toJson: valueOverrideTojson,
    )
    required List<ValueOverrideDto> valueOverride,
    @JsonKey(
      name: 'percentageOverride',
      defaultValue: <PercentageOverrideDto>[],
      includeIfNull: false,
      toJson: percentageOverrideTojson,
    )
    required List<PercentageOverrideDto> percentageOverride,
  }) = _MaterialItemOverrideDto;

  MaterialItemOverride toDomain() => MaterialItemOverride(
        reference: reference,
        valueOverride: valueOverride.map((e) => e.toDomain()).toList(),
        percentageOverride:
            percentageOverride.map((e) => e.toDomain()).toList(),
      );

  factory MaterialItemOverrideDto.fromDomain(
    MaterialItemOverride materialItemOverride,
  ) {
    return MaterialItemOverrideDto(
      reference: '',
      valueOverride: materialItemOverride.valueOverride
          .map((e) => ValueOverrideDto.fromDomain(e))
          .toList(),
      percentageOverride: materialItemOverride.percentageOverride
          .map((e) => PercentageOverrideDto.fromDomain(e))
          .toList(),
    );
  }

  factory MaterialItemOverrideDto.fromPriceAggregate(
    PriceAggregate priceAggregate,
  ) {
    // for bundles we've to pass the override price,
    // else SAP will consider the material's actual
    // price instead of bundle unit price

    return MaterialItemOverrideDto(
      reference: '',
      valueOverride: [
        if (priceAggregate.isMaterialItemOverride)
          ValueOverrideDto.fromDomain(
            ValueOverride.empty().copyWith(
              price: priceAggregate.materialInfo.type.typeBundle
                  ? priceAggregate.bundle.currentBundleInfo.rate
                  : priceAggregate.price.finalPrice.getOrDefaultValue(0),
              currency: priceAggregate.salesOrgConfig.currency,
            ),
          ),
      ],
      percentageOverride: [
        if (priceAggregate.price.zdp8Override.isValid())
          PercentageOverrideDto.fromDomain(
            PercentageOverride(
              percentage: priceAggregate.price.zdp8Override.getValue(),
            ),
          ),
      ],
    );
  }

  factory MaterialItemOverrideDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialItemOverrideDtoFromJson(json);
}

@freezed
class ValueOverrideDto with _$ValueOverrideDto {
  const ValueOverrideDto._();
  const factory ValueOverrideDto({
    @JsonKey(name: 'code', defaultValue: '') required String code,
    @JsonKey(name: 'price', defaultValue: 0) required double price,
    @JsonKey(name: 'currency', defaultValue: '') required String currency,
  }) = _ValueOverrideDto;

  ValueOverride toDomain() => ValueOverride(
        code: code,
        price: price,
        currency: Currency(currency),
      );

  factory ValueOverrideDto.fromDomain(ValueOverride override) {
    return ValueOverrideDto(
      code: override.code,
      currency: override.currency.code,
      price: override.price,
    );
  }

  factory ValueOverrideDto.fromJson(Map<String, dynamic> json) =>
      _$ValueOverrideDtoFromJson(json);
}

@freezed
class PercentageOverrideDto with _$PercentageOverrideDto {
  const PercentageOverrideDto._();
  const factory PercentageOverrideDto({
    required String code,
    @JsonKey(name: 'percentage', defaultValue: 0) required double percentage,
  }) = _PercentageOverrideDto;

  PercentageOverride toDomain() => PercentageOverride(
        code: code,
        percentage: percentage,
      );

  factory PercentageOverrideDto.fromDomain(PercentageOverride override) {
    return PercentageOverrideDto(
      code: override.code,
      percentage: override.percentage,
    );
  }

  factory PercentageOverrideDto.fromJson(Map<String, dynamic> json) =>
      _$PercentageOverrideDtoFromJson(json);
}

dynamic valueOverrideTojson(List<ValueOverrideDto> valueOverride) {
  if (valueOverride.isEmpty) {
    return null;
  }

  return valueOverride.map((e) => e.toJson()).toList();
}

dynamic percentageOverrideTojson(
  List<PercentageOverrideDto> percentageOverride,
) {
  if (percentageOverride.isEmpty) {
    return null;
  }

  return percentageOverride.map((e) => e.toJson()).toList();
}
