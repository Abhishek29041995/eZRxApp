import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_numeric_text_field.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/widget_utils.dart';

void main() {
  late AppRouter autoRouterMock;
  const textFieldKey = Key('fake-key');

  setUpAll(() {
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      child: Scaffold(
        body: CustomNumericTextField.decimalNumber(
          fieldKey: textFieldKey,
          onChanged: (String text) {},
          decoration: const InputDecoration(),
        ),
      ),
    );
  }

  group('Customer Numeric Text Field Test => ', () {
    testWidgets('Enter value less than one', (tester) async {
      const textLessThanOne = '0.01';
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.enterText(find.byKey(textFieldKey), textLessThanOne);
      await tester.pump();
      expect(find.text(textLessThanOne), findsOneWidget);
    });
  });
}
