part of 'contact_us_bloc.dart';

@freezed
class ContactUsState with _$ContactUsState {
  const ContactUsState._();

  const factory ContactUsState({
    required ContactUs contactUs,
    required AppMarket appMarket,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isSubmitting,
    required bool showErrorMessage,
    required bool responseFlag,
  }) = _ContactUsState;

  factory ContactUsState.initial() => ContactUsState(
        contactUs: ContactUs.empty(),
        appMarket: AppMarket.defaultMarket(),
        apiFailureOrSuccessOption: none(),
        isSubmitting: false,
        showErrorMessage: false,
        responseFlag: false,
      );
}
