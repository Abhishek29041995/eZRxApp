import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/or_divider.dart';
import 'package:ezrxmobile/presentation/core/rich_text_span.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

part 'package:ezrxmobile/presentation/payments/widgets/instruction_note.dart';
part 'package:ezrxmobile/presentation/payments/widgets/bank_info_detail.dart';

class BankInfo extends StatelessWidget {
  final List<BankBeneficiary> bankInAccounts;
  const BankInfo({
    required this.bankInAccounts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            context.tr('Bank-in account information'),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        ...bankInAccounts
            .mapIndexed(
              (index, bankInAccount) => _BankInfoDetail(
                bankBeneficiary: bankInAccount,
                displayDivider: index != bankInAccounts.length - 1,
              ),
            )
            ,
        const _InstructionNote(),
      ],
    );
  }
}
