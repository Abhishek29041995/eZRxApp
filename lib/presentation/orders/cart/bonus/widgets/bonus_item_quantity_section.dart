import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonusItemQuantitySection extends StatefulWidget {
  final MaterialInfo bonusItem;
  final PriceAggregate cartProduct;
  const BonusItemQuantitySection({
    super.key,
    required this.bonusItem,
    required this.cartProduct,
  });

  @override
  State<BonusItemQuantitySection> createState() =>
      _BonusItemQuantitySectionState();
}

class _BonusItemQuantitySectionState extends State<BonusItemQuantitySection> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.value = TextEditingValue(
      text: '0',
      selection: TextSelection.collapsed(
        offset: _controller.selection.base.offset,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.upsertBonusItemInProgressHashCode !=
          current.upsertBonusItemInProgressHashCode,
      builder: (context, state) {
        final isBonusMaterialLoading =
            state.upsertBonusItemInProgressHashCode.contains(
          widget.bonusItem
              .copyWith(
                parentID: widget.cartProduct.materialInfo.materialNumber
                    .getOrDefaultValue(''),
                quantity: widget.cartProduct.totalCartProductBonusQty(
                  context
                      .read<BonusMaterialBloc>()
                      .state
                      .bonusItemID(widget.bonusItem.materialNumber),
                  widget.bonusItem.quantity,
                ),
                type: MaterialInfoType(''),
              )
              .hashCode,
        );

        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CartItemQuantityInput(
            height: 40,
            isEnabled: !isBonusMaterialLoading,
            quantityAddKey: WidgetKeys.increaseQuantityKey,
            quantityDeleteKey: WidgetKeys.decreaseQuantityKey,
            quantityTextKey: WidgetKeys.quantityInputTextKey,
            controller: _controller,
            onFieldChange: (value) => context.read<BonusMaterialBloc>().add(
                  BonusMaterialEvent.updateBonusItemQuantity(
                    updatedBonusItem: widget.bonusItem.copyWith(
                      quantity: MaterialQty(value),
                    ),
                  ),
                ),
            minusPressed: (k) => context.read<BonusMaterialBloc>().add(
                  BonusMaterialEvent.updateBonusItemQuantity(
                    updatedBonusItem: widget.bonusItem.copyWith(
                      quantity: MaterialQty(k),
                    ),
                  ),
                ),
            addPressed: (k) => context.read<BonusMaterialBloc>().add(
                  BonusMaterialEvent.updateBonusItemQuantity(
                    updatedBonusItem: widget.bonusItem.copyWith(
                      quantity: MaterialQty(k),
                    ),
                  ),
                ),
            onSubmit: (value) => context.read<BonusMaterialBloc>().add(
                  BonusMaterialEvent.updateBonusItemQuantity(
                    updatedBonusItem: widget.bonusItem.copyWith(
                      quantity: MaterialQty(value),
                    ),
                  ),
                ),
          ),
        );
      },
    );
  }
}
