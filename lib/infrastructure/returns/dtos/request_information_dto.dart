import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/request_information_header_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_request_information_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'request_information_dto.freezed.dart';
part 'request_information_dto.g.dart';

@freezed
class RequestInformationDto with _$RequestInformationDto {
  const RequestInformationDto._();
  factory RequestInformationDto({
    @JsonKey(name: 'requestHeader')
        required RequestInformationHeaderDto requestHeader,
    @JsonKey(
      name: 'requestInformationV2',
      defaultValue: <ReturnRequestInformationDto>[],
    )
        required List<ReturnRequestInformationDto> requestInformation,
  }) = _RequestInformationDto;

  RequestInformation toDomain() {
    return RequestInformation(
      requestInformationHeader: requestHeader.toDomain(),
      returnRequestInformationList:
          requestInformation.map((e) => e.toDomain()).toList(),
    );
  }

  factory RequestInformationDto.fromJson(Map<String, dynamic> json) =>
      _$RequestInformationDtoFromJson(json);
}
