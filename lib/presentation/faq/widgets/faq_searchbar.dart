part of 'package:ezrxmobile/presentation/faq/faq.dart';

class _FAQSearchBar extends StatelessWidget {
  const _FAQSearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding12),
      child: BlocBuilder<FaqBloc, FaqState>(
        buildWhen: (previous, current) =>
            previous.searchKey != current.searchKey,
        builder: (context, state) {
          return CustomSearchBar(
            initialValue: state.searchKey.searchValueOrEmpty,
            enabled: true,
            onSearchChanged: (value) => context.read<FaqBloc>().add(
                  FaqEvent.updateSearchKey(searchKey: SearchKey.search(value)),
                ),
            onSearchSubmitted: (value) => context.read<FaqBloc>().add(
                  FaqEvent.updateSearchKey(searchKey: SearchKey.search(value)),
                ),
            customValidator: (value) => SearchKey.search(value).isValid(),
            onClear: () => context.read<FaqBloc>().add(
                  FaqEvent.updateSearchKey(searchKey: SearchKey.empty()),
                ),
          );
        },
      ),
    );
  }
}
