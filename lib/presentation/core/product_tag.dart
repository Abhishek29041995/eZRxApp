import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductTag extends StatelessWidget {
  final String labelTag;
  final bool hasIcon;
  final String assetIconSvg;
  final TextStyle? labelStyle;
  final Color backgroundColor;
  final Color textColor;
  final Color? iconColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderRadiusGeometry? borderRadius;
  final IconData iconData;
  final double? iconSize;
  final double iconSpacing;

  const ProductTag._({
    super.key,
    required this.labelTag,
    required this.backgroundColor,
    required this.textColor,
    this.hasIcon = false,
    this.assetIconSvg = '',
    this.iconData = Icons.local_offer_outlined,
    this.iconSpacing = 0,
    this.labelStyle,
    this.iconColor,
    this.margin,
    this.padding,
    this.borderRadius,
    this.iconSize,
  });

  factory ProductTag.bundleOffer({TextStyle? labelStyle}) => ProductTag._(
        key: WidgetKeys.bundleTag,
        labelTag: 'Bundle offer',
        backgroundColor: ZPColors.skyBlueColor,
        assetIconSvg: SvgImage.bonusOffer,
        hasIcon: true,
        textColor: ZPColors.white,
        labelStyle: labelStyle,
      );
  factory ProductTag.bundleOfferIcon() => const ProductTag._(
        key: WidgetKeys.bundleTag,
        labelTag: '',
        backgroundColor: ZPColors.skyBlueColor,
        assetIconSvg: SvgImage.bonusOffer,
        hasIcon: true,
        textColor: ZPColors.white,
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        margin: EdgeInsets.zero,
      );
  factory ProductTag.preOrderTag({
    TextStyle? labelStyle,
    required String label,
    required Color backgroundColor,
    required Color labelColor,
  }) =>
      ProductTag._(
        labelTag: label,
        backgroundColor: backgroundColor,
        textColor: labelColor,
        labelStyle: labelStyle,
      );
  factory ProductTag.covidTag({TextStyle? labelStyle}) => ProductTag._(
        key: WidgetKeys.covidLabel,
        labelTag: 'Covid-19',
        backgroundColor: ZPColors.invoiceStatusBlue,
        textColor: ZPColors.skyBlueColor,
        assetIconSvg: SvgImage.coronavirus,
        hasIcon: true,
        padding: const EdgeInsets.symmetric(vertical: 4.0).copyWith(
          left: 8.0,
          right: 12.0,
        ),
        labelStyle: labelStyle,
      );
  factory ProductTag.onOfferIcon() => const ProductTag._(
        key: WidgetKeys.offerTag,
        labelTag: '',
        backgroundColor: ZPColors.orange,
        textColor: ZPColors.white,
        hasIcon: true,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      );
  factory ProductTag.onOfferTag({TextStyle? labelStyle}) => ProductTag._(
        key: WidgetKeys.offerTag,
        labelTag: 'On offer',
        backgroundColor: ZPColors.orange,
        textColor: ZPColors.white,
        hasIcon: true,
        labelStyle: labelStyle,
      );
  factory ProductTag.comboOffer({TextStyle? labelStyle}) => ProductTag._(
        labelTag: 'Combo offer',
        key: WidgetKeys.comboOfferTag,
        backgroundColor: ZPColors.skyBlueColor,
        iconData: Icons.discount_outlined,
        hasIcon: true,
        textColor: ZPColors.white,
        labelStyle: labelStyle,
        iconColor: ZPColors.white,
        margin: EdgeInsets.zero,
      );
  factory ProductTag.tenderTag() => const ProductTag._(
        key: WidgetKeys.tenderTag,
        labelTag: 'Tender Available',
        backgroundColor: ZPColors.skyBlueColor,
        textColor: ZPColors.white,
        padding: EdgeInsets.fromLTRB(16, 4, 8, 4),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.0),
        ),
      );
  factory ProductTag.gimmickTag({bool isRounded = true}) =>
      ProductTag._iconWithLabel(
        key: WidgetKeys.gimmickTag,
        label: 'Gimmick',
        icon: SvgImage.gimmickMaterialIcon,
        bgColor: ZPColors.paleBlueGray,
        textColor: ZPColors.darkTeal,
        isRounded: isRounded,
      );
  factory ProductTag.sample({bool isRounded = true}) =>
      ProductTag._iconWithLabel(
        key: WidgetKeys.sampleTag,
        label: 'Sample',
        icon: SvgImage.sampleMaterialIcon,
        bgColor: ZPColors.paleBlueGray,
        textColor: ZPColors.darkTeal,
        isRounded: isRounded,
      );
  factory ProductTag.poison({bool isRounded = true}) =>
      ProductTag._iconWithLabel(
        key: WidgetKeys.poisonTag,
        label: 'Poison',
        icon: SvgImage.poisonMaterialIcon,
        bgColor: ZPColors.poisonMaterialBg,
        textColor: ZPColors.poisonMaterialText,
        isRounded: isRounded,
      );

  factory ProductTag._iconWithLabel({
    required Key key,
    required String label,
    required String icon,
    required Color textColor,
    required Color bgColor,
    bool isRounded = false,
  }) =>
      ProductTag._(
        key: key,
        labelTag: label,
        assetIconSvg: icon,
        hasIcon: true,
        iconSize: 14,
        iconSpacing: 4,
        backgroundColor: bgColor,
        textColor: textColor,
        margin: isRounded ? const EdgeInsets.all(0) : null,
        padding: isRounded
            ? const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5)
            : const EdgeInsets.fromLTRB(16, 4, 8, 4),
        borderRadius: isRounded
            ? BorderRadius.circular(24)
            : const BorderRadius.only(topRight: Radius.circular(8.0)),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      margin: margin ?? const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ??
            const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        key: WidgetKeys.productTag,
        children: [
          if (hasIcon)
            assetIconSvg.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.only(right: iconSpacing),
                    child: SvgPicture.asset(
                      assetIconSvg,
                      height: iconSize ?? 18,
                      fit: BoxFit.fill,
                      color: iconColor,
                    ),
                  )
                : Icon(
                    iconData,
                    size: iconSize ?? 20,
                    color: ZPColors.white,
                  ),
          if (labelTag.isNotEmpty)
            Flexible(
              child: FittedBox(
                child: Text(
                  context.tr(labelTag),
                  style: labelStyle ??
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
