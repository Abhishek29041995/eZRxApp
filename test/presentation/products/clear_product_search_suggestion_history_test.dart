import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/clear_product_search_suggestion_history.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class ProductSearchBlocMock
    extends MockBloc<ProductSearchEvent, ProductSearchState>
    implements ProductSearchBloc {}

void main() {
  late ProductSearchBlocMock productSearchBlocMock;
  late AppRouter autoRouterMock;

  setUpAll(() async {
    locator.registerFactory(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
  });

  group('Test "Product Search Entry Test"', () {
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      locator = GetIt.instance;
      productSearchBlocMock = ProductSearchBlocMock();
      when(() => productSearchBlocMock.state)
          .thenReturn(ProductSearchState.initial());
    });

    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<ProductSearchBloc>(
            create: (context) => productSearchBlocMock,
          ),
        ],
        child: const Material(
          child: ClearProductSearchSuggestionHistory(),
        ),
      );
    }

    testWidgets(
      '=> Test widget display',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.text('Clear search history?'.tr()),
          findsOneWidget,
        );
        final cancelButtonFinder = find.byKey(WidgetKeys.cancelButton);
        expect(cancelButtonFinder, findsOneWidget);
        expect(find.text('Cancel'.tr()), findsOneWidget);
        final confirmButtonFinder = find.byKey(WidgetKeys.confirmButton);
        expect(confirmButtonFinder, findsOneWidget);
        expect(find.text('Clear'.tr()), findsOneWidget);
      },
    );

    testWidgets(
      '=> Test on tap cancel button',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final cancelButtonFinder = find.byKey(WidgetKeys.cancelButton);
        await tester.tap(cancelButtonFinder);
      },
    );

    testWidgets(
      '=> Test on tap confirm button',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final confirmButtonFinder = find.byKey(WidgetKeys.confirmButton);
        await tester.tap(confirmButtonFinder);
        await tester.pumpAndSettle();
        verify(
          () => productSearchBlocMock.add(
            const ProductSearchEvent.clearProductSearchSuggestionHistory(),
          ),
        ).called(1);
      },
    );
  });
}
