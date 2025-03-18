import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:ezrxmobile/presentation/core/market_place/market_place_icon.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

const _titleText = 'Marketplace item(s) delivery';
const _descriptionText =
    'The delivery times for Marketplace items are based on sellers\' response times and may exceed the usual delivery times for ZP orders. Sellers will dispatch the items to the ZP warehouse, and we will handle the delivery to you.';
const _subtitleText = 'Delivery by';

class MarketPlaceDeliveryExpansionTile extends StatelessWidget {
  final List<String> sellers;

  const MarketPlaceDeliveryExpansionTile({super.key, required this.sellers});

  @override
  Widget build(BuildContext context) {
    return custom.ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      childrenPadding: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 15,
      ),
      threeLineTitle: true,
      initiallyExpanded: true,
      iconColor: ZPColors.neutralsBlack,
      boxBorder:
          const Border(bottom: BorderSide(color: ZPColors.extraLightGrey2)),
      title: Text.rich(
        TextSpan(
          children: [
            const WidgetSpan(
              child: MarketPlaceIcon(height: 24, width: 24),
              alignment: PlaceholderAlignment.middle,
            ),
            const WidgetSpan(child: SizedBox(width: 4)),
            TextSpan(text: context.tr(_titleText)),
          ],
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: ZPColors.neutralsBlack),
        ),
      ),
      children: [
        Text(
          context.tr(_descriptionText),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            context.tr(_subtitleText),
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: ZPColors.shadesBlack),
          ),
        ),
        ...sellers.map(
          (sellerName) => Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: MarketPlaceSellerTitle(
              sellerName: sellerName,
              textColor: ZPColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class MarketPlaceDeliveryTile extends StatelessWidget {
  final List<String> sellers;

  const MarketPlaceDeliveryTile({super.key, required this.sellers});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.6,
            ),
            builder: (_) => _MarketPlaceDeliveryInfoSheet(sellers: sellers),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: ZPColors.extraLightGrey2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr(_titleText),
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: ZPColors.neutralsBlack),
              ),
              const Icon(
                Icons.keyboard_arrow_right,
                color: ZPColors.neutralsBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MarketPlaceDeliveryInfoSheet extends StatelessWidget {
  final List<String> sellers;

  const _MarketPlaceDeliveryInfoSheet({required this.sellers});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: WidgetKeys.marketplaceDeliveryInfoSheet,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  const WidgetSpan(
                    child: MarketPlaceIcon(height: 24, width: 24),
                    alignment: PlaceholderAlignment.middle,
                  ),
                  const WidgetSpan(child: SizedBox(width: 4)),
                  TextSpan(text: context.tr(_titleText)),
                ],
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ZPColors.primary,
                    ),
              ),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      context.tr(_descriptionText),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: ZPColors.neutralsGrey1),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      context.tr(_subtitleText),
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: ZPColors.shadesBlack),
                    ),
                    const SizedBox(height: 16),
                    ...sellers.map(
                      (sellerName) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: MarketPlaceSellerTitle(
                          sellerName: sellerName,
                          textColor: ZPColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              key: WidgetKeys.closeButton,
              child: Text(context.tr('Close')),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
