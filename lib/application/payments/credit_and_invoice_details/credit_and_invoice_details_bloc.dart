import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/domain/payments/repository/i_all_credits_and_invoices_repository.dart';
import 'package:ezrxmobile/domain/payments/repository/i_credit_and_invoice_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_and_invoice_details_event.dart';
part 'credit_and_invoice_details_state.dart';
part 'credit_and_invoice_details_bloc.freezed.dart';

class CreditAndInvoiceDetailsBloc
    extends Bloc<CreditAndInvoiceDetailsEvent, CreditAndInvoiceDetailsState> {
  final ICreditAndInvoiceDetailsRepository creditAndInvoiceDetailsRepository;
  final IAllCreditsAndInvoicesRepository allCreditsAndInvoicesRepository;

  CreditAndInvoiceDetailsBloc({
    required this.creditAndInvoiceDetailsRepository,
    required this.allCreditsAndInvoicesRepository,
  }) : super(CreditAndInvoiceDetailsState.initial()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    CreditAndInvoiceDetailsEvent event,
    Emitter<CreditAndInvoiceDetailsState> emit,
  ) async {
    await event.map(
      initialized: (event) {
        emit(
          CreditAndInvoiceDetailsState.initial().copyWith(
            salesOrganisation: event.salesOrganisation,
            customerCodeInfo: event.customerCodeInfo,
          ),
        );
      },
      fetch: (event) async {
        emit(
          state.copyWith(
            isLoading: true,
            basicInfo: event.creditAndInvoiceItem,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await creditAndInvoiceDetailsRepository.getCreditAndInvoiceDetails(
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          creditAndInvoiceItem: event.creditAndInvoiceItem,
          isMarketPlace: event.isMarketPlace,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
          (data) {
            emit(
              state.copyWith(
                itemsInfo: data.validItems,
                basicInfo: event.creditAndInvoiceItem,
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
        );
      },
      fetchInvoiceById: (event) async {
        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
        );

        final searchFailureOrSuccess =
            await allCreditsAndInvoicesRepository.filterInvoices(
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          filter: AllInvoicesFilter.defaultFilter().copyWith(
            searchKey: SearchKey.search(event.invoiceId),
          ),
          pageSize: 1,
          offset: 0,
          isMarketPlace: false,
        );

        await searchFailureOrSuccess.fold(
          (_) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(searchFailureOrSuccess),
                isLoading: false,
              ),
            );
          },
          (invoiceItems) async {
            final basicInfo =
                invoiceItems.firstOrNull ?? CreditAndInvoiceItem.empty();

            final detailFailureOrSuccess =
                await creditAndInvoiceDetailsRepository
                    .getCreditAndInvoiceDetails(
              salesOrganisation: state.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
              creditAndInvoiceItem: basicInfo,
              isMarketPlace: event.isMarketPlace,
            );

            detailFailureOrSuccess.fold(
              (_) {
                emit(
                  state.copyWith(
                    basicInfo: basicInfo,
                    failureOrSuccessOption: optionOf(detailFailureOrSuccess),
                    isLoading: false,
                  ),
                );
              },
              (data) {
                emit(
                  state.copyWith(
                    basicInfo: basicInfo,
                    itemsInfo: data,
                    failureOrSuccessOption: optionOf(detailFailureOrSuccess),
                    isLoading: false,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
