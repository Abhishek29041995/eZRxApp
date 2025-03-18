part of 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcement_info_details_page.dart';

class _AnnouncementInfoBottomSheet extends StatelessWidget {
  const _AnnouncementInfoBottomSheet({
    super.key,
    required this.isLoading,
    required this.changeState,
  });

  final bool isLoading;
  final Function changeState;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementInfoBloc, AnnouncementInfoState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        final announcementInfoId = context
            .read<AnnouncementInfoDetailsBloc>()
            .state
            .announcementInfoDetails
            .id;
        final otherAnnouncementList = state.announcementInfo
            .filterAnnouncementListWithoutId(announcementInfoId);

        return Container(
          height: 175,
          color: ZPColors.whiteBgCard,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  context.tr('Other Announcements'),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: otherAnnouncementList.length,
                  itemBuilder: (context, index) {
                    final currentAnnouncement = otherAnnouncementList[index];

                    return LoadingShimmer.withChild(
                      enabled: isLoading,
                      child: GestureDetector(
                        key: WidgetKeys.announcementDetailsItem(
                          index.toString(),
                        ),
                        onTap: () {
                          changeState();
                          context.read<AnnouncementInfoDetailsBloc>().add(
                                AnnouncementInfoDetailsEvent.fetch(
                                  itemId: currentAnnouncement.id,
                                  salesOrg: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .salesOrg,
                                ),
                              );
                        },
                        child: CustomCard(
                          showBorder: true,
                          width: MediaQuery.of(context).size.width * 0.5,
                          margin: const EdgeInsets.all(8),
                          clipBehavior: Clip.antiAlias,
                          child: _AnnouncementInfoItemDescription(
                            title: currentAnnouncement.title,
                            description: currentAnnouncement.summary,
                            releaseDate: currentAnnouncement.releaseDate,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
