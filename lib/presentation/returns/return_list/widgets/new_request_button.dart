import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewRequestButton extends StatelessWidget {
  const NewRequestButton({
    super.key,
    required this.controller,
  });

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      icon: Icons.add,
      label: 'New request'.tr(),
      onPress: () {
        trackMixpanelEvent(
          TrackingEvents.newReturnRequestClicked,
          props: {
            TrackingProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.routeData.path),
          },
        );
        final eligibilityState = context
            .read<EligibilityBloc>()
            .state;
        context.read<UsageCodeBloc>().add(
          UsageCodeEvent.fetch(
            salesOrg: eligibilityState.salesOrg,
          ),
        );
        context.read<ReturnItemsBloc>().add(
          ReturnItemsEvent.initialized(
            salesOrganisation: eligibilityState.salesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            user: eligibilityState.user,
          ),
        );
        context.read<NewRequestBloc>().add(
          NewRequestEvent.initialized(
            salesOrg: eligibilityState.salesOrg,
          ),
        );
        context.router.push(const NewRequestPageRoute());
      },
      scrollController: controller,
    );
  }
}
