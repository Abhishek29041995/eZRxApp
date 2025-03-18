import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/return_item_price.dart';
import 'package:ezrxmobile/presentation/returns/widgets/ware_house_storage_condition_tag.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class MaterialInfoWidget extends StatelessWidget {
  final bool showMpLogo;
  final ReturnMaterial data;

  const MaterialInfoWidget({
    super.key,
    required this.data,
    this.showMpLogo = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        bottom: 8.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (data.isMarketPlace && showMpLogo)
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: MarketPlaceLogo.medium(),
                ),
              Text(
                data.materialNumber.displayMatNo,
                style: Theme.of(context).textTheme.bodyMedium,
                key: WidgetKeys.itemMaterialNumberKey,
              ),
            ],
          ),
          Text(
            data.defaultMaterialDescription,
            style: Theme.of(context).textTheme.labelMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            key: WidgetKeys.itemTitleKey,
          ),
          Text(
            '${context.tr('Batch')}: ${data.displayBatch} - ${context.tr('Expires')}: ${data.displayExpiryDate}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
            key: WidgetKeys.returnBatchAndExpires,
          ),
          ReturnItemPrice(data: data),
          WareHouseStorageConditionTag(
            wareHouseStorageCondition:
                data.wareHouseStorageCondition.displayStorageCondition,
          ),
        ],
      ),
    );
  }
}
