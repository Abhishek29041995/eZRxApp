// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionDetailDtoImpl _$$TransactionDetailDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionDetailDtoImpl(
      id: json['id'] as String? ?? '',
      reference: json['reference'] as String? ?? '',
      invoices: (json['invoices'] as List<dynamic>?)
              ?.map((e) =>
                  TransactionInvoiceDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      amountPayable: (json['amountPayable'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] as String? ?? '',
      paymentDocument: json['paymentDocument'] as String? ?? '',
      paymentMethodDisplay: json['paymentMethodDisplay'] as String? ?? '',
      createdOn: json['createdOn'] as String? ?? '',
      bankId: json['bankId'] as String? ?? '',
      paidOn: json['paidOn'] as String? ?? '',
      vaName: JsonReadValueHelper.readVaName(json, 'vaName') as String? ?? '',
      vaNumber:
          JsonReadValueHelper.readVaNumber(json, 'vaNumber') as String? ?? '',
    );

Map<String, dynamic> _$$TransactionDetailDtoImplToJson(
        _$TransactionDetailDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'invoices': instance.invoices.map((e) => e.toJson()).toList(),
      'amountPayable': instance.amountPayable,
      'status': instance.status,
      'paymentDocument': instance.paymentDocument,
      'paymentMethodDisplay': instance.paymentMethodDisplay,
      'createdOn': instance.createdOn,
      'bankId': instance.bankId,
      'paidOn': instance.paidOn,
      'vaName': instance.vaName,
      'vaNumber': instance.vaNumber,
    };
