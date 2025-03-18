import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/error_text_with_icon.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBundleItemQuantitySection extends StatefulWidget {
  final MaterialInfo cartItem;
  final Bundle bundle;
  const CartBundleItemQuantitySection({super.key, 
    required this.cartItem,
    required this.bundle,
  });

  @override
  State<CartBundleItemQuantitySection> createState() =>
      _CartBundleItemQuantitySectionState();
}

class _CartBundleItemQuantitySectionState extends State<CartBundleItemQuantitySection> {
  final _controller = TextEditingController();

  String get _qty => widget.cartItem.quantity.intValue.toString();

  @override
  void initState() {
    _controller.value = TextEditingValue(
      text: _qty,
      selection: TextSelection.collapsed(
        offset: _controller.selection.base.offset,
      ),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CartBundleItemQuantitySection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_qty != _controller.text) {
      _controller.text = _qty;
      _controller.selection = TextSelection.collapsed(
        offset: widget.cartItem.quantity.getOrDefaultValue(0).toString().length,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalQuantityOfProductBundle = context
        .read<CartBloc>()
        .state
        .findItemById(MaterialNumber(widget.bundle.bundleCode))
        .bundle
        .totalQty;

    //Bundle minimum quantity is the first quantity which is sorted with respect to sequence.
    final bundleMinQty = totalQuantityOfProductBundle >
            widget.bundle.minimumQuantityBundleMaterial.quantity
        ? 1
        : totalQuantityOfProductBundle;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CartItemQuantityInput(
                isEnabled: true,
                quantityAddKey: WidgetKeys.increaseQuantityKey,
                quantityDeleteKey: WidgetKeys.decreaseQuantityKey,
                quantityTextKey: WidgetKeys.quantityInputTextKey,
                controller: _controller,
                onFieldChange: (value) {},
                minusPressed: (k) => _callCartUpsertItemsEvent(quantity: k),
                addPressed: (k) => _callCartUpsertItemsEvent(quantity: k),
                onSubmit: (value) => _callCartUpsertItemsEvent(quantity: value),
                isLoading: context.read<CartBloc>().state.isUpserting &&
                    _qty != _controller.text,
                minimumQty: bundleMinQty,
              ),
            ),
            IconButton(
              key: WidgetKeys.cartItemProductDeleteButton,
              onPressed: () => _showConfirmRemove(context),
              icon: const Icon(Icons.delete_outlined),
            ),
          ],
        ),
        if (!widget.cartItem.inStock &&
            context
                .read<OrderEligibilityBloc>()
                .state
                .displayInvalidOOSOnCartItem)
          ErrorTextWithIcon(
            valueText: context.tr('Material out of stock'),
          ),
      ],
    );
  }

  void _showConfirmRemove(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      useSafeArea: true,
      builder: (_) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Column(
                children: [
                  Text(
                    context.tr('Remove item from bundle?'),
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: ZPColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    context.tr(
                      'Removing items from the bundle may result in price changes.',
                    ),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.extraLightGrey4,
                        ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  _ConfirmButton(confirmFunction: _callCartUpsertItemsEvent),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _callCartUpsertItemsEvent({
    required int quantity,
  }) {
    context.read<CartBloc>().add(
          CartEvent.upsertCartItems(
            priceAggregate: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber(
                  widget.bundle.bundleCode,
                ),
              ),
              bundle: Bundle.empty().copyWith(
                materials: [
                  widget.cartItem.copyWith(quantity: MaterialQty(quantity)),
                ],
                bundleCode: widget.bundle.bundleCode,
              ),
            ),
          ),
        );
  }
}

class _ConfirmButton extends StatelessWidget {
  final Function({required int quantity}) confirmFunction;
  const _ConfirmButton({required this.confirmFunction});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  backgroundColor: const WidgetStatePropertyAll(
                    ZPColors.white,
                  ),
                  shape: const WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      side: BorderSide(color: ZPColors.primary),
                    ),
                  ),
                ),
            child: Text(
              context.tr('Cancel'),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.primary,
                  ),
            ),
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              confirmFunction(quantity: 0);
              Navigator.of(context).pop();
            },
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  backgroundColor: const WidgetStatePropertyAll(
                    ZPColors.primary,
                  ),
                  shape: const WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      side: BorderSide(color: ZPColors.primary),
                    ),
                  ),
                ),
            child: Text(
              context.tr('Remove'),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}