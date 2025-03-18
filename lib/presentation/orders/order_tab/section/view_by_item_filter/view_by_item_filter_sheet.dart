import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/filter_section_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

part 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/widgets/view_by_item_filter_app_bar.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/widgets/view_by_item_filter_apply_button.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/widgets/view_by_item_filter_date_range_picker.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/widgets/view_by_item_filter_reset_button.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/widgets/view_by_item_filter_status_picker.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/widgets/view_by_item_filter_type_picker.dart';

const _defaultPadding = EdgeInsets.symmetric(horizontal: 15);

class ViewByItemFilterSheet extends StatelessWidget {
  const ViewByItemFilterSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _ViewByItemFilterAppBar(),
          Flexible(
            child: _FilterList(),
          ),
          Divider(
            height: 32,
            endIndent: 0,
            indent: 0,
            color: ZPColors.lightGrey,
          ),
          Padding(
            padding: _defaultPadding,
            child: Row(
              children: [
                Expanded(
                  child: _ViewByItemFilterResetButton(),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _ViewByItemFilterApplyButton(),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _FilterList extends StatelessWidget {
  const _FilterList();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: ListView(
        key: WidgetKeys.scrollList,
        shrinkWrap: true,
        children: [
          const SizedBox(height: 12),
          if (context.read<EligibilityBloc>().state.marketPlaceEligible) ...[
            const FilterSectionLabel('Show history'),
            const SizedBox(height: 12),
            Padding(
              padding: _defaultPadding
                  .subtract(const EdgeInsets.symmetric(horizontal: 3)),
              child: const _ViewByItemFilterHistoryTypePicker(),
            ),
            const SizedBox(height: 20),
          ],
          const FilterSectionLabel('Order date'),
          const SizedBox(height: 12),
          const Padding(
            padding: _defaultPadding,
            child: _ViewByItemFilterDateRangePicker(),
          ),
          const SizedBox(height: 20),
          const FilterSectionLabel('Status'),
          const SizedBox(height: 12),
          const Padding(
            padding: _defaultPadding,
            child: _ViewByItemFilterStatusPicker(),
          ),
        ],
      ),
    );
  }
}
