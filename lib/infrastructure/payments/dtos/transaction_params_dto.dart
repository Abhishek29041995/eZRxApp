import 'package:ezrxmobile/domain/payments/entities/transaction_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_params_dto.freezed.dart';
part 'transaction_params_dto.g.dart';

@freezed
class TransactionParamsDto with _$TransactionParamsDto {
  const TransactionParamsDto._();

  const factory TransactionParamsDto({
    @JsonKey(name: 'customer', defaultValue: '') required String customer,
    @JsonKey(name: 'createdStartDate', defaultValue: '')
    required String createdStartDate,
    @JsonKey(name: 'createdEndDate', defaultValue: '')
    required String createdEndDate,
    @JsonKey(name: 'search', defaultValue: '') required String search,
    @JsonKey(name: 'first', defaultValue: 0) required int first,
    @JsonKey(name: 'after', defaultValue: 0) required int after,
    @JsonKey(name: 'amountMin', defaultValue: 0) required int amountMin,
    @JsonKey(name: 'amountMax', defaultValue: 0) required int amountMax,
    @JsonKey(name: 'status', defaultValue: <String>[])
    required List<String> status,
  }) = _TransactionParamsDto;

  factory TransactionParamsDto.fromDomain(
    TransactionParams entity,
  ) {
    return TransactionParamsDto(
      customer: entity.customerCode,
      createdStartDate: entity.filter.createdDateFrom.apiDateTimeString,
      createdEndDate: entity.filter.createdDateTo.apiDateTimeString,
      search: entity.filter.searchKey.searchValueOrEmpty,
      amountMin: entity.filter.amountValueFrom.intValue,
      amountMax: entity.filter.amountValueTo.intValue,
      status: entity.filter.filterStatuses.map((e) => e.getValue()).toList(),
      first: entity.first,
      after: entity.after,
    );
  }

  factory TransactionParamsDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionParamsDtoFromJson(json);

  Map<String, dynamic> toMap() => toJson()
    ..removeWhere(
      (key, value) =>
          ((value is String || value is List<String>) &&
              (!['createdEndDate', 'createdStartDate'].contains(key)) &&
              value.isEmpty) ||
          (key != 'after' && value is int && value == 0),
    );
}
