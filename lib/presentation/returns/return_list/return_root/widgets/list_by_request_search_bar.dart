part of 'package:ezrxmobile/presentation/returns/return_list/return_root/return_root.dart';

class _ListByRequestSearchBar extends StatelessWidget {
  const _ListByRequestSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnListByRequestBloc, ReturnListByRequestState>(
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
    final bloc = context.read<ReturnListByRequestBloc>();
    final appliedFilter = bloc.state.appliedFilter;
    trackMixpanelEvent(
      TrackingEvents.returnRequestSearched,
      props: {
        TrackingProps.keyword: keyword,
        TrackingProps.subTabFrom: const ReturnByRequestPageRoute().routeName,
      },
    );
    bloc.add(
      ReturnListByRequestEvent.fetch(
        appliedFilter: appliedFilter,
        searchKey: SearchKey.search(keyword),
      ),
    );
  }
}
