import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_filter/announcement_filter_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_filter/articles_info_filter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/widgets/filter_announcement_bottomsheet.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/articles/widgets/filter_article_bottomsheet.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';

part 'widgets/announcement_search.dart';
part 'articles/widgets/search_article.dart';
part 'articles/widgets/filter_article.dart';
part 'announcements/widgets/filter_announcement.dart';

@RoutePage()
class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.commonAppBar(
        key: WidgetKeys.announcementsTab,
        title: Text(
          context.tr('Announcements & articles'),
        ),
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnnouncementWidget(
            currentPath: context.router.currentPath,
          ),
          Expanded(
            child: AutoTabsRouter.tabBar(
              routes: const [
                AnnouncementsTabRoute(),
                ArticlesTabRoute(),
              ],
              builder: (context, child, tabController) => Column(
                children: [
                  TabBar(
                    controller: tabController,
                    tabs: [
                      'Announcements',
                      'Articles',
                    ]
                        .map(
                          (e) => Tab(
                            key: WidgetKeys.genericKey(key: e),
                            text: context.tr(e),
                          ),
                        )
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      12.0,
                      12.0,
                      12.0,
                      0.0,
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: context.tabsRouter.current.name ==
                                  AnnouncementsTabRoute.name
                              ? const _SearchAnnouncement()
                              : const _SearchArticle(),
                        ),
                        context.tabsRouter.current.name ==
                                AnnouncementsTabRoute.name
                            ? const _AnnouncementFilterIcon()
                            : const _ArticleFilterIcon(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(child: child),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
