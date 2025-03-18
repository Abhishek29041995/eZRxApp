import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'outstanding_invoice_filter_dto.freezed.dart';
part 'outstanding_invoice_filter_dto.g.dart';

@freezed
class OutstandingInvoiceFilterDto with _$OutstandingInvoiceFilterDto {
  const OutstandingInvoiceFilterDto._();
  const factory OutstandingInvoiceFilterDto({
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
      name: 'amountInTransactionCurrencyFrom',
      defaultValue: '',
    )
        required String amountInTransactionCurrencyFrom,
    @JsonKey(
      name: 'amountInTransactionCurrencyTo',
      defaultValue: '',
    )
        required String amountInTransactionCurrencyTo,
    @JsonKey(
      name: 'status',
      defaultValue: '',
    )
        required String status,
  }) = _OutstandingInvoiceFilterDto;

  factory OutstandingInvoiceFilterDto.fromDomain(
    OutstandingInvoiceFilter outstandingInvoiceFilter,
  ) {
    return OutstandingInvoiceFilterDto(
      status: outstandingInvoiceFilter
          .outstandingInvoiceStatus.displayPaymentStatus,
      dueDateTo: outstandingInvoiceFilter.dueDateTo.apiDateWithDashString,
      dueDateFrom: outstandingInvoiceFilter.dueDateFrom.apiDateWithDashString,
      documentDateTo:
          outstandingInvoiceFilter.documentDateTo.apiDateWithDashString,
      documentDateFrom:
          outstandingInvoiceFilter.documentDateFrom.apiDateWithDashString,
      amountInTransactionCurrencyFrom:
          outstandingInvoiceFilter.amountValueFrom.apiParameterValue,
      amountInTransactionCurrencyTo:
          outstandingInvoiceFilter.amountValueTo.apiParameterValue,
    );
  }

  factory OutstandingInvoiceFilterDto.fromJson(Map<String, dynamic> json) =>
      _$OutstandingInvoiceFilterDtoFromJson(json);

  List<Map<String, String>> get toMapList {
    final filterMap = <Map<String, String>>[];
    if (dueDateFrom.isNotEmpty &&
        dueDateFrom != '-' &&
        dueDateTo.isNotEmpty &&
        dueDateTo != '-') {
      filterMap.add(
        mapFilterFieldData(
          field: 'netDueDate',
          date: dueDateFrom,
          type: 'ge',
        ),
      );
      filterMap.add(
        mapFilterFieldData(
          field: 'netDueDate',
          date: dueDateTo,
          type: 'le',
        ),
      );
    }
    if (documentDateFrom.isNotEmpty &&
        documentDateFrom != '-' &&
        documentDateTo.isNotEmpty &&
        documentDateTo != '-') {
      filterMap.add(
        mapFilterFieldData(
          field: 'postingDate',
          date: documentDateFrom,
          type: 'ge',
        ),
      );
      filterMap.add(
        mapFilterFieldData(
          field: 'postingDate',
          date: documentDateTo,
          type: 'le',
        ),
      );
    }
    if (amountInTransactionCurrencyFrom.isNotEmpty &&
        amountInTransactionCurrencyTo.isNotEmpty) {
      filterMap.add(
        mapFilterFieldData(
          field: 'openAmountInTransCrcy',
          date: amountInTransactionCurrencyFrom,
          type: 'ge',
        ),
      );
      filterMap.add(
        mapFilterFieldData(
          field: 'openAmountInTransCrcy',
          date: amountInTransactionCurrencyTo,
          type: 'le',
        ),
      );
    }

    if (status.isNotEmpty) {
      final statusMap = <String, String>{};
      statusMap.putIfAbsent('field', () => 'status');
      statusMap.putIfAbsent('value', () => status);
      filterMap.add(statusMap);
    }

    return filterMap;
  }
}
