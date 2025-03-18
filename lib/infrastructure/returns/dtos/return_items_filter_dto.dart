import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_items_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'return_items_filter_dto.freezed.dart';
part 'return_items_filter_dto.g.dart';

@freezed
class ReturnItemsFilterDto with _$ReturnItemsFilterDto {
  const ReturnItemsFilterDto._();
  const factory ReturnItemsFilterDto({
    @JsonKey(
      name: 'dateFrom',
      defaultValue: '',
    )
        required String dateFrom,
    @JsonKey(
      name: 'dateTo',
      defaultValue: '',
    )
        required String dateTo,
  }) = _ReturnItemsFilterDto;

  factory ReturnItemsFilterDto.fromDomain(
    ReturnItemsFilter tempFilter,
  ) {
    return ReturnItemsFilterDto(
      dateFrom: tempFilter.invoiceDateFrom.apiDateTimeString,
      dateTo: tempFilter.invoiceDateTo.apiDateTimeString,
    );
  }

  ReturnItemsFilter get toDomain => ReturnItemsFilter(
        invoiceDateFrom: DateTimeStringValue(dateFrom),
        invoiceDateTo: DateTimeStringValue(dateTo),
      );

  factory ReturnItemsFilterDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnItemsFilterDtoFromJson(json);
}
