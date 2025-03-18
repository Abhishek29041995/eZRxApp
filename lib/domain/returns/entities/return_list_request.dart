import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_list_request.freezed.dart';

@freezed
class ReturnListRequest with _$ReturnListRequest {
  const ReturnListRequest._();

  const factory ReturnListRequest({
    required String customerCode,
    required SalesOrg salesOrg,
    required String shipToInfo,
    required Username userName,
    required int first,
    required int after,
    required ReturnFilter filter,
    required SearchKey searchKey,
  }) = _ReturnListRequest;

  factory ReturnListRequest.empty() => ReturnListRequest(
        customerCode: '',
        salesOrg: SalesOrg(''),
        shipToInfo: '',
        userName: Username(''),
        first: 0,
        after: 0,
        filter: ReturnFilter.empty(),
        searchKey: SearchKey.empty(),
      );
}
