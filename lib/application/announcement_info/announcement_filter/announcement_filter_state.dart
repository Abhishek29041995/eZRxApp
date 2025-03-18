part of 'announcement_filter_bloc.dart';

@freezed
class AnnouncementFilterState with _$AnnouncementFilterState {
  const AnnouncementFilterState._();

  const factory AnnouncementFilterState({
    required List<String> filterCategoryKeyList,
    required List<String> categoryKeyList,
    required bool isLoading,
  }) = _AnnouncementFilterState;

  factory AnnouncementFilterState.initial() => const AnnouncementFilterState(
        filterCategoryKeyList: <String>[],
        categoryKeyList: <String>[],
        isLoading: false,
      );
}
