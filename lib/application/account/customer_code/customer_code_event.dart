part of 'customer_code_bloc.dart';

@freezed
class CustomerCodeEvent with _$CustomerCodeEvent {
  const factory CustomerCodeEvent.initialized({
    required bool hideCustomer,
    required User userInfo,
    required SalesOrganisation selectedSalesOrg,
  }) = _Initialized;

  const factory CustomerCodeEvent.fetch({
    required SearchKey searchValue,
  }) = _Fetch;

  const factory CustomerCodeEvent.loadMore() = _LoadMore;

  const factory CustomerCodeEvent.fetchCustomerCodeConfig({
    required CustomerCodeInfo customerCodeInfo,
  }) = _FetchCustomerCodeConfig;
}
