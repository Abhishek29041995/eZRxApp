import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/filter/return_items_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_items_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_filter_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_tab.dart';
import 'package:ezrxmobile/presentation/returns/widgets/ware_house_storage_condition_tag.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../common_mock_data/mock_bloc.dart';
import '../../../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppRouter autoRouterMock;
  late ReturnItemsBloc returnItemsBlocMock;
  late NewRequestBloc newRequestBlocMock;
  late ProductImageBloc productImageBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late ReturnMaterialList fakeReturnMaterialList;
  late ReturnMaterial fakeReturnMaterial;
  late ReturnItemsFilterBloc returnItemsFilterBlocMock;
  late Config config;
  const fakeUnitPrice = 8.77;
  const fakeBalanceQuantity = 5;

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    config = locator<Config>();
    autoRouterMock = locator<AppRouter>();
    returnItemsBlocMock = ReturnItemsBlocMock();
    newRequestBlocMock = NewRequestMockBloc();
    productImageBlocMock = ProductImageBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    returnItemsFilterBlocMock = ReturnItemsFilterBlocMock();
    fakeReturnMaterialList =
        await ReturnRequestLocalDataSource().searchReturnMaterials();
    fakeReturnMaterial = fakeReturnMaterialList.items.first.copyWith(
      unitPrice: RangeValue(fakeUnitPrice.toString()),
      balanceQuantity: IntegerValue(fakeBalanceQuantity.toString()),
      bonusItems: [fakeReturnMaterialList.items.first],
    );
    when(() => returnItemsBlocMock.state).thenReturn(
      ReturnItemsState.initial(),
    );
    when(() => newRequestBlocMock.state).thenReturn(
      NewRequestState.initial(),
    );
    when(() => productImageBlocMock.state).thenReturn(
      ProductImageState.initial(),
    );
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial(),
    );
    when(() => returnItemsFilterBlocMock.state).thenReturn(
      ReturnItemsFilterState.initial(),
    );
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ReturnItemsBloc>(
          create: (context) => returnItemsBlocMock,
        ),
        BlocProvider<NewRequestBloc>(
          create: (context) => newRequestBlocMock,
        ),
        BlocProvider<ProductImageBloc>(
          create: (context) => productImageBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<ReturnItemsFilterBloc>(
          create: (context) => returnItemsFilterBlocMock,
        ),
      ],
      child: const Material(
        child: ReturnItemsTab(),
      ),
    );
  }

  group('Return Items Tab Test', () {
    testWidgets(
      '=> display outside return policy tag',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
          ),
        );
        when(() => returnItemsBlocMock.state).thenReturn(
          ReturnItemsState.initial().copyWith(
            items: fakeReturnMaterialList.items,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cardFinder = find.byKey(WidgetKeys.newReturnItem);
        expect(cardFinder, findsNWidgets(2));
        expect(
          find.descendant(
            of: cardFinder.first,
            matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: cardFinder.last,
            matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
          ),
          findsNothing,
        );
      },
    );
    testWidgets(
      '=> display market place logo if item is from MP',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
          ),
        );
        when(() => returnItemsBlocMock.state).thenReturn(
          ReturnItemsState.initial().copyWith(
            items: fakeReturnMaterialList.items,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final scrollList =
            find.byKey(WidgetKeys.newRequestListItemAbleToReturn);
        await tester.drag(
          scrollList,
          const Offset(0.0, -1000),
        );
        await tester.pump();
        final mpLogo = find.byType(MarketPlaceLogo, skipOffstage: false);
        expect(mpLogo, findsWidgets);
      },
    );

    testWidgets(
      '=> display messages of return request in new return request page - step 1',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final msg = find.text(
          'Return requests can be created from invoices dated within the last 5 years ONLY.'
              .tr(),
        );
        expect(msg, findsOneWidget);
      },
    );

    testWidgets(
      '=> display outside return policy tag when toggle is off in the sales org config',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => returnItemsBlocMock.state).thenReturn(
          ReturnItemsState.initial().copyWith(
            items: fakeReturnMaterialList.items,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cardFinder = find.byKey(WidgetKeys.newReturnItem);
        expect(cardFinder, findsNWidgets(2));
        expect(
          find.descendant(
            of: cardFinder.first,
            matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
          ),
          findsNothing,
        );
        expect(
          find.descendant(
            of: cardFinder.last,
            matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
          ),
          findsNothing,
        );
      },
    );

    testWidgets(
      '=> Check bonus price and quantity',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        when(() => returnItemsBlocMock.state).thenReturn(
          ReturnItemsState.initial().copyWith(
            items: [
              fakeReturnMaterial.copyWith(
                bonusItems: [...fakeReturnMaterialList.items[1].bonusItems],
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        final showBonusDetail = find.text('Show details'.tr());
        expect(showBonusDetail, findsOneWidget);
        final mainItemPrice = find.text(
          'SGD ${fakeUnitPrice.toString()}',
          findRichText: true,
        );
        expect(mainItemPrice, findsOneWidget);
        final mainItemQty = find.text(
          'Qty: ${fakeReturnMaterial.targetQuantity.getOrDefaultValue(0)}',
        );
        final mainItemBalanceQuantity = find.text(
          'Returnable Qty: ${fakeReturnMaterial.balanceQuantity.getOrDefaultValue(0)}',
        );
        expect(mainItemBalanceQuantity, findsOneWidget);
        expect(mainItemQty, findsOneWidget);
        final bonusPrice = find.text(
          'SGD 268.53',
          findRichText: true,
        );
        await tester.pumpAndSettle();
        expect(find.text('Bonus'), findsOneWidget);
        expect(bonusPrice, findsOneWidget);
        final bonusQty = find.text(
          'Qty: 14',
        );
        expect(bonusQty, findsOneWidget);
        final bonusBalanceQuantity = find.text(
          'Returnable Qty: 12',
        );
        expect(bonusBalanceQuantity, findsOneWidget);
      },
    );

    testWidgets('=> On Press New Request Filter Button', (tester) async {
      final fakeFilter = ReturnItemsFilter.empty().copyWith(
        invoiceDateFrom: DateTimeStringValue('2023-12-27'),
      );
      final expectStates = [
        ReturnItemsState.initial().copyWith(
          appliedFilter: fakeFilter,
        ),
      ];
      whenListen(returnItemsBlocMock, Stream.fromIterable(expectStates));
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final filterButton = find.byKey(WidgetKeys.newRequestFilterIcon);
      expect(filterButton, findsOneWidget);
      await tester.tap(filterButton);
      await tester.pumpAndSettle();
      verify(
        () => returnItemsFilterBlocMock.add(
          ReturnItemsFilterEvent.openFilterBottomSheet(
            appliedFilter: fakeFilter,
          ),
        ),
      ).called(1);
      expect(find.byType(ReturnItemsFilterBottomSheet), findsOneWidget);
    });

    testWidgets('Test Default Document Date when filter is reset',
        (tester) async {
      when(() => returnItemsFilterBlocMock.state).thenAnswer(
        (invocation) => ReturnItemsFilterState.initial().copyWith(
          filter: ReturnItemsFilter.empty().copyWith(
            invoiceDateFrom: DateTimeStringValue('2023-12-24'),
            invoiceDateTo: DateTimeStringValue('2023-12-25'),
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final filterButton = find.byKey(WidgetKeys.newRequestFilterIcon);
      expect(filterButton, findsOneWidget);
      await tester.tap(filterButton);
      await tester.pumpAndSettle();

      expect(find.byType(ReturnItemsFilterBottomSheet), findsOneWidget);

      final resetButton = find.byKey(WidgetKeys.filterResetButton);
      expect(resetButton, findsOneWidget);
      await tester.tap(resetButton);

      verify(
        () => returnItemsBlocMock.add(
          ReturnItemsEvent.fetch(
            appliedFilter: ReturnItemsFilter.init(),
            searchKey: SearchKey.search(''),
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Show snackbar when api error', (tester) async {
      final expectStates = [
        ReturnItemsState.initial(),
        ReturnItemsState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ];
      whenListen(returnItemsBlocMock, Stream.fromIterable(expectStates));
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
    });
    testWidgets('=> Pull To Refresh', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final scrollListFinder =
          find.byKey(WidgetKeys.newRequestListItemAbleToReturn);
      expect(scrollListFinder, findsOneWidget);
      await tester.drag(
        scrollListFinder,
        const Offset(0.0, 1000.0),
      );
      await tester.pumpAndSettle();
      verify(
        () => returnItemsBlocMock.add(
          ReturnItemsEvent.fetch(
            appliedFilter: ReturnItemsFilter.init(),
            searchKey: SearchKey.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Loadmore Test', (tester) async {
      when(() => returnItemsBlocMock.state).thenReturn(
        ReturnItemsState.initial().copyWith(
          items: List.filled(
            8,
            fakeReturnMaterial,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final scrollListFinder =
          find.byKey(WidgetKeys.newRequestListItemAbleToReturn);
      expect(scrollListFinder, findsOneWidget);
      await tester.drag(
        scrollListFinder,
        const Offset(0.0, -3500.0),
      );
      await tester.pumpAndSettle();
      verify(
        () => returnItemsBlocMock.add(
          const ReturnItemsEvent.loadMore(),
        ),
      ).called(1);
    });

    testWidgets('=> On Press Item Test', (tester) async {
      when(() => returnItemsBlocMock.state).thenReturn(
        ReturnItemsState.initial().copyWith(
          items: [
            fakeReturnMaterial,
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      await tester.tap(
        find.byKey(WidgetKeys.newReturnItem),
      );
      verify(
        () => newRequestBlocMock.add(
          NewRequestEvent.toggleReturnItem(
            selected: true,
            item: fakeReturnMaterial,
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Search Bar Test', (tester) async {
      when(() => returnItemsBlocMock.state).thenReturn(
        ReturnItemsState.initial().copyWith(
          searchKey: SearchKey.search('12'),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final searchBarFinder = find.byKey(WidgetKeys.searchBar);
      expect(searchBarFinder, findsOneWidget);
      await tester.enterText(searchBarFinder, '123');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      verify(
        () => returnItemsBlocMock.add(
          ReturnItemsEvent.fetch(
            appliedFilter: ReturnItemsFilter.empty(),
            searchKey: SearchKey.search('123'),
          ),
        ),
      ).called(1);
      await tester.enterText(searchBarFinder, '1234');
      await tester.pump(Duration(seconds: config.autoSearchTimeout));
      verify(
        () => returnItemsBlocMock.add(
          ReturnItemsEvent.fetch(
            appliedFilter: ReturnItemsFilter.empty(),
            searchKey: SearchKey.search('1234'),
          ),
        ),
      ).called(1);
      final clearButton = find.byKey(WidgetKeys.clearIconKey);
      expect(clearButton, findsOneWidget);
      await tester.tap(clearButton);
      verify(
        () => returnItemsBlocMock.add(
          ReturnItemsEvent.fetch(
            appliedFilter: ReturnItemsFilter.empty(),
            searchKey: SearchKey.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets(
        '=> varify item description when material description in empty and defaultMaterialDescription has value',
        (tester) async {
      when(() => returnItemsBlocMock.state).thenReturn(
        ReturnItemsState.initial().copyWith(
          items: [
            fakeReturnMaterial.copyWith(
              materialDescription: '',
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.newReturnItem), findsOneWidget);
      expect(
        (tester.widget(find.byKey(WidgetKeys.itemTitleKey)) as Text).data,
        fakeReturnMaterial.defaultMaterialDescription,
      );
    });

    testWidgets('=> varify storage condition for the item ', (tester) async {
      when(() => returnItemsBlocMock.state).thenReturn(
        ReturnItemsState.initial().copyWith(
          items: [
            fakeReturnMaterial.copyWith(
              materialDescription: '',
              wareHouseStorageCondition: StorageCondition('AC'),
              bonusItems: [],
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.newReturnItem), findsOneWidget);
      expect(find.byType(WareHouseStorageConditionTag), findsOneWidget);
      expect(find.text('Air Conditioned'), findsOneWidget);
    });

    testWidgets('=> varify storage condition for the bonus item ',
        (tester) async {
      when(() => returnItemsBlocMock.state).thenReturn(
        ReturnItemsState.initial().copyWith(
          items: [
            fakeReturnMaterial.copyWith(
              materialDescription: '',
              wareHouseStorageCondition: StorageCondition('AC'),
              bonusItems: [
                fakeReturnMaterial.copyWith(
                  materialDescription: '',
                  wareHouseStorageCondition: StorageCondition('AC'),
                ),
              ],
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.newReturnItem), findsOneWidget);
      expect(find.byType(WareHouseStorageConditionTag), findsAtLeast(2));
      expect(find.text('Air Conditioned'), findsAtLeast(2));
    });

    testWidgets(
        '=> varify item description when material description in not empty',
        (tester) async {
      when(() => returnItemsBlocMock.state).thenReturn(
        ReturnItemsState.initial().copyWith(
          items: [
            fakeReturnMaterial,
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.newReturnItem), findsOneWidget);
      expect(
        (tester.widget(find.byKey(WidgetKeys.itemTitleKey)) as Text).data,
        fakeReturnMaterial.materialDescription,
      );
    });

    testWidgets('Search bar should display keyword same as searchKey state',
        (tester) async {
      const searchKey = 'fake-search-key';

      whenListen(
        returnItemsBlocMock,
        Stream.fromIterable([
          ReturnItemsState.initial().copyWith(
            searchKey: SearchKey.search(searchKey),
          ),
        ]),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final searchField =
          tester.widget<TextFormField>(find.byKey(WidgetKeys.searchBar));
      expect(searchField.controller?.text, searchKey);
    });
  });
}
