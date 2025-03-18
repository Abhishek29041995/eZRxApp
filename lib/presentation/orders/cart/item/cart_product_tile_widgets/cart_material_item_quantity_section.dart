part of 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile.dart';

class CartMaterialItemQuantitySection extends StatefulWidget {
  final PriceAggregate cartItem;
  final bool isInvalidCartItem;

  const CartMaterialItemQuantitySection({super.key, 
    required this.cartItem,
    required this.isInvalidCartItem,
  });

  @override
  State<CartMaterialItemQuantitySection> createState() =>
      _CartMaterialItemQuantitySectionState();
}

class _CartMaterialItemQuantitySectionState extends State<CartMaterialItemQuantitySection> {
  final _controller = TextEditingController();

  String get _qty => widget.cartItem.quantity.toString();
  Timer? _timer;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _controller.value = TextEditingValue(
      text: _qty,
      selection: TextSelection.collapsed(
        offset: _controller.selection.base.offset,
      ),
    );
    _focusNode.addListener(_onFocusChange);
    super.initState();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) return;
    _timer?.cancel();
    context.read<CartBloc>().add(
          CartEvent.upsertCart(
            priceAggregate: widget.cartItem.copyWith(
              quantity: int.tryParse(_controller.text) ?? 1,
            ),
          ),
        );
  }

  @override
  void didUpdateWidget(covariant CartMaterialItemQuantitySection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_qty != _controller.text) {
      _controller.text = _qty;
      _controller.selection = TextSelection.collapsed(
        offset: widget.cartItem.quantity.toString().length,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _onTextChanged(int quantity) {
    _timer?.cancel();
    _timer = Timer(
      Duration(
        milliseconds: locator<Config>().autoSearchTimeout,
      ),
      () => context.read<CartBloc>().add(
            CartEvent.upsertCart(
              priceAggregate: widget.cartItem.copyWith(
                quantity: quantity,
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        children: [
          Focus(
            focusNode: _focusNode,
            child: CartItemQuantityInput(
              height: 48,
              isEnabled: !widget.isInvalidCartItem,
              quantityAddKey: WidgetKeys.increaseQuantityKey,
              quantityDeleteKey: WidgetKeys.decreaseQuantityKey,
              quantityTextKey: WidgetKeys.quantityInputTextKey,
              controller: _controller,
              onFieldChange: (value) => _onTextChanged(value),
              minusPressed: (k) {
                context.read<CartBloc>().add(
                      CartEvent.upsertCart(
                        priceAggregate: widget.cartItem.copyWith(
                          quantity: k,
                        ),
                      ),
                    );
              },
              addPressed: (k) {
                context.read<CartBloc>().add(
                      CartEvent.upsertCart(
                        priceAggregate: widget.cartItem.copyWith(
                          quantity: k,
                        ),
                      ),
                    );
              },
              onSubmit: (value) {},
              isLoading: context.read<CartBloc>().state.isUpserting &&
                  !widget.isInvalidCartItem,
            ),
          ),
          if (!context.read<CartBloc>().state.priceUnderLoadingShimmer)
            _InvalidMaterialMessage(
              cartItem: widget.cartItem,
            ),
        ],
      ),
    );
  }
}