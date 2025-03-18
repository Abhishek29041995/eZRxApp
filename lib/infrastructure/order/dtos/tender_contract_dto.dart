import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tender_contract_dto.freezed.dart';
part 'tender_contract_dto.g.dart';

@freezed
class TenderContractDto with _$TenderContractDto {
  const TenderContractDto._();

  const factory TenderContractDto({
    @JsonKey(name: 'contractNumber') required String contractNumber,
    @JsonKey(name: 'contractItemNumber') required String contractItemNumber,
    @JsonKey(name: 'contractReference') required String contractReference,
    @JsonKey(name: 'tenderOrderReason') required String tenderOrderReason,
    @JsonKey(name: 'tenderVisaNumber') required String tenderVisaNumber,
    @JsonKey(name: 'salesDistrict') required String salesDistrict,
    @JsonKey(name: 'tenderPackageDescription')
    required String tenderPackageDescription,
    @StringToDoubleConverter()
    @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
    required double tenderPrice,
    @JsonKey(name: 'pricingUnit') required int pricingUnit,
    @JsonKey(name: 'remainingTenderQuantity')
    required int remainingTenderQuantity,
    @JsonKey(name: 'contractQuantity') required int contractQuantity,
    @JsonKey(name: 'contractExpiryDate') required String contractExpiryDate,
    @JsonKey(name: 'announcementLetterNumber')
    required String announcementLetterNumber,
    @JsonKey(name: 'isNearToExpire') required bool isNearToExpire,
    @JsonKey(name: 'contractPaymentTerm') required String contractPaymentTerm,
    @StringToDoubleConverter()
    @JsonKey(name: 'tenderUnitPrice', defaultValue: 0.0)
    required double tenderUnitPrice,
  }) = _TenderContractDto;

  factory TenderContractDto.fromDomain(TenderContract tenderContract) {
    return TenderContractDto(
      contractNumber: tenderContract.contractNumber.getOrDefaultValue(''),
      contractItemNumber:
          tenderContract.contractItemNumber.getOrDefaultValue(''),
      contractReference: tenderContract.contractReference.getOrDefaultValue(''),
      tenderOrderReason: tenderContract.tenderOrderReason.getOrDefaultValue(''),
      tenderVisaNumber: tenderContract.tenderVisaNumber.getOrDefaultValue(''),
      salesDistrict: tenderContract.salesDistrict.getOrDefaultValue(''),
      tenderPackageDescription:
          tenderContract.tenderPackageDescription.getOrDefaultValue(''),
      tenderPrice: tenderContract.tenderPrice,
      pricingUnit: tenderContract.pricingUnit,
      remainingTenderQuantity: tenderContract.remainingTenderQuantity,
      contractQuantity: tenderContract.contractQuantity,
      contractExpiryDate:
          tenderContract.contractExpiryDate.getOrDefaultValue(''),
      announcementLetterNumber:
          tenderContract.announcementLetterNumber.getOrDefaultValue(''),
      isNearToExpire: tenderContract.isNearToExpire,
      contractPaymentTerm:
          tenderContract.contractPaymentTerm.getOrDefaultValue(''),
      tenderUnitPrice: tenderContract.tenderUnitPrice,
    );
  }

  TenderContract toDomain() {
    return TenderContract(
      contractNumber: TenderContractNumber(contractNumber),
      contractItemNumber: TenderContractNumber(contractItemNumber),
      contractReference: StringValue(contractReference),
      tenderOrderReason: TenderContractReason(tenderOrderReason),
      tenderVisaNumber: TenderContractNumber(tenderVisaNumber),
      salesDistrict: StringValue(salesDistrict),
      tenderPackageDescription: StringValue(tenderPackageDescription),
      tenderPrice: tenderPrice,
      pricingUnit: pricingUnit,
      remainingTenderQuantity: remainingTenderQuantity,
      contractQuantity: contractQuantity,
      contractExpiryDate: DateTimeStringValue(contractExpiryDate),
      announcementLetterNumber: TenderContractNumber(
        announcementLetterNumber,
      ),
      isNearToExpire: isNearToExpire,
      isTenderExpired: false,
      contractPaymentTerm: StringValue(contractPaymentTerm),
      tenderUnitPrice: tenderUnitPrice,
    );
  }

  factory TenderContractDto.fromJson(Map<String, dynamic> json) =>
      _$TenderContractDtoFromJson(json);
}
