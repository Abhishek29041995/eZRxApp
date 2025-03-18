import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// class BonusMaterialBlocMock
//     extends MockBloc<BonusMaterialEvent, BonusMaterialState>
//     implements BonusMaterialBloc {}

// class CartRepositoryMock extends Mock implements CartRepository {}

// class TenderContractBlocMock
//     extends MockBloc<TenderContractEvent, TenderContractState>
//     implements TenderContractBloc {}

// class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

// class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
//     implements SalesOrgBloc {}

// class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
//     implements EligibilityBloc {}

// class CustomerCodeBlocMock
//     extends MockBloc<CustomerCodeEvent, CustomerCodeState>
//     implements CustomerCodeBloc {}

// class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

void main() {
  // late BonusMaterialBloc bonusMaterialBloc;
  // late List<MaterialInfo> mockbonusItemWithDataList;
  // late PriceAggregate cartItem;
  // late TenderContractBloc tenderContractBlocMock;
  // late UserBloc userBloc;
  // late SalesOrgBloc salesOrgBloc;
  // late EligibilityBloc eligibilityBloc;
  // late CustomerCodeBloc customerCodeBloc;
  // late MaterialItemBonus materialItemBonus;

  // late CartBloc cartBloc;

  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      // bonusMaterialBloc = BonusMaterialBlocMock();
      // tenderContractBlocMock = TenderContractBlocMock();
      // userBloc = UserBlocMock();
      // salesOrgBloc = SalesOrgBlocMock();
      // eligibilityBloc = EligibilityBlocMock();
      // customerCodeBloc = CustomerCodeBlocMock();
      // materialItemBonus = MaterialItemBonus.empty();
      // cartBloc = CartBlocMock();
      // cartItem = PriceAggregate.empty().copyWith(
      // quantity: 2,
      // materialInfo: MaterialInfo.empty().copyWith(
      //   materialNumber: MaterialNumber('000000000023168451'),
      //   materialDescription: ' Triglyceride Mosys D',
      //   principalData: PrincipalData.empty().copyWith(
      //     principalName: PrincipalName('台灣拜耳股份有限公司'),
      //   ),
      // ),
      // );
      // mockbonusItemWithDataList = [
      //   MaterialInfo.empty().copyWith(
      //     materialNumber: MaterialNumber('0000000000111111'),
      //     materialDescription: ' Mosys D',
      //     principalData: PrincipalData.empty().copyWith(
      //       principalName: PrincipalName('台灣拜耳股份有限公司'),
      //     ),
      //   ),
      // ];
      // when(() => bonusMaterialBloc.state)
      //     .thenReturn(BonusMaterialState.initial().copyWith(
      //   failureOrSuccessOption: none(),
      //   bonus: mockbonusItemWithDataList,
      //   isFetching: false,
      //   isStarting: true,
      // ));
      // when(() => userBloc.state).thenReturn(UserState.initial());
      // when(() => salesOrgBloc.state).thenReturn(SalesOrgState.initial());
      // when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      // when(() => customerCodeBloc.state).thenReturn(
      //   CustomerCodeState.initial(),
      // );
      // when(() => tenderContractBlocMock.state)
      //     .thenReturn(TenderContractState.initial());
      // when(() => cartBloc.state).thenReturn(CartState.initial().copyWith());
    },
  );
  // group('Bonus Item Tile Widget Test', () {
  // Widget getWidget() {
  //   return WidgetUtils.getScopedWidget(
  //     autoRouterMock: AutoRouterMock(),
  //     providers: [
  //       BlocProvider<BonusMaterialBloc>(
  //         create: (context) => bonusMaterialBloc,
  //       ),
  //       BlocProvider<TenderContractBloc>(
  //           create: (context) => tenderContractBlocMock),
  //       BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
  //       BlocProvider<UserBloc>(create: (context) => userBloc),
  //       BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBloc),
  //       BlocProvider<CartBloc>(create: (context) => cartBloc),
  //       BlocProvider<CustomerCodeBloc>(
  //         create: (context) => customerCodeBloc,
  //       ),
  //     ],
  //     child: Material(
  //       child: BonusItemTile(
  //         cartItem: CartItem.material(cartItem.copyWith(
  //           salesOrgConfig: SalesOrganisationConfigs.empty()
  //               .copyWith(expiryDateDisplay: true),
  //         )),
  //         material: cartItem.copyWith(
  //           salesOrgConfig: SalesOrganisationConfigs.empty()
  //               .copyWith(expiryDateDisplay: true),
  //         ),
  //         bonusItem: materialItemBonus,
  //         isBonusOverrideEnable: true,
  //       ),
  //     ),
  //   );
  // }

  // testWidgets(
  //   'On cart bonus Test',
  //   (tester) async {
  //     materialItemBonus = materialItemBonus.copyWith(
  //       materialInfo: MaterialInfo.empty().copyWith(
  //         materialNumber: MaterialNumber('1234567'),
  //         remarks: 'test',
  //       ),
  //       expiryDate: DateTimeStringValue('20230407'),
  //     );
  //     when(() => salesOrgBloc.state).thenReturn(
  //       SalesOrgState.initial().copyWith(
  //         configs:
  //             SalesOrganisationConfigs.empty().copyWith(enableRemarks: true),
  //       ),
  //     );

  //     await tester.pumpWidget(getWidget());
  //     await tester.pump();
  //     final expiryDateDisplay = find.textContaining('Expiry Date');
  //     expect(expiryDateDisplay, findsOneWidget);
  //     final expiryDate = find.textContaining('07 Apr 2023');
  //     expect(expiryDate, findsOneWidget);

  //     final quantityInput = find.byType(QuantityInput);
  //     expect(quantityInput, findsOneWidget);
  //     await tester.ensureVisible(quantityInput);
  //     await tester.pump();

  //     await tester.tap(quantityInput, warnIfMissed: false);
  //     await tester.enterText(quantityInput, '12');
  //     // verify(
  //     //   () => cartBloc.add(
  //     //     CartEvent.updateBonusItem(
  //     //       bonusItemCount: 12,
  //     //       cartItem: cartItem.copyWith(
  //     //         salesOrgConfig: SalesOrganisationConfigs.empty()
  //     //             .copyWith(expiryDateDisplay: true),
  //     //       ),
  //     //       bonusItem: materialItemBonus,
  //     //       isUpdateFromCart: true,
  //     //     ),
  //     //   ),
  //     // ).called(1);
  //     final addBonusFromCart = find.byKey(const ValueKey('addBonusFromCart'));
  //     expect(addBonusFromCart, findsOneWidget);
  //     await tester.tap(addBonusFromCart);

  //     // verify(
  //     //   () => cartBloc.add(
  //     //     CartEvent.updateBonusItem(
  //     //       bonusItemCount: 13,
  //     //       cartItem: cartItem.copyWith(
  //     //         salesOrgConfig: SalesOrganisationConfigs.empty()
  //     //             .copyWith(expiryDateDisplay: true),
  //     //       ),
  //     //       bonusItem: materialItemBonus,
  //     //       isUpdateFromCart: true,
  //     //     ),
  //     //   ),
  //     // ).called(1);

  //     final removeBonusFromCart =
  //         find.byKey(const ValueKey('removeBonusFromCart'));
  //     expect(removeBonusFromCart, findsOneWidget);
  //     await tester.tap(removeBonusFromCart);

  //     // verify(
  //     //   () => cartBloc.add(
  //     //     CartEvent.updateBonusItem(
  //     //       bonusItemCount: 12,
  //     //       cartItem: cartItem.copyWith(
  //     //         salesOrgConfig: SalesOrganisationConfigs.empty()
  //     //             .copyWith(expiryDateDisplay: true),
  //     //       ),
  //     //       bonusItem: materialItemBonus,
  //     //       isUpdateFromCart: true,
  //     //     ),
  //     //   ),
  //     // ).called(1);
  //   },
  // );

  // testWidgets(
  //   'On cart bonus item Edit Dailog',
  //   (tester) async {
  //     materialItemBonus = materialItemBonus.copyWith(
  //       materialInfo: MaterialInfo.empty().copyWith(
  //         materialNumber: MaterialNumber('1234567'),
  //         remarks: 'test',
  //       ),
  //     );
  //     when(() => salesOrgBloc.state).thenReturn(
  //       SalesOrgState.initial().copyWith(
  //         configs:
  //             SalesOrganisationConfigs.empty().copyWith(enableRemarks: true),
  //       ),
  //     );

  //     await tester.pumpWidget(getWidget());
  //     await tester.pump();
  //     final editDeleteDialog = find.byKey(const ValueKey('editDeleteDialog'));
  //     expect(editDeleteDialog, findsOneWidget);
  //     await tester.tap(editDeleteDialog.first);
  //     await tester.pumpAndSettle();
  //     final childDeleteButton = find.text('Delete');
  //     expect(childDeleteButton, findsOneWidget); //
  //     await tester.ensureVisible(childDeleteButton);
  //     await tester.pumpAndSettle();
  //     await tester.tap(childDeleteButton);
  //     // verify(
  //     //   () => cartBloc.add(
  //     //     const CartEvent.remarksChanged(''),
  //     //   ),
  //     // ).called(1);
  //   },
  // );
  // });
}
