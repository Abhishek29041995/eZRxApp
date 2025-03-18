import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/repository/i_sales_org_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_org_bloc.freezed.dart';
part 'sales_org_event.dart';
part 'sales_org_state.dart';

class SalesOrgBloc extends Bloc<SalesOrgEvent, SalesOrgState> {
  final ISalesOrgRepository salesOrgRepository;

  SalesOrgBloc({
    required this.salesOrgRepository,
  }) : super(SalesOrgState.initial()) {
    on<SalesOrgEvent>(_onEvent);
  }

  Future<void> _onEvent(
    SalesOrgEvent event,
    Emitter<SalesOrgState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(SalesOrgState.initial());
      },
      loadSavedOrganisation: (e) async {
        final failureOrSuccess = await salesOrgRepository.getSalesOrg();
        if (isClosed) return;
        final salesOrganisations = e.salesOrganisations;

        // found last selected from local storage => apply
        // not found last selected from local storage => use first one of the current list
        final salesOrg = failureOrSuccess.fold(
          (_) {
            return e.salesOrganisations.first;
          },
          (accountSelector) {
            return salesOrganisations.firstWhere(
              (e) => e.salesOrg.fullName == accountSelector.salesOrg,
              orElse: () => salesOrganisations.first,
            );
          },
        );
        add(SalesOrgEvent.selected(salesOrganisation: salesOrg));
      },
      selected: (e) async {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );

        if (e.salesOrganisation != state.salesOrganisation) {
          await salesOrgRepository.storeSalesOrg(
            salesOrg: e.salesOrganisation.salesOrg.fullName,
          );
        }

        final failureOrSuccess = await salesOrgRepository
            .getSalesOrganisationConfigs(e.salesOrganisation);
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                configs: SalesOrganisationConfigs.empty(),
                salesOrgFailureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
                salesOrganisation: e.salesOrganisation,
              ),
            );
          },
          (configs) => emit(
            state.copyWith(
              configs: configs,
              salesOrgFailureOrSuccessOption: none(),
              isLoading: false,
              salesOrganisation: e.salesOrganisation,
            ),
          ),
        );
      },
      fetchAvailableSalesOrg: (e) {
        emit(
          state.copyWith(
            availableSalesOrg: e.avialableSalesOrgList,
            salesOrgFailureOrSuccessOption: none(),
          ),
        );
      },
      searchSalesOrg: (e) {
        emit(
          state.copyWith(
            availableSalesOrg: e.salesOrgList
                .where(
                  (element) => element.salesOrg.fullName.toLowerCase().contains(
                        e.searchKey.searchValueOrEmpty.trim().toLowerCase(),
                      ),
                )
                .toList(),
            searchKey: e.searchKey,
            salesOrgFailureOrSuccessOption: none(),
          ),
        );
      },
    );
  }
}
