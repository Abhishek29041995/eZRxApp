import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_tender_contract_info.freezed.dart';

@freezed
class SubmitTenderContract with _$SubmitTenderContract {
  const SubmitTenderContract._();

  const factory SubmitTenderContract({
    required TenderContractNumber contractNumber,
    required String contractLineItemNumber,
    required double contractPrice,
    required int contractUnitOfMeasurement,
    required String currency,
    required String contractPONumber,
  }) = _SubmitTenderContract;

  factory SubmitTenderContract.empty() => SubmitTenderContract(
        contractNumber: TenderContractNumber(''),
        contractLineItemNumber: '',
        contractPrice: 0.0,
        contractUnitOfMeasurement: 0,
        currency: '',
        contractPONumber: '',
      );
}
