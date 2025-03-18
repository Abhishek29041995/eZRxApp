part of 'full_summary_bloc.dart';

@freezed
class FullSummaryEvent with _$FullSummaryEvent {
  const factory FullSummaryEvent.initialized({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _initialized;
  const factory FullSummaryEvent.fetch({
    required FullSummaryFilter appliedFilter,
  }) = _Fetch;
  const factory FullSummaryEvent.loadMore() = _LoadMore;
}
