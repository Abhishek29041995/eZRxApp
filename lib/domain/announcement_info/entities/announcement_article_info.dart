import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_article_info.freezed.dart';

@freezed
class AnnouncementArticleInfo with _$AnnouncementArticleInfo {
  const AnnouncementArticleInfo._();

  const factory AnnouncementArticleInfo({
    required int total,
    required String endCursor,
    required List<AnnouncementArticleItem> announcementList,
  }) = _AnnouncementArticleInfo;

  factory AnnouncementArticleInfo.empty() => const AnnouncementArticleInfo(
        total: 0,
        announcementList: <AnnouncementArticleItem>[],
        endCursor: '',
      );

  List<AnnouncementArticleItem> get _sortedAnnouncementsWithPinned {
    final pinnedAnnouncementArticleList =
        announcementList.where((element) => element.pinToTop).toList()
          ..sort(
            (a, b) => b.releaseDate.dateTime.compareTo(a.releaseDate.dateTime),
          );

    final unPinnedAnnouncementArticleList =
        announcementList.where((element) => !element.pinToTop).toList()
          ..sort(
            (a, b) => b.releaseDate.dateTime.compareTo(a.releaseDate.dateTime),
          );

    return [
      ...pinnedAnnouncementArticleList,
      ...unPinnedAnnouncementArticleList,
    ];
  }

  List<AnnouncementArticleItem> filterAnnouncementListBySearchKey(
    String searchKey,
    List<String> categoryKey,
  ) {
    final searchList = _sortedAnnouncementsWithPinned
        .where(
          (element) => element.isSearchKeyMatching(searchKey),
        )
        .toList();
    if (categoryKey.isEmpty) {
      return searchList;
    } else {
      final filterList = <AnnouncementArticleItem>[];
      for (final category in categoryKey) {
        filterList.addAll(
          searchList
              .where(
                (element) => element.isCategoryMatching(category),
              )
              .toList(),
        );
      }

      return filterList;
    }
  }

  List<AnnouncementArticleItem> filterAnnouncementListWithoutId(
    String announcementInfoId,
  ) =>
      announcementList
          .where(
            (element) => element.id != announcementInfoId,
          )
          .toList();

  List<AnnouncementArticleItem> get homePageAnnouncementList =>
      announcementList.length > 4
          ? announcementList.sublist(0, 4)
          : announcementList;
}

@freezed
class AnnouncementArticleItem with _$AnnouncementArticleItem {
  const AnnouncementArticleItem._();
  const factory AnnouncementArticleItem({
    required String id,
    required String title,
    required String summary,
    required String thumbnail,
    required HtmlContent content,
    required DateTimeStringValue publishedDate,
    required DateTimeStringValue releaseDate,
    required List<BranchAndIc4Info> branchInfo,
    required List<BranchAndIc4Info> iC4Info,
    required String tag,
    required String manufacturer,
    required List<String> documents,
    required bool pinToTop,
  }) = _AnnouncementArticleItem;

  factory AnnouncementArticleItem.empty() => AnnouncementArticleItem(
        id: '',
        title: '',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
        releaseDate: DateTimeStringValue(''),
        branchInfo: <BranchAndIc4Info>[],
        iC4Info: <BranchAndIc4Info>[],
        tag: '',
        manufacturer: '',
        documents: [],
        pinToTop: false,
      );

  bool isSearchKeyMatching(String searchKey) =>
      title.toLowerCase().contains(searchKey);

  bool isCategoryMatching(String categoryhKey) =>
      tag.toLowerCase().contains(categoryhKey.toLowerCase());
}

@freezed
class BranchAndIc4Info with _$BranchAndIc4Info {
  const BranchAndIc4Info._();
  const factory BranchAndIc4Info({
    required String id,
    required String name,
    required String displayName,
  }) = _BranchAndIc4Info;

  factory BranchAndIc4Info.empty() => const BranchAndIc4Info(
        id: '',
        name: '',
        displayName: '',
      );
}
