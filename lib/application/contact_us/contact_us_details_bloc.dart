import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/contact_us/entities/contact_us_details.dart';
import 'package:ezrxmobile/domain/contact_us/repository/i_contact_us_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_us_details_event.dart';
part 'contact_us_details_state.dart';
part 'contact_us_details_bloc.freezed.dart';

class ContactUsDetailsBloc
    extends Bloc<ContactUsDetailsEvent, ContactUsDetailsState> {
  final IContactUsDetailsRepository contactUsRepository;
  ContactUsDetailsBloc({required this.contactUsRepository})
      : super(ContactUsDetailsState.initial()) {
    on<ContactUsDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ContactUsDetailsEvent event,
    Emitter<ContactUsDetailsState> emit,
  ) async {
    await event.map(
      fetch: (e) async {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );

        final failureOrSuccess = await contactUsRepository.getContactUsDetails(
          market: e.market,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isLoading: false,
                contactUsDetails: ContactUsDetails.empty(),
              ),
            );
          },
          (contactUsDetails) {
            emit(
              state.copyWith(
                isLoading: false,
                contactUsDetails: contactUsDetails,
              ),
            );
          },
        );
      },
    );
  }
}
