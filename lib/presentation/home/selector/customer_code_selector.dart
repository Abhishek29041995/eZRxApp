import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class CustomerCodeSelector extends StatelessWidget {
  const CustomerCodeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.displayShipToCustomerCode !=
              current.displayShipToCustomerCode ||
          previous.displayShipTo != current.displayShipTo ||
          previous.isLoadingCustomerCode != current.isLoadingCustomerCode,
      builder: (context, eligibilityState) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          minLeadingWidth: 40,
          horizontalTitleGap: 0,
          dense: true,
          key: WidgetKeys.customerCodeSelect,
          onTap: eligibilityState.isLoadingCustomerCode
              ? null
              : () {
                  context.read<CustomerCodeBloc>().add(
                        CustomerCodeEvent.fetch(
                          searchValue: SearchKey.empty(),
                        ),
                      );
                  context.router.push(const CustomerSearchPageRoute());
                },
          leading: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: ZPColors.orange,
              ),
            ],
          ),
          title: eligibilityState.isLoadingCustomerCode
              ? LoadingShimmer.tile()
              : Text(
                  eligibilityState.displayShipToCustomerCode,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ZPColors.white,
                      ),
                  key: WidgetKeys.customerCodeSelectShipTo,
                ),
          subtitle: eligibilityState.isLoadingCustomerCode
              ? LoadingShimmer.tile()
              : Row(
                  children: [
                    Expanded(
                      child: Text(
                        eligibilityState.displayShipTo,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ZPColors.white,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
