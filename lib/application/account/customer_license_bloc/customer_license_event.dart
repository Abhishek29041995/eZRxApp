part of 'customer_license_bloc.dart';

@freezed
class CustomerLicenseEvent with _$CustomerLicenseEvent {
  const factory CustomerLicenseEvent.initialized({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerInfo,
    required User user,
  }) = _Initialized;
  const factory CustomerLicenseEvent.fetch() = _Fetch;
  const factory CustomerLicenseEvent.loadMore() = _LoadMore;
}
