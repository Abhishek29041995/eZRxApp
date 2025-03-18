//TODO : Need to revisit after counter offer PR is merged

import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CartMockBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeMockBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class EligibilityMockBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class PriceOverrideMockBloc
    extends MockBloc<PriceOverrideEvent, PriceOverrideState>
    implements PriceOverrideBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

void main() {
  // late CartBloc cartMockBloc;
  // late SalesOrgBloc salesOrgMockBloc;
  // late CustomerCodeBloc customerCodeMockBloc;
  // late EligibilityBloc eligibilityMockBloc;
  // late AppRouter autoRouterMock;
  // late PriceOverrideBloc priceOverrideMockBloc;
  // late List<PriceAggregate> mockPriceAggregates;

  group('Price Override Sheet Test', () {
    // setUp(() {
    //   cartMockBloc = CartMockBloc();
    //   eligibilityMockBloc = EligibilityMockBloc();
    //   salesOrgMockBloc = SalesOrgMockBloc();
    //   customerCodeMockBloc = CustomerCodeMockBloc();
    //   autoRouterMock = AppRouter();
    //   priceOverrideMockBloc = PriceOverrideMockBloc();
    //   mockPriceAggregates = [
    //     PriceAggregate.empty().copyWith(
    //       price: Price.empty(),
    //       materialInfo: MaterialInfo.empty().copyWith(
    //         materialNumber: MaterialNumber('1'),
    //       ),
    //     ),
    //   ];

    //   // when(() => cartMockBloc.state).thenReturn(CartState.initial().copyWith(
    //   //   cartItemList: mockPriceAggregates,
    //   // ));
    //   when(() => priceOverrideMockBloc.state).thenReturn(
    //     PriceOverrideState.initial(),
    //   );
    // });

    // Widget getScopedWidget(
    //   Widget child, [
    //   List<BlocProvider> additionalProviders = const [],
    // ]) {
    //   return WidgetUtils.getScopedWidget(
    //     autoRouterMock: autoRouterMock,
    //     providers: [
    //       BlocProvider<CartBloc>(create: (context) => cartMockBloc),
    //       BlocProvider<PriceOverrideBloc>(
    //         create: (context) => priceOverrideMockBloc,
    //       ),
    //       if (additionalProviders.isNotEmpty) ...additionalProviders,
    //     ],
    //     child: Scaffold(
    //       appBar: null,
    //       body: child,
    //     ),
    //   );
    // }

    //   testWidgets('Initialisation Test', (tester) async {
    //     await tester.pumpWidget(
    //       getScopedWidget(
    //         PriceSheet(
    //           item: mockPriceAggregates.first,
    //         ),
    //       ),
    //     );

    //     final priceSheetWidget = find.byKey(const Key('priceSheetKey'));
    //     final overridePriceButton =
    //         find.byKey(const Key('priceOverrideSubmitButton'));
    //     final formField = find.byType(TextFormField);
    //     final formFieldWidget = tester.widget<TextFormField>(formField);
    //     final newPrice = mockPriceAggregates.first.getNewPrice();

    //     expect(priceSheetWidget, findsOneWidget);
    //     expect(overridePriceButton, findsOneWidget);
    //     expect(
    //       formFieldWidget.controller?.text,
    //       newPrice != 0.0 ? StringUtils.formatter.format(newPrice) : '',
    //     );
    //   });

    //   testWidgets('Change Price Test', (tester) async {
    //     await tester.pumpWidget(
    //       getScopedWidget(
    //         PriceSheet(
    //           item: mockPriceAggregates.first.copyWith(
    //             salesOrgConfig: SalesOrganisationConfigs.empty()
    //                 .copyWith(currency: Currency('vnd')),
    //           ),
    //         ),
    //       ),
    //     );

    //     final priceOverrideTextFormField =
    //         find.byKey(const Key('priceOverrideTextFormField'));
    //     expect(priceOverrideTextFormField, findsOneWidget);
    //     await tester.enterText(priceOverrideTextFormField, '0.11');
    //   });

    //   testWidgets('Change Price Test for salesRep user success', (tester) async {
    //     when(() => salesOrgMockBloc.state).thenReturn(
    //       SalesOrgState.initial(),
    //     );
    //     when(() => customerCodeMockBloc.state).thenReturn(
    //       CustomerCodeState.initial(),
    //     );
    //     when(() => eligibilityMockBloc.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         user: User.empty().copyWith(
    //           hasPriceOverride: true,
    //           role: Role.empty().copyWith(
    //             type: RoleType('internal_sales_rep'),
    //           ),
    //         ),
    //       ),
    //     );
    //     final expectedStates = [
    //       PriceOverrideState.initial(),
    //       PriceOverrideState.initial().copyWith(
    //         priceOverrideValue: PriceOverrideValue(0.0),
    //         isFetching: false,
    //         showErrorMessages: true,
    //       ),
    //     ];

    //     whenListen(priceOverrideMockBloc, Stream.fromIterable(expectedStates));
    //     await tester.pumpWidget(
    //       getScopedWidget(
    //           PriceSheet(
    //             item: mockPriceAggregates.first.copyWith(
    //               salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
    //                 currency: Currency('vnd'),
    //               ),
    //             ),
    //           ),
    //           [
    //             BlocProvider<EligibilityBloc>(
    //               create: (context) => eligibilityMockBloc,
    //             ),
    //             BlocProvider<SalesOrgBloc>(
    //               create: (context) => salesOrgMockBloc,
    //             ),
    //             BlocProvider<CustomerCodeBloc>(
    //               create: (context) => customerCodeMockBloc,
    //             ),
    //           ]),
    //     );

    //     final priceOverrideTextFormField =
    //         find.byKey(const Key('priceOverrideTextFormField'));
    //     expect(priceOverrideTextFormField, findsOneWidget);
    //     await tester.enterText(priceOverrideTextFormField, '0.11');
    //     await tester.pump();
    //     final priceOverrideSubmitButton =
    //         find.byKey(const Key('priceOverrideSubmitButton'));
    //     await tester.tap(priceOverrideSubmitButton);
    //     await tester.pump();
    //     verify(
    //       () => priceOverrideMockBloc.add(
    //         PriceOverrideEvent.fetch(
    //           item: mockPriceAggregates.first.copyWith(
    //             salesOrgConfig: SalesOrganisationConfigs.empty()
    //                 .copyWith(currency: Currency('vnd')),
    //           ),
    //           salesOrganisation: SalesOrganisation.empty(),
    //           customerCodeInfo: CustomerCodeInfo.empty(),
    //         ),
    //       ),
    //     ).called(1);
    //   });

    //   testWidgets('Change Price Test for salesRep user not success',
    //       (tester) async {
    //     when(() => salesOrgMockBloc.state).thenReturn(
    //       SalesOrgState.initial(),
    //     );
    //     when(() => customerCodeMockBloc.state).thenReturn(
    //       CustomerCodeState.initial(),
    //     );
    //     when(() => eligibilityMockBloc.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         user: User.empty().copyWith(
    //           hasPriceOverride: false,
    //           role: Role.empty().copyWith(
    //             type: RoleType('internal_sales_rep'),
    //           ),
    //         ),
    //       ),
    //     );
    //     final expectedStates = [
    //       PriceOverrideState.initial(),
    //       PriceOverrideState.initial().copyWith(
    //         priceOverrideValue: PriceOverrideValue(0.0),
    //         isFetching: false,
    //         showErrorMessages: true,
    //       ),
    //     ];

    //     whenListen(priceOverrideMockBloc, Stream.fromIterable(expectedStates));
    //     await tester.pumpWidget(
    //       getScopedWidget(
    //         PriceSheet(
    //           item: mockPriceAggregates.first.copyWith(
    //             salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
    //               currency: Currency('vnd'),
    //             ),
    //           ),
    //         ),
    //         [
    //           BlocProvider<EligibilityBloc>(
    //             create: (context) => eligibilityMockBloc,
    //           ),
    //           BlocProvider<SalesOrgBloc>(
    //             create: (context) => salesOrgMockBloc,
    //           ),
    //           BlocProvider<CustomerCodeBloc>(
    //             create: (context) => customerCodeMockBloc,
    //           ),
    //         ],
    //       ),
    //     );

    //     final priceOverrideTextFormField =
    //         find.byKey(const Key('priceOverrideTextFormField'));
    //     expect(priceOverrideTextFormField, findsOneWidget);
    //     await tester.enterText(priceOverrideTextFormField, '0.11');
    //     await tester.pump();
    //     final priceOverrideSubmitButton =
    //         find.byKey(const Key('priceOverrideSubmitButton'));
    //     await tester.tap(priceOverrideSubmitButton);
    //     await tester.pump();
    //     verifyNever(
    //       () => priceOverrideMockBloc.add(
    //         PriceOverrideEvent.fetch(
    //           item: mockPriceAggregates.first.copyWith(
    //             salesOrgConfig: SalesOrganisationConfigs.empty()
    //                 .copyWith(currency: Currency('vnd')),
    //           ),
    //           salesOrganisation: SalesOrganisation.empty(),
    //           customerCodeInfo: CustomerCodeInfo.empty(),
    //         ),
    //       ),
    //     );
    //   });

    //   testWidgets('Change Price Test validation error', (tester) async {
    //     when(() => eligibilityMockBloc.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         user: User.empty().copyWith(
    //           hasPriceOverride: false,
    //           role: Role.empty().copyWith(
    //             type: RoleType('internal_sales_rep'),
    //           ),
    //         ),
    //       ),
    //     );
    //     final expectedStates = [
    //       PriceOverrideState.initial(),
    //       PriceOverrideState.initial().copyWith(
    //         priceOverrideValue: PriceOverrideValue(0.0),
    //         isFetching: false,
    //         showErrorMessages: true,
    //       ),
    //     ];

    //     whenListen(priceOverrideMockBloc, Stream.fromIterable(expectedStates));
    //     await tester.pumpWidget(
    //       getScopedWidget(
    //         PriceSheet(
    //           item: mockPriceAggregates.first.copyWith(
    //             salesOrgConfig: SalesOrganisationConfigs.empty()
    //                 .copyWith(currency: Currency('vnd')),
    //           ),
    //         ),
    //         [
    //           BlocProvider<EligibilityBloc>(
    //             create: (context) => eligibilityMockBloc,
    //           ),
    //           BlocProvider<SalesOrgBloc>(
    //             create: (context) => salesOrgMockBloc,
    //           ),
    //           BlocProvider<CustomerCodeBloc>(
    //             create: (context) => customerCodeMockBloc,
    //           ),
    //         ],
    //       ),
    //     );

    //     final priceOverrideTextFormField =
    //         find.byKey(const Key('priceOverrideTextFormField'));
    //     expect(priceOverrideTextFormField, findsOneWidget);
    //     await tester.enterText(priceOverrideTextFormField, '0.0');
    //     await tester.pump();
    //     final priceOverrideSubmitButton =
    //         find.byKey(const Key('priceOverrideSubmitButton'));
    //     await tester.tap(priceOverrideSubmitButton);
    //     await tester.pump();
    //     final priceOverrideErrorText =
    //         find.textContaining('Priceoverride cannot be empty or zero.'.tr());
    //     expect(priceOverrideErrorText, findsOneWidget);
    //   });

    //   testWidgets('Update cart test success', (tester) async {
    //     when(() => priceOverrideMockBloc.state).thenReturn(
    //       PriceOverrideState.initial().copyWith(
    //         isFetching: true,
    //       ),
    //     );

    //     final expectedState = [
    //       PriceOverrideState.initial().copyWith(
    //         isFetching: false,
    //         cartItemList: [
    //           Price.empty().copyWith(
    //             materialNumber: MaterialNumber('1'),
    //             finalPrice: MaterialPrice(1),
    //             finalTotalPrice: MaterialPrice(1),
    //             lastPrice: MaterialPrice(0.5),
    //           ),
    //         ],
    //       ),
    //     ];

    //     whenListen(priceOverrideMockBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(
    //       getScopedWidget(
    //         PriceSheet(
    //           item: mockPriceAggregates.first,
    //         ),
    //       ),
    //     );

    //     await tester.pump();

    //     expect(autoRouterMock.current.name, 'Root');
    //   });

    //   testWidgets('Update cart test failure', (tester) async {
    //     when(() => priceOverrideMockBloc.state).thenReturn(
    //       PriceOverrideState.initial().copyWith(
    //         isFetching: true,
    //       ),
    //     );

    //     final expectedState = [
    //       PriceOverrideState.initial().copyWith(
    //         isFetching: false,
    //         apiFailureOrSuccessOption: optionOf(
    //           const Left(ApiFailure.other('mock_error')),
    //         ),
    //       ),
    //     ];

    //     whenListen(priceOverrideMockBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(
    //       getScopedWidget(
    //         PriceSheet(
    //           item: mockPriceAggregates.first,
    //         ),
    //       ),
    //     );

    //     await tester.pump();

    //     const snackbarText = 'mock_error';
    //     final snackbarWidget = find.text(snackbarText);

    //     expect(snackbarWidget, findsOneWidget);
    //   });

    //   testWidgets('Update cart test right success', (tester) async {
    //     when(() => priceOverrideMockBloc.state).thenReturn(
    //       PriceOverrideState.initial().copyWith(
    //         isFetching: true,
    //       ),
    //     );

    //     final expectedState = [
    //       PriceOverrideState.initial().copyWith(
    //         isFetching: false,
    //         cartItemList: [
    //           Price.empty().copyWith(
    //             materialNumber: MaterialNumber('1'),
    //             finalPrice: MaterialPrice(1),
    //             finalTotalPrice: MaterialPrice(1),
    //             lastPrice: MaterialPrice(0.5),
    //           ),
    //         ],
    //         apiFailureOrSuccessOption: optionOf(const Right('success')),
    //       ),
    //     ];

    //     whenListen(priceOverrideMockBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(
    //       getScopedWidget(
    //         PriceSheet(
    //           item: mockPriceAggregates.first,
    //         ),
    //       ),
    //     );

    //     await tester.pump();

    //     expect(autoRouterMock.current.name, 'Root');
    //   });
  });
}
