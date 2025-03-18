import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/batches.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'batches_dto.freezed.dart';
part 'batches_dto.g.dart';

@freezed
class BatchesDto with _$BatchesDto {
  const BatchesDto._();
  const factory BatchesDto({
    @JsonKey(name: 'batchNumber', defaultValue: '') required String batchNumber,
    @JsonKey(name: 'expiryDate', defaultValue: '') required String expiryDate,
  }) = _BatchesDto;

  factory BatchesDto.fromDomain(
    Batches batches,
  ) {
    return BatchesDto(
      batchNumber: batches.batchNumber.getOrCrash(),
      expiryDate: batches.expiryDate.getOrCrash(),
    );
  }

  Batches toDomain() {
    return Batches(
      batchNumber: StringValue(batchNumber),
      expiryDate: DateTimeStringValue(expiryDate),
    );
  }

  factory BatchesDto.fromJson(Map<String, dynamic> json) =>
      _$BatchesDtoFromJson(json);
}
