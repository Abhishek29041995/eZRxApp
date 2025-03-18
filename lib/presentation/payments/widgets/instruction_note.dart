part of 'package:ezrxmobile/presentation/payments/widgets/bank_info.dart';

class _InstructionNote extends StatelessWidget {
  const _InstructionNote();

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.bankInInstructionNote,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            context.tr('Notes'),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        BulletWidget(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          content: Text(
            context.tr(
              'For OTC payments, write the 16-digit Payment Advice No. (ex. 09EP230001568101) on the bank deposit slip.',
            ),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
        ),
        const BulletWidget(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          content: RichTextSpan(
            text:
                'For online banking, select [b]Bills Payment[b] and input the 16-digit Payment Advice No. (ex. 09EP230001568101) for your reference number.',
            textColor: ZPColors.extraLightGrey4,
          ),
        ),
        BulletWidget(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          content: Text(
            context.tr(
              'Please DO NOT use the Funds Transfer facility.',
            ),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
        ),
      ],
    );
  }
}
