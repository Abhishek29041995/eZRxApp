import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_beneficiary.freezed.dart';

@freezed
class BankBeneficiary with _$BankBeneficiary {
  const BankBeneficiary._();

  const factory BankBeneficiary({
    required int key,
    required SalesOrg salesOrg,
    required StringValue bankAccount,
    required String bankAddress,
    required String bankCode,
    required StringValue bankName,
    required StringValue beneficiaryName,
    required String branch,
    required EmailAddress emailId,
    required String hdbcSwiftCode,
    required String payNowUen,
    required String salesDistrict,
    required bool isDeleteInProgress,
  }) = _BankBeneficiary;


  factory BankBeneficiary.empty() => BankBeneficiary(
        key: 0,
        salesOrg: SalesOrg(''),
        bankAccount: StringValue(''),
        bankAddress: '',
        bankCode: '',
        bankName: StringValue(''),
        beneficiaryName: StringValue(''),
        branch: '',
        emailId: EmailAddress.optional(''),
        hdbcSwiftCode: '',
        payNowUen: '',
        salesDistrict: '',
        isDeleteInProgress: false,
      );
}
