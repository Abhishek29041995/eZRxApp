import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/filter/return_items_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/returns/entities/return_items_filter.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/widgets/invoice_dates_filter.dart';
part 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/widgets/filter_action_buttons.dart';

class ReturnItemsFilterBottomSheet extends StatelessWidget {
  const ReturnItemsFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      sheetKey: WidgetKeys.returnItemsFilter,
      headerText: 'Filter',
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Invoice date'.tr(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Row(
              children: [
                const _FromInvoiceDateFilter(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '-',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                const _ToInvoiceDateFilter(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                _ResetButton(),
                SizedBox(
                  width: 12,
                ),
                _ApplyButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
