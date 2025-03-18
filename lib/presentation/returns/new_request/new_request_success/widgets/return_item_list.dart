part of 'package:ezrxmobile/presentation/returns/new_request/new_request_success/new_request_successful_page.dart';

class _ReturnItemList extends StatelessWidget {
  const _ReturnItemList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: BlocBuilder<NewRequestBloc, NewRequestState>(
        buildWhen: (previous, current) =>
            previous.selectedItems != current.selectedItems,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${'Return items'.tr()} (${state.selectedItems.length})',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              const SizedBox(height: 12),
              if (state.containsMPItems)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: MarketPlaceSellerWithLogo(
                    state.selectedItems.first.principalName.name,
                  ),
                ),
              ...state.selectedItems
                  .map(
                    (e) => e.balanceQuantity.isGreaterThanZero
                        ? _ReturnItem(
                            returnMaterial: e,
                            returnItemDetail:
                                state.getReturnItemDetails(e.uuid),
                          )
                        : Column(
                            children: state
                                .getReturnBonusItemsOfMainItem(e)
                                .map(
                                  (item) => BonusMaterialReturnWidget(
                                    returnMaterial: item,
                                    returnItemDetail:
                                        state.getReturnItemDetails(item.uuid),
                                  ),
                                )
                                .toList(),
                          ),
                  )
                  ,
            ],
          );
        },
      ),
    );
  }
}
