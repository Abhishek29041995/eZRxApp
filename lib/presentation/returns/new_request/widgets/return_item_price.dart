import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnItemPrice extends StatelessWidget {
  const ReturnItemPrice({
    super.key,
    required this.data,
  });

  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    var details =
        context.read<NewRequestBloc>().state.getReturnItemDetails(data.uuid);
    if (details == ReturnItemDetails.empty()) {
      details = data.validatedItemDetails;
    }
    final isPriceOverrideValid = (details.returnType.isCounterOfferElegible &&
            eligibilityState.isReturnsOverrideEnable) &&
        details.priceOverride.isValid();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (isPriceOverrideValid)
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: PriceComponent(
                  salesOrgConfig: eligibilityState.salesOrgConfigs,
                  price: details.unitPrice.toString(),
                  type: PriceStyle.counterOfferPrice,
                ),
              ),
            PriceComponent(
              salesOrgConfig: eligibilityState.salesOrgConfigs,
              price: (details.returnType.isCounterOfferElegible &&
                      details.priceOverride.isValid())
                  ? details.priceOverride.stringValue
                  : details.unitPrice.toString(),
              type: PriceStyle.summaryPrice,
            ),
          ],
        ),
        if (isPriceOverrideValid)
          Text(
            context.tr('Requested return value counter offer'),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: ZPColors.darkGray,
            ),
          ),
      ],
    );
  }
}
