import 'package:flutter/material.dart';

extension ScrollControllerExtension on ScrollController {
  void scrollToTop() {
    if (hasClients) {
      animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
