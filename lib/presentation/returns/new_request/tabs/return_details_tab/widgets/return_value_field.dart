import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnValueField extends StatelessWidget {
  const ReturnValueField({
    super.key,
    required this.data,
  });

  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) {
        final previousReturn = previous.getReturnItemDetails(data.uuid);
        final currentReturn = current.getReturnItemDetails(data.uuid);

        return previousReturn.returnQuantity != currentReturn.returnQuantity ||
            previousReturn.priceOverride != currentReturn.priceOverride;
      },
      builder: (context, state) {
        final detail = state.getReturnItemDetails(data.uuid);

        return Row(
          key: WidgetKeys.returnValueField(
            '${data.uuid}${detail.returnValue}',
          ),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${context.tr('Return value')}:',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ZPColors.neutralsGrey1,
                  ),
            ),
            PriceComponent(
              salesOrgConfig:
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
              price: detail.returnValue.toString(),
              type: PriceStyle.grandTotalPrice,
            ),
          ],
        );
      },
    );
  }
}
