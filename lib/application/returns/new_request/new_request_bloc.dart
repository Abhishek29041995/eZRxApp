import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/add_request_params.dart';
import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_request_repository.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_request_event.dart';
part 'new_request_state.dart';
part 'new_request_bloc.freezed.dart';

class NewRequestBloc extends Bloc<NewRequestEvent, NewRequestState> {
  final IReturnRequestRepository newRequestRepository;

  NewRequestBloc({required this.newRequestRepository})
      : super(NewRequestState.initial()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    NewRequestEvent event,
    Emitter<NewRequestState> emit,
  ) async {
    await event.map(
      initialized: (_Initialized e) {
        emit(
          NewRequestState.initial().copyWith(
            salesOrg: e.salesOrg,
          ),
        );
      },
      toggleReturnItem: (_ToggleReturnItem e) {
        final invoiceDetails = [...state.invoiceDetails];
        if (e.selected) {
          final invoiceDetail = InvoiceDetails.empty().copyWith(
            invoiceNumber: e.item.assignmentNumber,
            salesOrg: state.salesOrg,
            returnItemDetailsList: [
              e.item.validatedItemDetails,
              if (e.item.balanceQuantity.isZero)
                ...e.item.bonusItems.map(
                  (bonusItem) => bonusItem.validatedItemDetails,
                ),
            ],
          );
          emit(
            state.copyWith(
              selectedItems: [...state.selectedItems, e.item],
              invoiceDetails: [...invoiceDetails, invoiceDetail],
            ),
          );
        } else {
          emit(
            state.copyWith(
              selectedItems: [...state.selectedItems]..remove(e.item),
              invoiceDetails: invoiceDetails
                  .where(
                    (element) =>
                        element.invoiceNumber != e.item.assignmentNumber,
                  )
                  .toList(),
            ),
          );
        }
      },
      toggleBonusItem: (_ToggleBonusItem e) {
        final updatedInvoiceDetails = state.invoiceDetails.map((invoiceDetail) {
          if (invoiceDetail.invoiceNumber == e.item.assignmentNumber) {
            final returnItemDetailsList = [
              ...invoiceDetail.returnItemDetailsList,
            ];

            e.included
                ? returnItemDetailsList.add(
                    e.item.validatedItemDetails.copyWith(
                      returnType: invoiceDetail.returnItemDetailsList.isNotEmpty
                          ? invoiceDetail.returnItemDetailsList.first.returnType
                          : ReturnType.returnItem(),
                      priceOverride:
                          invoiceDetail.returnItemDetailsList.isNotEmpty
                              ? invoiceDetail
                                  .returnItemDetailsList.first.priceOverride
                              : CounterOfferValue(''),
                    ),
                  )
                : returnItemDetailsList.removeWhere(
                    (element) => element.itemNumber == e.item.itemNumber,
                  );

            return invoiceDetail.copyWith(
              returnItemDetailsList: returnItemDetailsList,
            );
          }

          return invoiceDetail;
        }).toList();

        emit(state.copyWith(invoiceDetails: updatedInvoiceDetails));
      },
      additionInfoChanged: (_AdditionInfoChanged e) {
        final invoiceDetails = state.invoiceDetails.map((invoiceDetail) {
          final detailsList = invoiceDetail.returnItemDetailsList
              .map(
                (returnItemDetail) =>
                    e.additionInfo.uuid == returnItemDetail.uuid
                        ? e.additionInfo
                        : returnItemDetail,
              )
              .toList();

          return invoiceDetail.copyWith(returnItemDetailsList: detailsList);
        }).toList();

        emit(state.copyWith(invoiceDetails: invoiceDetails));
      },
      updateRequestCounterOffer: (_UpdateRequestCounterOffer e) {
        if (e.isChangeMaterialCounterOffer) {
          final invoiceDetails = state.invoiceDetails.map((invoiceDetail) {
            final containTheUUID = invoiceDetail.returnItemDetailsList.any(
              (returnItemDetail) => e.uuid == returnItemDetail.uuid,
            );
            if (containTheUUID) {
              final detailsList = invoiceDetail.returnItemDetailsList
                  .map(
                    (returnItemDetail) => returnItemDetail.copyWith(
                      priceOverride: e.counterOfferValue,
                    ),
                  )
                  .toList();

              return invoiceDetail.copyWith(returnItemDetailsList: detailsList);
            }

            return invoiceDetail;
          }).toList();
          emit(state.copyWith(invoiceDetails: invoiceDetails));
        } else {
          final invoiceDetails = state.invoiceDetails.map((invoiceDetail) {
            final detailsList = invoiceDetail.returnItemDetailsList
                .map(
                  (returnItemDetail) => e.uuid == returnItemDetail.uuid
                      ? returnItemDetail.copyWith(
                          priceOverride: e.counterOfferValue,
                        )
                      : returnItemDetail,
                )
                .toList();

            return invoiceDetail.copyWith(returnItemDetailsList: detailsList);
          }).toList();

          emit(state.copyWith(invoiceDetails: invoiceDetails));
        }
      },
      toggleFiles: (_ToggleFiles e) {
        var invoiceDetails = [...state.invoiceDetails];
        final existFiles = state.getReturnItemDetails(e.uuid).uploadedFiles;

        if (e.included) {
          final existFileNames = existFiles.map((e) => e.name).toSet();
          final validNewFiles = e.files
              .where((element) => !existFileNames.contains(element.name))
              .toList();

          if (validNewFiles.isNotEmpty) {
            invoiceDetails = invoiceDetails.map((invoiceDetail) {
              final updatedReturnItemDetailsList =
                  invoiceDetail.returnItemDetailsList
                      .map(
                        (item) => e.uuid == item.uuid
                            ? item.copyWith(
                                uploadedFiles: [
                                  ...existFiles,
                                  ...validNewFiles,
                                ],
                              )
                            : item,
                      )
                      .toList();

              return invoiceDetail.copyWith(
                returnItemDetailsList: updatedReturnItemDetailsList,
              );
            }).toList();
          }
        } else {
          final newFileNames = e.files.map((e) => e.name).toSet();

          invoiceDetails = invoiceDetails.map((invoiceDetail) {
            final updatedReturnItemDetailsList =
                invoiceDetail.returnItemDetailsList
                    .map(
                      (item) => e.uuid == item.uuid
                          ? item.copyWith(
                              uploadedFiles: item.uploadedFiles
                                  .where(
                                    (element) =>
                                        !newFileNames.contains(element.name),
                                  )
                                  .toList(),
                            )
                          : item,
                    )
                    .toList();

            return invoiceDetail.copyWith(
              returnItemDetailsList: updatedReturnItemDetailsList,
            );
          }).toList();
        }

        emit(state.copyWith(invoiceDetails: invoiceDetails));
      },
      validateStep: (_ValidateStep e) {
        switch (e.step) {
          case 1:
            emit(
              state.copyWith(
                showErrorMessages: !state.validateForStep1,
              ),
            );
            break;
          case 2:
            emit(
              state.copyWith(
                showErrorMessages: !state.validateForStep2,
              ),
            );
            break;
          default:
        }
      },
      returnReferenceChanged: (_ReturnReferenceChanged e) {
        emit(
          state.copyWith(
            returnReference: e.returnReference,
          ),
        );
      },
      specialInstructionsChanged: (_SpecialInstructionsChanged e) {
        emit(
          state.copyWith(
            specialInstructions: e.specialInstructions,
          ),
        );
      },
      submit: (_Submit e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isSubmitting: true,
          ),
        );

        final failureOrSuccess = await newRequestRepository.addRequest(
          requestParams: AddRequestParams.empty().copyWith(
            invoiceDetails: state.validInvoiceDetails,
            returnReference: state.returnReference,
            specialInstruction: state.specialInstructions,
            soldTo: e.customerCodeInfo.customerCodeSoldTo,
            user: e.user,
          ),
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isSubmitting: false,
            ),
          ),
          (requestID) => emit(
            state.copyWith(
              failureOrSuccessOption: none(),
              isSubmitting: false,
              returnRequestId: requestID,
            ),
          ),
        );
      },
      updateSelectedReturnType: (value) {
        final invoiceDetails = state.invoiceDetails.map((invoiceDetail) {
          final detailsList = invoiceDetail.returnItemDetailsList
              .map(
                (returnItemDetail) =>
                    value.assignmentNumber == returnItemDetail.assignmentNumber
                        ? returnItemDetail.copyWith(
                            returnType: value.returnType,
                          )
                        : returnItemDetail,
              )
              .toList();

          return invoiceDetail.copyWith(returnItemDetailsList: detailsList);
        }).toList();

        emit(state.copyWith(invoiceDetails: invoiceDetails));
      },
    );
  }
}
