part of 'national_privacy_commission_bloc.dart';

@freezed
class NationalPrivacyCommissionState with _$NationalPrivacyCommissionState {
  const factory NationalPrivacyCommissionState({
    required bool isSaving,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _NationalPrivacyCommissionState;
  factory NationalPrivacyCommissionState.initial() =>
      NationalPrivacyCommissionState(
        isSaving: false,
        failureOrSuccessOption: none(),
      );
}
