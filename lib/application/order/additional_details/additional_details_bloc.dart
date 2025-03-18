import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/date_time_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'additional_details_bloc.freezed.dart';
part 'additional_details_event.dart';
part 'additional_details_state.dart';

class AdditionalDetailsBloc
    extends Bloc<AdditionalDetailsEvent, AdditionalDetailsState> {
  AdditionalDetailsBloc() : super(AdditionalDetailsState.initial()) {
    on<AdditionalDetailsEvent>(_onEvent);
  }

  void _onEvent(
    AdditionalDetailsEvent event,
    Emitter<AdditionalDetailsState> emit,
  ) {
    event.map(
      initialized: (value) => emit(
        AdditionalDetailsState.initial().copyWith(
          config: value.config,
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            mobileNumber: PhoneNumber(
              value.customerCodeInfo.telephoneNumber.validPhoneNumber,
            ),
          ),
        ),
      ),
      onTextChange: (value) => _onTextChange(
        label: value.label,
        newValue: value.newValue,
        emit: emit,
      ),
      validateForm: (value) => _validateAdditionalDetails(
        emit: emit,
      ),
      addPoDocument: (value) {
        emit(
          state.copyWith(
            deliveryInfoData: state.deliveryInfoData.copyWith(
              poDocuments: value.poDocuments,
            ),
            isPoAttachmentValidated: true,
          ),
        );
      },
      removePoDocument: (value) {
        final updatedPoDocuments =
            List<PoDocuments>.from(state.deliveryInfoData.poDocuments)
              ..removeWhere(
                (PoDocuments element) => element == value.poDocument,
              );
        emit(
          state.copyWith(
            deliveryInfoData: state.deliveryInfoData.copyWith(
              poDocuments: updatedPoDocuments,
            ),
            isPoAttachmentValidated: updatedPoDocuments.isNotEmpty,
          ),
        );
      },
      removeAllPoDocument: (value) => emit(
        state.copyWith(
          deliveryInfoData:
              state.deliveryInfoData.copyWith(poDocuments: <PoDocuments>[]),
        ),
      ),
      updateIncludePoisonRefDoucments: (e) {
        final isPoAttachmentValidated = e.value
            ? state.deliveryInfoData.poDocuments.isNotEmpty
            : state.deliveryInfoData.poDocuments.isNotEmpty ||
                !state.config.enablePOAttachmentRequired;

        emit(
          state.copyWith(
            deliveryInfoData: state.deliveryInfoData.copyWith(
              poisonRefDocumentsIncluded: e.value,
            ),
            isPoAttachmentValidated: state.showErrorMessages
                ? isPoAttachmentValidated
                : state.isPoAttachmentValidated,
          ),
        );
      },
      toggleGreenDelivery: (value) {
        final currentValue = state.deliveryInfoData.greenDeliveryEnabled;

        emit(
          state.copyWith(
            deliveryInfoData: state.deliveryInfoData.copyWith(
              greenDeliveryEnabled: !currentValue,
            ),
          ),
        );
      },
      initiateFromHistory: (value) {
        emit(
          AdditionalDetailsState.initial().copyWith(
            config: value.config,
            deliveryInfoData: value.data.copyWith(
              mobileNumber: PhoneNumber(
                value.data.mobileNumber.validPhoneNumber,
              ),
            ),
          ),
        );
      },
    );
  }

  void _validateAdditionalDetails({
    required Emitter<AdditionalDetailsState> emit,
  }) {
    emit(
      state.copyWith(
        focusTo: null,
        isValidated: false,
      ),
    );
    final isCustomerPoReferenceValid = state.config.poNumberRequired.getValue()
        ? state.deliveryInfoData.poReference.isValid()
        : true;

    final isContactPersonValid = state.config.enableMobileNumber
        ? state.deliveryInfoData.contactPerson.isValid()
        : true;
    final isContactNumberValid = state.config.enableMobileNumber
        ? state.deliveryInfoData.mobileNumber.isValid()
        : true;
    final isPaymentTermValid = state.config.enablePaymentTerms
        ? state.deliveryInfoData.paymentTerm.isValid()
        : true;
    final poAttachmentRequired = (state.config.enablePOAttachmentRequired ||
            state.deliveryInfoData.poisonRefDocumentsIncluded) &&
        state.config.showPOAttachment;
    final isPoUploadAttachment = poAttachmentRequired
        ? state.deliveryInfoData.poDocuments.isNotEmpty
        : true;

    final isFormValid = isCustomerPoReferenceValid &&
        isContactPersonValid &&
        isContactNumberValid &&
        isPoUploadAttachment &&
        isPaymentTermValid;

    emit(
      state.copyWith(
        isValidated: isFormValid,
        isPoAttachmentValidated: isPoUploadAttachment,
        showErrorMessages: !isFormValid,
        deliveryInfoData: isFormValid
            ? state.deliveryInfoData.formatted
            : state.deliveryInfoData,
        focusTo: !isCustomerPoReferenceValid
            ? DeliveryInfoLabel.poReference
            : !isContactPersonValid
                ? DeliveryInfoLabel.contactPerson
                : !isContactNumberValid
                    ? DeliveryInfoLabel.mobileNumber
                    : !isPaymentTermValid
                        ? DeliveryInfoLabel.paymentTerm
                        : null,
      ),
    );
  }

  void _emitAfterOnTextChange({
    required Emitter<AdditionalDetailsState> emit,
    required DeliveryInfoData deliveryInfoData,
  }) {
    emit(
      state.copyWith(
        deliveryInfoData: deliveryInfoData,
      ),
    );
  }

  void _onTextChange({
    required DeliveryInfoLabel label,
    required String newValue,
    required Emitter<AdditionalDetailsState> emit,
  }) {
    switch (label) {
      case DeliveryInfoLabel.poReference:
        _emitAfterOnTextChange(
          emit: emit,
          deliveryInfoData: state.deliveryInfoData.copyWith(
            poReference: StringValue.trimmed(newValue),
          ),
        );
        break;
      case DeliveryInfoLabel.mobileNumber:
        _emitAfterOnTextChange(
          emit: emit,
          deliveryInfoData: state.deliveryInfoData.copyWith(
            mobileNumber: PhoneNumber(newValue),
          ),
        );
        break;
      case DeliveryInfoLabel.contactPerson:
        _emitAfterOnTextChange(
          emit: emit,
          deliveryInfoData: state.deliveryInfoData.copyWith(
            contactPerson: StringValue.trimmed(newValue),
          ),
        );
        break;
      case DeliveryInfoLabel.deliveryDate:
        _emitAfterOnTextChange(
          emit: emit,
          deliveryInfoData: state.deliveryInfoData.copyWith(
            deliveryDate: DateTimeStringValue(newValue),
          ),
        );
        break;
      case DeliveryInfoLabel.paymentTerm:
        _emitAfterOnTextChange(
          emit: emit,
          deliveryInfoData: state.deliveryInfoData.copyWith(
            paymentTerm: PaymentTerm(newValue),
          ),
        );
        break;
      case DeliveryInfoLabel.referenceNote:
        _emitAfterOnTextChange(
          emit: emit,
          deliveryInfoData: state.deliveryInfoData.copyWith(
            referenceNote: StringValue.trimmed(newValue),
          ),
        );
        break;
      case DeliveryInfoLabel.deliveryInstruction:
        _emitAfterOnTextChange(
          emit: emit,
          deliveryInfoData: state.deliveryInfoData.copyWith(
            deliveryInstruction: StringValue.trimmed(newValue),
          ),
        );
        break;
    }
  }
}
