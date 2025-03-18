import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/covid_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CommonTileItem extends StatelessWidget {
  const CommonTileItem({
    super.key,
    required this.label,
    required this.materialNumber,
    required this.title,
    required this.subtitle,
    required this.quantity,
    required this.isQuantityBelowImage,
    required this.footerWidget,
    this.padding,
    this.headerText,
    this.headerTextStyle,
    this.headerTextInfoIcon,
    this.statusWidget,
    this.statusTag,
    this.priceComponent,
    this.isQuantityRequired = true,
    this.onTap,
    this.isCovidItem = false,
    this.showOfferTag = false,
    this.showBundleTag = false,
    this.topHeaderWidget,
    this.labelTrailing,
    this.labelLeading,
    this.margin,
    this.batchExpiryDate,
  });

  final String label;
  final MaterialNumber materialNumber;
  final String title;
  final String subtitle;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String? headerText;
  final TextStyle? headerTextStyle;
  final Widget? headerTextInfoIcon;
  final Widget? priceComponent;
  final Widget? statusWidget;
  final String quantity;
  final bool isQuantityBelowImage;
  final StatusType? statusTag;
  final Widget footerWidget;
  final bool isQuantityRequired;
  final bool isCovidItem;
  final bool showOfferTag;
  final bool showBundleTag;
  final VoidCallback? onTap;
  final Widget? topHeaderWidget;
  final Widget? labelTrailing;
  final Widget? labelLeading;
  final Widget? batchExpiryDate;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: margin ?? const EdgeInsets.only(bottom: 12),
      padding: padding ?? const EdgeInsets.only(bottom: 0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        onTap: onTap,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HeaderItem(
              header: headerText,
              headerTextStyle: headerTextStyle,
              statusWidget: statusWidget,
              topHeaderWidget: topHeaderWidget,
              headerTextInfoIcon: headerTextInfoIcon,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ImageBox(
                  isQuantityBelowImage:
                      isQuantityRequired ? isQuantityBelowImage : false,
                  quantity: quantity,
                  materialNumber: materialNumber,
                  isCovidItem: isCovidItem,
                  showOfferTag: showOfferTag,
                  showBundleTag: showBundleTag,
                  isBonusAndStatusTagAvailable: labelTrailing != null,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: 4,
                          children: [
                            if (labelLeading != null) labelLeading!,
                            Text(
                              label,
                              key: WidgetKeys.commonTileItemLabel,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            if (statusTag != null &&
                                statusTag!
                                    .getOrDefaultValue('')
                                    .isNotEmpty) ...[
                              const SizedBox(width: 5),
                              StatusLabel(
                                key: WidgetKeys.commonTileItemStatusLabel,
                                status: statusTag!,
                                valueColor: statusTag!.displayStatusTextColor,
                              ),
                            ],
                            if (labelTrailing != null) labelTrailing!,
                            if (headerText == null && statusWidget != null) ...[
                              const Spacer(),
                              statusWidget!,
                            ],
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            title,
                            key: WidgetKeys.commonTileItemTitle,
                            style: Theme.of(context).textTheme.labelMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (batchExpiryDate != null) batchExpiryDate!,
                        _Subtitle(
                          tileBody3: subtitle,
                          isQuantityBelowImage:
                              isQuantityRequired ? isQuantityBelowImage : true,
                          quantity: quantity,
                          priceComponent:
                              priceComponent ?? const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            footerWidget,
          ],
        ),
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({
    required this.tileBody3,
    required this.isQuantityBelowImage,
    required this.quantity,
    required this.priceComponent,
  });

  final String tileBody3;
  final bool isQuantityBelowImage;
  final String quantity;
  final Widget priceComponent;

  @override
  Widget build(BuildContext context) {
    return isQuantityBelowImage
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              priceComponent,
              Text(
                tileBody3,
                key: WidgetKeys.commonTileItemSubTitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ZPColors.darkerGrey,
                    ),
              ),
            ],
          )
        : Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    priceComponent,
                    Text(
                      tileBody3,
                      key: WidgetKeys.commonTileItemSubTitle,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: ZPColors.darkGray,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (quantity.isNotEmpty)
                Text(
                  '${context.tr('Qty')}: $quantity',
                  key: WidgetKeys.commonTileItemQty,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.black,
                      ),
                ),
            ],
          );
  }
}

class _HeaderItem extends StatelessWidget {
  const _HeaderItem({
    this.header,
    this.headerTextStyle,
    this.statusWidget,
    this.topHeaderWidget,
    this.headerTextInfoIcon,
  });

  final String? header;
  final TextStyle? headerTextStyle;
  final Widget? headerTextInfoIcon;
  final Widget? statusWidget;
  final Widget? topHeaderWidget;

  @override
  Widget build(BuildContext context) {
    final headerText = header ?? '';
    if (headerText.isEmpty && statusWidget == null) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        topHeaderWidget ?? const SizedBox.shrink(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RichText(
                key: WidgetKeys.commonTileItemHeader,
                text: TextSpan(
                  text: headerText,
                  style: headerTextStyle ??
                      Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: ZPColors.darkerGrey,
                          ),
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: headerTextInfoIcon ?? const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
            statusWidget ?? const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}

class _ImageBox extends StatelessWidget {
  const _ImageBox({
    required this.isQuantityBelowImage,
    required this.quantity,
    required this.materialNumber,
    required this.isCovidItem,
    required this.showOfferTag,
    required this.showBundleTag,
    required this.isBonusAndStatusTagAvailable,
  });
  final bool isQuantityBelowImage;
  final bool isCovidItem;
  final bool showOfferTag;
  final bool showBundleTag;
  final bool isBonusAndStatusTagAvailable;
  final String quantity;
  final MaterialNumber materialNumber;

  @override
  Widget build(BuildContext context) {
    final defaultHeight = MediaQuery.of(context).size.height * 0.08;
    final defaultWidth = MediaQuery.of(context).size.height * 0.08;

    return isQuantityBelowImage
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCard(
                showBorder: true,
                showShadow: false,
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.fromLTRB(0, 10, 8, 0),
                child: Stack(
                  children: [
                    ProductImage(
                      key: WidgetKeys.commonTileItemImage,
                      fit: BoxFit.fitHeight,
                      materialNumber: materialNumber,
                      width: isBonusAndStatusTagAvailable ? defaultWidth : 80,
                      height: isBonusAndStatusTagAvailable ? defaultHeight : 80,
                    ),
                    if (showOfferTag) ProductTag.onOfferIcon(),
                    if (isCovidItem)
                      const Positioned(
                        bottom: 20,
                        child: CovidTag(),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Qty: $quantity',
                key: WidgetKeys.commonTileItemQty,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          )
        : CustomCard(
            showBorder: true,
            showShadow: false,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.fromLTRB(0, 7, 8, 0),
            child: Stack(
              children: [
                ProductImage(
                  materialNumber: materialNumber,
                  fit: BoxFit.fitHeight,
                  width: isBonusAndStatusTagAvailable ? defaultWidth : 80,
                  height: isBonusAndStatusTagAvailable ? defaultHeight : 80,
                ),
                if (showOfferTag) ProductTag.onOfferIcon(),
                if (showBundleTag) ProductTag.bundleOfferIcon(),
                if (isCovidItem)
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.055,
                    child: const CovidTag(),
                  ),
              ],
            ),
          );
  }
}
