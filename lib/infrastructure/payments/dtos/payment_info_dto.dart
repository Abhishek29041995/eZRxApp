import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_info_dto.freezed.dart';
part 'payment_info_dto.g.dart';

@freezed
class PaymentInfoDto with _$PaymentInfoDto {
  const PaymentInfoDto._();

  const factory PaymentInfoDto({
    @JsonKey(name: 'paymentID', defaultValue: '') required String paymentID,
    @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
    required String paymentBatchAdditionalInfo,
    @JsonKey(name: 'valueDate', defaultValue: '') required String valueDate,
    @JsonKey(name: 'transactionCurrency', defaultValue: '')
    required String transactionCurrency,
    @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
    required String accountingDocExternalReference,
    @JsonKey(name: 'zCcpPaymentQRCode', defaultValue: '')
    required String zCcpPaymentQRCode,
    @JsonKey(name: 'zzAdvice', defaultValue: '') required String zzAdvice,
    @JsonKey(name: 'zzHtmcs', defaultValue: '') required String zzHtmcs,
    @JsonKey(name: 'adviceExpiry', defaultValue: '')
    required String adviceExpiry,
  }) = _PaymentInfoDto;

  PaymentInfo toDomain({required String baseUrl}) {
    var zzHtmcsConverted = '';
    if (zzHtmcs.isNotEmpty) {
      var htmlFormat = zzHtmcs
          .replaceAll(RegExp(r'html:\s*'), '')
          .replaceAll(RegExp(r'_blank\s*'), '_self');
      final buttonHtml = htmlFormat.characters
          .getRange(
            htmlFormat.indexOf('<button'),
            htmlFormat.indexOf('</button>') + '</button>'.length,
          )
          .string;
      htmlFormat = htmlFormat.replaceAll(buttonHtml, '');
      const jsLib =
          '''<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>''';
      const autoClick =
          '''<script type="text/javascript">\$(document).ready(function(){\$("#btn_submit").click();});</script>''';

      zzHtmcsConverted = '$jsLib$buttonHtml$htmlFormat$autoClick';
    }

    if (Currency(transactionCurrency).isTH) {
      // We need to replace form action from post /api/thankyou-page to "https://uat-th.ezrxplus.com/api/thankyou-page"
      // by using baseURL call API to load the success page when form success and redirect to
      // https://uat-th.ezrxplus.com/my-account/thankyou?TxnStatus=53616c7465645f5f9e6445a22f88ac275415afdf861f1a360b3c9d40e1d1afa2&paymentId=53616c7465645f5fa366a6a3b8e9bc690c839d598e55995f7d98a6198d77462e&transactionReference=53616c7465645f5fbd8415d149a249d8fb7ac3b4443f650f7ae710c09892b2cc&isCancelled=false

      final regexSplitAction = RegExp(r'(action=")([^"]+)(")');

      zzHtmcsConverted = zzHtmcs.characters
          .getRange(
            zzHtmcs.indexOf('<html>'),
            zzHtmcs.indexOf('</html>') + '</html>'.length,
          )
          .string
          .replaceAllMapped(
            regexSplitAction,
            (match) =>
                '${match.group(1)}$baseUrl${match.group(2)}${match.group(3)}',
          );
    }

    if (Currency(transactionCurrency).isSG) {
      zzHtmcsConverted = zCcpPaymentQRCode;
    }

    return PaymentInfo(
      zzHtmcs: zzHtmcsConverted,
      paymentBatchAdditionalInfo: paymentBatchAdditionalInfo,
      paymentID: paymentID,
      accountingDocExternalReference: accountingDocExternalReference,
      zzAdvice: zzAdvice,
      createdDate: DateTimeStringValue(valueDate),
      adviceExpiry: AdviceExpiryValue(adviceExpiry),
    );
  }

  factory PaymentInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentInfoDtoFromJson(json);
}
