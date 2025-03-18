part of 'soa_filter_bloc.dart';

@freezed
class SoaFilterState with _$SoaFilterState {
  const factory SoaFilterState({
    required SoaFilter filter,
  }) = _Initial;

  factory SoaFilterState.initial() => SoaFilterState(filter: SoaFilter.empty());
}
