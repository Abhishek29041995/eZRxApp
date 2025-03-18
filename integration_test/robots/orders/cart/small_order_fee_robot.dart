import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/price_summary/price_summary_tile.dart';
import 'package:flutter_test/flutter_test.dart';

class SmallOrderFeeRobot {
  final WidgetTester tester;

  SmallOrderFeeRobot(this.tester);

  final bottomSheet = find.byKey(WidgetKeys.smallOrderFeeModal);
  final cancelButton = find.byKey(WidgetKeys.cancelButton);
  final agreeButton = find.byKey(WidgetKeys.confirmButton);

  bool get isSheetVisible => bottomSheet.evaluate().isNotEmpty;

  void verifySheet({required bool isVisible}) {
    expect(bottomSheet, isVisible ? findsOneWidget : findsNothing);
  }

  void verifyCancelButton() {
    expect(
      find.descendant(of: bottomSheet, matching: cancelButton),
      findsOneWidget,
    );
  }

  Future<void> tapCancelButton() async {
    await tester.tap(find.descendant(of: bottomSheet, matching: cancelButton));
    await tester.pumpAndSettle();
  }

  void verifyAgreeButton() {
    expect(
      find.descendant(of: bottomSheet, matching: agreeButton),
      findsOneWidget,
    );
  }

  Future<void> tapAgreeButton() async {
    await tester.tap(find.descendant(of: bottomSheet, matching: agreeButton));
    await tester.pumpAndSettle();
  }

  void verifyBottomSheetContent() {
    expect(find.text('Agree to small order fee?'.tr()), findsOneWidget);
    expect(
      find.text(
        'Please agree to small order fee to proceed.'.tr(),
      ),
      findsOneWidget,
    );
    expect(
      find.text(
        'Alternatively, you may choose to add more in-stock items to your order.'
            .tr(),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: bottomSheet,
        matching: find.byType(PriceSummarySection),
      ),
      findsOneWidget,
    );
  }
}
