import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bundle_info_dto.freezed.dart';
part 'bundle_info_dto.g.dart';

@freezed
class BundleInfoDto with _$BundleInfoDto {
  const BundleInfoDto._();

  const factory BundleInfoDto({
    @JsonKey(name: 'sequence') required int sequence,
    @JsonKey(name: 'quantity') required int quantity,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'rate') required double rate,
  }) = _BundleInfoDto;

  BundleInfo toDomain() {
    return BundleInfo(
      sequence: sequence,
      quantity: quantity,
      type: DiscountType(type),
      rate: rate,
    );
  }

  factory BundleInfoDto.fromDomain(BundleInfo bundleInfo) {
    return BundleInfoDto(
      sequence: bundleInfo.sequence,
      quantity: bundleInfo.quantity,
      type: bundleInfo.type.getOrCrash(),
      rate: bundleInfo.rate,
    );
  }

  factory BundleInfoDto.fromJson(Map<String, dynamic> json) =>
      _$BundleInfoDtoFromJson(json);
}
