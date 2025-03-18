part of 'package:ezrxmobile/presentation/payments/new_payment/tabs/available_credits_tab/available_credits_tab.dart';

class _AvailableCreditsSearchBar extends StatelessWidget {
  const _AvailableCreditsSearchBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableCreditsBloc, AvailableCreditsState>(
      buildWhen: (previous, current) => previous.searchKey != current.searchKey,
      builder: (context, state) => CustomSearchBar(
        onSearchChanged: (value) => _search(context: context, searchKey: value),
        onSearchSubmitted: (value) =>
            _search(context: context, searchKey: value),
        hintText: context.tr(
          context.isMPPayment ? 'Search by MP document number' : 'Search',
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        customValidator: (value) => SearchKey.search(value).isValid(),
        enabled: true,
        onClear: () => _search(context: context, searchKey: ''),
        initialValue: state.searchKey.searchValueOrEmpty,
      ),
    );
  }

  void _search({
    required BuildContext context,
    required String searchKey,
  }) {
    trackMixpanelEvent(TrackingEvents.documentNumberSearched);
    context.read<AvailableCreditsBloc>().add(
          AvailableCreditsEvent.fetch(
            appliedFilter: searchKey.isEmpty
                ? AvailableCreditFilter.defaultFilter()
                : AvailableCreditFilter.empty(),
            searchKey: SearchKey.search(searchKey),
            isMarketPlace: context.isMPPayment,
          ),
        );
  }
}
