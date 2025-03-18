part of 'package:ezrxmobile/presentation/account/customer_search/customer_search.dart';

class _ShipToAddressTitle extends StatelessWidget {
  const _ShipToAddressTitle({
    required this.shipToInfo,
  });

  final ShipToInfo shipToInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          shipToInfo.shipToCustomerCode,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        if (shipToInfo.defaultShipToAddress) const _ShowDefaultTag(),
      ],
    );
  }
}
