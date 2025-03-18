part of 'material_list_bloc.dart';

@freezed
class MaterialListState with _$MaterialListState {
  const MaterialListState._();

  const factory MaterialListState({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required int materialCount,
    required List<MaterialInfo> materialList,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool canLoadMore,
    required bool isFetching,
    required bool isScanFromBarcode,
    required int nextPageIndex,
    required SearchKey searchKey,
    required MaterialFilter selectedMaterialFilter,
  }) = _MaterialListState;

  factory MaterialListState.initial() => MaterialListState(
        user: User.empty(),
        configs: SalesOrganisationConfigs.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        materialCount: 0,
        materialList: <MaterialInfo>[],
        apiFailureOrSuccessOption: none(),
        canLoadMore: true,
        isFetching: false,
        isScanFromBarcode: false,
        nextPageIndex: 0,
        searchKey: SearchKey.empty(),
        selectedMaterialFilter: MaterialFilter.empty(),
      );

  bool get isFilterSelected => selectedMaterialFilter != MaterialFilter.empty();

  bool get displaySearchResult =>
      isFilterSelected || searchKey.validateNotEmpty;
}
