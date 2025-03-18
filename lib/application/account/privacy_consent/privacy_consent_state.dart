part of 'privacy_consent_bloc.dart';

@freezed
class PrivacyConsentState with _$PrivacyConsentState {
  const PrivacyConsentState._();

  const factory PrivacyConsentState({
    required bool isLoading,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required Option<Either<ApiFailure, dynamic>> submitFailureOrSuccessOption,
    required PrivacyControl previousPrivacyControl,
    required PrivacyControl currentPrivacyControl,
  }) = _PrivacyConsentState;

  factory PrivacyConsentState.initial() => PrivacyConsentState(
        isLoading: false,
        failureOrSuccessOption: none(),
        submitFailureOrSuccessOption: none(),
        previousPrivacyControl: PrivacyControl.empty(),
        currentPrivacyControl: PrivacyControl.empty(),
      );

  bool get enableSubmit => previousPrivacyControl != currentPrivacyControl;
}
