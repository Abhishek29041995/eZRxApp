part of 'package:ezrxmobile/presentation/account/customer_search/customer_search.dart';

class _ShipToAddressInfo extends StatelessWidget {
  const _ShipToAddressInfo({
    required this.shipToInfo,
  });

  final ShipToInfo shipToInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            shipToInfo.shipToName.toString(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          Text(
            shipToInfo.deliveryAddress,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
        ],
      ),
    );
  }
}
