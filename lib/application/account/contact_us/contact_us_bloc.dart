import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/contact_us.dart';
import 'package:ezrxmobile/domain/account/repository/i_contact_us_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_us_bloc.freezed.dart';
part 'contact_us_event.dart';
part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  final IContactUsRepository contactUsRepository;

  ContactUsBloc({
    required this.contactUsRepository,
  }) : super(ContactUsState.initial()) {
    on<ContactUsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ContactUsEvent event,
    Emitter<ContactUsState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(
          ContactUsState.initial().copyWith(
            appMarket: e.market,
          ),
        );
      },
      onUsernameChange: (e) {
        emit(
          state.copyWith(
            contactUs: state.contactUs.copyWith(
              username: Username(e.newValue),
            ),
          ),
        );
      },
      onEmailChange: (e) {
        emit(
          state.copyWith(
            contactUs: state.contactUs.copyWith(
              email: EmailAddress(e.newValue),
            ),
          ),
        );
      },
      onContactNumberChange: (e) {
        emit(
          state.copyWith(
            contactUs: state.contactUs.copyWith(
              contactNumber: PhoneNumber(e.newValue),
            ),
          ),
        );
      },
      onMessageChange: (e) {
        emit(
          state.copyWith(
            contactUs: state.contactUs.copyWith(
              message: StringValue(e.newValue),
            ),
          ),
        );
      },
      submit: (e) async {
        final isUserNameValid = state.contactUs.username.isValid();
        final isEmailValid = state.contactUs.email.isValid();
        final isContactNumberValid = state.contactUs.contactNumber.isValid();
        final isMessageValid = state.contactUs.message.isValid();

        final isFormValid = isUserNameValid &&
            isEmailValid &&
            isContactNumberValid &&
            isMessageValid;

        if (isFormValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
              showErrorMessage: false,
            ),
          );
          final failureOrSuccess = await contactUsRepository.submit(
            contactUs: state.contactUs,
            appMarket: state.appMarket,
          );
          if (isClosed) return;
          failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                  isSubmitting: false,
                ),
              );
            },
            (success) {
              emit(
                state.copyWith(
                  responseFlag: success,
                  contactUs: state.contactUs.copyWith(
                    contactNumber: PhoneNumber(
                      '',
                    ),
                    message: StringValue(
                      '',
                    ),
                  ),
                  isSubmitting: false,
                  apiFailureOrSuccessOption: none(),
                ),
              );
            },
          );
        } else {
          if (isClosed) return;
          emit(
            state.copyWith(
              showErrorMessage: true,
            ),
          );
        }
      },
    );
  }
}
