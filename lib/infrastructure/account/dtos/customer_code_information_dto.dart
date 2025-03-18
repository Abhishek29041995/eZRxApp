import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_code_information_dto.freezed.dart';

part 'customer_code_information_dto.g.dart';

@freezed
class CustomerInformationDTO with _$CustomerInformationDTO {
  const CustomerInformationDTO._();

  const factory CustomerInformationDTO({
    @JsonKey(name: 'shipToCount', defaultValue: 0) required int shipToCount,
    @JsonKey(name: 'SoldToInformation', defaultValue: [])
        required List<CustomerCodeDto> soldToInformation,
  }) = _CustomerInformationDTO;

  CustomerInformation toDomain() {
    return CustomerInformation(
      shipToCount: shipToCount,
      soldToInformation: soldToInformation.map((e) => e.toDomain()).toList(),
    );
  }

  factory CustomerInformationDTO.fromJson(Map<String, dynamic> json) =>
      _$CustomerInformationDTOFromJson(json);
}
