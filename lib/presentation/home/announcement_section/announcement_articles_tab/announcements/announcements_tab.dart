import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/scroll_to_top_widget.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/widgets/new_announcement_icon.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_details/announcement_info_details_bloc.dart';

@RoutePage()
class AnnouncementsTab extends StatefulWidget {
  const AnnouncementsTab({super.key});

  @override
  State<AnnouncementsTab> createState() => _AnnouncementsTabState();
}

class _AnnouncementsTabState extends State<AnnouncementsTab> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollAtInitialPosition = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _isScrollAtInitialPosition = _scrollController.initialScrollOffset ==
          _scrollController.position.pixels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.announcementListPageKey,
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocConsumer<AnnouncementInfoBloc, AnnouncementInfoState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption,
          listener: (context, state) {
            state.apiFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading ||
              previous.searchedAnnouncementList !=
                  current.searchedAnnouncementList,
          builder: (context, state) {
            return state.isLoading &&
                    state.announcementInfo.announcementList.isEmpty
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : ScrollList<AnnouncementArticleItem>(
                    key: WidgetKeys.announcementListKey,
                    dismissOnDrag: true,
                    noRecordFoundWidget: NoRecordFound(
                      key: WidgetKeys.announcementNotFoundRecordKey,
                      title: context.tr('No Announcement found'),
                    ),
                    controller: _scrollController,
                    onRefresh: () => context.read<AnnouncementInfoBloc>().add(
                          const AnnouncementInfoEvent.fetch(),
                        ),
                    onLoadingMore: () =>
                        context.read<AnnouncementInfoBloc>().add(
                              const AnnouncementInfoEvent.loadMore(),
                            ),
                    isLoading: state.isLoading,
                    itemBuilder: (context, index, item) => GestureDetector(
                      child: AnnouncementItem(item: item),
                      onTap: () {
                        context.read<AnnouncementInfoDetailsBloc>().add(
                              AnnouncementInfoDetailsEvent.fetch(
                                itemId: item.id,
                                salesOrg: context
                                    .read<EligibilityBloc>()
                                    .state
                                    .salesOrg,
                              ),
                            );
                        context.router
                            .push(const AnnouncementInfoDetailsPageRoute());
                      },
                    ),
                    items: state.searchedAnnouncementList,
                  );
          },
        ),
      ),
      floatingActionButton: ScrollToTopWidget(
        scrollController: _scrollController,
        isVisible: !_isScrollAtInitialPosition,
      ),
    );
  }
}

class AnnouncementItem extends StatelessWidget {
  final AnnouncementArticleItem item;
  const AnnouncementItem({
    super.key,
    required this.item,
  });
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.genericKey(key: item.id),
      showBorder: false,
      showShadow: true,
      margin: const EdgeInsets.only(
        left: padding12,
        right: padding12,
        top: padding12,
      ),
      child: ListTile(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    item.releaseDate.dateTimeOrDashString,
                    key: WidgetKeys.announcementItemDateKey,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: ZPColors.neutralsGrey1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  children: [
                    if (item.releaseDate.aWeekDifference)
                      const NewAnnouncementIcon(),
                    if (item.pinToTop)
                      const Icon(
                        Icons.push_pin,
                        color: ZPColors.kPrimaryColor,
                      ),
                  ],
                ),
              ],
            ),
            Text(
              item.title,
              key: WidgetKeys.announcementItemTitleKey,
              style: Theme.of(context).textTheme.labelSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            ),
            Row(
              children: [
                if (item.tag.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(6),
                    margin: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
                    decoration: BoxDecoration(
                      color: ZPColors.paleBlueGray,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      item.tag,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                if (item.documents.isNotEmpty) ...[
                  const Icon(
                    Icons.attach_file_outlined,
                    color: ZPColors.lightGray,
                    size: 18,
                  ),
                  Text(
                    context.tr('Attachment included'),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.lightGray,
                        ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
