import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/product_price_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import 'product_detail_robot.dart';

class CovidDetailRobot extends ProductDetailRobot {
  CovidDetailRobot(super.tester);
  final addToCartErrorSection = find.byKey(WidgetKeys.addToCartErrorSection);
  final cancelCovidMaterialAddToCart = find.byKey(
    WidgetKeys.cancelCovidMaterialAddToCart,
  );
  final proceedCovidMaterialAddToCart = find.byKey(
    WidgetKeys.addToCartErrorSectionProceed,
  );

  void verifyCovidLabel() {
    expect(find.byKey(WidgetKeys.covidLabel), findsWidgets);
  }

  void verifyCovidMaterialPrice() {
    final priceLabel = find.byType(ProductPriceLabel);
    expect(
      find.descendant(
        of: priceLabel.evaluate().length > 1 ? priceLabel.first : priceLabel,
        matching: find.text('Price Not Available'.tr(), findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyProceedNotToAddToCartDialog() {
    expect(
      find.descendant(
        of: addToCartErrorSection,
        matching: find.text('Proceed to add to cart?'.tr()),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: addToCartErrorSection,
        matching: cancelCovidMaterialAddToCart,
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: addToCartErrorSection,
        matching: proceedCovidMaterialAddToCart,
      ),
      findsOneWidget,
    );
  }

  void verifyCovidCannotBeAddedWithCommercialMaterialErrorTextInDialog() {
    expect(
      find.descendant(
        of: addToCartErrorSection,
        matching: find.text(
          'Covid-19 vaccine cannot be added to cart with other commercial materials. By proceeding, your current cart will be cleared.'
              .tr(),
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyCommercialMaterialCannotBeAddedWithCovidErrorTextInDialog() {
    expect(
      find.descendant(
        of: addToCartErrorSection,
        matching: find.text(
          'Commercial materials cannot be added to cart with Covid-19 vaccines. By proceeding, your current cart will be cleared.'
              .tr(),
        ),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapCancelCovidMaterialAddToCartButton() async {
    await tester.tap(cancelCovidMaterialAddToCart);
    await tester.pump();
  }

  Future<void> tapProceedCovidMaterialAddToCartButton() async {
    await tester.tap(proceedCovidMaterialAddToCart);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }
}
