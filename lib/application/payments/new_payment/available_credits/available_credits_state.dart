part of 'available_credits_bloc.dart';

@freezed
class AvailableCreditsState with _$AvailableCreditsState {
  const AvailableCreditsState._();
  const factory AvailableCreditsState({
    required List<CustomerOpenItem> items,
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required bool canLoadMore,
    required AvailableCreditFilter appliedFilter,
    required SearchKey searchKey,
  }) = _AvailableCreditsState;

  factory AvailableCreditsState.initial() => AvailableCreditsState(
        failureOrSuccessOption: none(),
        isLoading: false,
        canLoadMore: true,
        items: <CustomerOpenItem>[],
        appliedFilter: AvailableCreditFilter.defaultFilter(),
        searchKey: SearchKey.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganization: SalesOrganisation.empty(),
      );

  bool get isSearchAndFilterEmpty =>
      searchKey.isValueEmpty &&
      appliedFilter == AvailableCreditFilter.defaultFilter();
}
