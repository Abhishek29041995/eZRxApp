import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/return_type_info_button.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnTypeSection extends StatelessWidget {
  const ReturnTypeSection({
    super.key,
    required this.isDisable,
    required this.uuid,
    required this.assignmentNumber,
  });

  final bool isDisable;
  final String uuid;
  final String assignmentNumber;

  @override
  Widget build(BuildContext context) {
    return context.read<EligibilityBloc>().state.salesOrg.showReturnTypeSection
        ? BlocBuilder<NewRequestBloc, NewRequestState>(
            buildWhen: (previous, current) =>
                previous.getReturnItemDetails(uuid).returnType !=
                current.getReturnItemDetails(uuid).returnType,
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Return type'.tr(),
                      style: Theme.of(context).textTheme.labelSmall,
                      children: <TextSpan>[
                        TextSpan(
                          text: ' *',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: ZPColors.red),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      CustomRadioTile(
                        value: ReturnType.returnItem(),
                        groupValue: state.getReturnItemReturnType(uuid),
                        title: 'Return'.tr(),
                        isDisabled: isDisable,
                        assignmentNumber: assignmentNumber,
                      ),
                      CustomRadioTile(
                        value: ReturnType.exchangeItem(),
                        groupValue: state.getReturnItemReturnType(uuid),
                        title: 'Exchange'.tr(),
                        isDisabled: isDisable,
                        assignmentNumber: assignmentNumber,
                      ),
                    ],
                  ),
                ],
              );
            },
          )
        : const SizedBox.shrink();
  }
}

class CustomRadioTile extends StatelessWidget {
  const CustomRadioTile({
    super.key,
    required this.title,
    required this.assignmentNumber,
    required this.groupValue,
    required this.value,
    required this.isDisabled,
  });
  final String title;
  final String assignmentNumber;
  final bool isDisabled;
  final ReturnType value;
  final ReturnType groupValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          key: WidgetKeys.selectByRadio(title),
          visualDensity: const VisualDensity(
            horizontal: -4.0,
            vertical: -4.0,
          ),
          groupValue: groupValue,
          value: value,
          fillColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) =>
                isDisabled ? ZPColors.lightGray : ZPColors.primary,
          ),
          onChanged: isDisabled
              ? null
              : (ReturnType? value) => context.read<NewRequestBloc>().add(
                    NewRequestEvent.updateSelectedReturnType(
                      returnType: value!,
                      assignmentNumber: assignmentNumber,
                    ),
                  ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: isDisabled ? ZPColors.lightGray : ZPColors.neutralsBlack,
              ),
        ),
        ReturnTypeInfoIcon(
          returnType: value,
        ),
      ],
    );
  }
}
