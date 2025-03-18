part of 'banner_bloc.dart';

@freezed
class BannerEvent with _$BannerEvent {
  const factory BannerEvent.initialized() = _Initialized;
  const factory BannerEvent.fetch({
    required bool isPreSalesOrg,
    required SalesOrganisation salesOrganisation,
    required String country,
    required String role,
    required String bannerType,
    required String branchCode,
    required String targetCustomerType,
  }) = _Fetch;
}
