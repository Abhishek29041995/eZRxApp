part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_tab.dart';

class _BonusItemSection extends StatelessWidget {
  const _BonusItemSection({
    required this.items,
  });
  final List<ReturnMaterial> items;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const SizedBox.shrink()
        : ExpandableInfo(
            labelText: 'Bonus details'.tr(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map(
                    (ReturnMaterial returnMaterial) => BonusMaterialInfo(
                      data: returnMaterial,
                      displayReturnableQuantity: true,
                    ),
                  )
                  .toList(),
            ),
          );
  }
}
