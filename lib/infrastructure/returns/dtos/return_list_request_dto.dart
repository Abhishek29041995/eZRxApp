import 'package:ezrxmobile/domain/returns/entities/return_list_request.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_filter_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_list_request_dto.freezed.dart';
part 'return_list_request_dto.g.dart';

@freezed
class ReturnListRequestDto with _$ReturnListRequestDto {
  const ReturnListRequestDto._();

  const factory ReturnListRequestDto({
    @JsonKey(name: 'salesOrg', defaultValue: '') required String salesOrg,
    @JsonKey(name: 'soldTo', defaultValue: '') required String soldTo,
    @JsonKey(name: 'shipTo', defaultValue: '') required String shipTo,
    @JsonKey(name: 'username', defaultValue: '') required String username,
    @JsonKey(name: 'first', defaultValue: 0) required int first,
    @JsonKey(name: 'after', defaultValue: 0) required int after,
    @JsonKey(
      name: 'filterQuery',
      defaultValue: null,
      includeToJson: false,
    )
    required ReturnFilterDto filterQuery,
    @JsonKey(name: 'searchFilter', defaultValue: '') required String searchKey,
  }) = _ReturnListRequestDto;

  factory ReturnListRequestDto.fromDomain(
    ReturnListRequest returnListRequest,
  ) {
    return ReturnListRequestDto(
      salesOrg: returnListRequest.salesOrg.getOrCrash(),
      soldTo: returnListRequest.customerCode,
      shipTo: returnListRequest.shipToInfo,
      username: returnListRequest.userName.getOrCrash(),
      first: returnListRequest.first,
      after: returnListRequest.after,
      filterQuery: ReturnFilterDto.fromDomain(returnListRequest.filter),
      searchKey: returnListRequest.searchKey.getOrCrash(),
    );
  }

  factory ReturnListRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnListRequestDtoFromJson(json);
}
