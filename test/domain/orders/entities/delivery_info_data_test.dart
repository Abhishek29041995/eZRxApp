import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DeliveryInfoData entity -', () {
    test('DeliveryInfoData empty', () {
      final emptyDeliveryInfoData = DeliveryInfoData.empty();

      expect(emptyDeliveryInfoData.poReference, StringValue(''));
      expect(
        emptyDeliveryInfoData.deliveryInstruction,
        StringValue(''),
      );
      expect(emptyDeliveryInfoData.referenceNote, StringValue(''));
      expect(emptyDeliveryInfoData.contactPerson, StringValue(''));
      expect(emptyDeliveryInfoData.mobileNumber, PhoneNumber(''));
      expect(emptyDeliveryInfoData.paymentTerm, PaymentTerm(''));
      expect(emptyDeliveryInfoData.deliveryDate, DateTimeStringValue(''));
      expect(emptyDeliveryInfoData.poDocuments, <PoDocuments>[]);
      expect(emptyDeliveryInfoData.greenDeliveryEnabled, false);
    });
  });
}
