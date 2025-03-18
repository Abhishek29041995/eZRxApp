import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'usage_dto.freezed.dart';
part 'usage_dto.g.dart';

@freezed
class UsageDto with _$UsageDto {
  const UsageDto._();

  const factory UsageDto({
    @JsonKey(name: 'usageCode') required String usageCode,
    @JsonKey(name: 'usageDescription') required String usageDescription,
  }) = _UsageDto;

  factory UsageDto.fromDomain(Usage usage) {
    return UsageDto(
      usageCode: usage.usageCode,
      usageDescription: usage.usageDescription,
    );
  }

  Usage toDomain() {
    return Usage(
      usageCode: usageCode,
      usageDescription: usageDescription,
    );
  }

  factory UsageDto.fromJson(Map<String, dynamic> json) =>
      _$UsageDtoFromJson(json);
}
