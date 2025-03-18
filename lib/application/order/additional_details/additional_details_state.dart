part of 'additional_details_bloc.dart';

@freezed
class AdditionalDetailsState with _$AdditionalDetailsState {
  const AdditionalDetailsState._();

  const factory AdditionalDetailsState({
    required DeliveryInfoData deliveryInfoData,
    required String orderId,
    required bool isValidated,
    required bool isPoAttachmentValidated,
    required bool isLoading,
    required bool showErrorMessages,
    required SalesOrganisationConfigs config,
    DeliveryInfoLabel? focusTo,
  }) = _AdditionalDetailsState;

  factory AdditionalDetailsState.initial() => AdditionalDetailsState(
        deliveryInfoData: DeliveryInfoData.empty(),
        orderId: '',
        isValidated: false,
        isPoAttachmentValidated: true,
        isLoading: false,
        showErrorMessages: false,
        config: SalesOrganisationConfigs.empty(),
      );

  String get displayDeliveryDate {
    final dateTime = DateFormat(DateTimeFormatString.apiDateWithDashFormat)
        .tryParse(deliveryInfoData.deliveryDate.getValue());

    return dateTime == null
        ? ''
        : DateTimeUtils.getDeliveryDateString(dateTime);
  }
}
