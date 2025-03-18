part of 'material_filter_bloc.dart';

@freezed
class MaterialFilterState with _$MaterialFilterState {
  const MaterialFilterState._();
  const factory MaterialFilterState({
    required MaterialFilter materialFilter,
    required SearchKey searchKey,
    required SalesOrganisation salesOrganisation,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
    required bool hasAccessToCovidMaterial,
  }) = _MaterialFilterState;

  factory MaterialFilterState.initial() => MaterialFilterState(
        salesOrganisation: SalesOrganisation.empty(),
        isFetching: false,
        materialFilter: const MaterialFilter(
          countryMapOptions: <MaterialFilterCountry, bool>{},
          manufactureMapOptions: <String, bool>{},
          brandList: <String>[],
        ),
        searchKey: SearchKey.empty(),
        hasAccessToCovidMaterial: false,
        apiFailureOrSuccessOption: none(),
      );

  List<Sort> get displaySortFilter {
    final sortList = List<Sort>.from(Sort.values);

    if (!salesOrganisation.salesOrg.isID) {
      sortList.removeWhere((e) => e.isPriceSort);
    }

    return sortList;
  }

  MaterialFilter get displayMaterialFilter => MaterialFilter(
        manufactureMapOptions: Map<String, bool>.fromEntries(
          materialFilter.manufactureMapOptions.entries.where(
            (element) => element.key
                .toLowerCase()
                .contains(searchKey.getValue().toLowerCase()),
          ),
        ),
        countryMapOptions: Map<MaterialFilterCountry, bool>.fromEntries(
          materialFilter.countryMapOptions.entries.where(
            (element) => element.key.name
                .toLowerCase()
                .contains(searchKey.getValue().toLowerCase()),
          ),
        ),
        brandList: <String>[],
      );
}
