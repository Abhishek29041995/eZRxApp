part of 'all_credits_filter_bloc.dart';

@freezed
class AllCreditsFilterEvent with _$AllCreditsFilterEvent {
  const factory AllCreditsFilterEvent.initialized() = _Initialized;

  const factory AllCreditsFilterEvent.openFilterBottomSheet({
    required AllCreditsFilter appliedFilter,
  }) = _OpenFilterBottomSheet;

  const factory AllCreditsFilterEvent.validateFilters() = _ValidateFilters;

  const factory AllCreditsFilterEvent.amountValueFromChanged(
    String amountValueFrom,
  ) = _AmountValueFromChanged;

  const factory AllCreditsFilterEvent.amountValueToChanged(
    String amountValueTo,
  ) = _AmountValueToChanged;

  const factory AllCreditsFilterEvent.statusChanged(
    String filterStatus,
    bool selected,
  ) = _StatusChanged;

  const factory AllCreditsFilterEvent.setDocumentDate(
    DateTimeRange dateRange,
  ) = _SetDocumentDate;
}
