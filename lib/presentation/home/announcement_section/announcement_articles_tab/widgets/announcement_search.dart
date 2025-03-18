part of 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements_page.dart';

class _SearchAnnouncement extends StatelessWidget {
  const _SearchAnnouncement();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementInfoBloc, AnnouncementInfoState>(
      buildWhen: (previous, current) => previous.searchKey != current.searchKey,
      builder: (context, state) {
        return CustomSearchBar(
          key: WidgetKeys.searchSectionTab('Announcements'),
          initialValue: state.searchKey.searchValueOrEmpty,
          enabled: true,
          onSearchChanged: (value) => context.read<AnnouncementInfoBloc>().add(
                AnnouncementInfoEvent.updateSearchKey(
                  searchKey: SearchKey.search(value),
                ),
              ),
          onSearchSubmitted: (value) =>
              context.read<AnnouncementInfoBloc>().add(
                    AnnouncementInfoEvent.updateSearchKey(
                      searchKey: SearchKey.search(value),
                    ),
                  ),
          customValidator: (value) => SearchKey.search(value).isValid(),
          onClear: () => context.read<AnnouncementInfoBloc>().add(
                AnnouncementInfoEvent.updateSearchKey(
                  searchKey: SearchKey.empty(),
                ),
              ),
        );
      },
    );
  }
}
