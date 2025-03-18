part of 'all_credits_bloc.dart';

@freezed
class AllCreditsEvent with _$AllCreditsEvent {
  const factory AllCreditsEvent.initialized({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _initialized;
  const factory AllCreditsEvent.fetch({
    required AllCreditsFilter appliedFilter,
  }) = _Fetch;
  const factory AllCreditsEvent.loadMore() = _LoadMore;
}
