import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/covid_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/error_text_with_icon.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/list_price_strike_through_component.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_combo_item.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/widgets/bottom_section.dart';
part 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/widgets/pre_order_scroll_section.dart';
part 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/widgets/image_section.dart';
part 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/widgets/material_details.dart';
part 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/widgets/manufacturer_name.dart';
part 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/widgets/pre_order_product_tile.dart';
part 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/widgets/pre_order_bundle_tile.dart';
part 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/widgets/pre_order_combo_tile.dart';

const _horizontalPadding = EdgeInsets.symmetric(horizontal: 12);
const _itemSpacing = 20.0;

class PreOrderModal extends StatelessWidget {
  const PreOrderModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          key: WidgetKeys.preOrderModel,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: _horizontalPadding,
              child: Text(
                context.tr('OOS-Preorder items in cart'),
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: ZPColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            InfoLabel(
              textValue: context.tr(
                'These item will only be delivered when stock is available.',
              ),
              margin: const EdgeInsets.symmetric(vertical: 15)
                  .add(_horizontalPadding),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              mainColor: ZPColors.lightBorderYellow,
              textStyle: Theme.of(context).textTheme.bodySmall,
            ),
            const Flexible(child: _PreOrderScrollSection()),
            _BottomSection(),
          ],
        ),
      ),
    );
  }
}
