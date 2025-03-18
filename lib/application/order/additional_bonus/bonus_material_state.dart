part of 'bonus_material_bloc.dart';

@freezed
class BonusMaterialState with _$BonusMaterialState {
  const BonusMaterialState._();
  const factory BonusMaterialState({
    required bool isFetching,
    required bool isUpdatingStock,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<MaterialInfo> bonusItemList,
    required bool canLoadMore,
    required bool isBonusQtyValidated,
    required SearchKey searchKey,
    required List<BonusSampleItem> addedBonusItemsList,
  }) = _BonusMaterialState;

  factory BonusMaterialState.initial() => BonusMaterialState(
        failureOrSuccessOption: none(),
        bonusItemList: <MaterialInfo>[],
        canLoadMore: true,
        isFetching: false,
        isUpdatingStock: false,
        isBonusQtyValidated: true,
        searchKey: SearchKey.empty(),
        addedBonusItemsList: <BonusSampleItem>[],
      );

  StringValue bonusItemID(MaterialNumber matNumber) => addedBonusItemsList
      .firstWhere(
        (element) => element.materialNumber == matNumber,
        orElse: () => BonusSampleItem.empty(),
      )
      .itemId;
}
