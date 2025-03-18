import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_credit_filter_dto.freezed.dart';
part 'available_credit_filter_dto.g.dart';

@freezed
class AvailableCreditFilterDto with _$AvailableCreditFilterDto {
  const AvailableCreditFilterDto._();
  const factory AvailableCreditFilterDto({
    @JsonKey(name: 'documentDateFrom', defaultValue: '')
    required String documentDateFrom,
    @JsonKey(name: 'documentDateTo', defaultValue: '')
    required String documentDateTo,
    @JsonKey(name: 'amountInTransactionCurrencyFrom', defaultValue: '')
    required String amountInTransactionCurrencyFrom,
    @JsonKey(name: 'amountInTransactionCurrencyTo', defaultValue: '')
    required String amountInTransactionCurrencyTo,
  }) = _AvailableCreditFilterDto;

  factory AvailableCreditFilterDto.fromDomain(
    AvailableCreditFilter availableCreditFilter,
  ) {
    return AvailableCreditFilterDto(
      documentDateTo:
          availableCreditFilter.documentDateTo.apiDateWithDashString,
      documentDateFrom:
          availableCreditFilter.documentDateFrom.apiDateWithDashString,
      amountInTransactionCurrencyFrom:
          availableCreditFilter.amountValueFrom.apiParameterValue,
      amountInTransactionCurrencyTo:
          availableCreditFilter.amountValueTo.apiParameterValue,
    );
  }

  factory AvailableCreditFilterDto.fromJson(Map<String, dynamic> json) =>
      _$AvailableCreditFilterDtoFromJson(json);

  List<Map<String, String>> get toMapList {
    final filterMap = <Map<String, String>>[];
    if (documentDateFrom.isNotEmpty &&
        documentDateFrom != '-' &&
        documentDateTo.isNotEmpty &&
        documentDateTo != '-') {
      filterMap.add(
        mapFilterFieldData(
          field: 'documentDate',
          date: documentDateFrom,
          type: 'ge',
        ),
      );
      filterMap.add(
        mapFilterFieldData(
          field: 'documentDate',
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
          date: '-$amountInTransactionCurrencyTo',
          type: 'ge',
        ),
      );
      filterMap.add(
        mapFilterFieldData(
          field: 'openAmountInTransCrcy',
          date: '-$amountInTransactionCurrencyFrom',
          type: 'le',
        ),
      );
    }

    return filterMap;
  }
}
