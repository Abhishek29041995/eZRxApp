import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdiUserBanner extends StatelessWidget {
  const EdiUserBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.customerCodeInfo.status != current.customerCodeInfo.status,
      builder: (context, state) {
        return state.customerCodeInfo.status.isEDI
            ? Container(
                key: WidgetKeys.ediUserBanner,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: const BoxDecoration(
                  color: ZPColors.customerBlockedBannerColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr('You are an EDI customer.'),
                      key: WidgetKeys.ediCustomerOrderDisableTitle,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      context.tr(
                        'Ordering is disabled on eZRx+, please place your orders through the EDI system only.',
                      ),
                      key: WidgetKeys.ediCustomerOrderDisableContent,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
