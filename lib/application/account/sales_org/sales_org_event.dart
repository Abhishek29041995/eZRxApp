part of 'sales_org_bloc.dart';

@freezed
class SalesOrgEvent with _$SalesOrgEvent {
  const factory SalesOrgEvent.initialized() = _Initialized;
  const factory SalesOrgEvent.selected({
    required SalesOrganisation salesOrganisation,
  }) = _Selected;
  const factory SalesOrgEvent.loadSavedOrganisation({
    required List<SalesOrganisation> salesOrganisations,
  }) = _LoadSavedOrganisation;
  const factory SalesOrgEvent.fetchAvailableSalesOrg({
    required List<SalesOrganisation> avialableSalesOrgList,
  }) = _FetchAvailableSalesOrg;
  const factory SalesOrgEvent.searchSalesOrg({
    required SearchKey searchKey,
    required List<SalesOrganisation> salesOrgList,
  }) = _SearchSalesOrg;
}
