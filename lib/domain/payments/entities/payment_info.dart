import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_info.freezed.dart';

@freezed
class PaymentInfo with _$PaymentInfo {
  const PaymentInfo._();

  const factory PaymentInfo({
    required String paymentID,
    required String paymentBatchAdditionalInfo,
    required String zzHtmcs,
    required String accountingDocExternalReference,
    required String zzAdvice,
    required DateTimeStringValue createdDate,
    required AdviceExpiryValue adviceExpiry,
  }) = _PaymentInfo;

  factory PaymentInfo.empty() => PaymentInfo(
        paymentID: '',
        paymentBatchAdditionalInfo: '',
        zzHtmcs: '',
        accountingDocExternalReference: '',
        zzAdvice: '',
        createdDate: DateTimeStringValue(''),
        adviceExpiry: AdviceExpiryValue(''),
      );
}
