import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/view_by_item_filter/view_by_item_return_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/presentation/core/custom_numeric_text_field.dart';
import 'package:ezrxmobile/presentation/core/regexes.dart';
import 'package:ezrxmobile/presentation/core/value_range_error.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/returns/return_list/return_by_item_filter/widgets/return_by_item_filter_button.dart';
part 'package:ezrxmobile/presentation/returns/return_list/return_by_item_filter/widgets/return_by_item_filter_date_range_picker.dart';
part 'package:ezrxmobile/presentation/returns/return_list/return_by_item_filter/widgets/return_by_item_filter_status_picker.dart';
part 'package:ezrxmobile/presentation/returns/return_list/return_by_item_filter/widgets/return_by_item_filter_type_picker.dart';
part 'package:ezrxmobile/presentation/returns/return_list/return_by_item_filter/widgets/return_by_item_filter_amount_range_input.dart';

const _defaultPadding = EdgeInsets.symmetric(horizontal: padding12);

class ReturnByItemFilterPage extends StatelessWidget {
  const ReturnByItemFilterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            title: Text(
              context.tr('Filter'),
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: ZPColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            automaticallyImplyLeading: false,
            centerTitle: false,
            elevation: 0,
            actions: [
              IconButton(
                key: WidgetKeys.closeButton,
                onPressed: () {
                  context.router.maybePop();
                },
                icon: const Icon(Icons.clear, color: ZPColors.black),
              ),
            ],
          ),
          const _ReturnFilter(),
          const Divider(
            height: padding24,
            endIndent: 0,
            indent: 0,
            color: ZPColors.lightGrey,
          ),
          const Padding(
            padding: _defaultPadding,
            child: Row(
              children: [
                _ResetButton(),
                SizedBox(width: padding12),
                _ApplyButton(),
              ],
            ),
          ),
          const SizedBox(height: padding12),
        ],
      ),
    );
  }
}

class _ReturnFilter extends StatelessWidget {
  const _ReturnFilter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemReturnFilterBloc, ViewByItemReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessage != current.showErrorMessage,
      builder: (context, state) {
        final salesOrgConfig =
            context.read<EligibilityBloc>().state.salesOrgConfigs;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: padding12),
            if (context.read<EligibilityBloc>().state.marketPlaceEligible) ...[
              const _FilterSectionLabel('Show returns'),
              const Padding(
                padding: EdgeInsets.all(padding12),
                child: _ReturnTypePicker(),
              ),
            ],
            _FilterSectionLabel(context.tr('Request date')),
            const Padding(
              padding: EdgeInsets.fromLTRB(
                padding12,
                padding12,
                padding12,
                padding24,
              ),
              child: _RequestDateRangePicker(),
            ),
            _FilterSectionLabel(
              '${context.tr('Request amount')} (${salesOrgConfig.currency.code})',
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(
                padding12,
                padding12,
                padding12,
                0,
              ),
              child: _RequestAmountRangeInput(),
            ),
            if (!state.filter.isReturnAmountValueRangeValid)
              Padding(
                padding: _defaultPadding,
                child: ValueRangeError(
                  label: context.tr('Invalid Amount range!'),
                  isValid: state.filter.isReturnAmountValueRangeValid,
                ),
              ),
            const SizedBox(height: padding24),
            _FilterSectionLabel(context.tr('Status')),
            const Padding(
              padding: _defaultPadding,
              child: _StatusPicker(),
            ),
          ],
        );
      },
    );
  }
}

class _FilterSectionLabel extends StatelessWidget {
  final String text;
  const _FilterSectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _defaultPadding,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: ZPColors.neutralsBlack,
            ),
      ),
    );
  }
}
