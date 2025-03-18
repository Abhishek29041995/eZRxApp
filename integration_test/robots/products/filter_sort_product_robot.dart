import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';
import '../common/extension.dart';

class FilterSortProductRobot extends CommonRobot {
  final manufacturerLabel = find.byKey(WidgetKeys.filterManufacturerButton);
  final countryLabel = find.byKey(WidgetKeys.filterCountryOfOriginButton);
  final suggestedCountry = find.byKey(WidgetKeys.suggestedCountryText);

  FilterSortProductRobot(super.tester);

  void verifySheet({bool isVisible = true}) => expect(
        find.byType(ProductFilterPage),
        isVisible ? findsOneWidget : findsNothing,
      );

  void verifyCheckboxCheckedShowProduct(String checkbox, bool isChecked) {
    final checkboxWidget = find.byKey(WidgetKeys.showProductCheckbox(checkbox));
    expect(
      tester.widget<CheckboxListTile>(checkboxWidget).value,
      isChecked,
    );
  }

  Future<void> tapProductTypeCheckbox(String checkbox) async {
    await tester.tap(find.byKey(WidgetKeys.showProductCheckbox(checkbox)));
    await tester.pumpAndSettle();
  }

  Future<void> chooseSortProductsBy(String sortType) async {
    final radioSort = find.byKey(WidgetKeys.sortByRadio(sortType));
    await tester.tap(radioSort);
    await tester.pumpAndSettle();
  }

  Future<void> openFilterManufacturerScreen() async {
    await tester.tap(manufacturerLabel);
    await tester.pumpAndSettle();
  }

  void verifyFilterManufacturerVisible() {
    expect(manufacturerLabel, findsOneWidget);
  }

  Future<void> openFilterCountryOfOriginScreen() async {
    await tester.tap(countryLabel);
    await tester.pumpAndSettle();
  }

  void verifyFilterCountryOfOriginVisible() {
    expect(countryLabel, findsOneWidget);
  }

  void verifyFilterCountryOfOriginInvisibleForIdMarket() {
    expect(countryLabel, findsNothing);
  }

  void verifyCountryListSelectedVisible(int countSelected) {
    expect(
      tester
              .widget<Text>(
                find.byKey(WidgetKeys.countryListSelectedLength),
              )
              .data ??
          ' ',
      '$countSelected ${'selected'.tr()}',
    );
  }

  void verifyManufactureListSelectedVisible(int countSelected) {
    expect(
      tester
              .widget<Text>(
                find.byKey(WidgetKeys.manufactureListSelectedLength),
              )
              .data ??
          ' ',
      '$countSelected ${'selected'.tr()}',
    );
  }

  Future<void> tapFilterApplyButton() async {
    final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
    await tester.tap(filterApplyButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapFilterResetButton() async {
    final filterResetButton = find.byKey(WidgetKeys.filterResetButton);
    await tester.tap(filterResetButton);
    await tester.pumpAndSettle();
  }

  void verifyRadioSort(String sortType, bool isChecked) {
    final radioSort = find.byKey(WidgetKeys.sortByRadio(sortType));
    expect(
      tester.firstWidget<RadioListTile>(radioSort).checked,
      isChecked,
    );
  }

  Future<void> tapFirstSuggestedManufacturer() async {
    final suggestedManufacturer =
        find.byKey(WidgetKeys.suggestedManufacturer).first;
    await tester.tap(suggestedManufacturer);
    await tester.pumpAndSettle();
  }

  String getFirstSuggestedCountry() =>
      tester.widget<Text>(suggestedCountry.first).data ?? '';

  Future<void> tapFirstSuggestedCountry() async {
    await tester.tap(suggestedCountry.first);
    await tester.pumpAndSettle();
  }

  void verifyManufacturerSelected(String filterSelected) {
    expect(
      find.byKey(WidgetKeys.manufacturerFilterSelected(filterSelected)),
      findsOneWidget,
    );
  }

  void verifyListCountryOfOriginMatched(String keyword) {
    final listSuggest =
        tester.widgetList<Text>(suggestedCountry).map((e) => e.data);

    for (final e in listSuggest) {
      expect(e, contains(keyword));
    }
  }

  void verifyListManufacturerMatched(String keyword) {
    final suggestedManufacturerText =
        find.byKey(WidgetKeys.suggestedManufacturerText);
    final listSuggest =
        tester.widgetList<Text>(suggestedManufacturerText).map((e) => e.data);

    for (final e in listSuggest) {
      expect(e, contains(keyword));
    }
  }

  Future<void> pumpUntilFilterBySectionLoaded() async {
    await tester.pumpUntilVisible(manufacturerLabel);
    verifyFilterManufacturerVisible();
  }

  void verifyDefaultFilterProduct({
    bool verifyFavourite = true,
    bool verifyItemWithOffer = true,
    bool verifyTenderContract = false,
    bool verifyBundleOffer = true,
    bool verifyManufacturerVisible = true,
    bool verifyCountryOfOriginVisible = true,
  }) {
    if (verifyFavourite) verifyCheckboxCheckedShowProduct('Favourites', false);
    if (verifyTenderContract) {
      verifyCheckboxCheckedShowProduct('Tender Contract', false);
    }
    if (verifyItemWithOffer) {
      verifyCheckboxCheckedShowProduct('Items with offers', false);
    }
    if (verifyBundleOffer) {
      verifyCheckboxCheckedShowProduct('Bundle offers', false);
    }
    verifyRadioSort('A-Z', true);
    verifyRadioSort('Z-A', false);
    if (verifyManufacturerVisible) verifyFilterManufacturerVisible();
    if (verifyCountryOfOriginVisible) verifyFilterCountryOfOriginVisible();
  }

  void verifyDefaultFilterProductForIdMarket() {
    verifyCheckboxCheckedShowProduct('Favourites', false);
    verifyRadioSort('A-Z', true);
    verifyRadioSort('Z-A', false);
    verifyRadioSort('Price: Low to high', false);
    verifyRadioSort('Price: High to low', false);
    verifyFilterManufacturerVisible();
  }

  void verifyMarketPlaceFilter({bool isVisible = true}) => expect(
        find.byKey(WidgetKeys.showProductCheckbox('Marketplace items')),
        isVisible ? findsOneWidget : findsNothing,
      );
}
