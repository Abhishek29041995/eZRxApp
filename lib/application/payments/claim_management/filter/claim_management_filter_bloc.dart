import 'package:bloc/bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_management_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'claim_management_filter_event.dart';
part 'claim_management_filter_state.dart';
part 'claim_management_filter_bloc.freezed.dart';

class ClaimManagementFilterBloc
    extends Bloc<ClaimManagementFilterEvent, ClaimManagementFilterState> {
  ClaimManagementFilterBloc() : super(ClaimManagementFilterState.initial()) {
    on<ClaimManagementFilterEvent>(_onEvent);
  }

  void _onEvent(
    ClaimManagementFilterEvent event,
    Emitter<ClaimManagementFilterState> emit,
  ) {
    event.map(
      initialized: (_) async => emit(
        ClaimManagementFilterState.initial(),
      ),
      openFilterBottomSheet: (_OpenFilterBottomSheet value) {
        emit(
          state.copyWith(
            filter: value.appliedFilter,
          ),
        );
      },
      claimTypeChange: (_StatusChanged value) {
        final claimTypeSelected = List<ClaimType>.from(state.filter.claimTypes);

        if (value.selected) {
          claimTypeSelected.add(value.claimType);
        } else {
          claimTypeSelected.remove(value.claimType);
        }
        emit(
          state.copyWith(
            filter: state.filter.copyWith(
              claimTypes: claimTypeSelected,
            ),
          ),
        );
      },
      clearAll: (_) => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            claimTypes: <ClaimType>[],
          ),
        ),
      ),
    );
  }
}
