part of 'national_privacy_commission_bloc.dart';

@freezed
class NationalPrivacyCommissionEvent with _$NationalPrivacyCommissionEvent {
  const factory NationalPrivacyCommissionEvent.initialized() = _Initialized;
  const factory NationalPrivacyCommissionEvent.saveImages({
    required List<String> images,
  }) = _SaveImages;
}
