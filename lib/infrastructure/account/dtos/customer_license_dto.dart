import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_license_dto.freezed.dart';
part 'customer_license_dto.g.dart';

@freezed
class CustomerLicenseDto with _$CustomerLicenseDto {
  const CustomerLicenseDto._();
  factory CustomerLicenseDto({
    @JsonKey(name: 'licenceType', defaultValue: '') required String licenseType,
    @JsonKey(name: 'licenseNumber', defaultValue: '')
        required String licenseNumber,
    @JsonKey(name: 'validFrom', defaultValue: '') required String validFrom,
    @JsonKey(name: 'validTo', defaultValue: '') required String validTo,
    @JsonKey(name: 'licenseDescription', defaultValue: '')
        required String licenseDescription,
    @JsonKey(name: 'status', defaultValue: '') required String status,
  }) = _CustomerLicenseDto;

  factory CustomerLicenseDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerLicenseDtoFromJson(json);

  CustomerLicense get toDomain => CustomerLicense(
        licenseDescription: StringValue(licenseDescription),
        licenseNumbers: StringValue(licenseNumber),
        licenseType: StringValue(licenseType),
        status: StatusType(status),
        validFrom: DateTimeStringValue(validFrom),
        validTo: DateTimeStringValue(validTo),
      );
}
