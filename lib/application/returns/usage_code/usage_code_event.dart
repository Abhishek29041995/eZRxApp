part of 'usage_code_bloc.dart';

@freezed
class UsageCodeEvent with _$UsageCodeEvent {
  const factory UsageCodeEvent.initialized() = _Initialized;

  const factory UsageCodeEvent.fetch({
    required SalesOrg salesOrg,
  }) = _Fetch;
}
