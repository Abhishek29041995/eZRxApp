import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateTime? getDeliveryDate(String dateString) =>
      DateFormat(DateTimeFormatString.displayDateFormat).tryParse(dateString);

  static String getDeliveryDateString(DateTime deliveryDate) =>
      DateFormat(DateTimeFormatString.displayDateFormat).format(deliveryDate);

  static String getApiDateWithDashString(DateTime date) =>
      DateFormat(DateTimeFormatString.apiDateWithDashFormat).format(date);

  static DateTime getNearestWorkingDate(DateTime time) {
    time = time.add(const Duration(days: 1));

    while (isWeekend(time)) {
      time = time.add(const Duration(days: 1));
    }

    return DateUtils.dateOnly(time);
  }

  static DateTime addWorkingDay(DateTime startDate, int duration) {
    var endDate = startDate;
    while (duration > 0) {
      endDate = endDate.add(const Duration(days: 1));
      if (!isWeekend(endDate)) {
        duration--;
      }
    }

    return DateUtils.dateOnly(endDate);
  }

  static bool isWeekend(DateTime dateTime) =>
      dateTime.weekday >= DateTime.saturday;
}
