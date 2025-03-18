import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';

class PriceComponent extends StatelessWidget {
  const PriceComponent({
    super.key,
    required this.salesOrgConfig,
    required this.price,
    this.title = '',
    this.trailingText = '',
    this.priceLabelStyle,
    this.obscured = false,
    this.maxLine = 2,
    this.type = PriceStyle.commonPrice,
    this.align = TextAlign.start,
  });

  final SalesOrganisationConfigs salesOrgConfig;
  final String price;
  final String title;
  final String trailingText;
  final TextStyle? priceLabelStyle;
  final bool obscured;
  final PriceStyle type;
  final int? maxLine;
  final TextAlign align;

  bool get _isNegativePrice => type == PriceStyle.negativePrice;

  //ignore:long-method
  List<TextSpan> _getTextSpan(BuildContext context) {
    final textSpans = <TextSpan>[];
    final notPrice = !price.contains(RegExp(r'^-?\d+(\.\d+)?$'));
    final priceTextStyle = _priceStyle(context, type);
    final currencyCodeTextStyle = _currencyCodeTextStyle(context, type);
    final singleCommaTextStyle = _currencyCodeTextStyle(context, type).copyWith(
      color: _isNegativePrice ? ZPColors.priceNegative : null,
    );

    final priceValue = notPrice
        ? price.tr()
        : StringUtils.priceComponentDisplayPrice(
            salesOrgConfig,
            double.parse(price),
            obscured,
          );

    if (title.isNotEmpty) {
      textSpans.add(
        TextSpan(
          text: title,
          style: priceLabelStyle ?? priceTextStyle,
        ),
      );
    }
    if (notPrice) {
      textSpans.add(
        TextSpan(
          text: priceValue,
          style: priceTextStyle,
        ),
      );

      return textSpans;
    }
    if (type == PriceStyle.credits) {
      textSpans.add(TextSpan(text: '(', style: singleCommaTextStyle));
    }
    final amount = priceValue.split(' ').last;
    //currency
    textSpans.add(
      TextSpan(
        text: priceValue.replaceAll(amount, ''),
        style: currencyCodeTextStyle,
      ),
    );

    //amount
    final obscuredValue = amount.replaceAll(RegExp(r'[0-9]'), '*');
    final amountString = obscured ? obscuredValue : amount;
    if (type == PriceStyle.creditSummaryPrice || _isNegativePrice) {
      textSpans.add(
        TextSpan(
          text: '($amountString)',
          style: priceTextStyle,
        ),
      );
    } else {
      textSpans.add(
        TextSpan(
          text: amountString,
          style: priceTextStyle,
        ),
      );
    }
    if (type == PriceStyle.credits) {
      textSpans.add(TextSpan(text: ')', style: singleCommaTextStyle));
    }
    if (trailingText.isNotEmpty) {
      textSpans
          .add(TextSpan(text: ' $trailingText', style: currencyCodeTextStyle));
    }

    return textSpans;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      key: WidgetKeys.priceComponent,
      text: TextSpan(
        children: _getTextSpan(context),
      ),
      maxLines: maxLine,
      overflow: maxLine == null ? TextOverflow.clip : TextOverflow.ellipsis,
      textAlign: align,
    );
  }
}

enum PriceStyle {
  commonPrice,
  bundlePrice,
  productPrice,
  bundleAddToCartPrice,
  bundleCartPrice,
  bundleActiveOfferPrice,
  bundleFinalPrice,
  bundleListPriceStrikeThrough,
  counterOfferPrice,
  bonusPrice,
  discountPrice,
  taxPrice,
  totalPrice,
  summaryPrice,
  grandTotalPrice,
  credits,
  creditSummaryPrice,
  paymentInProgressPrice,
  comboOfferPrice,
  comboOfferPriceDiscounted,
  comboSubTotalItemWithTax,
  comboSubTotalExclTax,
  negativePrice,
  returnBonusPrice,
  materialListPriceStrikeThrough,
  govtMaterialListPrice,
  returnOriginPriceStrikeThrough,
  cartMaterialUnitPrice,
  tenderPrice,
  tenderViewOrderByItemPrice,
  tenderCartPrice,
  counterOfferListPrice,
  deliveryOptionFee,
}

