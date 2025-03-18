part of 'package:ezrxmobile/presentation/payments/claim_management/claim_management_page.dart';

class _ClaimManagementSearchBar extends StatelessWidget {
  const _ClaimManagementSearchBar();

  @override
  Widget build(BuildContext context) {
    final initialSearchKey =
        context.read<ClaimManagementBloc>().state.appliedFilter.searchKey;

    return Expanded(
      child: CustomSearchBar(
        key: WidgetKeys.genericKey(
          key: initialSearchKey.searchValueOrEmpty,
        ),
        hintText: 'Search by Principal Code/Name',
        initialValue: initialSearchKey.searchValueOrEmpty,
        enabled: true,
        onSearchChanged: (value) => _fetch(
          context: context,
          searchKey: value,
        ),
        onSearchSubmitted: (value) => _fetch(
          context: context,
          searchKey: value,
        ),
        customValidator: (value) => SearchKey.search(value).isValid(),
        onClear: () => _fetch(
          context: context,
          searchKey: '',
        ),
      ),
    );
  }

  void _fetch({
    required BuildContext context,
    required String searchKey,
  }) {
    final bloc = context.read<ClaimManagementBloc>();
    bloc.add(
      ClaimManagementEvent.applyFilter(
        appliedFilter: bloc.state.appliedFilter.copyWith(
          searchKey: SearchKey.search(searchKey),
        ),
      ),
    );
  }
}
