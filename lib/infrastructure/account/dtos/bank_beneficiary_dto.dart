import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_beneficiary_dto.freezed.dart';
part 'bank_beneficiary_dto.g.dart';

@freezed
class BankBeneficiaryDto with _$BankBeneficiaryDto {
  const BankBeneficiaryDto._();

  const factory BankBeneficiaryDto({
    @JsonKey(
      name: 'salesOrg',
      defaultValue: '',
    )
        required String salesOrg,
    @JsonKey(name: 'bankAccount', defaultValue: '', toJson: valueOrNullToJson)
        required String bankAccount,
    @JsonKey(name: 'bankAddress', defaultValue: '', toJson: valueOrNullToJson)
        required String bankAddress,
    @JsonKey(name: 'bankCode', defaultValue: '', toJson: valueOrNullToJson)
        required String bankCode,
    @JsonKey(name: 'bankName', defaultValue: '', toJson: valueOrNullToJson)
        required String bankName,
    @JsonKey(name: 'beneficiaryName', defaultValue: '', toJson: valueOrNullToJson)
        required String beneficiaryName,
    @JsonKey(name: 'branch', defaultValue: '', toJson: valueOrNullToJson)
        required String branch,
    @JsonKey(name: 'emailId', defaultValue: '', toJson: valueOrNullToJson)
        required String emailId,
    @JsonKey(name: 'hdbcSwiftCode', defaultValue: '', toJson: valueOrNullToJson)
        required String hdbcSwiftCode,
    @JsonKey(name: 'payNowUen', defaultValue: '', toJson: valueOrNullToJson)
        required String payNowUen,
    @JsonKey(name: 'salesDistrict', defaultValue: '', toJson: valueOrNullToJson)
        required String salesDistrict,
  }) = _BankBeneficiaryDto;

  factory BankBeneficiaryDto.fromDomain(
    BankBeneficiary manageBenificiary,
  ) {
    return BankBeneficiaryDto(
      salesOrg: manageBenificiary.salesOrg.getOrCrash(),
      bankAccount: manageBenificiary.bankAccount.getValue(),
      bankAddress: manageBenificiary.bankAddress,
      bankCode: manageBenificiary.bankCode,
      bankName: manageBenificiary.bankName.getValue(),
      beneficiaryName: manageBenificiary.beneficiaryName.getValue(),
      branch: manageBenificiary.branch,
      emailId: manageBenificiary.emailId.getValue(),
      hdbcSwiftCode: manageBenificiary.hdbcSwiftCode,
      payNowUen: manageBenificiary.payNowUen,
      salesDistrict: manageBenificiary.salesDistrict,
    );
  }

  BankBeneficiary toDomain() {
    return BankBeneficiary(
      key: hashCode,
      salesOrg: SalesOrg(salesOrg),
      bankAccount: StringValue(bankAccount),
      bankAddress: bankAddress,
      bankCode: bankCode,
      bankName: StringValue(bankName),
      beneficiaryName: StringValue(beneficiaryName),
      branch: branch,
      emailId: EmailAddress.optional(emailId),
      hdbcSwiftCode: hdbcSwiftCode,
      payNowUen: payNowUen,
      salesDistrict: salesDistrict,
      isDeleteInProgress: false,
    );
  }

  factory BankBeneficiaryDto.fromJson(Map<String, dynamic> json) =>
      _$BankBeneficiaryDtoFromJson(json);
}