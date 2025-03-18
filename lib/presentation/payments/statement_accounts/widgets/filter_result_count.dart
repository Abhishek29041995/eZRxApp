part of 'package:ezrxmobile/presentation/payments/statement_accounts/statement_accounts.dart';

class _FilterResultCount extends StatelessWidget {
  final int value;

  const _FilterResultCount(this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.soaFilterResultCount,
      padding: const EdgeInsets.only(top: 14, bottom: 16, left: 20, right: 20),
      child: Wrap(
        runSpacing: 10,
        key: WidgetKeys.totalMaterialItemCount,
        children: [
          Text(
            context.tr('Search results'),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: ZPColors.paleBlueGray,
            ),
            child: Text(
              '$value',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ZPColors.darkTeal,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
