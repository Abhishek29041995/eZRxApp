import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/account/value/value_objects.dart';

part 'invoice_details.freezed.dart';

@freezed
class InvoiceDetails with _$InvoiceDetails {
  const InvoiceDetails._();

  const factory InvoiceDetails({
    required String invoiceNumber,
    required SalesOrg salesOrg,
    required List<ReturnItemDetails> returnItemDetailsList,
  }) = _InvoiceDetails;

  factory InvoiceDetails.empty() => InvoiceDetails(
        invoiceNumber: '',
        salesOrg: SalesOrg(''),
        returnItemDetailsList: <ReturnItemDetails>[],
      );

  List<ReturnItemDetails> get validReturnItemDetailsList =>
      returnItemDetailsList
          .where((element) => element.balanceQty.isGreaterThanZero)
          .toList();
}
