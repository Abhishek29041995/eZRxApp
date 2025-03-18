part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';

class _ReturnMaterialWidget extends StatelessWidget {
  final ReturnMaterial item;
  final List<ReturnMaterial> bonusItems;
  final ReturnItemDetails itemDetail;

  const _ReturnMaterialWidget({
    super.key,
    required this.item,
    required this.bonusItems,
    required this.itemDetail,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.returnReviewItemKey,
      showBorder: true,
      showShadow: false,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        key: WidgetKeys.returnRequestMaterialCard(item.uuid),
        children: [
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
                  width: MediaQuery.sizeOf(context).height * 0.1,
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  fit: BoxFit.fitHeight,
                  materialNumber: item.materialNumber,
                ),
              ),
              Expanded(
                child: MaterialInfoWidget(
                  data: item,
                ),
              ),
            ],
          ),
          MaterialQuantityAndPrice(
            returnQuantity: itemDetail.returnQuantity.getIntValue,
            balanceQuantity: itemDetail.balanceQty.getOrDefaultValue(0),
            totalPrice: itemDetail.returnValue,
          ),
          ExpandableSection(
            expanded: true,
            child: Column(
              children: [
                MaterialDetailsSection(
                  key: WidgetKeys.newRequestStep3MaterialDetail,
                  data: item,
                ),
                _MaterialReturnDetailsSection(
                  detail: itemDetail,
                ),
                _BonusItemSection(
                  items: bonusItems,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
