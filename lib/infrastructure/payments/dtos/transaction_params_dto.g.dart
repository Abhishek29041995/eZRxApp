// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_params_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionParamsDtoImpl _$$TransactionParamsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionParamsDtoImpl(
      customer: json['customer'] as String? ?? '',
      createdStartDate: json['createdStartDate'] as String? ?? '',
      createdEndDate: json['createdEndDate'] as String? ?? '',
      search: json['search'] as String? ?? '',
      first: (json['first'] as num?)?.toInt() ?? 0,
      after: (json['after'] as num?)?.toInt() ?? 0,
      amountMin: (json['amountMin'] as num?)?.toInt() ?? 0,
      amountMax: (json['amountMax'] as num?)?.toInt() ?? 0,
      status: (json['status'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$TransactionParamsDtoImplToJson(
        _$TransactionParamsDtoImpl instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'createdStartDate': instance.createdStartDate,
      'createdEndDate': instance.createdEndDate,
      'search': instance.search,
      'first': instance.first,
      'after': instance.after,
      'amountMin': instance.amountMin,
      'amountMax': instance.amountMax,
      'status': instance.status,
    };
