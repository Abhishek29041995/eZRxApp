import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_details/announcement_info_details_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcements_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementSection extends StatelessWidget {
  const AnnouncementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementInfoBloc, AnnouncementInfoState>(
      buildWhen: (previous, current) =>
          previous.isLoading != current.isLoading ||
          previous.announcementInfo != current.announcementInfo,
      builder: (context, state) {
        if (state.isLoading) {
          return const _AnnouncementSectionLoadingShimmer();
        } else if (state.announcementInfo.announcementList.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: padding12,
                top: padding12,
              ),
              child: SectionTitle(
                key: WidgetKeys.announcementIcon,
                title: 'Announcements',
                onTapIconButton: () =>
                    context.router.push(const AnnouncementsPageRoute()),
              ),
            ),
            ...state.announcementInfo.homePageAnnouncementList.map(
              (e) => GestureDetector(
                onTap: () {
                  context.read<AnnouncementInfoDetailsBloc>().add(
                        AnnouncementInfoDetailsEvent.fetch(
                          itemId: e.id,
                          salesOrg:
                              context.read<EligibilityBloc>().state.salesOrg,
                        ),
                      );
                  context.router.push(const AnnouncementInfoDetailsPageRoute());
                },
                child: AnnouncementItem(item: e),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _AnnouncementSectionLoadingShimmer extends StatelessWidget {
  const _AnnouncementSectionLoadingShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LoadingShimmer.withChild(
        child: const SizedBox(
          height: 140,
          child: CustomCard(
            child: ListTile(),
          ),
        ),
      ),
    );
  }
}
