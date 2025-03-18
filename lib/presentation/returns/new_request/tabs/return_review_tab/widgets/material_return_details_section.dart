part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';

class _MaterialReturnDetailsSection extends StatelessWidget {
  const _MaterialReturnDetailsSection({
    required this.detail,
  });
  final ReturnItemDetails detail;

  @override
  Widget build(BuildContext context) {
    return ExpandableInfo(
      key: WidgetKeys.returnDetailsSectionKey,
      labelText: 'Return details'.tr(),
      child: Column(
        children: [
          BalanceTextRow(
            keyText: 'Return Type'.tr(),
            keyTextStyle: Theme.of(context).textTheme.titleSmall,
            keyFlex: 2,
            valueFlex: 3,
            valueText: detail.returnType.returnTypeValue,
          ),
          BalanceTextRow(
            keyText: 'Reason'.tr(),
            keyTextStyle: Theme.of(context).textTheme.titleSmall,
            keyFlex: 2,
            valueFlex: 3,
            valueText: context
                .read<UsageCodeBloc>()
                .state
                .getUsage(detail.returnReason)
                .usageDescription,
          ),
          BalanceTextRow(
            keyText: 'Comments'.tr(),
            keyTextStyle: Theme.of(context).textTheme.titleSmall,
            keyFlex: 2,
            valueFlex: 3,
            valueText: detail.remarks.displayText,
          ),
          UploadedFileList(
            uuid: detail.uuid,
          ),
        ],
      ),
    );
  }
}
