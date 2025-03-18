import 'package:ezrxmobile/infrastructure/order/dtos/payment_status_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final uri = Uri.parse(
    'https://uat-my.ezrxplus.com/my-account/thankyou?TxnStatus=53616c7465645f5f8e5e0ca2b58a806b94a4ebbf208dfa4b0d88785a87b5d51c&paymentId=53616c7465645f5fe091adf59597a72a5abfd6acc86a3ab61711eb2bbde29eb142069eb826b994521f0f6f6aef1b0b39&transactionReference=53616c7465645f5f1848629ba40e99bbaa51def8fee526d27b1aa47b0db74a940b88ea79ee309de40f5853a2fe8a4eba&isCancelled=false&serviceID=53616c7465645f5f4359c1513d51facdf3714b241e1968387b451b21e5096e25',
  );

  group('Test Payment Status Dto ', () {
    test('Test fromUri', () {
      final paymentStatusDto = PaymentStatusDto.fromUri(uri);
      expect(paymentStatusDto.txnStatus, '0');
      expect(paymentStatusDto.paymentID, '09EZ240002433001');
      expect(paymentStatusDto.transactionRef, 'ZPA000009EZ240002433001');
    });
  });
}
