// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_beneficiary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankBeneficiaryDtoImpl _$$BankBeneficiaryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BankBeneficiaryDtoImpl(
      salesOrg: json['salesOrg'] as String? ?? '',
      bankAccount: json['bankAccount'] as String? ?? '',
      bankAddress: json['bankAddress'] as String? ?? '',
      bankCode: json['bankCode'] as String? ?? '',
      bankName: json['bankName'] as String? ?? '',
      beneficiaryName: json['beneficiaryName'] as String? ?? '',
      branch: json['branch'] as String? ?? '',
      emailId: json['emailId'] as String? ?? '',
      hdbcSwiftCode: json['hdbcSwiftCode'] as String? ?? '',
      payNowUen: json['payNowUen'] as String? ?? '',
      salesDistrict: json['salesDistrict'] as String? ?? '',
    );

Map<String, dynamic> _$$BankBeneficiaryDtoImplToJson(
        _$BankBeneficiaryDtoImpl instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'bankAccount': valueOrNullToJson(instance.bankAccount),
      'bankAddress': valueOrNullToJson(instance.bankAddress),
      'bankCode': valueOrNullToJson(instance.bankCode),
      'bankName': valueOrNullToJson(instance.bankName),
      'beneficiaryName': valueOrNullToJson(instance.beneficiaryName),
      'branch': valueOrNullToJson(instance.branch),
      'emailId': valueOrNullToJson(instance.emailId),
      'hdbcSwiftCode': valueOrNullToJson(instance.hdbcSwiftCode),
      'payNowUen': valueOrNullToJson(instance.payNowUen),
      'salesDistrict': valueOrNullToJson(instance.salesDistrict),
    };
