import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/repository/i_tender_contract_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tender_contract_detail_bloc.freezed.dart';
part 'tender_contract_detail_event.dart';
part 'tender_contract_detail_state.dart';

class TenderContractDetailBloc
    extends Bloc<TenderContractDetailEvent, TenderContractDetailState> {
  ITenderContractRepository tenderContractRepository;

  TenderContractDetailBloc({
    required this.tenderContractRepository,
  }) : super(TenderContractDetailState.initial()) {
    on<TenderContractDetailEvent>(_onEvent);
  }

  Future<void> _onEvent(TenderContractDetailEvent event, Emitter emit) async {
    await event.map(
      initialized: (_) {
        emit(TenderContractDetailState.initial());
      },
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );

        final failureOrSuccess =
            await tenderContractRepository.getTenderContractDetails(
          materialNumber: e.materialNumber,
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
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                tenderContractList: tenderContractList,
                selectedTenderContract:
                    tenderContractList.firstAvailableContract,
              ),
            );
          },
        );
      },
      select: (e) {
        if (e.tenderContract.remainingTenderQuantity == 0) {
          return;
        }
        emit(
          state.copyWith(
            selectedTenderContract: e.tenderContract,
          ),
        );
      },
      toggleSwitch: (e) {
        emit(
          state.copyWith(
            tenderContractEnable: e.enable,
          ),
        );
      },
      updateQty: (e) {
        emit(
          state.copyWith(
            inputQty: e.qty,
          ),
        );
      },
      setDefaultValueForEdit: (e) {
        emit(
          state.copyWith(
            tenderContractEnable: true,
            selectedTenderContract: e.tenderContract,
          ),
        );
      },
    );
  }
}
