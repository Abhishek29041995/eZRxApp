import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_document_details_group.freezed.dart';

@freezed
class CustomerDocumentDetailGroup with _$CustomerDocumentDetailGroup {
  factory CustomerDocumentDetailGroup({
    required PrincipalName principalName,
    required List<CustomerDocumentDetail> items,
  }) = _CustomerDocumentDetailGroup;

  factory CustomerDocumentDetailGroup.empty() => CustomerDocumentDetailGroup(
        principalName: PrincipalName(''),
        items: <CustomerDocumentDetail>[],
      );
}
