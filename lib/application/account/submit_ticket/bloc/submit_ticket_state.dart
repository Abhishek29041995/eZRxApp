part of 'submit_ticket_bloc.dart';

@freezed
class SubmitTicketState with _$SubmitTicketState {
  const SubmitTicketState._();

  const factory SubmitTicketState({
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required EZCSTicket ezcsTicket,
    required bool agreeToDisclaimer,
    required bool showErrorMessages,
    required bool isLoading,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool showUploadExeedMessage,
  }) = _SubmitTicketState;
  factory SubmitTicketState.initial() => SubmitTicketState(
        agreeToDisclaimer: false,
        showErrorMessages: false,
        isLoading: false,
        ezcsTicket: EZCSTicket.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        user: User.empty(),
        failureOrSuccessOption: none(),
        showUploadExeedMessage: false,
      );

  bool get enableSubmit =>
      ezcsTicket.subject.isNotEmpty &&
      ezcsTicket.description.isNotEmpty &&
      ezcsTicket.customerTicketType.isValid() &&
      ezcsTicket.ticketPriority.isValid() &&
      !showUploadExeedMessage &&
      !isLoading;

  bool get invalidAgreeToDisclaimer => showErrorMessages && !agreeToDisclaimer;
}
