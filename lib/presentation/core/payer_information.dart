import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayerInformation extends StatelessWidget {
  final bool expanded;
  const PayerInformation({
    super.key,
    required this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    final payerInfoState = context.read<PaymentCustomerInformationBloc>().state;

    return payerInfoState.billToInfoAvailable &&
            context.read<EligibilityBloc>().state.salesOrgConfigs.enableBillTo
        ? Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              key: WidgetKeys.payerInformation,
              initiallyExpanded: expanded,
              tilePadding: const EdgeInsets.only(
                left: 0,
                top: 10,
              ),
              title: Text(
                '${context.tr('Bill-to')}: ${payerInfoState.getBillToInfo.billToCustomerCode}',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                key: WidgetKeys.billToCustomerCode,
              ),
              subtitle: Text(
                '${payerInfoState.getBillToInfo.billToAddress}',
                style: Theme.of(context).textTheme.bodyMedium,
                key: WidgetKeys.billToAddress,
              ),
              children: [
                BalanceTextRow(
                  keyText: context.tr('Name'),
                  keyTextStyle: Theme.of(context).textTheme.bodyMedium,
                  valueText: '${payerInfoState.getBillToInfo.billToName}',
                  valueTextStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                BalanceTextRow(
                  keyText: context.tr('Email'),
                  keyTextStyle: Theme.of(context).textTheme.bodyMedium,
                  valueText: payerInfoState.customerEmailAddress,
                  valueTextStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                BalanceTextRow(
                  keyText: context.tr('Tax number'),
                  keyTextStyle: Theme.of(context).textTheme.bodyMedium,
                  valueText:
                      payerInfoState.getBillToInfo.taxNumber.displayNAIfEmpty,
                  valueTextStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                BalanceTextRow(
                  keyText: context.tr('Phone'),
                  keyTextStyle: Theme.of(context).textTheme.bodyMedium,
                  valueText: payerInfoState.getBillToInfo.telephoneNumber,
                  valueTextStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
