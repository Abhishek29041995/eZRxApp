import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_filter_dto.freezed.dart';
part 'return_filter_dto.g.dart';

@freezed
class ReturnFilterDto with _$ReturnFilterDto {
  const ReturnFilterDto._();
  const factory ReturnFilterDto({
    @JsonKey(name: 'dateFrom', defaultValue: '') required String dateFrom,
    @JsonKey(name: 'dateTo', defaultValue: '') required String dateTo,
    @JsonKey(name: 'refundTotalFrom', defaultValue: '')
    required String refundTotalFrom,
    @JsonKey(name: 'refundTotalTo', defaultValue: '')
    required String refundTotalTo,
    @JsonKey(name: 'status', defaultValue: <String>[])
    required List<String> statusList,
    @JsonKey(name: 'returnType', includeIfNull: false) int? returnType,
  }) = _ReturnFilterDto;

  factory ReturnFilterDto.fromDomain(ReturnFilter returnFilter) {
    return ReturnFilterDto(
      statusList:
          returnFilter.returnStatusList.map((e) => e.getOrCrash()).toList(),
      dateTo: returnFilter.returnDateTo.apiDateTimeString,
      dateFrom: returnFilter.returnDateFrom.apiDateTimeString,
      refundTotalFrom: returnFilter.amountValueFrom.apiParameterValue,
      refundTotalTo: returnFilter.amountValueTo.apiParameterValue,
      returnType:
          returnFilter.materialOriginFilter == MaterialOriginFilter.all()
              ? null
              : returnFilter.materialOriginFilter.getOrDefaultValue(0),
    );
  }

  factory ReturnFilterDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnFilterDtoFromJson(json);
}
