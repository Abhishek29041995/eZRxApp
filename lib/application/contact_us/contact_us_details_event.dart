part of 'contact_us_details_bloc.dart';

@freezed
class ContactUsDetailsEvent with _$ContactUsDetailsEvent {
  const factory ContactUsDetailsEvent.fetch({
    required AppMarket market,
  }) = _Fetch;
}
