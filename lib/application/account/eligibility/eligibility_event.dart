part of 'eligibility_bloc.dart';

@freezed
class EligibilityEvent with _$EligibilityEvent {
  const factory EligibilityEvent.initialized() = _Initialized;

  const factory EligibilityEvent.update({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfigs,
  }) = _Update;

  const factory EligibilityEvent.registerChatBot() = _RegisterChatBot;

  const factory EligibilityEvent.selectedCustomerCode({
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) = _SelectedCustomerCode;

  const factory EligibilityEvent.updatedCustomerCodeConfig({
    required CustomerCodeConfig customerCodeConfig,
  }) = _UpdatedCustomerCodeConfig;

  const factory EligibilityEvent.loadStoredCustomerCode() =
      _LoadStoredCustomerCode;

  const factory EligibilityEvent.fetchAndPreSelectCustomerCode() =
      _FetchAndPreSelectCustomerCode;

  const factory EligibilityEvent.updateStockInfoAvailability({
    required bool isStockInfoNotAvailable,
  }) = _UpdateStockInfoAvailability;

  const factory EligibilityEvent.watchStockApiStatus() = _WatchStockApiStatus;

  const factory EligibilityEvent.watchConnectivityStatus() =
      _WatchConnectivityStatus;

  const factory EligibilityEvent.updateNetworkAvailability({
    required bool isNetworkAvailable,
  }) = _UpdateNetworkAvailability;
}
