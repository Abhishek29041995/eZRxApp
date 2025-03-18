import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'product_detail_robot.dart';

class TenderContractDetailRobot extends ProductDetailRobot {
  TenderContractDetailRobot(super.tester);
  final addToCartErrorSectionForTenderContract =
      find.byKey(WidgetKeys.addToCartErrorSection);
  final cancelTenderMaterialAddToCart = find.byKey(
    WidgetKeys.cancelCovidMaterialAddToCart,
  );
  final proceedTenderMaterialAddToCart = find.byKey(
    WidgetKeys.addToCartErrorSectionProceed,
  );
  final tenderExpandableSection =
      find.byKey(WidgetKeys.tenderExpandableSection);
  final editTenderExpandableSection =
      find.byKey(WidgetKeys.editTenderContractButton);

  void verifyTenderContractSection() =>
      expect(tenderContractSection, findsOneWidget);

  void verifyUseTenderContractToggle(bool enable) {
    final toggle = find.descendant(
      of: tenderContractToggle,
      matching: find.byType(Switch),
    );
    expect(toggle, findsOneWidget);
    expect(tester.widget<Switch>(toggle).value, enable);
  }

  Future<void> tapUseTenderContractToggle() async {
    await tester.tap(tenderContractToggle);
    await tester.pumpAndSettle();
  }

  void verifyTenderContractItems(bool isDisplayed) => expect(
        find.byKey(WidgetKeys.materialTenderContracts),
        isDisplayed ? findsOneWidget : findsNothing,
      );

  void verifyTenderContractItem({
    required int index,
    bool isSelected = false,
  }) {
    final tenderContractNumber = tester
            .widget<Text>(
              find.byKey(WidgetKeys.materialTenderContractNumber).at(index),
            )
            .data ??
        '';
    expect(
      find.byKey(
        WidgetKeys.materialTenderContractItem(
          tenderContractNumber,
          isSelected,
        ),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapSecondTenderContractItem() async {
    final radio = find.byKey(WidgetKeys.materialTenderContractRadio).at(1);
    await tester.fling(materialTenderContracts, const Offset(-200, 0), 50);
    await tester.pumpAndSettle(Durations.extralong2);
    await tester.tap(radio);
    await tester.pumpAndSettle();
  }

  void verifyTenderContractSectionInCartAndCheckout() {
    expect(tenderExpandableSection, findsOneWidget);
  }

  void verifyTenderContractDetailsSection({
    required String price,
    required String expiryDate,
    required String referance,
  }) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.tenderContractPrice),
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
    expect(find.text(expiryDate), findsOneWidget);
    expect(find.text(referance), findsOneWidget);
  }

  Future<void> tapTenderContractSection() async {
    await tester.tap(tenderExpandableSection);
    await tester.pumpAndSettle();
  }

  void verifyEditTenderContractSection({bool isVisible = true}) {
    expect(
      editTenderExpandableSection,
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  Future<void> tapEditTenderContractSection() async {
    await tester.tap(editTenderExpandableSection);
    await tester.pumpAndSettle();
  }

  void verifyTenderContractSectionForOrderSection() {
    expect(
      find.byKey(WidgetKeys.tenderExpandableSection),
      findsOneWidget,
    );
  }

  void verifyMandetoryTenderContractToggleChangeMessage(bool isDisplayed) =>
      expect(
        find.text('This is a mandatory contract'.tr()),
        isDisplayed ? findsOneWidget : findsNothing,
      );

  void verifyInsufficientQuantityMessage() => expect(
        find.text(
          'Insufficient available quantity. Tender contract is no longer available.'
              .tr(),
        ),
        findsOneWidget,
      );

  void verifyMessageWhenCartHasMandetoryTenderMaterial() => expect(
        find.descendant(
          of: addToCartErrorSectionForTenderContract,
          matching: find.text(
            'Other materials cannot be ordered while materials from the 730 tender contract are in your cart. By proceeding, your current cart will be cleared.'
                .tr(),
          ),
        ),
        findsOneWidget,
      );
  void verifyMessageWhenCartHasNonMandetoryTenderMaterial() => expect(
        find.descendant(
          of: addToCartErrorSectionForTenderContract,
          matching: find.text(
            'Other materials cannot be ordered while materials from the 735 tender contract are in your cart. By proceeding, your current cart will be cleared.'
                .tr(),
          ),
        ),
        findsOneWidget,
      );
  void
      verifyNonMandetoryTenderContactMessageWhenCartHasMandetoryTenderMaterial() =>
          expect(
            find.descendant(
              of: addToCartErrorSectionForTenderContract,
              matching: find.text(
                'Other materials cannot be ordered while materials from the 730 tender contract are in your cart. By proceeding, your current cart will be cleared.'
                    .tr(),
              ),
            ),
            findsOneWidget,
          );
  void verifyMandetoryTenderContactMessageWhenCartHasNonTenderMaterial() =>
      expect(
        find.descendant(
          of: addToCartErrorSectionForTenderContract,
          matching: find.text(
            'Materials from the 730 tender contract cannot be added to your cart if you have other materials in your cart. By proceeding, your current cart will be cleared.'
                .tr(),
          ),
        ),
        findsOneWidget,
      );
  void verifyNonMandetoryTenderContactMessageWhenCartHasNonTenderMaterial() =>
      expect(
        find.descendant(
          of: addToCartErrorSectionForTenderContract,
          matching: find.text(
            'Materials from the 735 tender contract cannot be added to your cart if you have other materials in your cart. By proceeding, your current cart will be cleared.'
                .tr(),
          ),
        ),
        findsOneWidget,
      );

  // Need to remove when the order details buy again pop up msg designed
  void verifyMessageWhenCartHasMandetoryTenderMaterialForOrderDetails() =>
      expect(
        find.text(
          'Other materials cannot be ordered while materials from the 730 tender contract are in your cart. By proceeding, your current cart will be cleared.'
              .tr(),
        ),
        findsOneWidget,
      );
  void verifyMessageWhenCartHasNonMandetoryTenderMaterialForOrderDetails() =>
      expect(
        find.text(
          'Other materials cannot be ordered while materials from the 735 tender contract are in your cart. By proceeding, your current cart will be cleared.'
              .tr(),
        ),
        findsOneWidget,
      );
  void
      verifyNonMandetoryTenderContactMessageWhenCartHasMandetoryTenderMaterialForOrderDetails() =>
          expect(
            find.text(
              'Other materials cannot be ordered while materials from the 730 tender contract are in your cart. By proceeding, your current cart will be cleared.'
                  .tr(),
            ),
            findsOneWidget,
          );
  void
      verifyMandetoryTenderContactMessageWhenCartHasNonTenderMaterialForOrderDetails() =>
          expect(
            find.text(
              'Materials from the 730 tender contract cannot be added to your cart if you have other materials in your cart. By proceeding, your current cart will be cleared.'
                  .tr(),
            ),
            findsOneWidget,
          );
  void
      verifyNonMandetoryTenderContactMessageWhenCartHasNonTenderMaterialForOrderDetails() =>
          expect(
            find.text(
              'Materials from the 735 tender contract cannot be added to your cart if you have other materials in your cart. By proceeding, your current cart will be cleared.'
                  .tr(),
            ),
            findsOneWidget,
          );

  Future<void> tapCancelTenderMaterialAddToCartButton() async {
    await tester.tap(cancelTenderMaterialAddToCart);
    await tester.pumpAndSettle();
  }

  Future<void> tapProceedTenderMaterialAddToCartButton() async {
    await tester.tap(proceedTenderMaterialAddToCart);
    await tester.pumpAndSettle();
  }
}
