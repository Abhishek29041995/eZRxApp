import 'package:ezrxmobile/domain/order/entities/submit_tender_contract_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_tender_contract_dto.freezed.dart';
part 'submit_tender_contract_dto.g.dart';

@freezed
class SubmitTenderContractDto with _$SubmitTenderContractDto {
  const SubmitTenderContractDto._();

  const factory SubmitTenderContractDto({
    @JsonKey(name: 'contractNumber', defaultValue: '')
    required String contractNumber,
    @JsonKey(name: 'contractLineItemNumber', defaultValue: '')
    required String contractLineItemNumber,
    @JsonKey(name: 'contractPrice', defaultValue: 0.0)
    required double contractPrice,
    @JsonKey(name: 'contractUnitOfMeasurement', defaultValue: 0)
    required int contractUnitOfMeasurement,
    @JsonKey(name: 'currency', defaultValue: '') required String currency,
    @JsonKey(name: 'contractPONumber', defaultValue: '')
    required String contractPONumber,
  }) = _SubmitTenderContractDto;

  factory SubmitTenderContractDto.fromDomain(
    SubmitTenderContract submitTenderContract,
  ) {
    return SubmitTenderContractDto(
      contractNumber: submitTenderContract.contractNumber.getOrDefaultValue(''),
      contractLineItemNumber: submitTenderContract.contractLineItemNumber,
      contractPrice: submitTenderContract.contractPrice,
      contractUnitOfMeasurement: submitTenderContract.contractUnitOfMeasurement,
      currency: submitTenderContract.currency,
      contractPONumber: submitTenderContract.contractPONumber,
    );
  }

  SubmitTenderContract toDomain() {
    return SubmitTenderContract(
      contractNumber: TenderContractNumber(contractNumber),
      contractLineItemNumber: contractLineItemNumber,
      contractPrice: contractPrice,
      contractUnitOfMeasurement: contractUnitOfMeasurement,
      currency: currency,
      contractPONumber: contractPONumber,
    );
  }

  static const empty = SubmitTenderContractDto(
    contractNumber: '',
    contractLineItemNumber: '',
    contractPrice: 0.0,
    contractUnitOfMeasurement: 0,
    currency: '',
    contractPONumber: '',
  );

  factory SubmitTenderContractDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitTenderContractDtoFromJson(json);
}
