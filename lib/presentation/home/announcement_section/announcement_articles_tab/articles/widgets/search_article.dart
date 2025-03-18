part of 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements_page.dart';

class _SearchArticle extends StatelessWidget {
  const _SearchArticle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesInfoBloc, ArticlesInfoState>(
      buildWhen: (previous, current) => previous.searchKey != current.searchKey,
      builder: (context, state) {
        return CustomSearchBar(
          key: WidgetKeys.searchSectionTab('Articles'),
          enabled: true,
          initialValue: state.searchKey.searchValueOrEmpty,
          onSearchChanged: (value) => context.read<ArticlesInfoBloc>().add(
                ArticlesInfoEvent.setSearchKey(
                  searchKey: SearchKey.search(value),
                ),
              ),
          onSearchSubmitted: (value) => context.read<ArticlesInfoBloc>().add(
                ArticlesInfoEvent.setSearchKey(
                  searchKey: SearchKey.search(value),
                ),
              ),
          customValidator: (value) => SearchKey.search(value).isValid(),
          onClear: () => context.read<ArticlesInfoBloc>().add(
                ArticlesInfoEvent.setSearchKey(
                  searchKey: SearchKey.empty(),
                ),
              ),
        );
      },
    );
  }
}
