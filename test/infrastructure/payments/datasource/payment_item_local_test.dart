import 'dart:convert';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_item_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_details_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/transaction_detail_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PaymentItemLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = PaymentItemLocalDataSource();
    },
  );

  group(
    'Payment item local data source test -',
    () {
      test('get Payment Items ', () async {
        final data = json.decode(
          await rootBundle.loadString(
            'assets/json/payment_item/paymentItemResponse.json',
          ),
        )['data']['paymentItems'];

        final expectResult = List.from(data)
            .map((e) => PaymentItemDto.fromJson(e).toDomain())
            .toList();

        final result = await localDataSource.getPaymentItems();

        expect(
          result,
          expectResult,
        );
      });

      test('get Payment Summary Details ', () async {
        final data = json.decode(
          await rootBundle.loadString(
            'assets/json/payment_summary_list/paymentSummaryListResponse.json',
          ),
        )['data']['customerPayment']['customerPaymentResponse'][0];

        final expectResult = PaymentSummaryDetailsDto.fromJson(data).toDomain();

        final result = await localDataSource.getPaymentSummaryDetails();

        expect(
          result,
          expectResult,
        );
      });

      test('get Payment Summary Details By PaymentId success', () async {
        final data = json.decode(
          await rootBundle.loadString(
            'assets/json/payment_summary_list/paymentSummaryListResponse.json',
          ),
        )['data']['customerPayment']['customerPaymentResponse'];

        const fakePaymentId = '2        3';

        final expectResult = PaymentSummaryDetailsDto.fromJson(
          data.firstWhere(
            (element) => element['paymentID'] == fakePaymentId,
          ),
        ).toDomain();

        final result = await localDataSource
            .getPaymentSummaryDetailsByPaymentId(fakePaymentId);

        expect(
          result,
          expectResult,
        );
      });

      test('get Payment Summary Details By PaymentId return empty ', () async {
        const fakePaymentId = 'fake-payment-id';

        final result = await localDataSource
            .getPaymentSummaryDetailsByPaymentId(fakePaymentId);

        expect(
          result,
          PaymentSummaryDetails.empty(),
        );
      });

      test('delete customer payment ', () async {
        final result = await localDataSource.deleteCustomerPayment();

        expect(
          result,
          true,
        );
      });

      test('get transaction ', () async {
        final data = json.decode(
          await rootBundle.loadString(
            'assets/json/get_transaction/getTransactionResponse.json',
          ),
        )['data']['getTransaction'];

        final expectResult = TransactionDetailDto.fromJson(data).toDomain();

        final result = await localDataSource.getTransaction();

        expect(
          result,
          expectResult,
        );
      });

      test('cancel payment advice ', () async {
        final result = await localDataSource.cancelPaymentAdvice();

        expect(
          result,
          'TR202310190725',
        );
      });
    },
  );
}
