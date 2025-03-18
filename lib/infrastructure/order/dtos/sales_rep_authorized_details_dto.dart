import 'package:ezrxmobile/domain/account/entities/sales_rep_authorized_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_rep_authorized_details_dto.freezed.dart';
part 'sales_rep_authorized_details_dto.g.dart';

@freezed
class SalesRepAuthorizedDetailsDto with _$SalesRepAuthorizedDetailsDto {
  const SalesRepAuthorizedDetailsDto._();

  const factory SalesRepAuthorizedDetailsDto({
    @JsonKey(name: 'movApproval', defaultValue: '') required String movApproval,
    @JsonKey(name: 'movReason', defaultValue: '') required String movReason,
  }) = _SalesRepAuthorizedDetailsDto;

  factory SalesRepAuthorizedDetailsDto.empty() =>
      const SalesRepAuthorizedDetailsDto(
        movApproval: '',
        movReason: '',
      );

  factory SalesRepAuthorizedDetailsDto.fromDomain(
    SalesRepAuthorizedDetails salesRepAuthorizedDetails,
  ) {
    return SalesRepAuthorizedDetailsDto(
      movApproval: salesRepAuthorizedDetails.movApproval,
      movReason: salesRepAuthorizedDetails.movReason,
    );
  }
  SalesRepAuthorizedDetails get toDomain => SalesRepAuthorizedDetails(
        movApproval: movApproval,
        movReason: movReason,
        sendPayload: true,
      );

  factory SalesRepAuthorizedDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$SalesRepAuthorizedDetailsDtoFromJson(json);
}
