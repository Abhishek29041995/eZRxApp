import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/domain/announcement_info/repository/i_announcement_info_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_info_details_bloc.freezed.dart';
part 'announcement_info_details_event.dart';
part 'announcement_info_details_state.dart';

class AnnouncementInfoDetailsBloc
    extends Bloc<AnnouncementInfoDetailsEvent, AnnouncementInfoDetailsState> {
  final IAnnouncementInfoRepository announcementInfoRepository;

  AnnouncementInfoDetailsBloc({
    required this.announcementInfoRepository,
  }) : super(AnnouncementInfoDetailsState.initial()) {
    on<AnnouncementInfoDetailsEvent>(_onEvent);
  }

  Future<FutureOr<void>> _onEvent(
    AnnouncementInfoDetailsEvent event,
    Emitter<AnnouncementInfoDetailsState> emit,
  ) async {
    await event.map(
      fetch: (e) async {
        if (e.itemId == state.announcementInfoDetails.id) return;

        emit(
          state.copyWith(
            isLoading: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await announcementInfoRepository.getAnnouncementDetails(
          salesOrg: e.salesOrg,
          announcementId: e.itemId,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isLoading: false,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                announcementInfoDetails: AnnouncementInfoDetails.empty(),
              ),
            );
          },
          (announcementDetails) {
            emit(
              state.copyWith(
                isLoading: false,
                announcementInfoDetails: announcementDetails,
                apiFailureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
    );
  }
}
