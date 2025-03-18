import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewPaymentButton extends StatelessWidget {
  final ScrollController? scrollController;

  factory NewPaymentButton.scale({required ScrollController controller}) =>
      NewPaymentButton._(controller);

  factory NewPaymentButton.elevated() => const NewPaymentButton._(null);

  const NewPaymentButton._(this.scrollController);

  static const paymentFailureMessage =
      'You have a pending payment which has not been completed. Please create a new payment only after the existing one has been cleared.';

  Future<bool?> _showFailedBottomSheet(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      builder: (_) => ConfirmBottomSheet(
        key: WidgetKeys.confirmBottomSheet,
        title: 'Unable to create new payment',
        content: paymentFailureMessage,
        confirmButtonText: 'Close',
        displayCancelButton: false,
        iconWidget: SvgPicture.asset(
          SvgImage.alert,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = context.isMPPayment ? 'Make a MP payment' : 'New payment';

    return BlocBuilder<NewPaymentBloc, NewPaymentState>(
      buildWhen: (previous, current) =>
          previous.isFetchingPrincipalCutoffs !=
          current.isFetchingPrincipalCutoffs,
      builder: (context, state) => scrollController == null
          ? ElevatedButton(
              key: WidgetKeys.newPaymentButton,
              onPressed: state.isFetchingPrincipalCutoffs
                  ? null
                  : () => _toNewPayment(context),
              child: Text(context.tr(title)),
            )
          : ScaleButton(
              key: WidgetKeys.newPaymentButton,
              icon: Icons.add,
              label: title,
              onPress: state.isFetchingPrincipalCutoffs
                  ? null
                  : () => _toNewPayment(context),
              scrollController: scrollController!,
            ),
    );
  }

  void _toNewPayment(BuildContext context) {
    trackMixpanelEvent(
      TrackingEvents.newPaymentClicked,
      props: {
        TrackingProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.routeData.path),
      },
    );

    final eligibilityState = context.read<EligibilityBloc>().state;
    final cannotProcessPayment = eligibilityState.salesOrg.isID &&
        context
            .paymentSummaryBloc(context.isMPPayment)
            .state
            .includeInprogressPayment;

    if (cannotProcessPayment) {
      _showFailedBottomSheet(context);
    } else {
      context.read<NewPaymentBloc>()
        ..add(
          NewPaymentEvent.initialized(
            user: eligibilityState.user,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            salesOrganisation: eligibilityState.salesOrganisation,
            shipToInfo: eligibilityState.shipToInfo,
            isMarketPlace: context.isMPPayment,
          ),
        )
        ..add(const NewPaymentEvent.getPrincipalCutoffs());
    }
  }
}
