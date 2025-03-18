import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_to_top_widget.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:flutter_html/flutter_html.dart';

const offSet = 60.0;

@RoutePage()
class ArticleDetails extends StatefulWidget {
  final AnnouncementArticleItem article;
  const ArticleDetails({super.key, required this.article});

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollAtInitialPosition = true;
  bool _isBackButtonEnableForAppbar = false;

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
      _isBackButtonEnableForAppbar = _scrollController.position.pixels > 220;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.articleDetailsPageKey,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 300,
              floating: true,
              snap: true,
              pinned: true,
              flexibleSpace: Stack(
                children: [
                  FlexibleSpaceBar(
                    background: CustomImage(
                      key: WidgetKeys.articleDetailsImageKey,
                      width: MediaQuery.of(context).size.width,
                      imageUrl: widget.article.thumbnail,
                      errorWidget: const NoRecordFound(
                        svgImage: SvgImage.noImageAvailable,
                        title: 'Image not available',
                        subTitle: '',
                      ),
                    ),
                  ),
                  _isBackButtonEnableForAppbar
                      ? const SizedBox.shrink()
                      : IconButton(
                          key: WidgetKeys.articleDetailsBackButtonKey,
                          onPressed: () => context.router.maybePop(),
                          icon: const CircleAvatar(
                            maxRadius: 16,
                            backgroundColor:
                                ZPColors.defaultReturnSummaryStatusColor,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 20,
                              color: ZPColors.white,
                            ),
                          ),
                        ),
                ],
              ),
              centerTitle: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(offSet),
                child: AppBar(
                  key: WidgetKeys.articleDetailsBottomAppBarKey,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  leading: _isBackButtonEnableForAppbar
                      ? IconButton(
                          key: WidgetKeys.articleDetailsBottomBackButtonKey,
                          onPressed: () => context.router.maybePop(),
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 20,
                          ),
                        )
                      : const SizedBox.shrink(),
                  centerTitle: false,
                  leadingWidth: _isBackButtonEnableForAppbar ? 20 : 0,
                  title: _TitleSection(
                    article: widget.article,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.article.manufacturer.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              '${context.tr('By')} ${widget.article.manufacturer}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        if (widget.article.tag.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.all(6),
                            margin: const EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(
                              color: ZPColors.paleBlueGray,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Text(
                              widget.article.tag,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        const Divider(
                          indent: 0,
                          thickness: 1,
                          height: 5,
                          endIndent: 0,
                          color: ZPColors.extraLightGrey3,
                        ),
                        Html(
                          key: WidgetKeys.articleDetailsBodyKey,
                          style: {
                            'body': Style(
                              padding: HtmlPaddings.all(0),
                              margin: Margins.all(0),
                            ),
                          },
                          data: widget.article.content
                              .appendedImgSrcWithBaseUrlWithMedia,
                          shrinkWrap: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ScrollToTopWidget(
        scrollController: _scrollController,
        isVisible: !_isScrollAtInitialPosition,
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection({
    required this.article,
  });

  final AnnouncementArticleItem article;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          article.publishedDate.dateOrDashString,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: ZPColors.neutralsGrey1,
          ),
          key: WidgetKeys.articleDetailsTimeKey,
        ),
        Text(
          article.title,
          style: Theme.of(context).textTheme.labelSmall,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          key: WidgetKeys.articleDetailsTitleKey,
        ),
      ],
    );
  }
}
