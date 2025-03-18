part of 'deep_linking_bloc.dart';

@freezed
class DeepLinkingEvent with _$DeepLinkingEvent {
  const factory DeepLinkingEvent.initialize() = _Initialize;
  const factory DeepLinkingEvent.addPendingLink(
    EzrxLink link, {
    EZReachBanner? banner,
  }) = _AddPendingLink;
  const factory DeepLinkingEvent.consumePendingLink({
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
    required MaterialFilter materialFilter,
  }) = _ConsumePendingLink;
}
