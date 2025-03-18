import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ezcs_ticket.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_ezcs_ticket_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_ticket_event.dart';
part 'submit_ticket_state.dart';
part 'submit_ticket_bloc.freezed.dart';

class SubmitTicketBloc extends Bloc<SubmitTicketEvent, SubmitTicketState> {
  final IEZCSTicketRepository ezcsTicketRepository;
  final Config config;

  SubmitTicketBloc({
    required this.ezcsTicketRepository,
    required this.config,
  }) : super(SubmitTicketState.initial()) {
    on<SubmitTicketEvent>(_onEvent);
  }

  Future<void> _onEvent(
    SubmitTicketEvent event,
    Emitter<SubmitTicketState> emit,
  ) async {
    await event.map(
      initialize: (e) {
        emit(
          SubmitTicketState.initial().copyWith(
            customerCodeInfo: e.customerCodeInfo,
            shipToInfo: e.shipToInfo,
            user: e.user,
            ezcsTicket: EZCSTicket.empty().copyWith(
              userEmail: e.user.email.getOrDefaultValue(''),
              ticketPriority: TicketPriority.low(),
              customerTicketSubCategory:
                  CustomerTicketSubCategoryType.accountOpeningCreation(),
              chatUrl: e.chatUrl,
            ),
          ),
        );
      },
      selectTicketType: (e) {
        emit(
          state.copyWith(
            ezcsTicket: state.ezcsTicket.copyWith(
              customerTicketType: e.customerTicketType,
            ),
          ),
        );
      },
      selectTicketSubCategoryType: (e) {
        emit(
          state.copyWith(
            ezcsTicket: state.ezcsTicket.copyWith(
              customerTicketSubCategory: e.customerTicketSubCategoryType,
            ),
          ),
        );
      },
      selectPriority: (e) {
        emit(
          state.copyWith(
            ezcsTicket: state.ezcsTicket.copyWith(
              ticketPriority: e.ticketPriority,
            ),
          ),
        );
      },
      disclaimerConsent: (e) {
        emit(
          state.copyWith(
            agreeToDisclaimer: e.newValue,
          ),
        );
      },
      onTextChange: (e) {
        _onTextChange(emit: emit, label: e.label, newValue: e.newValue);
      },
      validateForm: (e) {
        _validateSubmitTicket(emit: emit);
      },
      addPoDocument: (e) {
        emit(
          state.copyWith(
            showUploadExeedMessage:
                e.poDocuments.totalFilesExceed(config.maximumUploadSize),
            ezcsTicket: state.ezcsTicket.copyWith(
              documents: e.poDocuments,
            ),
          ),
        );
      },
      removePoDocument: (e) {
        final updatedPoDocuments =
            List<PlatformFile>.from(state.ezcsTicket.documents)
              ..removeWhere(
                (PlatformFile element) => element == e.poDocument,
              );
        emit(
          state.copyWith(
            showUploadExeedMessage:
                updatedPoDocuments.totalFilesExceed(config.maximumUploadSize),
            ezcsTicket: state.ezcsTicket.copyWith(
              documents: updatedPoDocuments,
            ),
          ),
        );
      },
      submitTicket: (e) async {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );

        final failureOrSuccess = await ezcsTicketRepository.submitTicket(
          ezcsTicket: state.ezcsTicket,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
        );

        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
          (_) => emit(
            state.copyWith(
              failureOrSuccessOption: none(),
              isLoading: false,
            ),
          ),
        );
      },
    );
  }

  void _validateSubmitTicket({
    required Emitter<SubmitTicketState> emit,
  }) {
    final isOrderNumberValid =
        state.ezcsTicket.customerTicketType.isOrderRelated
            ? state.ezcsTicket.orderNumber.isNotEmpty
            : true;

    final isFormValid =
        state.enableSubmit && isOrderNumberValid && state.agreeToDisclaimer;

    emit(
      state.copyWith(
        showErrorMessages: !isFormValid,
      ),
    );

    if (isFormValid) {
      add(const SubmitTicketEvent.submitTicket());
    }
  }

  void _onTextChange({
    required SubmitTicketLabel label,
    required String newValue,
    required Emitter<SubmitTicketState> emit,
  }) {
    switch (label) {
      case SubmitTicketLabel.subject:
        emit(
          state.copyWith(
            ezcsTicket: state.ezcsTicket.copyWith(subject: newValue),
          ),
        );
        break;
      case SubmitTicketLabel.description:
        emit(
          state.copyWith(
            ezcsTicket: state.ezcsTicket.copyWith(description: newValue),
          ),
        );
        break;
      case SubmitTicketLabel.orderNumber:
        emit(
          state.copyWith(
            ezcsTicket: state.ezcsTicket.copyWith(orderNumber: newValue),
          ),
        );
        break;
      case SubmitTicketLabel.productName:
        emit(
          state.copyWith(
            ezcsTicket: state.ezcsTicket.copyWith(productName: newValue),
          ),
        );
        break;
      case SubmitTicketLabel.productSkuCode:
        emit(
          state.copyWith(
            ezcsTicket: state.ezcsTicket.copyWith(productSkuCode: newValue),
          ),
        );
        break;
      case SubmitTicketLabel.quantityOrdered:
        emit(
          state.copyWith(
            ezcsTicket: state.ezcsTicket.copyWith(quantityOrdered: newValue),
          ),
        );
        break;
    }
  }
}
