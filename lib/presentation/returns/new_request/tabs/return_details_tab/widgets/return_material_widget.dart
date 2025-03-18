part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';

class _ReturnMaterialWidget extends StatelessWidget with BottomsheetMixin {
  final ReturnMaterial item;
  final ReturnItemDetails detail;
  const _ReturnMaterialWidget({
    required this.item,
    required this.detail,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.getReturnItemDetails(item.uuid) !=
          current.getReturnItemDetails(item.uuid),
      builder: (context, state) {
        return CustomCard(
          key: WidgetKeys.returnRequestMaterialCard(item.uuid),
          showBorder: true,
          showShadow: false,
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              if (!item.balanceQuantity.isGreaterThanZero)
                const _ReturnRequestWarning(),
              if (item.displayOutSidePolicy(
                context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrgConfigs
                    .allowReturnsOutsidePolicy,
              ))
                const OutsideReturnPolicyTag(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCard(
                    showShadow: false,
                    showBorder: true,
                    child: ProductImage(
                      key: WidgetKeys.newRequestStep2ItemImage,
                      width: MediaQuery.of(context).size.height * 0.1,
                      height: MediaQuery.of(context).size.height * 0.1,
                      fit: BoxFit.fitHeight,
                      materialNumber: item.materialNumber,
                    ),
                  ),
                  Expanded(
                    child: MaterialInfoWidget(
                      data: item,
                    ),
                  ),
                  IconButton(
                    key: WidgetKeys.newRequestStep2RemoveIcon,
                    visualDensity: const VisualDensity(vertical: -4),
                    onPressed: () => _removeItem(
                      context,
                      state.selectedItems.length,
                    ),
                    icon: const Icon(
                      Icons.delete_outline_outlined,
                      color: ZPColors.red,
                    ),
                  ),
                ],
              ),
              MaterialQuantityAndPrice(
                returnQuantity: item.targetQuantity.getOrDefaultValue(0),
                balanceQuantity: item.balanceQuantity.getOrDefaultValue(0),
                totalPrice: item.totalPrice.getOrDefaultValue(0),
                displayReturnableQuantity: true,
                key: WidgetKeys.newRequestStep2QuantityAndPrice,
              ),
              MaterialDetailsSection(
                key: WidgetKeys.newRequestStep2DetailsSection,
                data: item,
                expandable: true,
              ),
              if (item.editDetailsAllowed)
                _MaterialReturnDetailsSection(
                  key: WidgetKeys.materialReturnDetailsSection,
                  item: item,
                  detail: detail,
                ),
              _BonusItemSection(
                key: WidgetKeys.bonusItemSection,
                returnItem: item,
                counterOfferEnabled: !item.editDetailsAllowed,
              ),
            ],
          ),
        );
      },
    );
  }

  Future _removeItem(BuildContext context, int itemsLength) async {
    final confirmed = await showConfirmBottomSheet(
      context: context,
    );
    if (confirmed ?? false) {
      if (itemsLength == 1) {
        if (context.mounted) {
          await AutoTabsRouter.of(context)
              .navigate(const ReturnItemsTabRoute());
        }
      }
      if (context.mounted) {
        context.read<NewRequestBloc>().add(
              NewRequestEvent.toggleReturnItem(
                selected: false,
                item: item,
              ),
            );
      }
    }
  }
}

class _ReturnRequestWarning extends StatelessWidget {
  const _ReturnRequestWarning();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: ZPColors.lightBorderYellow,
      ),
      child: Text(
        context.tr(
          'You cannot return this commercial item as there is no balance quantity.',
        ),
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
