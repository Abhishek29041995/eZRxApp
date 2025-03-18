import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class InvoiceItemCard extends StatelessWidget {
  const InvoiceItemCard({
    super.key,
    required this.customerOpenItem,
  });
  final CustomerOpenItem customerOpenItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr('Invoice')} #${customerOpenItem.accountingDocument}',
                style: Theme.of(context).textTheme.labelSmall,
                key: WidgetKeys.invoiceId,
              ),
              StatusLabel(
                status: StatusType(
                  customerOpenItem.status.getOrDefaultValue(''),
                ),
              ),
            ],
          ),
          if (context.read<EligibilityBloc>().state.salesOrg.showGovNumber)
            Text(
              '${context.tr('Gov. no')} ${customerOpenItem.documentReferenceID.displayDashIfEmpty}',
              style: Theme.of(context).textTheme.labelSmall,
              key: WidgetKeys.governmentNumber,
            ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    '${context.tr('Order')} #${customerOpenItem.orderId.displayNAIfEmpty}',
                    key: WidgetKeys.invoiceItemOrderId,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '${context.tr('Due on')} ${StringUtils.getDueDateString(
                      customerOpenItem.netDueDate.dateTimeOrNull,
                      context.read<EligibilityBloc>().state.salesOrganisation,
                    )}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: customerOpenItem.status.displayDueDateColor,
                        ),
                  ),
                ),
              ],
            ),
          ),
          PriceComponent(
            key: WidgetKeys.invoiceIdPrice,
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            price: customerOpenItem.openAmountInTransCrcy.toString(),
          ),
        ],
      ),
    );
  }
}
