part of 'contact_us_details_bloc.dart';

@freezed
class ContactUsDetailsState with _$ContactUsDetailsState {
  const ContactUsDetailsState._();

  const factory ContactUsDetailsState({
    required ContactUsDetails contactUsDetails,
    required bool isLoading,
  }) = _ContactUsDetailsState;

  factory ContactUsDetailsState.initial() => ContactUsDetailsState(
        isLoading: false,
        contactUsDetails: ContactUsDetails.empty(),
      );
}
