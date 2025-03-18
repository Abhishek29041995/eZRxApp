part of 'claim_management_bloc.dart';

@freezed
class ClaimManagementState with _$ClaimManagementState {
  const ClaimManagementState._();
  const factory ClaimManagementState({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required List<ClaimItem> items,
    required ClaimManagementFilter appliedFilter,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
  }) = _ClaimManagementState;

  factory ClaimManagementState.initial() => ClaimManagementState(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        user: User.empty(),
        failureOrSuccessOption: none(),
        isLoading: false,
        items: <ClaimItem>[],
        appliedFilter: ClaimManagementFilter.empty(),
      );

  bool get isFilterEmpty => appliedFilter == ClaimManagementFilter.empty();

  List<ClaimItem> get filterItems {
    var newList = List<ClaimItem>.from(items);
    if (!appliedFilter.searchKey.isInvalidSearchKey) {
      newList = newList
          .where(
            (item) =>
                item.principalCode.toString().contains(
                      appliedFilter.searchKey.getOrDefaultValue(''),
                    ) ||
                item.principalName.toLowerCase().contains(
                      appliedFilter.searchKey
                          .getOrDefaultValue('')
                          .toLowerCase(),
                    ),
          )
          .toList();
    }
    if (appliedFilter.claimTypes.isNotEmpty) {
      newList = newList
          .where(
            (item) => appliedFilter.claimTypes.contains(
              item.claimType,
            ),
          )
          .toList();
    }

    return newList;
  }
}
