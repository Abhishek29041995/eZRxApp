part of 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements_page.dart';

class _ArticleFilterIcon extends StatelessWidget {
  const _ArticleFilterIcon();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesInfoBloc, ArticlesInfoState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.categoryKeyList != current.categoryKeyList,
      builder: (context, state) {
        return CustomBadge(
          Icons.tune_outlined,
          key: WidgetKeys.articleFilterIcon,
          badgeColor: ZPColors.orange,
          count: state.categoryKeyList.length,
          onPressed: () {
            if (state.categoryKeyList.isNotEmpty) {
              context.read<ArticlesInfoFilterBloc>().add(
                    ArticlesInfoFilterEvent.setCategoryWhileOpenBottomSheet(
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
              builder: (_) => const ArticleFilterBottomSheet(),
            );
          },
        );
      },
    );
  }
}
