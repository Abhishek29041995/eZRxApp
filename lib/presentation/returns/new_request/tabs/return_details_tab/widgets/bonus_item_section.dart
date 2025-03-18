part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';

class _BonusItemSection extends StatelessWidget {
  const _BonusItemSection({
    super.key,
    required this.returnItem,
    required this.counterOfferEnabled,
  });
  final ReturnMaterial returnItem;
  final bool counterOfferEnabled;

  @override
  Widget build(BuildContext context) {
    final bonusItems = returnItem.bonusItemsBelongToZPorMP;

    return bonusItems.isEmpty
        ? const SizedBox.shrink()
        : BlocBuilder<NewRequestBloc, NewRequestState>(
            buildWhen: (previous, current) =>
                previous.invoiceDetails != current.invoiceDetails,
            builder: (context, state) {
              return Column(
                children: bonusItems.map(
                  (bonusItem) {
                    final detail = state.getReturnItemDetails(bonusItem.uuid);

                    return Column(
                      key: WidgetKeys.returnRequestBonusCard(bonusItem.uuid),
                      children: [
                        _MaterialBonusInfoSection(
                          returnItem: returnItem,
                          bonusItem: bonusItem,
                        ),
                        if (detail.itemNumber.isNotEmpty &&
                            bonusItem.editDetailsAllowed)
                          _MaterialBonusDetailsSection(
                            item: bonusItem,
                            returnItem: returnItem,
                            detail: detail,
                            counterOfferEnabled: counterOfferEnabled,
                          ),
                      ],
                    );
                  },
                ).toList(),
              );
            },
          );
  }
}
