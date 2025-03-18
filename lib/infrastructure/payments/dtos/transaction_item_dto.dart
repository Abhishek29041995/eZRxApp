import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_item_dto.freezed.dart';
part 'transaction_item_dto.g.dart';

@freezed
class TransactionItemDto with _$TransactionItemDto {
  const TransactionItemDto._();

  const factory TransactionItemDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'reference', defaultValue: '') required String reference,
    @JsonKey(name: 'paymentStatus', defaultValue: '')
        required String paymentStatus,
    @JsonKey(name: 'amountDue', defaultValue: 0) required double amountDue,
    @JsonKey(name: 'createdOn', defaultValue: '') required String createdOn,
    @JsonKey(name: 'paidOn', defaultValue: '') required String paidOn,
  }) = _TransactionItemDto;

  PaymentSummaryDetails toDomain() {
    return PaymentSummaryDetails.empty().copyWith(
      paymentID: StringValue(id),
      zzAdvice: StringValue(reference.isNotEmpty ? reference : id),
      status: FilterStatus(paymentStatus),
      createdDate: DateTimeStringValue(createdOn),
      paymentAmount: amountDue,
      paymentDate: DateTimeStringValue(paidOn),
    );
  }

  factory TransactionItemDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemDtoFromJson(json);
}
