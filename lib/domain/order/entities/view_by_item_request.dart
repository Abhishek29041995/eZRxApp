import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_item_request.freezed.dart';

@freezed
class ViewByItemRequest with _$ViewByItemRequest {
  const ViewByItemRequest._();

  factory ViewByItemRequest({
    required String salesOrg,
    required String customerCodeSoldTo,
    required String shipToCustomerCode,
    required String language,
    required int pageSize,
    required int offSet,
    required String searchKey,
    required String orderNumber,
    required ViewByItemFilter viewByItemFilter,
    required bool isDetailsPage,
    required MaterialOriginFilter materialOriginFilter,
  }) = _ViewByItemRequest;

  factory ViewByItemRequest.empty() => ViewByItemRequest(
        salesOrg: '',
        customerCodeSoldTo: '',
        shipToCustomerCode: '',
        language: '',
        pageSize: 0,
        offSet: 0,
        searchKey: '',
        orderNumber: '',
        viewByItemFilter: ViewByItemFilter.empty(),
        isDetailsPage: false,
        materialOriginFilter: MaterialOriginFilter.all(),
      );
}
