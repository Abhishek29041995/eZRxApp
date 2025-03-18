// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_invoices_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllInvoicesFilterDtoImpl _$$AllInvoicesFilterDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AllInvoicesFilterDtoImpl(
      dueDateFrom: json['dueDateFrom'] as String? ?? '',
      dueDateTo: json['dueDateTo'] as String? ?? '',
      documentDateFrom: json['documentDateFrom'] as String? ?? '',
      documentDateTo: json['documentDateTo'] as String? ?? '',
      amountValueFrom: json['amountValueFrom'] as String? ?? '',
      amountValueTo: json['amountValueTo'] as String? ?? '',
      filterStatuses: json['filterStatuses'] as String? ?? '',
      searchKey: json['accountingDocument'] as String? ?? '',
    );

Map<String, dynamic> _$$AllInvoicesFilterDtoImplToJson(
        _$AllInvoicesFilterDtoImpl instance) =>
    <String, dynamic>{
      'dueDateFrom': instance.dueDateFrom,
      'dueDateTo': instance.dueDateTo,
      'documentDateFrom': instance.documentDateFrom,
      'documentDateTo': instance.documentDateTo,
      'amountValueFrom': instance.amountValueFrom,
      'amountValueTo': instance.amountValueTo,
      'filterStatuses': instance.filterStatuses,
      'accountingDocument': instance.searchKey,
    };
