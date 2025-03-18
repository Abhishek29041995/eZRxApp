part of 'package:ezrxmobile/presentation/returns/new_request/new_request_success/new_request_successful_page.dart';

class _ReturnItem extends StatelessWidget {
  final ReturnMaterial returnMaterial;
  final ReturnItemDetails returnItemDetail;
  const _ReturnItem({
    required this.returnMaterial,
    required this.returnItemDetail,
  });

  @override
  Widget build(BuildContext context) {
    return ReturnListItemCard.summaryItem(
      data: returnMaterial,
      detailData: returnItemDetail,
      bottomWidget: _ReturnExpandableSection(
        children: [
          _ExpandableMaterialDetails(materialDetail: returnMaterial),
          _ExpandableReturnDetail(returnItemDetail: returnItemDetail),
          _ExpandableBonusItems(
            bonusItems: context
                .read<NewRequestBloc>()
                .state
                .getBonusItemsWithBalanceQuantity(
                  returnMaterial,
                ),
          ),
        ],
      ),
    );
  }
}
