import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';
import '../../common/extension.dart';

class NewPaymentStep3Robot extends CommonRobot {
  NewPaymentStep3Robot(super.tester);

  final generatePaymentAdviceButton =
      find.byKey(WidgetKeys.generatePaymentAdvice);
  final payButton = find.byKey(WidgetKeys.payButton);
  final radioPaymentGateway = find.byKey(WidgetKeys.paymentMethodRadio);
  final paymentWebviewPage = find.byKey(WidgetKeys.paymentWebviewPage);
  final createPaymentAdviseNote =
      find.byKey(WidgetKeys.createPaymentAdviseNote);
  final createPaymentAdviseWarning =
      find.byKey(WidgetKeys.createPaymentAdviseWarning);
  final invoiceCreditTile = find.byKey(WidgetKeys.invoiceCreditItemTile);

  void verifyStep3InitialField(String defaultPaymentMethod) {
    verifyWarningMessage();
    expect(
      find.textContaining('Select payment method'.tr()),
      findsAtLeastNWidgets(1),
    );
    expect(
      find.textContaining(defaultPaymentMethod),
      findsAtLeastNWidgets(1),
    );
    expect(radioPaymentGateway, findsAtLeastNWidgets(1));
    expect(
      tester
          .widget<Radio>(
            radioPaymentGateway.evaluate().length > 1
                ? radioPaymentGateway.at(0)
                : radioPaymentGateway,
          )
          .value,
      equals(PaymentMethodValue(defaultPaymentMethod)),
    );
  }

  void verifyStep3InitialFieldForID() {
    final defaultPaymentMethod = 'Virtual Account Payment'.tr();
    expect(
      find.textContaining(defaultPaymentMethod),
      findsAtLeastNWidgets(1),
    );
    verifyWarningMessage(isVisible: false);
    expect(radioPaymentGateway, findsAtLeastNWidgets(1));
    expect(
      tester.widget<Radio>(radioPaymentGateway).value,
      equals(PaymentMethodValue(defaultPaymentMethod)),
    );
  }

  void verifyStep3BankAccount() {
    final defaultPaymentMethod = 'Virtual Account Payment'.tr();
    expect(
      find.textContaining(defaultPaymentMethod),
      findsAtLeastNWidgets(1),
    );
    expect(radioPaymentGateway, findsAtLeastNWidgets(1));
    expect(
      tester.widget<Radio>(radioPaymentGateway).value,
      equals(PaymentMethodValue(defaultPaymentMethod)),
    );

    expect(
      find.byKey(WidgetKeys.paymentMethodCheckbox),
      findsAtLeastNWidgets(1),
    );
  }

  Future<void> verifyStep3SelectBankAccount() async {
    final defaultPaymentMethod = 'Virtual Account Payment'.tr();
    expect(
      find.textContaining(defaultPaymentMethod),
      findsAtLeastNWidgets(1),
    );
    expect(radioPaymentGateway, findsAtLeastNWidgets(1));
    expect(
      tester.widget<Radio>(radioPaymentGateway).value,
      equals(PaymentMethodValue(defaultPaymentMethod)),
    );

    expect(
      find.byKey(WidgetKeys.paymentMethodCheckbox),
      findsAtLeastNWidgets(1),
    );
    await tester.tap(find.byKey(WidgetKeys.paymentMethodCheckbox).first);
    await tester.pumpAndSettle();
  }

  void verifyWarningMessage({bool isVisible = true}) {
    expect(createPaymentAdviseNote, isVisible ? findsOneWidget : findsNothing);
  }

  void verifyPaymentAdviceWarning() {
    expect(createPaymentAdviseWarning, findsOneWidget);
  }

  void verifyOrderAddressVisible(String address) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionActionLabel &&
            widget is RichText &&
            widget.text.toPlainText().contains(address),
      ),
      findsOneWidget,
    );
  }

  void verifyCustomerCode(String customerCode) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionCustomerCodeLabel &&
            widget is Text &&
            (widget.data ?? '').contains(customerCode),
      ),
      findsOneWidget,
    );
  }

  void verifyShipToCode(String shipToCode) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionDeliveryToLabel &&
            widget is Text &&
            (widget.data ?? '').contains(shipToCode),
      ),
      findsOneWidget,
    );
  }

  Future<void> verifyOrderAddressVisibleForID(
    String address,
    String customerCode,
    String shipToCode,
  ) async {
    final addressWidget = find.byWidgetPredicate(
      (widget) =>
          widget.key == WidgetKeys.addressInfoSectionActionLabel &&
          widget is RichText &&
          widget.text.toPlainText().contains(address),
    );
    await scrollEnsureFinderVisible(addressWidget);
    expect(
      addressWidget,
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionCustomerCodeLabel &&
            widget is Text &&
            (widget.data ?? '').contains(customerCode),
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionDeliveryToLabel &&
            widget is Text &&
            (widget.data ?? '').contains(shipToCode),
      ),
      findsOneWidget,
    );
  }

  Future<void> verifyInvoiceCreditItem(
    String id,
    String governmentNumber,
  ) async {
    final firstItem = invoiceCreditTile.evaluate().length > 1
        ? invoiceCreditTile.first
        : invoiceCreditTile;
    await scrollEnsureFinderVisible(firstItem);
    expect(
      find.descendant(
        of: firstItem,
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.invoiceCreditItemId &&
              widget is Text &&
              widget.data!.contains(id),
        ),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: firstItem,
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.governmentNumber &&
              widget is Text &&
              widget.data!.contains(governmentNumber),
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyGeneratePaymentAdviceButton() {
    expect(generatePaymentAdviceButton, findsOneWidget);
  }

  void verifyThePriceAndButton(
    double priceWithoutCredit,
    double priceWithCredit,
  ) {
    expect(
      find.textContaining(priceWithCredit.priceFormatted, findRichText: true),
      findsAtLeastNWidgets(1),
    );
    expect(
      find.textContaining(
        priceWithoutCredit.priceFormatted,
        findRichText: true,
      ),
      findsAtLeastNWidgets(1),
    );
    expect(generatePaymentAdviceButton, findsOneWidget);
  }

  void verifyTotalAmountToPay(double invoicePrice, double creditPrice) {
    final totalAmount = double.parse(
      tester
          .widget<PriceComponent>(find.byKey(WidgetKeys.totalAmountToPay))
          .price,
    );
    expect(totalAmount, invoicePrice - creditPrice);
  }

  void verifyTotalAmountToPayForID(double invoicePrice) {
    final totalAmount = double.parse(
      tester
          .widget<PriceComponent>(find.byKey(WidgetKeys.totalAmountToPay))
          .price,
    );
    expect(totalAmount.priceFormattedForID, invoicePrice.priceFormattedForID);
  }
}
