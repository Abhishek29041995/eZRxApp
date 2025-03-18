import 'package:ezrxmobile/domain/account/entities/external_sales_representative_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'external_sales_representative_info_dto.freezed.dart';
part 'external_sales_representative_info_dto.g.dart';

@freezed
class ExternalSalesRepresentativeInfoDto
    with _$ExternalSalesRepresentativeInfoDto {
  const ExternalSalesRepresentativeInfoDto._();

  const factory ExternalSalesRepresentativeInfoDto({
    @JsonKey(name: 'userId') required int userId,
    @JsonKey(name: 'userName') required String userName,
  }) = _ExternalSalesRepresentativeInfoDto;
  factory ExternalSalesRepresentativeInfoDto.fromDomain(
    ExternalSalesRepresentativeInfo externalSalesRepresentativeInfo,
  ) {
    return ExternalSalesRepresentativeInfoDto(
      userId: externalSalesRepresentativeInfo.userId,
      userName: externalSalesRepresentativeInfo.userName,
    );
  }
  ExternalSalesRepresentativeInfo toDomain() {
    return ExternalSalesRepresentativeInfo(
      userId: userId,
      userName: userName,
    );
  }

  factory ExternalSalesRepresentativeInfoDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ExternalSalesRepresentativeInfoDtoFromJson(json);
}
