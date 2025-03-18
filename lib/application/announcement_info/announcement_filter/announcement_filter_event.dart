part of 'announcement_filter_bloc.dart';

@freezed
class AnnouncementFilterEvent with _$AnnouncementFilterEvent {
  const factory AnnouncementFilterEvent.categoryChanged(
    String filterCategory,
    bool selected,
  ) = _CategoryChanged;
  const factory AnnouncementFilterEvent.setCategoryWhileOpenBottomSheet(
    List<String> filterCategory,
  ) = _SetCategoryWhileOpenBottomSheet;
  const factory AnnouncementFilterEvent.resetCategory() = _ResetCategory;
  const factory AnnouncementFilterEvent.fetchCategory({
    required SalesOrg salesOrg,
  }) = _FetchCategory;
}
