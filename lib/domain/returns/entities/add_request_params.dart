import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_request_params.freezed.dart';

@freezed
class AddRequestParams with _$AddRequestParams {
  const AddRequestParams._();

  const factory AddRequestParams({
    required String returnReference,
    required String specialInstruction,
    required User user,
    required String soldTo,
    required List<InvoiceDetails> invoiceDetails,
  }) = _AddRequestParams;

  factory AddRequestParams.empty() => AddRequestParams(
        returnReference: '',
        specialInstruction: '',
        soldTo: '',
        user: User.empty(),
        invoiceDetails: <InvoiceDetails>[],
      );
}
