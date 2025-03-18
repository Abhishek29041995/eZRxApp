import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnSummaryItemPrice extends StatelessWidget {
  final ReturnRequestInformation requestInformation;

  const ReturnSummaryItemPrice({
    super.key,
    required this.requestInformation,
  });

  @override
  Widget build(BuildContext context) {
    final configs = context.read<EligibilityBloc>().state.salesOrgConfigs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (requestInformation.isUnapprovedCounterOffer)
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: PriceComponent(
                  salesOrgConfig: configs,
                  price: requestInformation.unitPrice.toString(),
                  type: PriceStyle.returnOriginPriceStrikeThrough,
                ),
              ),
            PriceComponent(
              salesOrgConfig: configs,
              price: requestInformation.calculatedUnitPrice.toString(),
              type: PriceStyle.bonusPrice,
            ),
          ],
        ),
        if (requestInformation.isCounterOfferRequested)
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
