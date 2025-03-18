import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/repository/i_tender_contract_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tender_contract_bloc.freezed.dart';

part 'tender_contract_event.dart';

part 'tender_contract_state.dart';

class TenderContractBloc
    extends Bloc<TenderContractEvent, TenderContractState> {
  ITenderContractRepository tenderContractRepository;

  TenderContractBloc({
    required this.tenderContractRepository,
  }) : super(TenderContractState.initial()) {
    on<TenderContractEvent>(_onEvent);
  }

  Future<void> _onEvent(TenderContractEvent event, Emitter emit) async {
    await event.map(
      initialized: (_) {
        emit(TenderContractState.initial());
      },
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            isFetching: true,
            tenderContractList: [],
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await tenderContractRepository.getTenderContractDetails(
          materialNumber: e.materialInfo.materialNumber,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (tenderContractList) {
            add(
              TenderContractEvent.selected(
                tenderContract: tenderContractList.getDefaultSelected(
                  currentTenderContract: e.defaultSelectedTenderContract,
                ),
              ),
            );

            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                tenderContractList: tenderContractList.withNoContractItem,
              ),
            );
          },
        );
      },
      selected: (e) {
        emit(
          state.copyWith(
            isFetching: false,
            selectedTenderContract: e.tenderContract,
          ),
        );
      },
      unselected: (e) {
        emit(
          state.copyWith(
            selectedTenderContract: TenderContract.empty(),
          ),
        );
      },
    );
  }
}
