part of 'package:ezrxmobile/presentation/returns/new_request/new_request_success/new_request_successful_page.dart';

class _ExpandableMaterialDetails extends StatelessWidget {
  final ReturnMaterial materialDetail;
  const _ExpandableMaterialDetails({required this.materialDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        const Divider(
          indent: 0,
          thickness: 1,
          endIndent: 0,
          height: 1,
          color: ZPColors.extraLightGrey2,
        ),
        const SizedBox(height: 8.0),
        Text(
          'Material details'.tr(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(height: 8.0),
        BalanceTextRow(
          keyText: materialDetail.displayPrincipalOrSellerCode.tr(),
          keyFlex: 2,
          valueFlex: 3,
          valueText: materialDetail.principalCode.getOrDefaultValue(''),
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        BalanceTextRow(
          keyText: materialDetail.displayPrincipalOrSellerName.tr(),
          keyFlex: 2,
          valueFlex: 3,
          valueText: materialDetail.principalName.name,
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        BalanceTextRow(
          keyText: context.tr('Invoice number'),
          keyFlex: 2,
          valueFlex: 3,
          valueText: materialDetail.assignmentNumber,
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        BalanceTextRow(
          keyText: 'Invoice date'.tr(),
          keyFlex: 2,
          valueFlex: 3,
          valueText: materialDetail.priceDate.dateString,
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
      ],
    );
  }
}
