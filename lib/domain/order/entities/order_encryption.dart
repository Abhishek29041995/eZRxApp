import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_encryption.freezed.dart';

@freezed
class OrderEncryption with _$OrderEncryption {
  const OrderEncryption._();
  factory OrderEncryption({
    required String data,
    required String hash,
  }) = _OrderEncryption;

  factory OrderEncryption.empty() => OrderEncryption(
        data: '',
        hash: '',
      );
}
