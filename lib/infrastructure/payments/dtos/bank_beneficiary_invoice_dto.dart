import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_beneficiary_invoice_dto.freezed.dart';
part 'bank_beneficiary_invoice_dto.g.dart';

@freezed
class BankBeneficiaryInvoiceDto with _$BankBeneficiaryInvoiceDto {
  const BankBeneficiaryInvoiceDto._();

  const factory BankBeneficiaryInvoiceDto({
    @JsonKey(name: 'beneficiaryName', defaultValue: '')
        required String beneficiaryName,
    @JsonKey(name: 'bankName', defaultValue: '') required String bankName,
    @JsonKey(name: 'branch', defaultValue: '') required String branch,
    @JsonKey(name: 'bankCode', defaultValue: '') required String bankCode,
    @JsonKey(name: 'bankAccount', defaultValue: '') required String bankAccount,
    @JsonKey(name: 'hdbcSwiftCode', defaultValue: '')
        required String hdbcSwiftCode,
    @JsonKey(name: 'bankAddress', defaultValue: '') required String bankAddress,
    @JsonKey(name: 'payNowUen', defaultValue: '') required String payNowUen,
    @JsonKey(name: 'emailId', defaultValue: '') required String emailId,
  }) = _BankBeneficiaryInvoiceDto;

   BankBeneficiary toDomain() {
    return BankBeneficiary(
      key: hashCode,
      salesOrg: SalesOrg(''),
      bankAccount: StringValue(bankAccount),
      bankAddress: bankAddress,
      bankCode: bankCode,
      bankName: StringValue(bankName),
      beneficiaryName: StringValue(beneficiaryName),
      branch: branch,
      emailId: EmailAddress.optional(emailId),
      hdbcSwiftCode: hdbcSwiftCode,
      payNowUen: payNowUen,
      salesDistrict: '',
      isDeleteInProgress: false,
    );
  }

  factory BankBeneficiaryInvoiceDto.fromJson(Map<String, dynamic> json) =>
      _$BankBeneficiaryInvoiceDtoFromJson(json);
}
