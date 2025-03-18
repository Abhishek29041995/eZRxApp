import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TenderContractSection extends StatelessWidget {
  final TenderContract tenderContract;
  const TenderContractSection({super.key, required this.tenderContract});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ExpansionTile(
        key: WidgetKeys.tenderExpandableSection,
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        iconColor: ZPColors.black,
        backgroundColor: ZPColors.tenderUnselectBg,
        collapsedBackgroundColor: ZPColors.tenderUnselectBg,
        tilePadding: const EdgeInsets.symmetric(horizontal: 10),
        title: Wrap(
          children: [
            Text(
              key: WidgetKeys.tenderOrderReason,
              '${tenderContract.tenderOrderReason.displayTenderContractReason} - ${context.tr('Contract Tender')}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 4),
            Text(
              key: WidgetKeys.tenderContractNumber,
              tenderContract.contractNumber.getValue(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ZPColors.darkerGrey,
                  ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr('Price'),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ZPColors.darkerGrey,
                            ),
                      ),
                      PriceComponent(
                        key: WidgetKeys.tenderContractPrice,
                        type: PriceStyle.tenderViewOrderByItemPrice,
                        price: tenderContract.tenderPrice.toString(),
                        salesOrgConfig: context
                            .read<EligibilityBloc>()
                            .state
                            .salesOrgConfigs,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr('Reference'),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ZPColors.darkerGrey,
                            ),
                      ),
                      Text(
                        key: WidgetKeys.tenderContractReference,
                        tenderContract.contractReference.getValue(),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ZPColors.primary,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
