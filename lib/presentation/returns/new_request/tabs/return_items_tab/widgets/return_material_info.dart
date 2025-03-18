part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_tab.dart';

class _ReturnMaterialInfo extends StatelessWidget {
  const _ReturnMaterialInfo({
    required this.data,
  });

  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.newReturnItem,
      showBorder: true,
      showShadow: false,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(0),
      child: Column(
        children: [
          if (data.displayOutSidePolicy(
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
                  key: WidgetKeys.newReturnItemImage,
                  width: MediaQuery.of(context).size.height * 0.1,
                  height: MediaQuery.of(context).size.height * 0.1,
                  fit: BoxFit.fitHeight,
                  materialNumber: data.materialNumber,
                ),
              ),
              Expanded(
                child: MaterialInfoWidget(
                  data: data,
                  showMpLogo: true,
                ),
              ),
            ],
          ),
          MaterialQuantityAndPrice(
            returnQuantity: data.targetQuantity.getOrDefaultValue(0),
            balanceQuantity: data.balanceQuantity.getOrDefaultValue(0),
            totalPrice: data.totalPrice.getOrDefaultValue(0),
            displayReturnableQuantity: true,
          ),
          ExpandableSection(
            expanded: false,
            child: Column(
              children: [
                MaterialDetailsSection(
                  data: data,
                ),
              ],
            ),
          ),
          _BonusItemSection(
            items: data.bonusItemsBelongToZPorMP,
          ),
        ],
      ),
    );
  }
}
