part of 'package:ezrxmobile/presentation/returns/new_request/new_request_success/new_request_successful_page.dart';

class _ExpandableReturnDetail extends StatelessWidget {
  final ReturnItemDetails returnItemDetail;
  const _ExpandableReturnDetail({
    required this.returnItemDetail,
  });

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
          'Return details'.tr(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(height: 8.0),
        BalanceTextRow(
          keyText: 'Return Type'.tr(),
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          keyFlex: 2,
          valueFlex: 3,
          valueText: returnItemDetail.returnType.returnTypeValue,
          valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        BalanceTextRow(
          keyText: 'Reason'.tr(),
          keyFlex: 2,
          valueFlex: 3,
          valueText: context
              .read<UsageCodeBloc>()
              .state
              .getUsage(returnItemDetail.returnReason)
              .usageDescription,
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        BalanceTextRow(
          keyText: 'Comments'.tr(),
          keyFlex: 2,
          valueFlex: 3,
          valueText: returnItemDetail.remarks.displayText,
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        UploadedFileList(uuid: returnItemDetail.uuid),
      ],
    );
  }
}
