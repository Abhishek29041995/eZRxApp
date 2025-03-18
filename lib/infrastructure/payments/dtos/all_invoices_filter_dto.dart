import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_invoices_filter_dto.freezed.dart';
part 'all_invoices_filter_dto.g.dart';

@freezed
class AllInvoicesFilterDto with _$AllInvoicesFilterDto {
  const AllInvoicesFilterDto._();
  const factory AllInvoicesFilterDto({
    @JsonKey(
      name: 'dueDateFrom',
      defaultValue: '',
    )
        required String dueDateFrom,
    @JsonKey(
      name: 'dueDateTo',
      defaultValue: '',
    )
        required String dueDateTo,
    @JsonKey(
      name: 'documentDateFrom',
      defaultValue: '',
    )
        required String documentDateFrom,
    @JsonKey(
      name: 'documentDateTo',
      defaultValue: '',
    )
        required String documentDateTo,
    @JsonKey(
      name: 'amountValueFrom',
      defaultValue: '',
    )
        required String amountValueFrom,
    @JsonKey(
      name: 'amountValueTo',
      defaultValue: '',
    )
        required String amountValueTo,
    @JsonKey(
      name: 'filterStatuses',
      defaultValue: '',
    )
        required String filterStatuses,
    @JsonKey(
      name: 'accountingDocument',
      defaultValue: '',
    )
        required String searchKey,
  }) = _AllInvoicesFilterDto;

  factory AllInvoicesFilterDto.fromDomain(
    AllInvoicesFilter tempFilter,
  ) {
    return AllInvoicesFilterDto(
      dueDateFrom: tempFilter.dueDateFrom.apiDateWithDashString,
      dueDateTo: tempFilter.dueDateTo.apiDateWithDashString,
      documentDateTo: tempFilter.documentDateTo.apiDateWithDashString,
      documentDateFrom: tempFilter.documentDateFrom.apiDateWithDashString,
      amountValueFrom: tempFilter.amountValueFrom.apiParameterValue,
      amountValueTo: tempFilter.amountValueTo.apiParameterValue,
      filterStatuses: tempFilter.filterStatuses.join(','),
      searchKey: tempFilter.searchKey.getOrDefaultValue(''),
    );
  }

  factory AllInvoicesFilterDto.fromJson(Map<String, dynamic> json) =>
      _$AllInvoicesFilterDtoFromJson(json);

  List<Map<String, String>> get toMapList => <Map<String, String>>[
        {
          'field': 'accountingDocumentType',
          'value': 'Invoice',
        },
        if (documentDateFrom.isNotEmpty && documentDateFrom != '-')
          {
            'field': 'documentDate',
            'value': documentDateFrom,
            'type': 'ge',
          },
        if (documentDateTo.isNotEmpty && documentDateTo != '-')
          {
            'field': 'documentDate',
            'value': documentDateTo,
            'type': 'le',
          },
        if (dueDateFrom.isNotEmpty && dueDateFrom != '-')
          {
            'field': 'netDueDate',
            'value': dueDateFrom,
            'type': 'ge',
          },
        if (dueDateTo.isNotEmpty && dueDateTo != '-')
          {
            'field': 'netDueDate',
            'value': dueDateTo,
            'type': 'le',
          },
        if (amountValueFrom.isNotEmpty)
          {
            'field': 'amountInTransactionCurrency',
            'value': amountValueFrom,
            'type': 'ge',
          },
        if (amountValueTo.isNotEmpty)
          {
            'field': 'amountInTransactionCurrency',
            'value': amountValueTo,
            'type': 'le',
          },
        if (filterStatuses.isNotEmpty)
          {
            'field': 'invoiceProcessingStatus',
            'value': filterStatuses,
          },
        if (searchKey.isNotEmpty)
          {
            'field': 'accountingDocument',
            'value': searchKey,
          },
      ];
}
