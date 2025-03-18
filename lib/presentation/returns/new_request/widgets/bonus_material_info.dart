import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/return_item_price.dart';
import 'package:ezrxmobile/presentation/returns/widgets/ware_house_storage_condition_tag.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonusMaterialInfo extends StatelessWidget {
  const BonusMaterialInfo({
    super.key,
    required this.data,
    this.displayReturnableQuantity = false,
  });

  final ReturnMaterial data;
  final bool displayReturnableQuantity;

  String getQuantity(BuildContext context) {
    final details =
        context.read<NewRequestBloc>().state.getReturnItemDetails(data.uuid);

    return details.returnQuantity.getIntValue > 0 && !displayReturnableQuantity
        ? details.returnQuantity.getIntValue.toString()
        : data.targetQuantity.apiParameterValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: ZPColors.extraLightGray,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                data.materialNumber.displayMatNo,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                width: 5,
              ),
              if (!context.read<EligibilityBloc>().state.salesOrg.isID)
                StatusLabel(
                  key: WidgetKeys.itemBonusTagKey,
                  status: StatusType('Bonus'),
                  valueColor: ZPColors.white,
                ),
            ],
          ),
          Text(
            data.defaultMaterialDescription,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            '${context.tr('Batch')}: ${data.displayBatch} - ${context.tr('Expires')}: ${data.displayExpiryDate}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
            key: WidgetKeys.returnBatchAndExpires,
          ),
          const SizedBox(
            height: 8,
          ),
          ReturnItemPrice(data: data),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr('Qty')}: ${getQuantity(context)}',
              ),
              if (displayReturnableQuantity)
                Text(
                  '${context.tr('Returnable Qty')}: ${data.balanceQuantity.getOrDefaultValue(0)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.black,
                      ),
                  key: WidgetKeys.itemBalanceQtyKey,
                ),
            ],
          ),
          WareHouseStorageConditionTag(
            wareHouseStorageCondition:
                data.wareHouseStorageCondition.displayStorageCondition,
          ),
          Text(
            context.tr(
              'Bonus unit price is derived by order subtotal divided by the total item quantity (incl. bonus).',
            ),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: ZPColors.changePasswordRecommendationColor,
            ),
          ),
        ],
      ),
    );
  }
}
