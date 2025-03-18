part of 'sales_org_bloc.dart';

@freezed
class SalesOrgState with _$SalesOrgState {
  const SalesOrgState._();
  const factory SalesOrgState({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required List<SalesOrganisation> availableSalesOrg,
    required Option<Either<ApiFailure, dynamic>> salesOrgFailureOrSuccessOption,
    required bool isLoading,
    required SearchKey searchKey,
  }) = _SalesOrgState;

  factory SalesOrgState.initial() => SalesOrgState(
        salesOrganisation: SalesOrganisation.empty(),
        configs: SalesOrganisationConfigs.empty(),
        availableSalesOrg: <SalesOrganisation>[],
        salesOrgFailureOrSuccessOption: none(),
        isLoading: false,
        searchKey: SearchKey.search(''),
      );

  bool get haveSelectedSalesOrganisation =>
      salesOrganisation != SalesOrganisation.empty();

  SalesOrg get salesOrg => salesOrganisation.salesOrg;
}
