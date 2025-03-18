part of 'additional_details_bloc.dart';

@freezed
class AdditionalDetailsEvent with _$AdditionalDetailsEvent {
  const factory AdditionalDetailsEvent.initialized({
    required SalesOrganisationConfigs config,
    required CustomerCodeInfo customerCodeInfo,
  }) = _Initialized;
  const factory AdditionalDetailsEvent.onTextChange({
    required DeliveryInfoLabel label,
    required String newValue,
  }) = _AdditionalDetailsTextOnChange;
  const factory AdditionalDetailsEvent.validateForm() =
      _AdditionalDetailsValidateForm;
  const factory AdditionalDetailsEvent.addPoDocument({
    required List<PoDocuments> poDocuments,
  }) = _AdditionalDetailsAddPoDocument;
  const factory AdditionalDetailsEvent.removePoDocument({
    required PoDocuments poDocument,
  }) = _AdditionalDetailsRemovePoDocument;
  const factory AdditionalDetailsEvent.removeAllPoDocument() =
      _AdditionalDetailsRemoveAllPoDocument;
  const factory AdditionalDetailsEvent.toggleGreenDelivery() =
      _AdditionalDetailsToggleGreenDelivery;
  const factory AdditionalDetailsEvent.updateIncludePoisonRefDoucments(
    bool value,
  ) = _UpdateIncludePoisonRefDoucments;
  const factory AdditionalDetailsEvent.initiateFromHistory({
    required SalesOrganisationConfigs config,
    required DeliveryInfoData data,
  }) = _AdditionalDetailsInitiateFromHistory;
}

enum DeliveryInfoLabel {
  poReference,
  deliveryInstruction,
  referenceNote,
  contactPerson,
  mobileNumber,
  paymentTerm,
  deliveryDate
}
