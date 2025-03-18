import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/presentation/core/dropdown_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReasonDropdown extends StatelessWidget {
  const ReasonDropdown({
    super.key,
    required this.uuid,
  });

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.getReturnItemDetails(uuid).returnReason !=
          current.getReturnItemDetails(uuid).returnReason,
      builder: (context, state) {
        return DropdownWithLabel(
          fieldKey: WidgetKeys.returnReasonDropdown(uuid),
          labelText: 'Reason'.tr(),
          mandatory: true,
          onChanged: (value) => context.read<NewRequestBloc>().add(
                NewRequestEvent.additionInfoChanged(
                  additionInfo: context
                      .read<NewRequestBloc>()
                      .state
                      .getReturnItemDetails(uuid)
                      .copyWith(
                        returnReason: value ?? '',
                      ),
                ),
              ),
          hintText: context.tr('Select one'),
          initialValue: state.getReturnItemDetails(uuid).returnReason,
          items: context
              .read<UsageCodeBloc>()
              .state
              .usages
              .map(
                (val) => DropdownMenuItem(
                  value: val.usageCode,
                  alignment: AlignmentDirectional.centerStart,
                  key: WidgetKeys.newRequestStepsDropdownItem(
                    val.usageDescription,
                  ),
                  child: Text(val.usageDescription),
                ),
              )
              .toList(),
          validator: (value) {
            if ((value ?? '').isEmpty) {
              return 'Return reason is required field.'.tr();
            }

            context.read<NewRequestBloc>().add(
                  const NewRequestEvent.validateStep(
                    step: 2,
                  ),
                );

            return null;
          },
          key: WidgetKeys.newRequestStep2ReasonDropdown,
        );
      },
    );
  }
}
