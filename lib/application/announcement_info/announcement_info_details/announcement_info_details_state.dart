part of 'announcement_info_details_bloc.dart';

@freezed
class AnnouncementInfoDetailsState with _$AnnouncementInfoDetailsState {
  const AnnouncementInfoDetailsState._();

  const factory AnnouncementInfoDetailsState({
    required AnnouncementInfoDetails announcementInfoDetails,
    required bool isLoading,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _AnnouncementInfoDetailsState;

  factory AnnouncementInfoDetailsState.initial() =>
      AnnouncementInfoDetailsState(
        isLoading: false,
        announcementInfoDetails: AnnouncementInfoDetails.empty(),
        apiFailureOrSuccessOption: none(),
      );
}
