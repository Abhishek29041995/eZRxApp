part of 'submit_ticket_bloc.dart';

@freezed
class SubmitTicketEvent with _$SubmitTicketEvent {
  const factory SubmitTicketEvent.initialize({
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required String chatUrl,
  }) = _Initialize;
  const factory SubmitTicketEvent.selectTicketType({
    required CustomerTicketType customerTicketType,
  }) = _SelectTicketType;
  const factory SubmitTicketEvent.selectTicketSubCategoryType({
    required CustomerTicketSubCategoryType customerTicketSubCategoryType,
  }) = _SelectTicketSubCategoryType;
  const factory SubmitTicketEvent.selectPriority({
    required TicketPriority ticketPriority,
  }) = _SelectPriority;
  const factory SubmitTicketEvent.disclaimerConsent({
    required bool newValue,
  }) = _DisclaimerConsent;
  const factory SubmitTicketEvent.onTextChange({
    required SubmitTicketLabel label,
    required String newValue,
  }) = _OnTextChange;
  const factory SubmitTicketEvent.validateForm() = _ValidateForm;
  const factory SubmitTicketEvent.addPoDocument({
    required List<PlatformFile> poDocuments,
  }) = _AddPoDocument;
  const factory SubmitTicketEvent.removePoDocument({
    required PlatformFile poDocument,
  }) = _RemovePoDocument;
  const factory SubmitTicketEvent.submitTicket() = _SubmitTicket;
}

enum SubmitTicketLabel {
  subject,
  description,
  orderNumber,
  productName,
  productSkuCode,
  quantityOrdered
}
