import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_item.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_management_filter.dart';
import 'package:ezrxmobile/domain/payments/repository/i_claim_management_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'claim_management_event.dart';
part 'claim_management_state.dart';
part 'claim_management_bloc.freezed.dart';

class ClaimManagementBloc
    extends Bloc<ClaimManagementEvent, ClaimManagementState> {
  final IClaimManagementRepository claimManagementRepository;
  final Config config;
  ClaimManagementBloc({
    required this.claimManagementRepository,
    required this.config,
  }) : super(ClaimManagementState.initial()) {
    on<_Initialized>(
      (event, emit) {
        emit(
          ClaimManagementState.initial().copyWith(
            salesOrganisation: event.salesOrganisation,
            customerCodeInfo: event.customerCodeInfo,
            user: event.user,
          ),
        );
        add(
          ClaimManagementEvent.fetch(
            appliedFilter: ClaimManagementFilter.empty(),
          ),
        );
      },
    );
    on<_Fetch>(
      (e, emit) async {
        if (!e.appliedFilter.searchKey.isValid()) return;
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            items: <ClaimItem>[],
            isLoading: true,
            appliedFilter: e.appliedFilter,
          ),
        );

        final failureOrSuccess =
            await claimManagementRepository.getClaimSubmissions(
          email: state.user.email,
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
          (responseData) {
            emit(
              state.copyWith(
                items: responseData,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_ApplyFilter>(
      (e, emit) {
        emit(
          state.copyWith(
            appliedFilter: e.appliedFilter,
          ),
        );
      },
    );
  }
}
