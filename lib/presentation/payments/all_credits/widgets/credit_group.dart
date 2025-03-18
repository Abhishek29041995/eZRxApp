part of 'package:ezrxmobile/presentation/payments/all_credits/all_credits.dart';

class _CreditGroup extends StatelessWidget {
  final CreditAndInvoiceGroup data;
  final bool showDivider;

  const _CreditGroup({
    required this.data,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showDivider)
          const Divider(
            indent: 0,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  '${context.tr('Created on')} ${data.dueDate.dateString}',
                  key: WidgetKeys.creditCreatedOn,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkerGrey,
                      ),
                ),
              ),
              ...data.items.map(
                (e) => _CreditsItem(creditItem: e),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
