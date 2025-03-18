import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/home/widgets/product_loading_shimmer.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common_mock_data/mock_other.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late AppRouter autoRouterMock;
  setUpAll(() {
    locator.registerLazySingleton<AppRouter>(() => AutoRouteMock());
    autoRouterMock = locator<AppRouter>();
  });

  Widget getWidget({gridView = false}) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      child: Material(
        child: ProductLoadingShimmer(gridView: gridView),
      ),
    );
  }

  group('ProductLoadingShimmer test => ', () {
    testWidgets('Show in list view', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Show in grid view', (tester) async {
      await tester.pumpWidget(getWidget(gridView: true));
      await tester.pump();
      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
