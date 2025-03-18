part of 'announcement_info_details_bloc.dart';

@freezed
class AnnouncementInfoDetailsEvent with _$AnnouncementInfoDetailsEvent {
  const factory AnnouncementInfoDetailsEvent.fetch({
    required String itemId,
    required SalesOrg salesOrg,
  }) = _Fetch;
}
