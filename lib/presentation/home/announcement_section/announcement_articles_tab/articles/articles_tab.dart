import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/scroll_to_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';

@RoutePage()
class ArticlesTab extends StatefulWidget {
  const ArticlesTab({super.key});

  @override
  State<ArticlesTab> createState() => _ArticlesTabState();
}

class _ArticlesTabState extends State<ArticlesTab> {
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
      key: WidgetKeys.articlesTab,
      body: BlocBuilder<ArticlesInfoBloc, ArticlesInfoState>(
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching ||
            previous.searchKey != current.searchKey ||
            previous.categoryKeyList != current.categoryKeyList,
        builder: (context, state) {
          return state.isFetching && state.articleInfo.announcementList.isEmpty
              ? LoadingShimmer.logo(
                  key: WidgetKeys.loaderImage,
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: ScrollList<AnnouncementArticleItem>(
                    controller: _scrollController,
                    dismissOnDrag: true,
                    noRecordFoundWidget: NoRecordFound(
                      key: WidgetKeys.noArticleToShowKey,
                      title: context.tr('No articles to show'),
                    ),
                    onRefresh: () {
                      context.read<ArticlesInfoBloc>().add(
                            const ArticlesInfoEvent.getArticles(),
                          );
                    },
                    isLoading: state.isFetching,
                    onLoadingMore: () => context.read<ArticlesInfoBloc>().add(
                          const ArticlesInfoEvent.loadMoreArticles(),
                        ),
                    itemBuilder: (context, index, item) => _ArticlesTile(
                      key: WidgetKeys.genericKey(key: 'articleItem$index'),
                      article: item,
                    ),
                    items: state.filterAnnouncementListBySearchKey,
                  ),
                );
        },
      ),
      floatingActionButton: ScrollToTopWidget(
        scrollController: _scrollController,
        isVisible: !_isScrollAtInitialPosition,
      ),
    );
  }
}

class _ArticlesTile extends StatelessWidget {
  final AnnouncementArticleItem article;
  const _ArticlesTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      showBorder: false,
      showShadow: true,
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () => context.router.push(
          ArticleDetailsRoute(
            article: article,
          ),
        ),
        minVerticalPadding: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              key: WidgetKeys.articleImageKey,
              width: MediaQuery.of(context).size.width * 0.35,
              height: 88,
              imageUrl: article.thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 10, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.labelSmall,
                      key: WidgetKeys.articleTitleKey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          article.releaseDate.dateTimeOrDashString,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: ZPColors.extraLightGrey4),
                          key: WidgetKeys.articleTimeKey,
                        ),
                        if (article.tag.isNotEmpty)
                          Flexible(
                            child: Container(
                              key: WidgetKeys.articlesListTag,
                              padding: const EdgeInsets.all(6),
                              margin: const EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                color: ZPColors.paleBlueGray,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Text(
                                article.tag,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: ZPColors.articleCategoryColor,
                                    ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
