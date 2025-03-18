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

part 'tender_contract_list_event.dart';
part 'tender_contract_list_state.dart';
part 'tender_contract_list_bloc.freezed.dart';

class TenderContractListBloc
    extends Bloc<TenderContractListEvent, TenderContractListState> {
  ITenderContractRepository tenderContractRepository;
  TenderContractListBloc({
    required this.tenderContractRepository,
  }) : super(TenderContractListState.initial()) {
    on<TenderContractListEvent>(_onEvent);
  }

  Future<void> _onEvent(
    TenderContractListEvent event,
    Emitter<TenderContractListState> emit,
  ) async {
    await event.map(
      initialize: (e) {
        emit(
          TenderContractListState.initial(),
        );
      },
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );

        final fetchingMaterialNumbers = e.materialNumbers
            .where(
              (item) => !state.tenderContracts.containsKey(item),
            )
            .toList();

        if (fetchingMaterialNumbers.isEmpty) {
          emit(
            state.copyWith(
              isFetching: false,
            ),
          );

          return;
        }
        final failureOrSuccess =
            await tenderContractRepository.getListTenderContractDetails(
          materialNumbers: fetchingMaterialNumbers,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (listTenderContractDetails) {
            emit(
              state.copyWith(
                tenderContracts: Map.from(state.tenderContracts)
                  ..addAll(listTenderContractDetails),
                isFetching: false,
              ),
            );
          },
        );
      },
    );
  }
}
