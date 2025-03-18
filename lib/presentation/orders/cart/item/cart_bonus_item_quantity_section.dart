import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBonusItemQuantitySection extends StatefulWidget {
  final PriceAggregate cartProduct;
  final BonusSampleItem bonusItem;
  const CartBonusItemQuantitySection({super.key, 
    required this.bonusItem,
    required this.cartProduct,
  });

  @override
  State<CartBonusItemQuantitySection> createState() =>
      _CartBonusItemQuantitySectionState();
}

class _CartBonusItemQuantitySectionState extends State<CartBonusItemQuantitySection> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.value = TextEditingValue(
      text: widget.bonusItem.qty.getOrDefaultValue(0).toString(),
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

  String get _qty => widget.bonusItem.qty.getOrDefaultValue(0).toString();

  @override
  void didUpdateWidget(covariant CartBonusItemQuantitySection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_qty != _controller.text) {
      _controller.text = _qty;
      _controller.selection = TextSelection.collapsed(offset: _qty.length);
    }
  }

  void _upsertCart(BuildContext context, int qty) =>
      context.read<CartBloc>().add(
            CartEvent.addBonusToCartItem(
              bonusMaterial: MaterialInfo.empty().copyWith(
                materialNumber: widget.bonusItem.materialNumber,
                parentID: widget.cartProduct.materialInfo.materialNumber
                    .getOrDefaultValue(''),
                quantity: MaterialQty(qty),
                type: widget.bonusItem.type,
              ),
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              bonusItemId: widget.bonusItem.itemId,
            ),
          );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: CartItemQuantityInput(
        isEnabled:
            context.read<EligibilityBloc>().state.isBonusSampleItemVisible &&
                widget.cartProduct.bonusPriceOverrideEligible,
        quantityAddKey: WidgetKeys.bonusOfferItemAddKey,
        quantityDeleteKey: WidgetKeys.bonusOfferItemDeleteKey,
        quantityTextKey: WidgetKeys.bonusOfferItemInputKey,
        controller: _controller,
        isLoading: context.read<CartBloc>().state.isUpserting,
        onFieldChange: (value) {},
        minusPressed: (k) => _upsertCart(context, k),
        addPressed: (k) => _upsertCart(context, k),
        onSubmit: (value) => _upsertCart(context, value),
        maximumQty: 99999,
      ),
    );
  }
}