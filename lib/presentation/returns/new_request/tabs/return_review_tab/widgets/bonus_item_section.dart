part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';

class _BonusItemSection extends StatelessWidget {
  const _BonusItemSection({
    required this.items,
  });
  final List<ReturnMaterial> items;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const SizedBox.shrink()
        : BlocBuilder<NewRequestBloc, NewRequestState>(
            buildWhen: (previous, current) =>
                previous.invoiceDetails != current.invoiceDetails,
            builder: (context, state) => ExpandableInfo(
              labelText: 'Bonus details'.tr(),
              child: Column(
                children: items
                    .map(
                      (item) => BonusMaterialReturnInfo(
                        returnMaterial: item,
                        returnItemDetail: state.getReturnItemDetails(item.uuid),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
  }
}
