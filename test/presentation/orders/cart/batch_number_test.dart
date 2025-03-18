import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

void main() {
  late CartBloc cartBlocMock;
  // late CartItem mockCartItemWithOutBatch;
  // late CartItem mockCartItemWithBatch;
  // late List<StockInfo> batchStockInfoMock;
  // late AppRouter autoRouter;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      cartBlocMock = CartBlocMock();
      locator.registerFactory(() => AppRouter());
      // autoRouter = AppRouter();
      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(
          isFetching: false,
        ),
      );
      // mockCartItemWithOutBatch = CartItem(
      //   materials: [
      //     PriceAggregate.empty().copyWith(
      //       quantity: 1,
      //       materialInfo: MaterialInfo.empty().copyWith(
      //         materialNumber: MaterialNumber('000000000023168451'),
      //       ),
      //       salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
      //         enableBatchNumber: true,
      //       ),
      //     ),
      //   ],
      //   itemType: CartItemType.material,
      // );

      // batchStockInfoMock = [
      //   StockInfo.empty().copyWith(
      //     materialNumber: MaterialNumber('000000000023168451'),
      //     inStock: MaterialInStock('Yes'),
      //     expiryDate: DateTimeStringValue('NA'),
      //     salesDistrict: '',
      //     batch: BatchNumber('fake-batch1'),
      //   ),
      //   StockInfo.empty().copyWith(
      //     materialNumber: MaterialNumber('000000000023168451'),
      //     inStock: MaterialInStock('Yes'),
      //     expiryDate: DateTimeStringValue('NA'),
      //     salesDistrict: '',
      //     batch: BatchNumber('fake-batch2'),
      //   ),
      // ];
      // mockCartItemWithBatch = CartItem(
      //   materials: [
      //     PriceAggregate.empty().copyWith(
      //       quantity: 1,
      //       materialInfo: MaterialInfo.empty().copyWith(
      //         materialNumber: MaterialNumber('000000000023168451'),
      //       ),
      //       stockInfo: batchStockInfoMock.first,
      //       stockInfoList: batchStockInfoMock,
      //       salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
      //         enableBatchNumber: true,
      //       ),
      //     ),
      //   ],
      //   itemType: CartItemType.material,
      // );
    },
  );

  // Widget getWidget({
  //   required CartItem item,
  //   isOrderSummaryView = false,
  // }) {
  //   return WidgetUtils.getScopedWidget(
  //     autoRouterMock: autoRouter,
  //     providers: [
  //       BlocProvider<CartBloc>(
  //         create: (context) => cartBlocMock,
  //       ),
  //     ],
  //     child: Material(
  //       child: BatchNumberLabel(
  //         cartItem: item,
  //         isOrderSummaryView: isOrderSummaryView,
  //       ),
  //     ),
  //   );
  // }

  // group('Batch number not available', () {
  // testWidgets(
  //   'test bottom sheet when batch not available from cart',
  //   (tester) async {
  //     await tester.pumpWidget(
  //       getWidget(
  //         item: mockCartItemWithOutBatch,
  //       ),
  //     );
  //     await tester.pump();
  //     final batchNumber = find.byKey(
  //       ValueKey(
  //         'batchNumber_${mockCartItemWithOutBatch.materials.first.stockInfo.batch.selectOrGetBatch}',
  //       ),
  //     );

  //     expect(batchNumber, findsOneWidget);
  //     await tester.tap(batchNumber);
  //     await tester.pumpAndSettle();

  //     final selectBatchNumber = find.byKey(
  //       const ValueKey('selectBatchNumber'),
  //     );
  //     expect(selectBatchNumber, findsOneWidget);

  //     final noBatchFound = find.byKey(
  //       const ValueKey('noBatchFound'),
  //     );
  //     expect(noBatchFound, findsOneWidget);

  //     final closeButton = find.byKey(
  //       const ValueKey('closeButton'),
  //     );
  //     expect(closeButton, findsOneWidget);
  //     await tester.tap(closeButton);
  //     await tester.pumpAndSettle();
  //     expect(closeButton, findsNothing);
  //   },
  // );

  //   testWidgets(
  //     'test bottom sheet when batch not available from orderSummery',
  //     (tester) async {
  //       await tester.pumpWidget(
  //         getWidget(
  //           item: mockCartItemWithOutBatch,
  //           isOrderSummaryView: true,
  //         ),
  //       );
  //       await tester.pump();
  //       final batchNumber = find.byKey(
  //         ValueKey(
  //           'batchNumber_${mockCartItemWithOutBatch.materials.first.stockInfo.batch.selectOrGetBatch}',
  //         ),
  //       );

  //       expect(batchNumber, findsOneWidget);
  //       await tester.tap(batchNumber);
  //       await tester.pump();

  //       final selectBatchNumber = find.byKey(
  //         const ValueKey('selectBatchNumber'),
  //       );
  //       expect(selectBatchNumber, findsOneWidget);

  //       final noBatchFound = find.byKey(
  //         const ValueKey('noBatchFound'),
  //       );
  //       expect(noBatchFound, findsOneWidget);

  //       final closeButton = find.byKey(
  //         const ValueKey('closeButton'),
  //       );
  //       expect(closeButton, findsOneWidget);
  //     },
  //   );
  // });

  // group('Batch number available', () {
  //   testWidgets(
  //     'test bottom sheet when batch available from cart',
  //     (tester) async {
  //       await tester.pumpWidget(
  //         getWidget(
  //           item: mockCartItemWithBatch,
  //         ),
  //       );
  //       await tester.pump();
  //       final batchNumber = find.byKey(
  //         ValueKey(
  //           'batchNumber_${mockCartItemWithBatch.materials.first.stockInfo.batch.selectOrGetBatch}',
  //         ),
  //       );

  //       expect(batchNumber, findsOneWidget);
  //       await tester.tap(batchNumber);
  //       await tester.pumpAndSettle();

  //       final selectBatchNumber = find.byKey(
  //         const ValueKey('selectBatchNumber'),
  //       );
  //       expect(selectBatchNumber, findsOneWidget);

  //       final closeButton = find.byKey(
  //         const ValueKey('closeButton'),
  //       );
  //       expect(closeButton, findsOneWidget);
  //       final batchFirst = find.byKey(
  //         ValueKey(batchStockInfoMock.first.batch.selectOrGetBatch),
  //       );
  //       expect(batchFirst, findsOneWidget);

  //       final batchSecond = find.byKey(
  //         ValueKey(batchStockInfoMock.last.batch.selectOrGetBatch),
  //       );
  //       expect(batchSecond, findsOneWidget);
  //       await tester.tap(batchSecond);
  //       await tester.pumpAndSettle();
  //       verify(
  //         () => cartBlocMock.add(
  //           CartEvent.updateBatchInCartItem(
  //             item: mockCartItemWithBatch,
  //             stockInfo: batchStockInfoMock.last,
  //           ),
  //         ),
  //       ).called(1);
  //     },
  //   );

  //   testWidgets(
  //     'test bottom sheet when batch available from order summery',
  //     (tester) async {
  //       await tester.pumpWidget(
  //         getWidget(
  //           item: mockCartItemWithBatch,
  //           isOrderSummaryView: false,
  //         ),
  //       );
  //       await tester.pump();
  //       final batchNumber = find.byKey(
  //         ValueKey(
  //           'batchNumber_${mockCartItemWithBatch.materials.first.stockInfo.batch.selectOrGetBatch}',
  //         ),
  //       );

  //       expect(batchNumber, findsOneWidget);
  //       await tester.tap(batchNumber);
  //       await tester.pumpAndSettle();

  //       final selectBatchNumber = find.byKey(
  //         const ValueKey('selectBatchNumber'),
  //       );
  //       expect(selectBatchNumber, findsOneWidget);

  //       final closeButton = find.byKey(
  //         const ValueKey('closeButton'),
  //       );
  //       expect(closeButton, findsOneWidget);
  //       final batchFirst = find.byKey(
  //         ValueKey(batchStockInfoMock.first.batch.selectOrGetBatch),
  //       );
  //       expect(batchFirst, findsOneWidget);

  //       final batchSecond = find.byKey(
  //         ValueKey(batchStockInfoMock.last.batch.selectOrGetBatch),
  //       );
  //       expect(batchSecond, findsOneWidget);
  //       await tester.tap(batchSecond);
  //       await tester.pumpAndSettle();
  //       verify(
  //         () => cartBlocMock.add(
  //           CartEvent.updateBatchInCartItem(
  //             item: mockCartItemWithBatch,
  //             stockInfo: batchStockInfoMock.last,
  //           ),
  //         ),
  //       ).called(1);
  //     },
  //   );
  // });
}
