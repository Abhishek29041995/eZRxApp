// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_beneficiary_invoice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankBeneficiaryInvoiceDtoImpl _$$BankBeneficiaryInvoiceDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BankBeneficiaryInvoiceDtoImpl(
      beneficiaryName: json['beneficiaryName'] as String? ?? '',
      bankName: json['bankName'] as String? ?? '',
      branch: json['branch'] as String? ?? '',
      bankCode: json['bankCode'] as String? ?? '',
      bankAccount: json['bankAccount'] as String? ?? '',
      hdbcSwiftCode: json['hdbcSwiftCode'] as String? ?? '',
      bankAddress: json['bankAddress'] as String? ?? '',
      payNowUen: json['payNowUen'] as String? ?? '',
      emailId: json['emailId'] as String? ?? '',
    );

Map<String, dynamic> _$$BankBeneficiaryInvoiceDtoImplToJson(
        _$BankBeneficiaryInvoiceDtoImpl instance) =>
    <String, dynamic>{
      'beneficiaryName': instance.beneficiaryName,
      'bankName': instance.bankName,
      'branch': instance.branch,
      'bankCode': instance.bankCode,
      'bankAccount': instance.bankAccount,
      'hdbcSwiftCode': instance.hdbcSwiftCode,
      'bankAddress': instance.bankAddress,
      'payNowUen': instance.payNowUen,
      'emailId': instance.emailId,
    };
