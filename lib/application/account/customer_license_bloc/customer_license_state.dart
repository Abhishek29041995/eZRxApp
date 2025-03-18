part of 'customer_license_bloc.dart';

@freezed
class CustomerLicenseState with _$CustomerLicenseState {
  const CustomerLicenseState._();
  const factory CustomerLicenseState({
    required bool isFetching,
    required bool canLoadMore,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<CustomerLicense> customerLicenses,
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerInfo,
    required User user,
  }) = _CustomerLicenseState;

  factory CustomerLicenseState.initial() => CustomerLicenseState(
        isFetching: false,
        canLoadMore: false,
        failureOrSuccessOption: none(),
        customerLicenses: <CustomerLicense>[],
        customerInfo: CustomerCodeInfo.empty(),
        salesOrganization: SalesOrganisation.empty(),
        user: User.empty(),
      );

  bool get isLicenseExpired =>
      salesOrganization.salesOrg.isID &&
      customerLicenses
          .any((element) => !element.validTo.isDateMoreThanAWeekAway);
}
