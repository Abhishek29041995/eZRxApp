import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/bonus_material_info.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/upload_file_list.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonusMaterialReturnInfo extends StatelessWidget {
  const BonusMaterialReturnInfo({
    super.key,
    required this.returnMaterial,
    required this.returnItemDetail,
  });
  final ReturnMaterial returnMaterial;
  final ReturnItemDetails returnItemDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.returnRequestBonusCard(returnMaterial.uuid),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BonusMaterialInfo(
          data: returnMaterial,
        ),
        const SizedBox(height: 8.0),
        const Divider(
          indent: 0,
          thickness: 1,
          endIndent: 0,
          height: 1,
          color: ZPColors.extraLightGrey2,
        ),
        const SizedBox(height: 8.0),
        Text(
          context.tr('Bonus return details'),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(height: 8.0),
        BalanceTextRow(
          keyText: 'Return Type'.tr(),
          keyTextStyle: Theme.of(context).textTheme.titleSmall,
          keyFlex: 2,
          valueFlex: 3,
          valueText: returnItemDetail.returnType.returnTypeValue,
        ),
        BalanceTextRow(
          keyText: context.tr('Reason'),
          keyFlex: 2,
          valueFlex: 3,
          valueText: context
              .read<UsageCodeBloc>()
              .state
              .getUsage(returnItemDetail.returnReason)
              .usageDescription,
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        BalanceTextRow(
          keyText: 'Comments'.tr(),
          keyTextStyle: Theme.of(context).textTheme.titleSmall,
          keyFlex: 2,
          valueFlex: 3,
          valueText: returnItemDetail.remarks.displayText,
        ),
        UploadedFileList(
          uuid: returnItemDetail.uuid,
        ),
      ],
    );
  }
}
