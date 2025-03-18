part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';

class _InvoiceNumber extends StatelessWidget {
  final StringValue invoiceData;
  const _InvoiceNumber({required this.invoiceData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemsBloc, ViewByItemsState>(
      buildWhen: (previous, current) =>
          previous.isFetchingInvoices != current.isFetchingInvoices,
      builder: (context, state) {
        if (!state.isFetchingInvoices && !invoiceData.isNotEmpty) {
          return const SizedBox.shrink();
        }

        return Flexible(
          child: LoadingShimmer.withChild(
            enabled: state.isFetchingInvoices,
            child: Text(
              '|  ${context.tr('Invoice')} #${invoiceData.getOrDefaultValue('')}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZPColors.black,
                  ),
            ),
          ),
        );
      },
    );
  }
}
