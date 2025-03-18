part of 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';

class _ProductFilterResetButton extends StatelessWidget {
  const _ProductFilterResetButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: WidgetKeys.filterResetButton,
      onPressed: () => _onResetPressed(context),
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: const WidgetStatePropertyAll(
              ZPColors.white,
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: ZPColors.primary),
              ),
            ),
          ),
      child: Text(
        context.tr('Reset'),
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: ZPColors.primary,
            ),
      ),
    );
  }

  Future<void> _onResetPressed(BuildContext context) async {
    final selectedFilter =
        context.read<MaterialListBloc>().state.selectedMaterialFilter;
    final materialFilterBloc = context.read<MaterialFilterBloc>();

    if (selectedFilter == MaterialFilter.empty()) {
      await context.router.maybePop(selectedFilter);

      return;
    }

    materialFilterBloc.add(
      const MaterialFilterEvent.resetFilter(),
    );

    final materialFilterState = await materialFilterBloc.stream.firstWhere(
      (element) => element.materialFilter != selectedFilter,
      orElse: () => MaterialFilterState.initial(),
    );

    if (context.mounted) {
      await context.router.maybePop(
        materialFilterState.materialFilter,
      );
    }
  }
}
