import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_icon.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:ezrxmobile/presentation/payments/widgets/price_text.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/widgets/warning_label_virtual_bank.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/widgets/total_section.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/widgets/new_payment_body.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/widgets/new_payment_footer.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/widgets/select_all_section.dart';

@RoutePage()
class NewPaymentPage extends StatelessWidget {
  final bool isMarketPlace;

  const NewPaymentPage({
    super.key,
    required this.isMarketPlace,
  });

  List<PageRouteInfo<void>> _getTabs({
    bool isID = false,
  }) {
    return [
      const OutstandingInvoicesTabRoute(),
      if (!isID) const AvailableCreditsTabRoute(),
      const PaymentMethodTabRoute(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isID = context.read<EligibilityBloc>().state.salesOrg.isID;

    final tabs = _getTabs(isID: isID);

    return PaymentModule(
      isMarketPlace: isMarketPlace,
      child: AutoTabsRouter.tabBar(
        routes: tabs,
        physics: const NeverScrollableScrollPhysics(),
        builder: (context, child, tabController) {
          final step = tabController.index + 1;

          return Scaffold(
            key: WidgetKeys.newPaymentPage,
            appBar: CustomAppBar.commonAppBar(
              titleSpacing: 12,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  _PreviousButton(
                    tabController: tabController,
                    step: step,
                  ),
                  const SizedBox(width: 8),
                  const Expanded(child: _AppBarTitle()),
                ],
              ),
              customerBlockedOrSuspended: context
                  .read<EligibilityBloc>()
                  .state
                  .customerBlockOrSuspended,
            ),
            body: AnnouncementBanner(
              currentPath: context.router.currentPath,
              child: Column(
                children: [
                  _NewPaymentBody(
                    currentStep: step,
                    totalTabs: tabs.length,
                    child: child,
                  ),
                  _NewPaymentFooter(
                    currentStep: step,
                    tabController: tabController,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerLeft,
      fit: BoxFit.scaleDown,
      child: Text.rich(
        TextSpan(
          style: Theme.of(context).textTheme.labelLarge,
          children: [
            if (context.isMPPayment) ...[
              const WidgetSpan(
                child: MarketPlaceIcon(height: 24, width: 24),
                alignment: PlaceholderAlignment.middle,
              ),
              const WidgetSpan(child: SizedBox(width: 8)),
            ],
            TextSpan(
              text: context.tr(
                context.isMPPayment ? 'Make a MP payment' : 'New payment',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviousButton extends StatelessWidget {
  final TabController tabController;
  final int step;

  const _PreviousButton({
    required this.tabController,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 32,
      child: IconButton(
        key: step == 1 ? WidgetKeys.closeButton : WidgetKeys.backButton,
        onPressed: () => step == 1
            ? Navigator.pop(context)
            : tabController.animateTo(tabController.index - 1),
        iconSize: 24,
        padding: EdgeInsets.zero,
        icon: Icon(step == 1 ? Icons.close : Icons.chevron_left),
      ),
    );
  }
}

class _NextButtonID extends StatelessWidget {
  final VoidCallback onTab;

  const _NextButtonID({
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPaymentBloc, NewPaymentState>(
      buildWhen: (previous, current) =>
          previous.isCreatingVirtualAccount !=
              current.isCreatingVirtualAccount ||
          previous.selectedPaymentMethod.options !=
              current.selectedPaymentMethod.options,
      builder: (context, state) {
        return LoadingShimmer.withChild(
          enabled: state.isCreatingVirtualAccount,
          child: ElevatedButton(
            key: WidgetKeys.nextButtonID,
            onPressed: state.enableCreateVirtualAccount ? onTab : null,
            child: Text(
              context.tr('Next'),
              style: const TextStyle(
                color: ZPColors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NextButton extends StatelessWidget {
  final TabController tabController;
  final bool enabled;

  const _NextButton({
    required this.tabController,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: WidgetKeys.nextButton,
      onPressed: enabled
          ? () {
              final step = tabController.index + 1;
              _trackProceedToNextStep(context, step);
              tabController.animateTo(step);
            }
          : null,
      child: Text(
        context.tr('Next'),
        style: const TextStyle(
          color: ZPColors.white,
        ),
      ),
    );
  }
}

void _trackProceedToNextStep(BuildContext context, int step) =>
    trackMixpanelEvent(
      TrackingEvents.paymentStep,
      props: {
        TrackingProps.step: step,
        TrackingProps.stepName: _stepTitle(context, step),
      },
    );

String _stepTitle(BuildContext context, int step) {
  final salesOrg = context.read<EligibilityBloc>().state.salesOrg;
  final stepTitles = <String>[
    'Select invoice(s) for payment',
    if (!salesOrg.isID) 'Select credit (Optional)',
    'Generate payment advice',
  ];

  return context.tr(stepTitles[step - 1]);
}
