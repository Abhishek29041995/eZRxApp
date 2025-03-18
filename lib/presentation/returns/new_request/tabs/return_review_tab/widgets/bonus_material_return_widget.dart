import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/bonus_material_info.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/upload_file_list.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonusMaterialReturnWidget extends StatefulWidget {
  final ReturnMaterial returnMaterial;
  final ReturnItemDetails returnItemDetail;
  const BonusMaterialReturnWidget({
    super.key,
    required this.returnItemDetail,
    required this.returnMaterial,
  });

  @override
  State<BonusMaterialReturnWidget> createState() =>
      _BonusMaterialReturnInfoState();
}

class _BonusMaterialReturnInfoState extends State<BonusMaterialReturnWidget> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              context.tr('Bonus Details'),
              key: WidgetKeys.newReturnBonusDetailsCard,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          BonusMaterialInfo(
            data: widget.returnMaterial,
          ),
          const SizedBox(height: 8.0),
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isExpanded
                      ? context.tr('Hide details')
                      : context.tr('Show details'),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.extraDarkGreen,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: ZPColors.extraDarkGreen,
                ),
              ],
            ),
          ),
          if (_isExpanded)
            const Divider(
              indent: 0,
              thickness: 1,
              endIndent: 0,
              height: 10,
              color: ZPColors.extraLightGrey2,
            ),
          if (_isExpanded) const SizedBox(height: 8.0),
          if (_isExpanded)
            Text(
              context.tr('Bonus return details'),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
          if (_isExpanded) const SizedBox(height: 8.0),
          if (_isExpanded)
            BalanceTextRow(
              keyText: context.tr('Return Type'),
              keyTextStyle: Theme.of(context).textTheme.titleSmall,
              keyFlex: 2,
              valueFlex: 3,
              valueText: widget.returnItemDetail.returnType.returnTypeValue,
            ),
          if (_isExpanded)
            BalanceTextRow(
              keyText: context.tr('Reason'),
              keyFlex: 2,
              valueFlex: 3,
              valueText: context
                  .read<UsageCodeBloc>()
                  .state
                  .getUsage(widget.returnItemDetail.returnReason)
                  .usageDescription,
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
          if (_isExpanded)
            BalanceTextRow(
              keyText: context.tr('Comments'),
              keyTextStyle: Theme.of(context).textTheme.titleSmall,
              keyFlex: 2,
              valueFlex: 3,
              valueText: widget.returnItemDetail.remarks.displayText,
            ),
          if (_isExpanded)
            UploadedFileList(
              uuid: widget.returnItemDetail.uuid,
            ),
        ],
      ),
    );
  }
}
