part of 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';

class _ProductFilterApplyButton extends StatelessWidget {
  const _ProductFilterApplyButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: WidgetKeys.filterApplyButton,
      onPressed: () {
        final selectedFilter =
            context.read<MaterialFilterBloc>().state.materialFilter;
        trackMixpanelEvent(
          TrackingEvents.productFilterApplied,
          props: selectedFilter.trackingInfo,
        );
        Navigator.of(context).pop(selectedFilter);
      },
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: const WidgetStatePropertyAll(
              ZPColors.primary,
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: ZPColors.primary),
              ),
            ),
          ),
      child: Text(
        'Apply'.tr(),
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: ZPColors.white,
            ),
      ),
    );
  }
}
