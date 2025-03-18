part of 'material_list_bloc.dart';

@freezed
class MaterialListEvent with _$MaterialListEvent {
  const factory MaterialListEvent.initialized({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required MaterialFilter selectedMaterialFilter,
  }) = _Initialized;
  const factory MaterialListEvent.watchFavoriteStatus() = _WatchFavoriteStatus;
  const factory MaterialListEvent.updateFavoriteStatus({
    required MaterialInfo updatedMaterial,
  }) = _UpdateFavoriteStatus;
  factory MaterialListEvent.fetch({
    required MaterialFilter selectedMaterialFilter,
  }) = _Fetch;
  factory MaterialListEvent.fetchStock({
    required List<MaterialInfo> materials,
  }) = _FetchStock;

  const factory MaterialListEvent.updateSearchKey({required String searchKey}) =
      _UpdateSearchKey;

  const factory MaterialListEvent.loadMore() = _LoadMore;

  factory MaterialListEvent.addFavourite({
    required MaterialInfo item,
  }) = _AddFavourite;

  factory MaterialListEvent.deleteFavourite({
    required MaterialInfo item,
  }) = _DeleteFavourite;
}
