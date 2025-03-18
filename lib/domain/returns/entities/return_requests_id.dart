import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_requests_id.freezed.dart';

@freezed
class ReturnRequestsId with _$ReturnRequestsId {
  ReturnRequestsId._();
  factory ReturnRequestsId({
    required String requestId,
  }) = _ReturnRequestsId;

  bool get isValidRequestId => requestId.isNotEmpty;

  factory ReturnRequestsId.empty() => ReturnRequestsId(
        requestId: '',
      );
}
