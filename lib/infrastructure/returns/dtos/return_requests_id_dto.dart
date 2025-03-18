import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_requests_id_dto.freezed.dart';
part 'return_requests_id_dto.g.dart';

@freezed
class ReturnRequestsIdDto with _$ReturnRequestsIdDto {
  ReturnRequestsIdDto._();

  factory ReturnRequestsIdDto({
    @JsonKey(name: 'requestId', defaultValue: '') required String requestId,
  }) = _ReturnRequestsIdDto;

  ReturnRequestsId toDomain() {
    return ReturnRequestsId(
      requestId: requestId,
    );
  }

  factory ReturnRequestsIdDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnRequestsIdDtoFromJson(json);

  bool get isValidRequestId => requestId.isNotEmpty;
}
