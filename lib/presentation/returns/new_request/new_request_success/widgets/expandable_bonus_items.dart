part of 'package:ezrxmobile/presentation/returns/new_request/new_request_success/new_request_successful_page.dart';

class _ExpandableBonusItems extends StatelessWidget {
  final List<ReturnMaterial> bonusItems;
  const _ExpandableBonusItems({required this.bonusItems});

  @override
  Widget build(BuildContext context) {
    if (bonusItems.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      key: WidgetKeys.returnBonusItemSection,
      children: [
        const SizedBox(
          height: 8,
        ),
        const Divider(
          indent: 0,
          thickness: 1,
          endIndent: 0,
          height: 1,
          color: ZPColors.extraLightGrey2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                context.tr('Bonus details'),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            StatusLabel(
              status: StatusType('Pending approval'),
              valueColor: ZPColors.neutralsBlack,
            ),
          ],
        ),
        ...bonusItems
            .map(
              (e) => BonusMaterialReturnInfo(
                returnMaterial: e,
                returnItemDetail: context
                    .read<NewRequestBloc>()
                    .state
                    .getReturnItemDetails(e.uuid),
              ),
            )
            ,
      ],
    );
  }
}
