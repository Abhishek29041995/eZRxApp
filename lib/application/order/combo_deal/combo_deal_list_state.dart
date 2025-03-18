part of 'combo_deal_list_bloc.dart';

@freezed
class ComboDealListState with _$ComboDealListState {
  const ComboDealListState._();
  const factory ComboDealListState({
    required Map<String, List<ComboDeal>> comboDeals,
    required PriceComboDeal priceComboDeal,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _ComboDealListState;

  factory ComboDealListState.initial() => ComboDealListState(
        comboDeals: {},
        isFetching: false,
        priceComboDeal: PriceComboDeal.empty(),
        apiFailureOrSuccessOption: none(),
      );

  ComboDeal getComboDeal({
    required String comboDealId,
  }) {
    final comboDealList = comboDeals[comboDealId];
    if (comboDealList == null || comboDealList.isEmpty) {
      return ComboDeal.empty();
    }

    return comboDealList.first;
  }
}
