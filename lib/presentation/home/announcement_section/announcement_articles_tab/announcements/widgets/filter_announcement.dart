part of 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements_page.dart';

class _AnnouncementFilterIcon extends StatelessWidget {
  const _AnnouncementFilterIcon();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementInfoBloc, AnnouncementInfoState>(
      buildWhen: (previous, current) =>
          previous.isLoading != current.isLoading ||
          previous.categoryKeyList != current.categoryKeyList,
      builder: (context, state) {
        return CustomBadge(
          Icons.tune_outlined,
          key: WidgetKeys.announcementFilterIcon,
          badgeColor: ZPColors.orange,
          count: state.categoryKeyList.length,
          onPressed: () {
            if (state.categoryKeyList.isNotEmpty) {
              context.read<AnnouncementFilterBloc>().add(
                    AnnouncementFilterEvent.setCategoryWhileOpenBottomSheet(
                      state.categoryKeyList,
                    ),
                  );
            }
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              enableDrag: false,
              isDismissible: false,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              builder: (_) => const AnnouncementFilterBottomSheet(),
            );
          },
        );
      },
    );
  }
}
