import 'dart:convert';

import 'package:ezrxmobile/infrastructure/payments/dtos/create_virtual_account_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/principal_cutoffs_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';

void main() {
  late NewPaymentLocalDataSource localDataSource;
  late String htmlUrlMY;
  late String htmlUrlPH;
  late String htmlUrlVN;
  late String htmlUrlTH;
  late String paymentQRCodeSG;

  const fakeTHBaseUrl = 'https://uat-th.ezrxplus.com';

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = NewPaymentLocalDataSource();
    },
  );
  setUp(() {
    htmlUrlMY =
        '''<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script><button type="button" onlick="butonClick" id="btn_submit">Open Payment Gateway</button><script language="javascript">\$("#btn_submit").click(function(){var win = window.open("" ,"_self");win.document.body.innerHTML = '<form id="pay_form" name="pay_form" action="https://pay.e-ghl.com/IPGSG/Payment.aspx" method="post"><input name="TransactionType" type="hidden" id="TransactionType" value="SALE" /><input name="PymtMethod" type="hidden" id="PymtMethod" value="ANY" /><input name="ServiceID" type="hidden" id="ServiceID" value="ZUE" /><input name="PaymentID" type="hidden" id="PaymentID" value="09EZ230001191801" /><input name="OrderNumber" type="hidden" id="OrderNumber" value="09EZ230001191801" /><input name="PaymentDesc" type="hidden" id="PaymentDesc" value="-" /><input name="MerchantName" type="hidden" id="MerchantName" value="Zuellig Pharma" /><input name="MerchantReturnURL" type="hidden" id="MerchantReturnURL" value="https://uat-my.ezrxplus.com/api/thankyou-payment" /><input name="MerchantCallBackURL" type="hidden" id="MerchantCallBackURL" value="https://omnicollect-dev.business.hsbc.com/api/callback/my/eGHL/payment" /><input name="Amount" type="hidden" id="Amount" value="12425.98" /><input name="CurrencyCode" type="hidden" id="CurrencyCode" value="MYR" /><input name="CustIP" type="hidden" id="CustIP" value="" /><input name="CustName" type="hidden" id="CustName" value="Customer Name" /><input name="CustEmail" type="hidden" id="CustEmail" value="customer.name@example.com" /><input name="CustPhone" type="hidden" id="CustPhone" value="1234567890" /><input name="LanguageCode" type="hidden" id="LanguageCode" value="EN" /><input name="PageTimeout" type="hidden" id="PageTimeout" value="780" /><input name="HashValue" type="hidden" id="HashValue" value="d0f8a5d65db2f14c72f42bc7361ba06e225c9026dcbedacd6bbd2fc68482f962" /></form>';win.document.pay_form.submit();})</script><script type="text/javascript">\$(document).ready(function(){\$("#btn_submit").click();});</script>''';
    htmlUrlPH =
        '''<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script><button type="button" onlick="butonClick" id="btn_submit">Open Payment Gateway</button><script language="javascript">\$(document).ready(function(){\$("#btn_submit").click(function (){var win=window.open("https://ubotpsentry-tst1.outsystemsenterprise.com/UPAY/WhiteLabel/73352865-5C06-AB2A-16A0-7E63A173AD0B?s=BO6qn38IzSkPzODnR%2FrCTg%3D%3DPz7CbHG%2Buec9hTb4u%2FwxLR7ku5kbpINSnE6zxubEqnUMBX%2Bzt9VvqSgyGV%2Btd8I%2BvTxSZDERDbSzzaOyr9MMsQc2rjGEsPf%2B2A7vPQrdAtEx729fM8kSlrjH8fc8l3cv1wwUwzlb3jUncpo6kocvJvhtCaYQj2FRV40DcCJeH10S47SIGAPeGKb1Sfz6413hdb1h3h%2BudYzEJpmbuVsqWPrIGe3GyPLsoUbg0dXpNqJ30hFF%2F1JidSyho1ghz2MmVAHg31HiiEG%2FjiCZIrPvxWQvP2LWw4DA2BhDCanPs%2F0BtNQ5W8hGpG3D60YhzTYk2oS8W026OOCurKw%2BG9qdyIJdpBMIxLrGH7uPgR2NcfhOPsYVg1YbYcHPzDiJobbhU2SaHFac52eLZUdacfUdc%2BdeYPlZzYYQCmD%2FyWzX9d4%3D" ,"_self" );})})</script><script type="text/javascript">\$(document).ready(function(){\$("#btn_submit").click();});</script>''';
    htmlUrlVN =
        '''<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script><button type="button" onlick="butonClick" id="btn_submit">Open Payment Gateway</button><script language="javascript">\$(document).ready(function(){\$("#btn_submit").click(function (){var win=window.open("https://newsandbox.payoo.com.vn/v2/paynow/prepare?_token=1hgRF9i75CC" ,"_self" );})})</script><script type="text/javascript">\$(document).ready(function(){\$("#btn_submit").click();});</script>''';
    htmlUrlTH =
        '''<html><head></head><body><form method="POST" action="$fakeTHBaseUrl/api/thankyou-payment"><script type="text/javascript" src="https://dev-kpaymentgateway.kasikornbank.com/ui/v2/kpayment.min.js" data-apikey="pkey_test_21102hvZyafqGFFzN0G3NjphkJZ2NPFbRBMRq" data-amount="32199.51" data-currency="THB" data-payment-methods="qr" data-order-id="order_test_211025257366f3c084154b2941ae1fa149c53"></script></form></body></html>''';
    paymentQRCodeSG =
        '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';
  });

  group(
    'New Payment Local Datasource Test',
    () {
      test(
        'getCustomerOpenItems',
        () async {
          final result = await localDataSource.getCustomerOpenItems();
          expect(
            result.length,
            5,
          );
        },
      );

      test(
        'pay on MY market',
        () async {
          final result = await localDataSource.pay(
            salesOrg: fakeMMSalesOrg,
            baseUrl: fakeTHBaseUrl,
          );
          expect(
            result.zzHtmcs,
            htmlUrlMY,
          );
        },
      );

      test(
        'pay on PH market',
        () async {
          final result = await localDataSource.pay(
            salesOrg: fakePHSalesOrg,
            baseUrl: fakeTHBaseUrl,
          );
          expect(
            result.zzHtmcs,
            htmlUrlPH,
          );
        },
      );

      test(
        'pay on VN market',
        () async {
          final result = await localDataSource.pay(
            salesOrg: fakeVNSalesOrg,
            baseUrl: fakeTHBaseUrl,
          );
          expect(
            result.zzHtmcs,
            htmlUrlVN,
          );
        },
      );

      test(
        'pay on TH market',
        () async {
          final result = await localDataSource.pay(
            salesOrg: fakeTHSalesOrg,
            baseUrl: fakeTHBaseUrl,
          );
          expect(
            result.zzHtmcs,
            htmlUrlTH,
          );
        },
      );

      test(
        'pay on SG market',
        () async {
          final result = await localDataSource.pay(
            salesOrg: fakeSGSalesOrg,
            baseUrl: fakeTHBaseUrl,
          );
          expect(
            result.zzHtmcs,
            paymentQRCodeSG,
          );
        },
      );

      test(
        'payment invoice pdf',
        () async {
          final result = await localDataSource.getPaymentInvoiceInfoPdf();
          expect(
            result.zzAdvice,
            '09EZ230001312201',
          );
        },
      );

      test(
        'update payment gateway',
        () async {
          final result = await localDataSource.updatePaymentGateway();
          expect(
            () => result,
            isA<void>(),
          );
        },
      );

      test(
        'fetch payment method',
        () async {
          final result = await localDataSource.fetchPaymentMethods();
          expect(
            result.length,
            1,
          );
        },
      );

      test('create Virtual Account ', () async {
        final data = json.decode(
          await rootBundle.loadString(
            'assets/json/create_virtual_account/createVirtualAccountResponse.json',
          ),
        )['data']['createVirtualAccount'];

        final expectResult = CreateVirtualAccountDto.fromJson(data).toDomain();

        final result = await localDataSource.createVirtualAccount();

        expect(
          result,
          expectResult,
        );
      });

      test('get principal cutoffs', () async {
        final data = json.decode(
          await rootBundle.loadString(
            'assets/json/get_principal_cutoffs/getPrincipalCutoffsResponse.json',
          ),
        )['data']['getPrincipalCutoffs'];

        final expectResult = PrincipalCutoffsDto.fromJson(data).toDomain();

        final result = await localDataSource.getPrincipalCutoffs();

        expect(
          result,
          expectResult,
        );
      });
    },
  );
}
