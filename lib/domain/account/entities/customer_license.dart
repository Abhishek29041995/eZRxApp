import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_license.freezed.dart';

@freezed
class CustomerLicense with _$CustomerLicense {
  CustomerLicense._();
  factory CustomerLicense({
    required StringValue licenseNumbers,
    required StringValue licenseType,
    required StringValue licenseDescription,
    required DateTimeStringValue validFrom,
    required DateTimeStringValue validTo,
    required StatusType status,
  }) = _CustomerLicense;

  StatusType get licenseStatus =>
      validTo.aWeekDifference ? StatusType('Expiring') : status;
}
