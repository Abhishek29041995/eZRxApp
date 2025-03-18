import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'payment_summary_details_dto.freezed.dart';
part 'payment_summary_details_dto.g.dart';

@freezed
class PaymentSummaryDetailsDto with _$PaymentSummaryDetailsDto {
  const PaymentSummaryDetailsDto._();

  const factory PaymentSummaryDetailsDto({
    @JsonKey(name: 'paymentID', defaultValue: '') required String paymentID,
    @JsonKey(
      name: 'valueDate',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate,
    )
    required String valueDate,
    @JsonKey(name: 'paymentAmount', defaultValue: 0.0)
    required double paymentAmount,
    @JsonKey(name: 'transactionCurrency', defaultValue: '')
    required String transactionCurrency,
    @JsonKey(name: 'paymentDocument', defaultValue: '')
    required String paymentDocument,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'paymentMethod', defaultValue: '')
    required String paymentMethod,
    @JsonKey(name: 'iban', defaultValue: '') required String iban,
    @JsonKey(name: 'bankKey', defaultValue: '') required String bankKey,
    @JsonKey(name: 'bankCountryKey', defaultValue: '')
    required String bankCountryKey,
    @JsonKey(name: 'bankAccountNumber', defaultValue: '')
    required String bankAccountNumber,
    @JsonKey(name: 'bankName', defaultValue: '') required String bankName,
    @JsonKey(name: 'paymentCardID', defaultValue: '')
    required String paymentCardID,
    @JsonKey(name: 'paymentCardNumber', defaultValue: '')
    required String paymentCardNumber,
    @JsonKey(name: 'paymentCardHolderName', defaultValue: '')
    required String paymentCardHolderName,
    @JsonKey(name: 'paymentCardMaskedNumber', defaultValue: '')
    required String paymentCardMaskedNumber,
    @JsonKey(name: 'paymentCardTypeName', defaultValue: '')
    required String paymentCardTypeName,
    @JsonKey(name: 'customId', defaultValue: '') required String customId,
    @JsonKey(name: 'bankIdentification', defaultValue: '')
    required String bankIdentification,
    @JsonKey(
      name: 'createdDate',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate,
    )
    required String createdDate,
    @JsonKey(name: 'zzAdvice', defaultValue: '') required String zzAdvice,
    @JsonKey(name: 'adviceExpiry', defaultValue: '')
    required String adviceExpiry,
    @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
    required String accountingDocExternalReference,
    @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
    required String paymentBatchAdditionalInfo,
    @Default(<String, dynamic>{}) Map<String, dynamic> filterBy,
  }) = _PaymentSummaryDetailsDto;

  PaymentSummaryDetails toDomain() {
    final paymentMethodValue = PaymentMethodValue(paymentMethod);
    var filterStatus = FilterStatus(status);
    final currency = Currency(transactionCurrency);

    if (filterStatus.getIsPending) {
      filterStatus = (paymentMethodValue.isBankIn || currency.isSG)
          ? filterStatus
          : FilterStatus('In Progress');
    }

    return PaymentSummaryDetails(
      bankAccountNumber: StringValue(bankAccountNumber),
      bankCountryKey: bankCountryKey,
      bankIdentification: bankIdentification,
      bankKey: bankKey,
      bankName: StringValue(bankName),
      customId: customId,
      iban: iban,
      status: filterStatus,
      paymentAmount: paymentAmount,
      paymentCardHolderName: paymentCardHolderName,
      paymentCardID: paymentCardID,
      paymentCardMaskedNumber: paymentCardMaskedNumber,
      paymentCardNumber: paymentCardNumber,
      paymentCardTypeName: paymentCardTypeName,
      paymentDocument: paymentDocument,
      paymentID: StringValue(paymentID),
      paymentMethod: paymentMethodValue,
      transactionCurrency: currency,
      paymentDate: DateTimeStringValue(valueDate),
      createdDate: DateTimeStringValue(createdDate),
      adviceExpiry: AdviceExpiryValue(adviceExpiry),
      zzAdvice: StringValue(zzAdvice),
      accountingDocExternalReference: accountingDocExternalReference,
      paymentBatchAdditionalInfo: StringValue(paymentBatchAdditionalInfo),
      paymentItems: <PaymentItem>[],
    );
  }

  factory PaymentSummaryDetailsDto.fromDomain(
    PaymentSummaryDetails details,
  ) {
    return PaymentSummaryDetailsDto(
      paymentID: details.paymentID.getOrDefaultValue(''),
      valueDate: details.paymentDate.getOrDefaultValue(''),
      paymentAmount: details.paymentAmount,
      transactionCurrency: details.transactionCurrency.getOrDefaultValue(''),
      paymentDocument: details.paymentDocument,
      status: details.status.getOrDefaultValue(''),
      paymentMethod: details.paymentMethod.getOrDefaultValue(''),
      iban: details.iban,
      bankKey: details.bankKey,
      bankCountryKey: details.bankCountryKey,
      bankAccountNumber: details.bankAccountNumber.getOrDefaultValue(''),
      bankName: details.bankName.getOrDefaultValue(''),
      paymentCardID: details.paymentCardID,
      paymentCardNumber: details.paymentCardNumber,
      paymentCardHolderName: details.paymentCardHolderName,
      paymentCardMaskedNumber: details.paymentCardMaskedNumber,
      paymentCardTypeName: details.paymentCardTypeName,
      customId: details.customId,
      bankIdentification: details.bankIdentification,
      createdDate: details.createdDate.getOrDefaultValue(''),
      zzAdvice: details.zzAdvice.getOrDefaultValue(''),
      adviceExpiry: details.adviceExpiry.getOrDefaultValue(''),
      accountingDocExternalReference: details.accountingDocExternalReference,
      paymentBatchAdditionalInfo:
          details.paymentBatchAdditionalInfo.getOrDefaultValue(''),
      filterBy: _filterByToJson(
        details.paymentID.getOrDefaultValue(''),
        details.zzAdvice.getOrDefaultValue(''),
        details.paymentBatchAdditionalInfo.getOrDefaultValue(''),
      ),
    );
  }

  factory PaymentSummaryDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentSummaryDetailsDtoFromJson(json);
}

Map<String, dynamic> _filterByToJson(
  String paymentID,
  String zzAdvice,
  String paymentBatchAdditionalInfo,
) {
  if (paymentBatchAdditionalInfo.isNotEmpty) {
    return {
      'field': 'paymentBatchAdditionalInfo',
      'value': paymentBatchAdditionalInfo,
    };
  }
  if (zzAdvice.isNotEmpty) {
    return {
      'field': 'zzAdvice',
      'value': zzAdvice,
    };
  }

  return {
    'field': 'paymentID',
    'value': paymentID,
  };
}
