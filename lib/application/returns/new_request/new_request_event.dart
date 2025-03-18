part of 'new_request_bloc.dart';

@freezed
class NewRequestEvent with _$NewRequestEvent {
  const factory NewRequestEvent.initialized({
    required SalesOrg salesOrg,
  }) = _Initialized;

  const factory NewRequestEvent.toggleReturnItem({
    required ReturnMaterial item,
    required bool selected,
  }) = _ToggleReturnItem;

  const factory NewRequestEvent.toggleBonusItem({
    required ReturnMaterial item,
    required bool included,
  }) = _ToggleBonusItem;

  const factory NewRequestEvent.additionInfoChanged({
    required ReturnItemDetails additionInfo,
  }) = _AdditionInfoChanged;

  const factory NewRequestEvent.updateRequestCounterOffer({
    required CounterOfferValue counterOfferValue,
    required String uuid,
    required bool isChangeMaterialCounterOffer,
  }) = _UpdateRequestCounterOffer;

  const factory NewRequestEvent.toggleFiles({
    required String uuid,
    required List<PoDocuments> files,
    required bool included,
  }) = _ToggleFiles;

  const factory NewRequestEvent.validateStep({
    required int step,
  }) = _ValidateStep;

  const factory NewRequestEvent.returnReferenceChanged(
    String returnReference,
  ) = _ReturnReferenceChanged;

  const factory NewRequestEvent.specialInstructionsChanged(
    String specialInstructions,
  ) = _SpecialInstructionsChanged;

  const factory NewRequestEvent.submit({
    required CustomerCodeInfo customerCodeInfo,
    required User user,
  }) = _Submit;
  const factory NewRequestEvent.updateSelectedReturnType({
    required ReturnType returnType,
    required String assignmentNumber,
  }) = _updateSelectedType;
}
