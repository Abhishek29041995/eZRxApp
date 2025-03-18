part of 'package:ezrxmobile/presentation/payments/widgets/bank_info.dart';

class _BankInfoDetail extends StatelessWidget {
  final BankBeneficiary bankBeneficiary;
  final bool displayDivider;
  const _BankInfoDetail({
    required this.bankBeneficiary,
    this.displayDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.bankInfoTile,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BalanceTextRow(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          keyText: context.tr('Bank name'),
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.black,
              ),
          valueText: bankBeneficiary.bankName.displayNAIfEmpty,
        ),
        BalanceTextRow(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          keyText: context.tr('Account number'),
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.black,
              ),
          valueText: bankBeneficiary.bankAccount.displayNAIfEmpty,
        ),
        BalanceTextRow(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          keyText: context.tr('Account holder'),
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.black,
              ),
          valueText: bankBeneficiary.beneficiaryName.displayNAIfEmpty,
        ),
        if (displayDivider) const OrDivider(),
      ],
    );
  }
}
