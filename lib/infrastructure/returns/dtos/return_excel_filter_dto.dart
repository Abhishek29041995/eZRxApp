import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_excel_filter_dto.freezed.dart';
part 'return_excel_filter_dto.g.dart';

@freezed
class ReturnExcelFilterDto with _$ReturnExcelFilterDto {
  const ReturnExcelFilterDto._();
  const factory ReturnExcelFilterDto({
    @JsonKey(name: 'dateFrom', defaultValue: '') required String dateFrom,
    @JsonKey(name: 'dateTo', defaultValue: '') required String dateTo,
    @JsonKey(name: 'refundTotalFrom', defaultValue: '')
    required String refundTotalFrom,
    @JsonKey(name: 'refundTotalTo', defaultValue: '')
    required String refundTotalTo,
    @JsonKey(name: 'statusItem', defaultValue: <String>[])
    required List<String> statusList,
  }) = _ReturnExcelFilterDto;

  factory ReturnExcelFilterDto.fromDomain(ReturnFilter returnFilter) {
    return ReturnExcelFilterDto(
      statusList:
          returnFilter.returnStatusList.map((e) => e.getOrCrash()).toList(),
      dateTo: returnFilter.returnDateTo.apiDateTimeString,
      dateFrom: returnFilter.returnDateFrom.apiDateTimeString,
      refundTotalFrom: returnFilter.amountValueFrom.apiParameterValue,
      refundTotalTo: returnFilter.amountValueTo.apiParameterValue,
    );
  }

  factory ReturnExcelFilterDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnExcelFilterDtoFromJson(json);
}
