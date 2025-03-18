import 'package:ezrxmobile/domain/order/entities/price_bundle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_bundle_dto.freezed.dart';
part 'price_bundle_dto.g.dart';

@freezed
class PriceBundleDto with _$PriceBundleDto {
  const PriceBundleDto._();

  const factory PriceBundleDto({
    @JsonKey(name: 'bundleName', defaultValue: '') required String name,
    @JsonKey(name: 'bundleCode', defaultValue: '') required String code,
    @JsonKey(name: 'conditions', defaultValue: '') required String conditions,
    @JsonKey(name: 'bonusEligible', defaultValue: false)
        required bool bonusEligible,
    @JsonKey(name: 'bundleInformation', defaultValue: <PriceBundleItemDto>[])
        required List<PriceBundleItemDto> information,
  }) = _PriceBundleDto;

  factory PriceBundleDto.fromDomain(PriceBundle priceBundle) {
    return PriceBundleDto(
      name: priceBundle.name,
      code: priceBundle.code,
      conditions: priceBundle.conditions,
      bonusEligible: priceBundle.bonusEligible,
      information: priceBundle.information
          .map((e) => PriceBundleItemDto.fromDomain(e))
          .toList(),
    );
  }

  PriceBundle toDomain() => PriceBundle(
        name: name,
        code: code,
        conditions: conditions,
        bonusEligible: bonusEligible,
        information: information.map((e) => e.toDomain()).toList(),
      );

  factory PriceBundleDto.fromJson(Map<String, dynamic> json) =>
      _$PriceBundleDtoFromJson(json);
}

@freezed
class PriceBundleItemDto with _$PriceBundleItemDto {
  const PriceBundleItemDto._();

  const factory PriceBundleItemDto({
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'sequence', defaultValue: 0) required int sequence,
    @JsonKey(name: 'quantity', defaultValue: 0) required int quantity,
    @JsonKey(name: 'rate', defaultValue: 0) required double rate,
  }) = _PriceBundleItemDto;

  factory PriceBundleItemDto.fromDomain(PriceBundleItem priceBundleItem) {
    return PriceBundleItemDto(
      type: priceBundleItem.type,
      sequence: priceBundleItem.sequence,
      quantity: priceBundleItem.quantity,
      rate: priceBundleItem.rate,
    );
  }

  PriceBundleItem toDomain() => PriceBundleItem(
        type: type,
        sequence: sequence,
        quantity: quantity,
        rate: rate,
      );

  factory PriceBundleItemDto.fromJson(Map<String, dynamic> json) =>
      _$PriceBundleItemDtoFromJson(json);
}