Color _priceTextColor(PriceStyle type) {
  switch (type) {
    case PriceStyle.paymentInProgressPrice:
    case PriceStyle.commonPrice:
    case PriceStyle.bundleActiveOfferPrice:
    case PriceStyle.comboSubTotalExclTax:
    case PriceStyle.creditSummaryPrice:
    case PriceStyle.govtMaterialListPrice:
    case PriceStyle.tenderViewOrderByItemPrice:
    case PriceStyle.tenderPrice:
    case PriceStyle.tenderCartPrice:
    case PriceStyle.productPrice:
    case PriceStyle.deliveryOptionFee:
      return ZPColors.primary;

    case PriceStyle.summaryPrice:
      return ZPColors.darkerGrey;
    case PriceStyle.totalPrice:
    case PriceStyle.credits:
    case PriceStyle.grandTotalPrice:
    case PriceStyle.bundlePrice:
    case PriceStyle.bonusPrice:
    case PriceStyle.bundleCartPrice:
      return ZPColors.neutralsBlack;
    case PriceStyle.bundleAddToCartPrice:
      return ZPColors.skyBlueColor;
    case PriceStyle.comboOfferPrice:
    case PriceStyle.comboOfferPriceDiscounted:
      return ZPColors.darkerGrey;

    case PriceStyle.counterOfferPrice:
    case PriceStyle.taxPrice:
    case PriceStyle.comboSubTotalItemWithTax:
    case PriceStyle.bundleFinalPrice:
    case PriceStyle.materialListPriceStrikeThrough:
    case PriceStyle.returnOriginPriceStrikeThrough:
      return ZPColors.darkGray;

    case PriceStyle.negativePrice:
      return ZPColors.priceNegative;
    case PriceStyle.bundleListPriceStrikeThrough:
    case PriceStyle.cartMaterialUnitPrice:
      return ZPColors.neutralsGrey1;
    case PriceStyle.counterOfferListPrice:
      return ZPColors.darkGray;
    default:
      return ZPColors.black;
  }
}

TextDecoration? _priceTextDecoration(PriceStyle type) {
  switch (type) {
    case PriceStyle.bundleListPriceStrikeThrough:
    case PriceStyle.counterOfferPrice:
    case PriceStyle.comboOfferPrice:
    case PriceStyle.materialListPriceStrikeThrough:
    case PriceStyle.returnOriginPriceStrikeThrough:
      return TextDecoration.lineThrough;
    default:
      return null;
  }
}

TextStyle _priceStyle(BuildContext context, PriceStyle type) {
  var priceTextStyle = Theme.of(context).textTheme.labelSmall;
  switch (type) {
    case PriceStyle.comboSubTotalItemWithTax:
      priceTextStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w600,
          );
      break;
    case PriceStyle.bundleFinalPrice:
    case PriceStyle.bundleListPriceStrikeThrough:
    case PriceStyle.counterOfferPrice:
    case PriceStyle.materialListPriceStrikeThrough:
      priceTextStyle = Theme.of(context).textTheme.bodySmall!;
      break;
    case PriceStyle.bundleCartPrice:
    case PriceStyle.bonusPrice:
    case PriceStyle.summaryPrice:
    case PriceStyle.returnBonusPrice:
    case PriceStyle.comboOfferPriceDiscounted:
      priceTextStyle = Theme.of(context).textTheme.titleSmall!;
      break;
    case PriceStyle.taxPrice:
    case PriceStyle.comboOfferPrice:
      priceTextStyle = Theme.of(context).textTheme.bodySmall!.copyWith();
      break;
    case PriceStyle.totalPrice:
    case PriceStyle.credits:
      priceTextStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w900,
          );
      break;
    case PriceStyle.tenderViewOrderByItemPrice:
    case PriceStyle.tenderPrice:
      priceTextStyle = Theme.of(context).textTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.bold,
          );
      break;
    case PriceStyle.tenderCartPrice:
      priceTextStyle = Theme.of(context).textTheme.labelSmall!.copyWith(
            color: ZPColors.primary,
          );
      break;
    case PriceStyle.grandTotalPrice:
      priceTextStyle = Theme.of(context).textTheme.labelMedium;
      break;
    case PriceStyle.comboSubTotalExclTax:
      priceTextStyle = Theme.of(context).textTheme.labelMedium;
      break;
    case PriceStyle.bundlePrice:
    case PriceStyle.productPrice:
      priceTextStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.w600,
          );
    case PriceStyle.bundleAddToCartPrice:
      priceTextStyle = Theme.of(context).textTheme.labelLarge;
      break;
    case PriceStyle.discountPrice:
    case PriceStyle.govtMaterialListPrice:
      priceTextStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ZPColors.extraLightGrey4,
          );
      break;
    case PriceStyle.returnOriginPriceStrikeThrough:
      priceTextStyle = Theme.of(context).textTheme.titleSmall!;
      break;
    case PriceStyle.cartMaterialUnitPrice:
      priceTextStyle = Theme.of(context).textTheme.bodyLarge!;
      break;
    case PriceStyle.counterOfferListPrice:
      priceTextStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: ZPColors.darkGray,
          );
      break;
    case PriceStyle.deliveryOptionFee:
      priceTextStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w700,
          );
      break;
    default:
      break;
  }

  return priceTextStyle!.copyWith(
    color: _priceTextColor(type),
    decoration: _priceTextDecoration(type),
  );
}

