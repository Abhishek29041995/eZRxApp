part of 'announcement_info_bloc.dart';

@freezed
class AnnouncementInfoEvent with _$AnnouncementInfoEvent {
  const factory AnnouncementInfoEvent.initialize({
    required User user,
    required SalesOrg salesOrg,
  }) = _Initialize;

  const factory AnnouncementInfoEvent.fetch() = _Fetch;
  const factory AnnouncementInfoEvent.loadMore() = _LoadMore;
  const factory AnnouncementInfoEvent.updateSearchKey({
    required SearchKey searchKey,
  }) = _UpdateSearchKey;

  const factory AnnouncementInfoEvent.setCategoryKey({
    required List<String> categoryKeyList,
  }) = _SetCategoryKey;
}
