import 'package:ezrxmobile/application/account/ez_point/ez_point_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

class QuickAccessMenuPanel extends StatelessWidget {
  const QuickAccessMenuPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          current.customerCodeConfig != previous.customerCodeConfig,
      builder: (context, state) {
        final quickAccessItems = _getQuickAccessItems(context, state);

        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: kToolbarHeight * 1.58,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 11,
              vertical: 5,
            ),
            scrollDirection: Axis.horizontal,
            children: quickAccessItems.map((quickAccessItem) {
              return _QuickAccessMenu(
                quickAccessMenuData: quickAccessItem,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class _QuickAccessMenu extends StatelessWidget {
  final _QuickAccessMenuData quickAccessMenuData;

  const _QuickAccessMenu({
    required this.quickAccessMenuData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: quickAccessMenuData.key,
      onTap: () {
        quickAccessMenuData.onTap.call();
        trackMixpanelEvent(
          TrackingEvents.quickAccessClicked,
          props: {
            TrackingProps.quickAccess: quickAccessMenuData.label,
          },
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomCard(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                height: kToolbarHeight * 0.5,
                constraints: const BoxConstraints(minWidth: 96),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  context.tr(quickAccessMenuData.label),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.darkTeal,
                      ),
                ),
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/svg/${quickAccessMenuData.icon}',
            height: kToolbarHeight * 0.75,
          ),
        ],
      ),
    );
  }
}

class _QuickAccessMenuData {
  final Key key;
  final String icon;
  final String label;
  final VoidCallback onTap;

  const _QuickAccessMenuData({
    required this.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });
}

List<_QuickAccessMenuData> _getQuickAccessItems(
  BuildContext context,
  EligibilityState eligibilityState,
) {
  final homeQuickAccessOrdersMenu = _QuickAccessMenuData(
    key: WidgetKeys.homeQuickAccessOrdersMenu,
    icon: 'order_menu.svg',
    label: 'Orders',
    onTap: () => context.navigateTo(const OrdersTabRoute()),
  );

  final homeQuickAccessReturnsMenu = _QuickAccessMenuData(
    key: WidgetKeys.homeQuickAccessReturnsMenu,
    icon: 'return_menu.svg',
    label: 'Returns',
    onTap: () => context.navigateTo(const ReturnRootRoute()),
  );

  final homeQuickAccessPaymentsMenu = _QuickAccessMenuData(
    key: WidgetKeys.homeQuickAccessPaymentsMenu,
    icon: 'payments_menu.svg',
    label: 'Payments',
    onTap: () {
      context.navigateTo(PaymentPageRoute(isMarketPlace: false));
    },
  );

  final homeQuickAccessMarketPlacePaymentMenu = _QuickAccessMenuData(
    key: WidgetKeys.homeQuickAccessMPPaymentsMenu,
    icon: 'marketplace_payment_menu.svg',
    label: 'MP Payments',
    onTap: () {
      context.navigateTo(PaymentPageRoute(isMarketPlace: true));
    },
  );

  final homeQuickAccessEZPointMenu = _QuickAccessMenuData(
    key: WidgetKeys.homeQuickAccessEZPointMenu,
    icon: 'eZPoint.svg',
    label: 'eZPoint',
    onTap: () {
      context.read<EZPointBloc>().add(
            EZPointEvent.fetch(
              customerCodeInfo:
                  context.read<EligibilityBloc>().state.customerCodeInfo,
            ),
          );
      context.router.push(
        const EZPointWebviewPageRoute(),
      );
    },
  );

  final homeQuickAccessChatSupportMenu = _QuickAccessMenuData(
    key: WidgetKeys.homeQuickAccessChatSupportMenu,
    icon: 'chat_support_menu.svg',
    label: 'Chat support',
    onTap: () =>
        context.read<ChatBotBloc>().add(const ChatBotEvent.startChatbot()),
  );

  return <_QuickAccessMenuData>[
    // homeQuickAccessWebLoginMenu,
    if (eligibilityState.user.userCanAccessOrderHistory)
      homeQuickAccessOrdersMenu,
    if (eligibilityState.isReturnsEnable) homeQuickAccessReturnsMenu,
    if (eligibilityState.isPaymentEnabled) ...[
      homeQuickAccessPaymentsMenu,
      if (eligibilityState.marketPlacePaymentEligible)
        homeQuickAccessMarketPlacePaymentMenu,
    ],
    if (eligibilityState.salesOrg.isID) homeQuickAccessEZPointMenu,
    // homeQuickAccessLoyaltyMenu,
    homeQuickAccessChatSupportMenu,
  ];
}
