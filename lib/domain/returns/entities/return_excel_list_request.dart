import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_excel_list_request.freezed.dart';

@freezed
class ReturnExcelListRequest with _$ReturnExcelListRequest {
  const ReturnExcelListRequest._();

  const factory ReturnExcelListRequest({
    required String customerCode,
    required bool isViewByReturn,
    required String shipToInfo,
    required Username userName,
    required ReturnFilter filter,
    required SearchKey searchKey,
  }) = _ReturnExcelListRequest;

  factory ReturnExcelListRequest.empty() => ReturnExcelListRequest(
        customerCode: '',
        isViewByReturn: false,
        shipToInfo: '',
        userName: Username(''),
        filter: ReturnFilter.empty(),
        searchKey: SearchKey.empty(),
      );
}
