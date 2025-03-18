import 'package:ezrxmobile/domain/returns/entities/return_excel_list_request.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_excel_filter_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_excel_list_request_dto.freezed.dart';
part 'return_excel_list_request_dto.g.dart';

@freezed
class ReturnExcelListRequestDto with _$ReturnExcelListRequestDto {
  const ReturnExcelListRequestDto._();

  const factory ReturnExcelListRequestDto({
    @JsonKey(name: 'isViewByReturn', defaultValue: false)
    required bool isViewByReturn,
    @JsonKey(name: 'soldTo', defaultValue: '') required String soldTo,
    @JsonKey(name: 'shipTo', defaultValue: '') required String shipTo,
    @JsonKey(name: 'username', defaultValue: '') required String username,
    @JsonKey(
      name: 'filterQuery',
      defaultValue: null,
      includeToJson: false,
    )
    required ReturnExcelFilterDto filterQuery,
    @JsonKey(name: 'searchFilter', defaultValue: '') required String searchKey,
  }) = _ReturnExcelListRequestDto;

  factory ReturnExcelListRequestDto.fromDomain(
    ReturnExcelListRequest returnExcelListRequest,
  ) {
    return ReturnExcelListRequestDto(
      isViewByReturn: returnExcelListRequest.isViewByReturn,
      soldTo: returnExcelListRequest.customerCode,
      shipTo: returnExcelListRequest.shipToInfo,
      username: returnExcelListRequest.userName.getOrCrash(),
      filterQuery:
          ReturnExcelFilterDto.fromDomain(returnExcelListRequest.filter),
      searchKey: returnExcelListRequest.searchKey.getOrCrash(),
    );
  }

  factory ReturnExcelListRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnExcelListRequestDtoFromJson(json);
}
