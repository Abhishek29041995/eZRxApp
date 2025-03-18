part of 'package:ezrxmobile/presentation/account/customer_search/customer_search.dart';

class _DeliveryAddressItem extends StatelessWidget {
  final CustomerCodeInfo customerCodeInfo;

  const _DeliveryAddressItem({required this.customerCodeInfo});

  @override
  Widget build(BuildContext context) {
    return custom.ExpansionTile(
      initiallyExpanded: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: padding12),
      iconColor: ZPColors.textButtonColor,
      title: _TitleSection(
        prefixText: customerCodeInfo.customerCodeSoldTo,
        suffixText: customerCodeInfo.customerName.name1,
        titleColor: ZPColors.textButtonColor,
      ),
      children: [
        Column(
          children: customerCodeInfo.shipToInfos
              .map(
                (e) => _ShipToAddressSection(
                  shipToInfo: e,
                  customerCodeInfo: customerCodeInfo,
                ),
              )
              .toList(),
        ),
        const Divider(
          indent: 0,
          endIndent: 0,
          color: ZPColors.extraLightGrey2,
        ),
      ],
    );
  }
}
