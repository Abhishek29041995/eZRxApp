import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/view_by_request_filter/view_by_request_return_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/presentation/core/custom_numeric_text_field.dart';
import 'package:ezrxmobile/presentation/core/regexes.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/value_range_error.dart';

part 'package:ezrxmobile/presentation/returns/return_list/return_filter/widgets/return_by_request_filter_type_picker.dart';
part 'package:ezrxmobile/presentation/returns/return_list/return_filter/widgets/return_by_request_filter_date_range_picker.dart';
part 'package:ezrxmobile/presentation/returns/return_list/return_filter/widgets/return_by_request_filter_amount_range_input.dart';
part 'package:ezrxmobile/presentation/returns/return_list/return_filter/widgets/return_by_request_filter_status_picker.dart';
part 'package:ezrxmobile/presentation/returns/return_list/return_filter/widgets/return_by_request_filter_button.dart';

class ReturnByRequestFilterPage extends StatelessWidget {
  const ReturnByRequestFilterPage({
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
                icon: const Icon(
                  Icons.clear,
                  color: ZPColors.black,
                ),
              ),
            ],
          ),
          const _ReturnFilter(),
        ],
      ),
    );
  }
}

class _ReturnFilter extends StatelessWidget {
  const _ReturnFilter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByRequestReturnFilterBloc,
        ViewByRequestReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessage != current.showErrorMessage,
      builder: (context, state) {
        final salesOrgConfig =
            context.read<EligibilityBloc>().state.salesOrgConfigs;

        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (context
                  .read<EligibilityBloc>()
                  .state
                  .marketPlaceEligible) ...[
                const _FilterSectionLabel('Show returns'),
                const SizedBox(height: 10),
                const _ReturnTypePicker(),
                const SizedBox(height: 16),
              ],
              const _FilterSectionLabel('Request date'),
              const SizedBox(height: 12),
              const _RequestDateRangePicker(),
              const SizedBox(height: 20),
              _FilterSectionLabel(
                'Request amount (${salesOrgConfig.currency.code})',
              ),
              const SizedBox(height: 12),
              const _RequestAmountRangeInput(),
              (!state.filter.isReturnAmountValueRangeValid)
                  ? ValueRangeError(
                      label: context.tr('Invalid Amount range!'),
                      isValid: state.filter.isReturnAmountValueRangeValid,
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 20),
              const _FilterSectionLabel('Status'),
              const _StatusPicker(),
              const SizedBox(height: 20),
              const Row(
                children: [
                  _ResetButton(),
                  SizedBox(width: 12),
                  _ApplyButton(),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
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
    return Text(
      context.tr(text),
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: ZPColors.neutralsBlack,
          ),
    );
  }
}
