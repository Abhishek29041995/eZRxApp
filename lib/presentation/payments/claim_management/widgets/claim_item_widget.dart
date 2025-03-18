part of 'package:ezrxmobile/presentation/payments/claim_management/claim_management_page.dart';

class _ClaimItemWidget extends StatelessWidget {
  final ClaimItem item;
  const _ClaimItemWidget({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.claimManagementItem,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.principalDisplay,
          key: WidgetKeys.claimItemPrincipal,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.tr(item.claimType.title),
              key: WidgetKeys.claimItemClaimType,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.shadesBlack,
                  ),
            ),
            Text(
              'eczs#${item.id}',
              key: WidgetKeys.claimItemId,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ZPColors.extraDarkGreen,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Text(
                '${context.tr('Submit date')}: ${item.createdAt.dateOrNaString}',
                key: WidgetKeys.claimItemSubmitDate,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.neutralsGrey1,
                    ),
              ),
            ),
            PriceComponent(
              key: WidgetKeys.claimItemAmount,
              salesOrgConfig:
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
              price: item.amount.toString(),
              priceLabelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ZPColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const Divider(
          color: ZPColors.tenderUnselectBorder,
          height: 32,
          indent: 0,
          endIndent: 0,
        ),
      ],
    );
  }
}
