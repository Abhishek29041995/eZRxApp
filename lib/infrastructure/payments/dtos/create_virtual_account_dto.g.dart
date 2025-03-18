// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_virtual_account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateVirtualAccountDtoImpl _$$CreateVirtualAccountDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateVirtualAccountDtoImpl(
      id: json['id'] as String? ?? '',
      invoices: (json['invoices'] as List<dynamic>?)
              ?.map((e) =>
                  TransactionInvoiceDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      amountPayable: (json['amountPayable'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] as String? ?? '',
      paymentDetails: PaymentDetailsDto.fromJson(
          json['paymentDetails'] as Map<String, dynamic>),
      paymentMethodDisplay: json['paymentMethodDisplay'] as String? ?? '',
      createdOn:
          JsonReadValueHelper.createdAtDate(json, 'createdOn') as String? ?? '',
      paidOn:
          JsonReadValueHelper.createdAtDate(json, 'paidOn') as String? ?? '',
    );

Map<String, dynamic> _$$CreateVirtualAccountDtoImplToJson(
        _$CreateVirtualAccountDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoices': instance.invoices.map((e) => e.toJson()).toList(),
      'amountPayable': instance.amountPayable,
      'status': instance.status,
      'paymentDetails': instance.paymentDetails.toJson(),
      'paymentMethodDisplay': instance.paymentMethodDisplay,
      'createdOn': instance.createdOn,
      'paidOn': instance.paidOn,
    };
