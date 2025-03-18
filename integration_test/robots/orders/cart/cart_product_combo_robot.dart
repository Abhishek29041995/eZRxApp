import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';

class CartProductComboRobot extends CommonRobot {
  CartProductComboRobot(super.tester);

  Finder _comboItem(String priceComboDealId) =>
      find.byKey(WidgetKeys.cartItemComboTile(priceComboDealId));

  Finder _comboMaterialItem({
    required String priceComboDealId,
    required String materialNumber,
  }) =>
      find.descendant(
        of: _comboItem(priceComboDealId),
        matching: find.byKey(
          WidgetKeys.cartItemProductTile(materialNumber),
        ),
      );

  Future<void> verifyComboHeaderAndFooter({
    required String priceComboDealId,
    required Finder comboTitleFinder,
    required Finder comboConditionFinder,
    required ComboDealScheme scheme,
    bool isEditable = true,
  }) async {
    // Header
    await scrollEnsureFinderVisible(
      _comboItem(priceComboDealId),
    );

    expect(
      _comboItem(priceComboDealId),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: _comboItem(priceComboDealId),
        matching: find.byKey(WidgetKeys.comboOfferTag),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: _comboItem(priceComboDealId),
        matching: find.byKey(WidgetKeys.comboOfferTag),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: _comboItem(priceComboDealId),
        matching: find.byKey(WidgetKeys.cartItemEditCombo(priceComboDealId)),
      ),
      isEditable ? findsOneWidget : findsNothing,
    );
    expect(
      find.descendant(
        of: _comboItem(priceComboDealId),
        matching: find.byKey(WidgetKeys.cartItemDeleteCombo(priceComboDealId)),
      ),
      isEditable ? findsOneWidget : findsNothing,
    );
    expect(
      find.descendant(
        of: _comboItem(priceComboDealId),
        matching: comboTitleFinder,
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: _comboItem(priceComboDealId),
        matching: comboConditionFinder,
      ),
      findsOneWidget,
    );

    // Footer
    expect(
      find.descendant(
        of: _comboItem(priceComboDealId),
        matching: find.text(
          'Combo subtotal (excl. tax):'.tr(),
        ),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: _comboItem(priceComboDealId),
        matching: find.byKey(WidgetKeys.cartItemComboTotalPrice),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: _comboItem(priceComboDealId),
        matching: find.byKey(WidgetKeys.comboNextDealInfo),
      ),
      scheme.haveFixedMaterials ? findsNothing : findsOneWidget,
    );
  }

  void verifyComboMaterial({
    required ComboDealScheme scheme,
    required String priceComboDealId,
    required String materialNumber,
    required String materialName,
    required String principalName,
  }) {
    expect(
      _comboMaterialItem(
        priceComboDealId: priceComboDealId,
        materialNumber: materialNumber,
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: _comboMaterialItem(
          priceComboDealId: priceComboDealId,
          materialNumber: materialNumber,
        ),
        matching: find.byType(CustomImage),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: _comboMaterialItem(
          priceComboDealId: priceComboDealId,
          materialNumber: materialNumber,
        ),
        matching: find.text(materialNumber),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: _comboMaterialItem(
          priceComboDealId: priceComboDealId,
          materialNumber: materialNumber,
        ),
        matching: find.byKey(WidgetKeys.comboDealMaterialItemDiscountTag),
      ),
      scheme.displayDiscountedSubTotal || scheme.displayDiscountedPrice
          ? findsOneWidget
          : findsNothing,
    );

    expect(
      find.descendant(
        of: _comboMaterialItem(
          priceComboDealId: priceComboDealId,
          materialNumber: materialNumber,
        ),
        matching: find.text(principalName),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: _comboMaterialItem(
          priceComboDealId: priceComboDealId,
          materialNumber: materialNumber,
        ),
        matching: find.byKey(WidgetKeys.cartComboItemProductOriginalPrice),
      ),
      scheme.displayDiscountedPrice ? findsOneWidget : findsNothing,
    );

    expect(
      find.descendant(
        of: _comboMaterialItem(
          priceComboDealId: priceComboDealId,
          materialNumber: materialNumber,
        ),
        matching: find.byKey(WidgetKeys.cartComboItemProductDiscountedPrice),
      ),
      findsOneWidget,
    );
  }
}
