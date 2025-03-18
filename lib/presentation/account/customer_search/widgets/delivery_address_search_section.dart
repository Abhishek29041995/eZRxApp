part of 'package:ezrxmobile/presentation/account/customer_search/customer_search.dart';

class _DeliveryAddressSearchSection extends StatelessWidget {
  const _DeliveryAddressSearchSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding12),
      child: BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
        buildWhen: (previous, current) =>
            previous.searchKey != current.searchKey,
        builder: (context, state) {
          return CustomSearchBar(
            onSearchChanged: (value) {
              context.read<CustomerCodeBloc>().add(
                    CustomerCodeEvent.fetch(
                      searchValue: SearchKey.search(value),
                    ),
                  );
            },
            onSearchSubmitted: (value) {
              context.read<CustomerCodeBloc>().add(
                    CustomerCodeEvent.fetch(
                      searchValue: SearchKey.search(value),
                    ),
                  );
            },
            customValidator: (value) => SearchKey.search(value).isValid(),
            enabled: true,
            onClear: () {
              context.read<CustomerCodeBloc>().add(
                    CustomerCodeEvent.fetch(searchValue: SearchKey.empty()),
                  );
            },
            initialValue: state.searchKey.searchValueOrEmpty,
          );
        },
      ),
    );
  }
}
