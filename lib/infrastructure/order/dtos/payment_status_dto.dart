import 'package:ezrxmobile/domain/payments/entities/payment_status.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/crypto/decryption.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_status_dto.freezed.dart';
part 'payment_status_dto.g.dart';

@freezed
class PaymentStatusDto with _$PaymentStatusDto {
  const PaymentStatusDto._();

  const factory PaymentStatusDto({
    @JsonKey(name: 'paymentID', defaultValue: '') required String paymentID,
    @JsonKey(name: 'txnStatus', defaultValue: '') required String txnStatus,
    @JsonKey(name: 'transactionRef', defaultValue: '')
    required String transactionRef,
  }) = _PaymentStatusDto;

  factory PaymentStatusDto.fromUri(Uri uri) {
    final decryption = Decryption();

    return PaymentStatusDto(
      paymentID: decryption.decrypt(uri.queryParameters['paymentId'] ?? ''),
      txnStatus: decryption.decrypt(uri.queryParameters['TxnStatus'] ?? ''),
      transactionRef:
          decryption.decrypt(uri.queryParameters['transactionReference'] ?? ''),
    );
  }

  PaymentStatus get toDomain => PaymentStatus(
        paymentId: paymentID,
        transactionReference: transactionRef,
        transactionStatus: TransactionStatus(txnStatus),
      );

  factory PaymentStatusDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentStatusDtoFromJson(json);
}
