import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StringUtils {
  static final priceFormatter = NumberFormat('###,###,###,###,##0.00');
  static final priceFormatterWithDecimal =
      NumberFormat('###,###,###,###,##0.##');

  static String displayPrice(
    SalesOrganisationConfigs salesOrgConfig,
    double price,
  ) {
    // Format the price, if price is negative applicable place a '-' sign leading sales org,
    // used where need to display price value on positive manner.
    if (price.isNegative) {
      return '- ${salesOrgConfig.currency.code} ${priceFormatter.format(price * -1)}';
    }

    return '${salesOrgConfig.currency.code} ${priceFormatter.format(price)}';
  }

  static String priceComponentDisplayPrice(
    SalesOrganisationConfigs salesOrgConfig,
    double price,
    bool signedPositive,
  ) {
    // Format the price, format the price base on signed parameter,
    // only use for PriceComponent.
    if (signedPositive && price.isNegative) {
      return '${salesOrgConfig.currency.code} ${formatPrice(salesOrgConfig, price * -1)}';
    }

    return '${salesOrgConfig.currency.code} ${formatPrice(salesOrgConfig, price)}';
  }

  static String displayNumber(
    double price,
  ) {
    return priceFormatter.format(price);
  }

  static String changeToCamelCase({required String sentence}) {
    final semiCamel = sentence
        .split(' ')
        .map(
          (e) =>
              '${e.characters.getRange(0, 1).toUpperCase()}${e.characters.getRange(1).toLowerCase()}',
        )
        .toList()
        .join();

    return '${semiCamel.characters.getRange(0, 1).toLowerCase()}${semiCamel.characters.getRange(1)}';
  }

  static String _getDueDateFormat(String country) {
    final dateTimeFormatMap = {
      'MY': DateTimeFormatString.displaySimpleDateFormat,
    };

    return dateTimeFormatMap[country] ?? DateTimeFormatString.displayDateFormat;
  }

  static String getDueDateString(
    DateTime? dueDate,
    SalesOrganisation salesOrganisation,
  ) =>
      dueDate == null
          ? ''
          : DateFormat(_getDueDateFormat(salesOrganisation.salesOrg.country))
              .format(dueDate);

  static String formatPrice(
    SalesOrganisationConfigs salesOrgConfig,
    double price,
  ) =>
      salesOrgConfig.salesOrg.isID
          ? displayNumberWithDecimal(price.roundToDouble())
          : displayNumber(price);

  static String displayNumberWithDecimal(
    double price,
  ) {
    return priceFormatterWithDecimal.format(price);
  }
}
