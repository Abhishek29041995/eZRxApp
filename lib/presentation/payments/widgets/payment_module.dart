import 'package:flutter/material.dart';

class PaymentModule extends InheritedWidget {
  final bool isMarketPlace;

  const PaymentModule({
    super.key,
    required this.isMarketPlace,
    required super.child,
  });

  static PaymentModule of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PaymentModule>()!;

  @override
  bool updateShouldNotify(PaymentModule oldWidget) =>
      isMarketPlace != oldWidget.isMarketPlace;
}
