import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/privacy_control.dart';
import 'package:ezrxmobile/domain/account/repository/i_user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_consent_bloc.freezed.dart';

part 'privacy_consent_event.dart';

part 'privacy_consent_state.dart';

class PrivacyConsentBloc
    extends Bloc<PrivacyConsentEvent, PrivacyConsentState> {
  final IUserRepository userRepository;

  PrivacyConsentBloc({required this.userRepository})
      : super(PrivacyConsentState.initial()) {
    on<PrivacyConsentEvent>(_onEvent);
  }

  Future<void> _onEvent(
    PrivacyConsentEvent event,
    Emitter<PrivacyConsentState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(PrivacyConsentState.initial());
      },
      fetch: (e) async {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );
        final failureOrSuccess = await userRepository.getUser();
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isLoading: false,
            ),
          ),
          (user) {
            emit(
              state.copyWith(
                currentPrivacyControl: user.privacyControl,
                previousPrivacyControl: user.privacyControl,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      updateAutomatedPersonalisation: (e) {
        emit(
          state.copyWith(
            currentPrivacyControl: state.currentPrivacyControl.copyWith(
              automatedPersonalisation: e.value,
            ),
          ),
        );
      },
      updateViaEmail: (e) {
        emit(
          state.copyWith(
            currentPrivacyControl: state.currentPrivacyControl.copyWith(
              viaEmails: e.value,
            ),
          ),
        );
      },
      updateViaPushNotification: (e) {
        emit(
          state.copyWith(
            currentPrivacyControl: state.currentPrivacyControl.copyWith(
              viaPushNotification: e.value,
            ),
          ),
        );
      },
      updateViaSMS: (e) {
        emit(
          state.copyWith(
            currentPrivacyControl: state.currentPrivacyControl.copyWith(
              viaSMS: e.value,
            ),
          ),
        );
      },
      submit: (e) async {
        emit(
          state.copyWith(
            isLoading: true,
            submitFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess = await userRepository.updatePrivacyControl(
          automatedPersonalisation:
              state.currentPrivacyControl.automatedPersonalisation,
          viaEmails: state.currentPrivacyControl.viaEmails,
          viaPushNotification: state.currentPrivacyControl.viaPushNotification,
          viaSMS: state.currentPrivacyControl.viaSMS,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              submitFailureOrSuccessOption: optionOf(failureOrSuccess),
              isLoading: false,
            ),
          ),
          (_) => emit(
            state.copyWith(
              submitFailureOrSuccessOption: optionOf(failureOrSuccess),
              previousPrivacyControl: state.currentPrivacyControl,
              isLoading: false,
            ),
          ),
        );
      },
      clear: (e) {
        emit(
          state.copyWith(
            currentPrivacyControl: state.previousPrivacyControl,
          ),
        );
      },
    );
  }
}
