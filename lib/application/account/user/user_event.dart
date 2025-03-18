part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.initialized() = _Initialized;
  const factory UserEvent.fetch() = _Fetch;
  const factory UserEvent.acceptTnc() = _AcceptTnc;
  const factory UserEvent.setMarketPlaceTncAcceptance(
    MarketPlaceTnCAcceptance value,
  ) = _SetMarketPlaceTncAcceptance;
  const factory UserEvent.updateLanguage(Language language) = _UpdateLanguage;
  const factory UserEvent.selectLanguage(Language language) = _SelectLanguage;
  const factory UserEvent.selectOrderType({
    required DocumentType orderType,
  }) = _SelectOrderType;
  const factory UserEvent.fetchSalesRepInfo() = _FetchSalesRepinfo;
  const factory UserEvent.setAppFirstLaunch() = _SetAppFirstLaunch;
}
