import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/repository/i_combo_deal_repository.dart';

part 'combo_deal_list_bloc.freezed.dart';
part 'combo_deal_list_event.dart';
part 'combo_deal_list_state.dart';

class ComboDealListBloc extends Bloc<ComboDealListEvent, ComboDealListState> {
  final IComboDealRepository repository;
  ComboDealListBloc({
    required this.repository,
  }) : super(ComboDealListState.initial()) {
    on<ComboDealListEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ComboDealListEvent event,
    Emitter<ComboDealListState> emit,
  ) async {
    await event.map(
      initialize: (e) {
        emit(ComboDealListState.initial());
      },
      fetchMaterialDeal: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );
        if (state.comboDeals.containsKey(e.priceComboDeal.id)) {
          emit(
            state.copyWith(
              isFetching: false,
            ),
          );

          return;
        }

        final failureOrSuccess = await repository.getComboDealList(
          comboDealInfo: e.priceComboDeal,
          customerCode: e.customerCodeInfo,
          salesOrg: e.salesOrganisation.salesOrg,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (comboDeals) {
            emit(
              state.copyWith(
                comboDeals: Map.from(state.comboDeals)
                  ..addAll(
                    {
                      e.priceComboDeal.id: comboDeals,
                    },
                  ),
                priceComboDeal: e.priceComboDeal,
                isFetching: false,
                apiFailureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
      fetchPrincipleGroupDeal: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );

        if (state.comboDeals.containsKey(e.priceComboDeal.id)) {
          emit(
            state.copyWith(
              isFetching: false,
            ),
          );

          return;
        }

        final failureOrSuccess = await repository.getComboDeal(
          comboDealInfo: e.priceComboDeal,
          customerCode: e.customerCodeInfo,
          salesOrg: e.salesOrganisation.salesOrg,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (comboDeal) {
            emit(
              state.copyWith(
                comboDeals: Map.from(state.comboDeals)
                  ..addAll(
                    {
                      e.priceComboDeal.id: [comboDeal],
                    },
                  ),
                isFetching: false,
                priceComboDeal: e.priceComboDeal,
              ),
            );
          },
        );
      },
    );
  }
}
