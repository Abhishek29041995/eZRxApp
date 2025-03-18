part of 'package:ezrxmobile/presentation/account/customer_search/customer_search.dart';

class _ChangeDeliveryAddress extends StatelessWidget {
  final ShipToInfo shipToInfo;
  final CustomerCodeInfo customerCodeInfo;
  const _ChangeDeliveryAddress({
    required this.shipToInfo,
    required this.customerCodeInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              SvgImage.alert,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            context.tr('Change delivery address?'),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.primary,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            context.tr('Any existing items in your cart will be cleared.'),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          const SizedBox(
            height: 35,
          ),
          _ConfirmChangeDeliveryAddressSection(
            shipToInfo: shipToInfo,
            customerCodeInfo: customerCodeInfo,
          ),
        ],
      ),
    );
  }
}

class _ConfirmChangeDeliveryAddressSection extends StatelessWidget {
  final ShipToInfo shipToInfo;
  final CustomerCodeInfo customerCodeInfo;
  const _ConfirmChangeDeliveryAddressSection({
    required this.shipToInfo,
    required this.customerCodeInfo,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              key: WidgetKeys.cancelButton,
              onPressed: () async {
                await context.router.maybePop();
              },
              child: Text(
                'Cancel'.tr(),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: ElevatedButton(
              key: WidgetKeys.confirmButton,
              onPressed: () {
                context.router
                    .popUntilRouteWithName(HomeNavigationTabbarRoute.name);

                trackMixpanelEvent(
                  TrackingEvents.shipToAddressSave,
                  props: {
                    TrackingProps.shipToAddress: shipToInfo.shipToCustomerCode,
                  },
                );
                context.read<EligibilityBloc>().add(
                      EligibilityEvent.selectedCustomerCode(
                        customerCodeInfo: customerCodeInfo,
                        shipToInfo: shipToInfo,
                      ),
                    );
                context.read<CartBloc>().add(
                      const CartEvent.clearCart(),
                    );
                trackMixpanelEvent(
                  TrackingEvents.customerCodeSave,
                  props: {
                    TrackingProps.customerCode:
                        customerCodeInfo.customerCodeSoldTo,
                  },
                );
              },
              child: Text(
                context.tr('Change address'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
