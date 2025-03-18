import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_item.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'claim_item_dto.freezed.dart';
part 'claim_item_dto.g.dart';

@freezed
class ClaimItemDto with _$ClaimItemDto {
  const ClaimItemDto._();
  const factory ClaimItemDto({
    @JsonKey(
      name: 'createdAt',
      defaultValue: '',
    )
    required String createdAt,
    @JsonKey(
      name: 'claimId',
      defaultValue: 0,
    )
    required int id,
    @JsonKey(
      name: 'claimAmount',
      defaultValue: '',
    )
    required String amount,
    @JsonKey(
      name: 'principalCode',
      defaultValue: 0,
    )
    required int principalCode,
    @JsonKey(
      name: 'principalName',
      defaultValue: '',
    )
    required String principalName,
    @JsonKey(
      name: 'claimType',
      defaultValue: '',
    )
    required String claimType,
  }) = _ClaimItemDto;

  ClaimItem toDomain() => ClaimItem(
        createdAt: DateTimeStringValue(createdAt),
        id: id,
        amount: double.tryParse(amount) ?? 0,
        principalCode: principalCode,
        principalName: principalName,
        claimType: claimType.length >= 2
            ? ClaimType(int.tryParse(claimType[1]) ?? -1)
            : ClaimType(-1),
      );

  factory ClaimItemDto.fromJson(Map<String, dynamic> json) =>
      _$ClaimItemDtoFromJson(json);
}
