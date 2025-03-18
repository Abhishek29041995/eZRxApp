import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

final locator = GetIt.instance;

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

void main() {
  late AppRouter autoRouterMock;
  late ProductImageBloc productImageBlocMock;
  const fakeTopHeaderWidget = Key('fakeTopHeaderWidget');

  setUpAll(() {
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    productImageBlocMock = ProductImageBlocMock();
    when(() => productImageBlocMock.state).thenReturn(
      ProductImageState.initial(),
    );
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ProductImageBloc>(
          create: (context) => productImageBlocMock,
        ),
      ],
      child: Scaffold(
        body: CommonTileItem(
          label: '',
          materialNumber: MaterialNumber(''),
          title: '',
          subtitle: '',
          quantity: '0',
          isQuantityBelowImage: false,
          statusWidget: const SizedBox.shrink(),
          headerText: '',
          topHeaderWidget: const SizedBox(key: fakeTopHeaderWidget),
          footerWidget: const SizedBox.shrink(),
        ),
      ),
    );
  }

  group(
    'Common Tile Item Test',
    () {
      testWidgets(
        ' => check topHeaderWidget display',
        (WidgetTester tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.byKey(fakeTopHeaderWidget), findsOneWidget);
        },
      );
    },
  );
}
