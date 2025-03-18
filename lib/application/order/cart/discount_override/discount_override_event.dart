part of 'discount_override_bloc.dart';

@freezed
class DiscountOverrideEvent with _$DiscountOverrideEvent {
  const factory DiscountOverrideEvent.fetch({
    required CustomerCodeInfo customerCode,
    required SalesOrganisation salesOrganisation,
    required MaterialInfo material,
    required MaterialNumber materialNumber,
    required ShipToInfo shipToInfo,
    required Price price,
  }) = _Fetch;

  const factory DiscountOverrideEvent.update({
    required Price price,
    required bool showErrorMessages,
  }) = _Update;
}
