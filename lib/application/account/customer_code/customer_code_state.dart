part of 'customer_code_bloc.dart';

@freezed
class CustomerCodeState with _$CustomerCodeState {
  const CustomerCodeState._();

  const factory CustomerCodeState({
    required bool hideCustomer,
    required User userInfo,
    required SalesOrganisation selectedSalesOrg,
    required List<CustomerCodeInfo> customerCodeList,
    required CustomerCodeConfig customerCodeConfig,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required Option<Either<ApiFailure, dynamic>> configFailureOrSuccessOption,
    required bool canLoadMore,
    required bool isFetching,
    required SearchKey searchKey,
  }) = _CustomerCodeState;

  factory CustomerCodeState.initial() => CustomerCodeState(
        hideCustomer: false,
        userInfo: User.empty(),
        selectedSalesOrg: SalesOrganisation.empty(),
        customerCodeList: [],
        apiFailureOrSuccessOption: none(),
        canLoadMore: true,
        isFetching: true,
        searchKey: SearchKey.empty(),
        customerCodeConfig: CustomerCodeConfig.empty(),
        configFailureOrSuccessOption: none(),
      );

  bool get apiSuccess => apiFailureOrSuccessOption.isNone();
}
