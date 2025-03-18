part of 'soa_filter_bloc.dart';

@freezed
class SoaFilterEvent with _$SoaFilterEvent {
  const factory SoaFilterEvent.initialized() = _Initialized;
  const factory SoaFilterEvent.setFilter(
    SoaFilter soaFilter,
  ) = _SetFilter;
  const factory SoaFilterEvent.changeToDate(
    DateTimeStringValue toDate,
  ) = _ChangeToDate;
  const factory SoaFilterEvent.changeFormDate(
    DateTimeStringValue formDate,
  ) = _changeFormDate;
}
