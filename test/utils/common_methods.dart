import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//use these function which have common component

Finder priceComponent(String price) => find.byWidgetPredicate(
      (widget) =>
          widget is RichText &&
          widget.key == WidgetKeys.priceComponent &&
          widget.text.toPlainText().contains(price),
    );
