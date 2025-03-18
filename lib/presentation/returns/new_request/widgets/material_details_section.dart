import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/expandable_info.dart';
import 'package:flutter/material.dart';

class MaterialDetailsSection extends StatelessWidget {
  const MaterialDetailsSection({
    super.key,
    required this.data,
    this.expandable = false,
  });
  final ReturnMaterial data;
  final bool expandable;

  @override
  Widget build(BuildContext context) {
    return ExpandableInfo(
      labelText: context.tr('Material details'),
      expandable: expandable,
      child: Column(
        children: [
          BalanceTextRow(
            keyText: context.tr(data.displayPrincipalOrSellerCode),
            keyTextStyle: Theme.of(context).textTheme.titleSmall,
            keyFlex: 2,
            valueFlex: 3,
            valueText: data.principalCode.getOrDefaultValue(''),
          ),
          BalanceTextRow(
            keyText: context.tr(data.displayPrincipalOrSellerName),
            keyTextStyle: Theme.of(context).textTheme.titleSmall,
            keyFlex: 2,
            valueFlex: 3,
            valueText: data.principalName.name,
          ),
          BalanceTextRow(
            keyText: context.tr('Invoice number'),
            keyTextStyle: Theme.of(context).textTheme.titleSmall,
            keyFlex: 2,
            valueFlex: 3,
            valueText: data.assignmentNumber,
          ),
          BalanceTextRow(
            keyText: context.tr('Invoice date'),
            keyTextStyle: Theme.of(context).textTheme.titleSmall,
            keyFlex: 2,
            valueFlex: 3,
            valueText: data.priceDate.dateString,
          ),
        ],
      ),
    );
  }
}
