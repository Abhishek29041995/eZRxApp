import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

IconData notificationIcon(
  String title,
) {
  final iconMap = {
    'order created': Icons.receipt_long_outlined,
    'return request created': Icons.electric_rickshaw,
    'return request failed': Icons.close,
    'payment advice deleted': Icons.close,
    'return request reviewed': Icons.electric_rickshaw,
    'payment advice created': Icons.account_balance_wallet_outlined,
    'reminder: payment advice expiring': Icons.error,
    'alert': Icons.push_pin_outlined,
  };

  return iconMap[title.toLowerCase()] ?? Icons.receipt_long_outlined;
}

Color getIconBGColor(
  String title,
) {
  final accentColor = {
    'order created': ZPColors.accentColor,
    'return request created': ZPColors.accentColor,
    'payment advice created': ZPColors.accentColor,
    'alert': ZPColors.accentColor,
  };
  final lightRed = {
    'return request failed': ZPColors.lightRed,
    'payment advice deleted': ZPColors.lightRed,
    'reminder: payment advice expiring': ZPColors.lightRed,
  };

  final titleMap = {
    ...accentColor,
    ...lightRed,
    'return request reviewed': ZPColors.lightSecondary,
  };

  return titleMap[title.toLowerCase()] ?? ZPColors.accentColor;
}

Color getIconColor(
  String title,
) {
  final primary = {
    'order created': ZPColors.primary,
    'return request created': ZPColors.primary,
    'payment advice created': ZPColors.primary,
    'alert': ZPColors.primary,
  };
  final red = {
    'return request failed': ZPColors.red,
    'payment advice deleted': ZPColors.red,
    'reminder: payment advice expiring': ZPColors.red,
  };

  final titleMap = {
    ...primary,
    ...red,
    'return request reviewed': ZPColors.lightGreen,
  };

  return titleMap[title.toLowerCase()] ?? ZPColors.primary;
}

bool checkReturn(String val) =>
    isEqualsIgnoreCase(val, 'ReturnRequestReminder') ||
    isEqualsIgnoreCase(val, 'ReturnRequestCreatedForApprover') ||
    isEqualsIgnoreCase(val, 'ReturnRequestCreated');

bool checkOrder(String val) =>
    isEqualsIgnoreCase(val, 'OrderCreated') ||
    isEqualsIgnoreCase(val, 'OrderCancelled');

bool checkPayment(String val) =>
    isEqualsIgnoreCase(val, 'PaymentAdviceCreated') ||
    isEqualsIgnoreCase(val, 'PaymentAdviceConfirmation');

bool checkAnnouncement(String val) =>
    isEqualsIgnoreCase(val, 'AnnouncementBanner');
