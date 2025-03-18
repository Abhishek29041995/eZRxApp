import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_info_data.freezed.dart';

@freezed
class DeliveryInfoData with _$DeliveryInfoData {
  const DeliveryInfoData._();
  const factory DeliveryInfoData({
    required StringValue poReference,
    required StringValue deliveryInstruction,
    required StringValue referenceNote,
    required StringValue contactPerson,
    required PhoneNumber mobileNumber,
    required PaymentTerm paymentTerm,
    required DateTimeStringValue deliveryDate,
    required List<PoDocuments> poDocuments,
    required bool greenDeliveryEnabled,
    required bool poisonRefDocumentsIncluded,
  }) = _DeliveryInfoData;

  factory DeliveryInfoData.fromOrderHistory({
    required OrderHistoryDetails orderHistoryDetails,
  }) {
    return DeliveryInfoData.empty().copyWith(
      poReference: StringValue.trimmed(
        orderHistoryDetails.poReference.getOrDefaultValue(''),
      ),
      contactPerson: StringValue.trimmed(
        orderHistoryDetails.orderBy.getOrDefaultValue(''),
      ),
      mobileNumber: orderHistoryDetails.telephoneNumber,
      deliveryInstruction: StringValue.trimmed(
        orderHistoryDetails.orderHistoryDetailsSpecialInstructions
            .getOrDefaultValue(''),
      ),
      referenceNote: StringValue.trimmed(
        orderHistoryDetails.referenceNotes.getOrDefaultValue(''),
      ),
      // collectiveNumber: CollectiveNumber(''),
      paymentTerm: PaymentTerm(
        '${orderHistoryDetails.orderHistoryDetailsPaymentTerm.paymentTermCode.getOrDefaultValue('')}-${orderHistoryDetails.orderHistoryDetailsPaymentTerm.paymentTermDescription.getOrDefaultValue('')}',
      ),
      poDocuments: orderHistoryDetails.orderHistoryDetailsPoDocuments,
    );
  }

  factory DeliveryInfoData.empty() => DeliveryInfoData(
        poReference: StringValue.trimmed(''),
        deliveryInstruction: StringValue.trimmed(''),
        referenceNote: StringValue.trimmed(''),
        // collectiveNumber: CollectiveNumber(''),
        contactPerson: StringValue.trimmed(''),
        mobileNumber: PhoneNumber(''),
        paymentTerm: PaymentTerm(''),
        deliveryDate: DateTimeStringValue(''),
        poDocuments: <PoDocuments>[],
        greenDeliveryEnabled: false,
        poisonRefDocumentsIncluded: false,
      );

  DeliveryInfoData get formatted => copyWith(
        poReference: StringValue.trimmed(poReference.formattedValue),
        deliveryInstruction:
            StringValue.trimmed(deliveryInstruction.formattedValue),
        referenceNote: StringValue.trimmed(referenceNote.formattedValue),
        contactPerson: StringValue.trimmed(contactPerson.formattedValue),
      );
}
