import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_numeric_text_field.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnQuantityField extends StatelessWidget {
  const ReturnQuantityField({
    super.key,
    required this.balanceQuantity,
    required this.uuid,
  });

  final IntegerValue balanceQuantity;
  final String uuid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.getReturnItemDetails(uuid).returnQuantity !=
              current.getReturnItemDetails(uuid).returnQuantity ||
          previous.getReturnItemDetails(uuid).returnType !=
              current.getReturnItemDetails(uuid).returnType,
      builder: (context, state) {
        return CustomNumericTextField.wholeNumber(
          fieldKey: WidgetKeys.returnQuantityField(uuid),
          labelText: state.getReturnItemReturnType(uuid).quantityHeading.tr(),
          decoration: InputDecoration(
            hintText: state.getReturnItemReturnType(uuid).quantityHintText.tr(),
          ),
          inputFormatters: <TextInputFormatter>[
            // limit charcter length to 6
            LengthLimitingTextInputFormatter(6),
          ],
          isEnabled: true,
          mandatory: true,
          initValue: context
              .read<NewRequestBloc>()
              .state
              .getReturnItemDetails(uuid)
              .returnQuantity
              .getOrDefaultValue(''),
          onChanged: (value) => context.read<NewRequestBloc>().add(
                NewRequestEvent.additionInfoChanged(
                  additionInfo: context
                      .read<NewRequestBloc>()
                      .state
                      .getReturnItemDetails(uuid)
                      .copyWith(
                        returnQuantity: ReturnQuantity(value),
                      ),
                ),
              ),
          validator: (text) {
            if ((text ?? '').isEmpty) {
              return 'Return quantity is required field.'.tr();
            } else if (ReturnQuantity(text ?? '').getIntValue >
                balanceQuantity.getOrDefaultValue(0)) {
              return 'Return quantity cannot exceed balance quantity.'.tr();
            }

            context.read<NewRequestBloc>().add(
                  const NewRequestEvent.validateStep(
                    step: 2,
                  ),
                );

            return null;
          },
        );
      },
    );
  }
}