//ignore:long-method
TextStyle _currencyCodeTextStyle(BuildContext context, PriceStyle type) {
  switch (type) {
    case PriceStyle.commonPrice:
    case PriceStyle.creditSummaryPrice:
    case PriceStyle.bundleActiveOfferPrice:
    case PriceStyle.negativePrice:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ZPColors.primary,
          );
    case PriceStyle.discountPrice:
      return Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ZPColors.extraLightGrey4,
          );
    case PriceStyle.bundleListPriceStrikeThrough:
      return Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ZPColors.neutralsGrey1,
            decoration: TextDecoration.lineThrough,
          );
    case PriceStyle.materialListPriceStrikeThrough:
    case PriceStyle.counterOfferPrice:
      return Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ZPColors.darkGray,
            decoration: TextDecoration.lineThrough,
          );
    case PriceStyle.bonusPrice:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ZPColors.neutralsBlack,
          );
    case PriceStyle.taxPrice:
      return Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ZPColors.darkGray,
          );
    case PriceStyle.grandTotalPrice:
      return Theme.of(context).textTheme.titleMedium!.copyWith(
            color: ZPColors.neutralsBlack,
          );
    case PriceStyle.bundlePrice:
      return Theme.of(context).textTheme.displayLarge!.copyWith(
            color: ZPColors.neutralsBlack,
            fontWeight: FontWeight.w600,
          );
    case PriceStyle.bundleAddToCartPrice:
      return Theme.of(context).textTheme.labelLarge!.copyWith(
            color: ZPColors.skyBlueColor,
          );
    case PriceStyle.paymentInProgressPrice:
      return Theme.of(context)
          .textTheme
          .labelSmall!
          .copyWith(color: ZPColors.primary);
    case PriceStyle.comboOfferPrice:
      return Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ZPColors.darkerGrey,
            decoration: TextDecoration.lineThrough,
          );
    case PriceStyle.comboOfferPriceDiscounted:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ZPColors.darkerGrey,
          );
    case PriceStyle.comboSubTotalItemWithTax:
      return Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ZPColors.darkGray,
          );
    case PriceStyle.comboSubTotalExclTax:
      return Theme.of(context).textTheme.titleMedium!.copyWith(
            color: ZPColors.primary,
          );
    case PriceStyle.bundleFinalPrice:
      return Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ZPColors.darkGray,
          );
    case PriceStyle.govtMaterialListPrice:
      return Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ZPColors.primary,
          );
    case PriceStyle.returnOriginPriceStrikeThrough:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ZPColors.darkGray,
            decoration: TextDecoration.lineThrough,
          );
    case PriceStyle.cartMaterialUnitPrice:
      return Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: ZPColors.neutralsGrey1,
          );
    case PriceStyle.tenderPrice:
      return Theme.of(context).textTheme.labelSmall!;
    case PriceStyle.tenderCartPrice:
      return Theme.of(context).textTheme.labelSmall!.copyWith(
            color: ZPColors.primary,
          );
    case PriceStyle.tenderViewOrderByItemPrice:
      return Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: ZPColors.primary,
          );
    case PriceStyle.summaryPrice:
      return Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: ZPColors.darkerGrey);
    case PriceStyle.counterOfferListPrice:
      return Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: ZPColors.darkGray,
          );
    case PriceStyle.productPrice:
      return Theme.of(context).textTheme.displayLarge!.copyWith(
            color: ZPColors.primary,
          );
    case PriceStyle.returnBonusPrice:
    case PriceStyle.bundleCartPrice:
    case PriceStyle.deliveryOptionFee:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ZPColors.primary,
            fontWeight: FontWeight.w700,
          );
    default:
      return Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: ZPColors.black);
  }
}
