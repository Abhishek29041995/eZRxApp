import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_item_request_dto.freezed.dart';
part 'view_by_item_request_dto.g.dart';

@freezed
class ViewByItemRequestDto with _$ViewByItemRequestDto {
  const ViewByItemRequestDto._();

  const factory ViewByItemRequestDto({
    @JsonKey(name: 'salesOrg', defaultValue: <String>[])
    required List<String> salesOrg,
    @JsonKey(name: 'soldTo', defaultValue: '') required String soldTo,
    @JsonKey(name: 'shipTo', defaultValue: <String>[])
    required List<String> shipTo,
    @JsonKey(name: 'first', defaultValue: 0) required int pageSize,
    @JsonKey(name: 'after', defaultValue: 0) required int offset,
    @JsonKey(name: 'language', defaultValue: '') required String language,
    @JsonKey(name: 'searchKey', defaultValue: '') required String searchKey,
    @JsonKey(name: 'orderNumber', defaultValue: '') required String orderNumber,
    @JsonKey(name: 'orderStatus', defaultValue: <String>[])
    required List<String> orderStatus,
    @JsonKey(name: 'toDate', defaultValue: '') required String dateTo,
    @JsonKey(name: 'fromDate', defaultValue: '') required String dateFrom,
    @JsonKey(name: 'isOptimised', defaultValue: true) required bool isOptimised,
    @JsonKey(name: 'orderType', includeIfNull: false) int? orderType,
    @JsonKey(name: 'isDetailsPage', defaultValue: false)
    required bool isDetailsPage,
  }) = _ViewByItemRequestDto;

  factory ViewByItemRequestDto.fromDomain(ViewByItemRequest viewByItemRequest) {
    final orderType = viewByItemRequest.viewByItemFilter.orderHistoryType;

    return ViewByItemRequestDto(
      salesOrg: [viewByItemRequest.salesOrg],
      soldTo: viewByItemRequest.customerCodeSoldTo,
      shipTo: viewByItemRequest.shipToCustomerCode.isEmpty
          ? []
          : [viewByItemRequest.shipToCustomerCode],
      pageSize: viewByItemRequest.pageSize,
      offset: viewByItemRequest.offSet,
      language: viewByItemRequest.language,
      searchKey: viewByItemRequest.searchKey,
      orderNumber: viewByItemRequest.orderNumber,
      orderStatus: viewByItemRequest.viewByItemFilter.orderStatusList
          .map((e) => e.getOrCrash())
          .toList(),
      dateTo: viewByItemRequest.viewByItemFilter.orderDateTo.apiDateTimeString,
      dateFrom:
          viewByItemRequest.viewByItemFilter.orderDateFrom.apiDateTimeString,
      isOptimised: true,
      orderType: orderType == MaterialOriginFilter.all()
          ? null
          : orderType.getOrDefaultValue(0),
      isDetailsPage: viewByItemRequest.isDetailsPage,
    );
  }

  factory ViewByItemRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ViewByItemRequestDtoFromJson(json);

  Map<String, dynamic> toMapJson() => toJson()
    ..removeWhere(
      (key, value) =>
          ((value is String && value.isEmpty) ||
              (value is List<String> && value.isEmpty)) ||
          (isDetailsPage && (key == 'first' || key == 'after')),
    );
}
