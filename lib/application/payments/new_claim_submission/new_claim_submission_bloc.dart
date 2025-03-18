import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_submission.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/claim_management_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_claim_submission_event.dart';
part 'new_claim_submission_state.dart';
part 'new_claim_submission_bloc.freezed.dart';

class NewClaimSubmissionBloc
    extends Bloc<NewClaimSubmissionEvent, NewClaimSubmissionState> {
  NewClaimSubmissionBloc({
    required ClaimManagementRepository claimManagementRepository,
    required Config config,
  }) : super(NewClaimSubmissionState.initial()) {
    on<_initialized>((event, emit) {
      emit(
        NewClaimSubmissionState.initial().copyWith(
          salesOrganisation: event.salesOrganisation,
          customerCodeInfo: event.customerCodeInfo,
        ),
      );
      add(const _FetchPrincipalList());
    });
    on<_FetchPrincipalList>(
      (e, emit) async {
        emit(
          state.copyWith(
            isPrincipalLoading: true,
          ),
        );
        final failureOrSuccess =
            await claimManagementRepository.getPrincipalForSalesOrg(
          salesOrganisation: state.salesOrganisation,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isPrincipalLoading: false,
              ),
            );
          },
          (responseData) {
            final sortedList = List<PrincipalData>.from(
              responseData,
            )..sort(
                (a, b) => a.principalName
                    .getOrDefaultValue('')
                    .compareTo(b.principalName.getOrDefaultValue('')),
              );

            emit(
              state.copyWith(
                principalList: sortedList,
                isPrincipalLoading: false,
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
    );
    on<_OnSelectPrincipal>(
      (e, emit) {
        emit(
          state.copyWith(
            claimSubmission:
                state.claimSubmission.copyWith(principal: e.principal),
          ),
        );
      },
    );
    on<_OnSelectClaimType>(
      (e, emit) {
        emit(
          state.copyWith(
            claimSubmission:
                state.claimSubmission.copyWith(claimType: e.claimType),
          ),
        );
      },
    );
    on<_OnClaimAmountChange>(
      (e, emit) {
        emit(
          state.copyWith(
            claimSubmission:
                state.claimSubmission.copyWith(claimAmount: e.amount),
          ),
        );
      },
    );
    on<_OnClaimDetailsChange>(
      (e, emit) {
        emit(
          state.copyWith(
            claimSubmission:
                state.claimSubmission.copyWith(claimDetails: e.claimDetails),
          ),
        );
      },
    );
    on<_AddPoDocument>(
      (e, emit) {
        emit(
          state.copyWith(
            showUploadExeedMessage:
                e.poDocuments.hasFileExeed(config.maximumUploadSize),
            claimSubmission:
                state.claimSubmission.copyWith(documents: e.poDocuments),
          ),
        );
      },
    );
    on<_RemovePoDocument>(
      (e, emit) {
        final updatedPoDocuments =
            List<PlatformFile>.from(state.claimSubmission.documents)
              ..removeWhere(
                (PlatformFile element) => element == e.poDocument,
              );
        emit(
          state.copyWith(
            showUploadExeedMessage:
                updatedPoDocuments.hasFileExeed(config.maximumUploadSize),
            claimSubmission:
                state.claimSubmission.copyWith(documents: updatedPoDocuments),
          ),
        );
      },
    );
    on<_Submit>(
      (e, emit) async {
        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess = await claimManagementRepository.submitClaim(
          user: e.user,
          customerCodeInfo: e.customerCodeInfo,
          data: state.claimSubmission,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isLoading: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (responseData) {
            emit(
              state.copyWith(
                isLoading: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
        );
      },
    );
  }
}
