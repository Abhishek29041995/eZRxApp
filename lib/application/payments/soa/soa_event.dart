part of 'soa_bloc.dart';

@freezed
class SoaEvent with _$SoaEvent {
  const factory SoaEvent.initialized() = _initialized;

  const factory SoaEvent.fetch({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrg salesOrg,
  }) = _Fetch;

  const factory SoaEvent.updateFilter({
    required SoaFilter soaFilter,
  }) = _UpdateFilter;
}
