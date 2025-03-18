part of 'package:ezrxmobile/presentation/account/customer_search/customer_search.dart';

class _ShipToAddressSection extends StatelessWidget {
  final ShipToInfo shipToInfo;
  final CustomerCodeInfo customerCodeInfo;

  const _ShipToAddressSection({
    required this.shipToInfo,
    required this.customerCodeInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          key: WidgetKeys.shipToAddressOption(shipToInfo.shipToCustomerCode),
          minLeadingWidth: 0,
          horizontalTitleGap: 9,
          contentPadding: const EdgeInsets.symmetric(horizontal: padding12),
          minVerticalPadding: 16,
          leading: const Icon(
            Icons.location_on_sharp,
            color: ZPColors.darkYellow,
          ),
          title: _ShipToAddressTitle(shipToInfo: shipToInfo),
          subtitle: _ShipToAddressInfo(shipToInfo: shipToInfo),
          onTap: () => _onShipToCodeChange(context),
        ),
        _isDividerVisible
            ? const Divider(
                indent: 20,
                endIndent: 20,
                color: ZPColors.extraLightGrey3,
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  void _onShipToCodeChange(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    final eligibilityBloc = context.read<EligibilityBloc>();
    if (eligibilityBloc.state.shipToInfo != ShipToInfo.empty() &&
        shipToInfo != eligibilityBloc.state.shipToInfo &&
        cartBloc.state.cartProducts.isNotEmpty) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        builder: (_) {
          return _ChangeDeliveryAddress(
            shipToInfo: shipToInfo,
            customerCodeInfo: customerCodeInfo,
          );
        },
      );
    } else {
      context.router.popUntilRouteWithName(HomeNavigationTabbarRoute.name);
      eligibilityBloc.add(
        EligibilityEvent.selectedCustomerCode(
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
        ),
      );
      trackMixpanelEvent(
        TrackingEvents.shipToAddressSave,
        props: {
          TrackingProps.shipToAddress: shipToInfo.shipToCustomerCode,
        },
      );
      trackMixpanelEvent(
        TrackingEvents.customerCodeSave,
        props: {
          TrackingProps.customerCode: customerCodeInfo.customerCodeSoldTo,
        },
      );
    }
  }

  bool get _isDividerVisible =>
      customerCodeInfo.shipToInfos.indexOf(shipToInfo) !=
      customerCodeInfo.shipToInfos.length - 1;
}
