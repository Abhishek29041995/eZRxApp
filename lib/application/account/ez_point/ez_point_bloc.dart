import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ez_point_token.dart';
import 'package:ezrxmobile/domain/account/repository/i_ez_point_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ez_point_bloc.freezed.dart';
part 'ez_point_event.dart';
part 'ez_point_state.dart';

class EZPointBloc extends Bloc<EZPointEvent, EZPointState> {
  final IEZPointRepository eZPointRepository;
  EZPointBloc({required this.eZPointRepository})
      : super(EZPointState.initial()) {
    on<EZPointEvent>(_onEvent);
  }

  Future<void> _onEvent(EZPointEvent event, Emitter<EZPointState> emit) async {
    await event.map(
      initialized: (e) {
        emit(EZPointState.initial());
      },
      fetch: (e) async {
        emit(state.copyWith(isFetching: true));
        final eZPointTokenFailureOrSuccess =
            await eZPointRepository.getEZPointToken(
          customerCodeInfo: e.customerCodeInfo,
        );
        if (isClosed) return;
        eZPointTokenFailureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              ezPointToken: EZPointToken.empty(),
              eZPointTokenFailureOrSuccessOption:
                  optionOf(eZPointTokenFailureOrSuccess),
              isFetching: false,
            ),
          ),
          (eZPointToken) => emit(
            state.copyWith(
              ezPointToken: eZPointToken,
              eZPointTokenFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          ),
        );
      },
    );
  }
}
