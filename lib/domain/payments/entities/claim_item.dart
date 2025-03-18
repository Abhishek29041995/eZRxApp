import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'claim_item.freezed.dart';

@freezed
class ClaimItem with _$ClaimItem {
  const ClaimItem._();

  const factory ClaimItem({
    required DateTimeStringValue createdAt,
    required int id,
    required double amount,
    required int principalCode,
    required String principalName,
    required ClaimType claimType,
  }) = _ClaimItem;

  factory ClaimItem.empty() => ClaimItem(
        createdAt: DateTimeStringValue(''),
        id: 0,
        amount: 0.0,
        principalCode: 0,
        principalName: '',
        claimType: ClaimType(-1),
      );

  String get principalDisplay => '$principalCode|$principalName';
}
