import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditItemCard extends StatelessWidget {
  const CreditItemCard({
    super.key,
    required this.customerOpenItem,
  });
  final CustomerOpenItem customerOpenItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr('Credit Note')} #${customerOpenItem.accountingDocument}',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
                key: WidgetKeys.accountingDocument,
              ),
              Text(
                customerOpenItem.postingDate.dateString,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              ),
            ],
          ),
          if (context.read<EligibilityBloc>().state.salesOrg.showGovNumber) ...[
            const SizedBox(height: 4),
            Text(
              '${context.tr('Gov. no')} ${customerOpenItem.documentReferenceID.displayDashIfEmpty}',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
              key: WidgetKeys.governmentNumber,
            ),
          ],
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                customerOpenItem.postingKeyName,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              PriceComponent(
                key: WidgetKeys.creditIdPrice,
                type: PriceStyle.comboSubTotalExclTax,
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: customerOpenItem.openAmountInTransCrcy.abs().toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
