import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/repository/i_po_attachment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'national_privacy_commission_bloc.freezed.dart';
part 'national_privacy_commission_event.dart';
part 'national_privacy_commission_state.dart';

class NationalPrivacyCommissionBloc extends Bloc<NationalPrivacyCommissionEvent,
    NationalPrivacyCommissionState> {
  final IpoAttachmentRepository poAttachmentRepository;
  NationalPrivacyCommissionBloc({required this.poAttachmentRepository})
      : super(NationalPrivacyCommissionState.initial()) {
    on<NationalPrivacyCommissionEvent>(_onEvent);
  }

  Future<void> _onEvent(
    NationalPrivacyCommissionEvent event,
    Emitter<NationalPrivacyCommissionState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(NationalPrivacyCommissionState.initial());
      },
      saveImages: (e) async {
        emit(state.copyWith(isSaving: true));
        final saveImagesFailureOrSuccess =
            await poAttachmentRepository.saveAssetImagesToGallery(
          fileList: e.images,
        );
        if (isClosed) return;
        saveImagesFailureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(saveImagesFailureOrSuccess),
              isSaving: false,
            ),
          ),
          (success) => emit(
            state.copyWith(
              failureOrSuccessOption: none(),
              isSaving: false,
            ),
          ),
        );
      },
    );
  }
}
