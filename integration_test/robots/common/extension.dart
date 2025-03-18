import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final _priceFormatter = StringUtils.priceFormatter;
final _priceFormatterForID = StringUtils.priceFormatterWithDecimal;

extension DateTimeExt on DateTime {
  bool isDateBetween(DateTime from, DateTime to) =>
      DateUtils.dateOnly(from).millisecondsSinceEpoch <=
          DateUtils.dateOnly(this).millisecondsSinceEpoch &&
      DateUtils.dateOnly(to).millisecondsSinceEpoch >=
          DateUtils.dateOnly(this).millisecondsSinceEpoch;
  String get displayDate => DateTimeStringValue(toIso8601String()).dateString;
}

extension NumExt on num {
  String get priceFormatted => _priceFormatter.format(this);
  String get priceFormattedForID => _priceFormatterForID.format(this);

  String priceDisplay(String currency) => '$currency $priceFormatted';
  String priceDisplayForID(String currency) => '$currency $priceFormattedForID';

  num includeTaxForID(num tax) => this + taxValueForID(tax);

  num taxValueForID(num tax) => taxValue(tax).floorToDouble();

  num includeTax(num tax) => this + taxValue(tax);

  num taxValue(num tax) => this / 100 * tax;

  //only for understanding purpose, exclude tax
  num excludeTax() => this;
}

extension StringExt on String {
  double get priceValue {
    try {
      return _priceFormatter.parse(this).toDouble();
    } catch (_) {
      return 0;
    }
  }

  double get extractDouble {
    if (this == 'Price Not Available'.tr()) return 0.0;

    final cleanedInput = replaceAll(',', '');
    final regex = RegExp(r'(\d+(\.\d+)?)');
    final match = regex.firstMatch(cleanedInput);

    return match != null ? double.parse(match.group(0)!) : 0.0;
  }
}

extension TesterExt on WidgetTester {
  Future<void> pumpUntilVisible(Finder finder, {int maxIteration = 15}) async {
    for (var i = 0; i < maxIteration; i++) {
      if (finder.evaluate().isNotEmpty) {
        expect(finder, findsWidgets);

        return;
      }
      await pumpAndSettle(const Duration(seconds: 1));
    }
  }
}
