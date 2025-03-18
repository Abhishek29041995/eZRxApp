part of 'package:ezrxmobile/presentation/returns/return_list/return_root/return_root.dart';

class _ListByItemSearchBar extends StatelessWidget {
  const _ListByItemSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnListByItemBloc, ReturnListByItemState>(
      buildWhen: (previous, current) => previous.searchKey != current.searchKey,
      builder: (context, state) {
        return CustomSearchBar(
          enabled: true,
          initialValue: state.searchKey.searchValueOrEmpty,
          onSearchChanged: (value) => _search(
            keyword: value,
            context: context,
          ),
          onSearchSubmitted: (value) => _search(
            keyword: value,
            context: context,
          ),
          customValidator: (value) => SearchKey.search(value).isValid(),
          onClear: () => _search(
            keyword: '',
            context: context,
          ),
        );
      },
    );
  }

  void _search({required String keyword, required BuildContext context}) {
    final bloc = context.read<ReturnListByItemBloc>();
    final appliedFilter = bloc.state.appliedFilter;
    trackMixpanelEvent(
      TrackingEvents.returnRequestSearched,
      props: {
        TrackingProps.keyword: keyword,
        TrackingProps.subTabFrom: const ReturnByItemPageRoute().routeName,
      },
    );
    bloc.add(
      ReturnListByItemEvent.fetch(
        appliedFilter: appliedFilter,
        searchKey: SearchKey.search(keyword),
      ),
    );
  }
}
