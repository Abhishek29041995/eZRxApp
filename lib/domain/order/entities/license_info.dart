import 'package:freezed_annotation/freezed_annotation.dart';

part 'license_info.freezed.dart';

@freezed
class LicenseInfo with _$LicenseInfo {
  const LicenseInfo._();

  const factory LicenseInfo({
    required String licenceType,
    required String licenseDescription,
    required String licenseNumber,
    required String validFrom,
    required String validTo,
  }) = _LicenseInfo;
}
