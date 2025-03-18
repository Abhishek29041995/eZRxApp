part of 'announcement_info_bloc.dart';

@freezed
class AnnouncementInfoState with _$AnnouncementInfoState {
  const AnnouncementInfoState._();

  const factory AnnouncementInfoState({
    required User user,
    required SalesOrg salesOrg,
    required AnnouncementArticleInfo announcementInfo,
    required bool isLoading,
    required bool canLoadMore,
    required SearchKey searchKey,
    required List<String> categoryKeyList,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _AnnouncementInfoState;

  factory AnnouncementInfoState.initial() => AnnouncementInfoState(
        user: User.empty(),
        salesOrg: SalesOrg(''),
        isLoading: false,
        canLoadMore: true,
        searchKey: SearchKey.empty(),
        categoryKeyList: <String>[],
        announcementInfo: AnnouncementArticleInfo.empty(),
        apiFailureOrSuccessOption: none(),
      );

  List<AnnouncementArticleItem> get searchedAnnouncementList =>
      announcementInfo.filterAnnouncementListBySearchKey(
        searchKey.searchValueOrEmpty,
        categoryKeyList,
      );
}
