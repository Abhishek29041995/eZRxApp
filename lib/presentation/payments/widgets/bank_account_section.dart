import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/payments/widgets/detail_info_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BankAccountSection extends StatelessWidget {
  const BankAccountSection({
    super.key,
    required this.widgetKey,
    required this.details,
    required this.visible,
    required this.isLoading,
  });
  final Key widgetKey;
  final PaymentSummaryDetails details;
  final bool visible;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return visible
        ? DetailsInfoSection(
            label: 'Transfer to Virtual Bank Account',
            child: CustomCard(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.all(12),
              showBorder: false,
              showShadow: false,
              key: widgetKey,
              backgroundColor: ZPColors.lightSilver,
              child: Column(
                children: [
                  _BankAccountInfoRow(
                    title: 'Recipient bank',
                    text: '${details.bankIdentification} ${context.tr('Bank')}',
                  ),
                  _BankAccountInfoRow(
                    title: 'Recipient name',
                    text: details.bankName.displayNAIfEmpty,
                    isLoading: isLoading,
                  ),
                  _BankAccountInfoRow(
                    title: 'Virtual bank account number',
                    text: details.bankAccountNumber.displayNAIfEmpty,
                    isLoading: isLoading,
                    canCopy: true,
                  ),
                  _BankAccountInfoRow(
                    title: 'Total amount to transfer',
                    text: details.paymentAmount.toString(),
                    isPrice: true,
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

class _BankAccountInfoRow extends StatelessWidget {
  const _BankAccountInfoRow({
    required this.title,
    required this.text,
    this.isLoading = false,
    this.isPrice = false,
    this.canCopy = false,
  });
  final String title;
  final String text;
  final bool isLoading;
  final bool isPrice;
  final bool canCopy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(title),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.passwordValidationsColor,
                ),
          ),
          isLoading
              ? SizedBox(
                  child: LoadingShimmer.tile(),
                )
              : Row(
                  children: [
                    isPrice
                        ? PriceComponent(
                            salesOrgConfig: context
                                .read<EligibilityBloc>()
                                .state
                                .salesOrgConfigs,
                            price: text,
                          )
                        : Text(
                            text,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: ZPColors.primary,
                                    ),
                          ),
                    if (canCopy)
                      GestureDetector(
                        onTap: () =>
                            Clipboard.setData(ClipboardData(text: text))
                                .whenComplete(
                          () => CustomSnackBar(
                            messageText: context.tr('Copied'),
                          ).show(context),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.copy,
                            color: ZPColors.extraDarkGreen,
                            size: 16,
                          ),
                        ),
                      ),
                  ],
                ),
        ],
      ),
    );
  }
}
