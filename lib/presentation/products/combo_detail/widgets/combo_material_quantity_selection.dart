part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _ComboMaterialQuantitySection extends StatefulWidget {
  final PriceAggregate comboItem;
  final ComboDealMaterial comboDealMaterial;
  const _ComboMaterialQuantitySection({
    required this.comboItem,
    required this.comboDealMaterial,
  });

  @override
  State<_ComboMaterialQuantitySection> createState() =>
      _ComboMaterialQuantitySectionState();
}

class _ComboMaterialQuantitySectionState
    extends State<_ComboMaterialQuantitySection> {
  final _qtyController = TextEditingController();

  @override
  void initState() {
    _qtyController.value = TextEditingValue(
      text: _qty,
      selection: TextSelection.collapsed(
        offset: _qtyController.selection.base.offset,
      ),
    );
    super.initState();
  }

  String get _qty => widget.comboItem.quantity.toString();

  @override
  void didUpdateWidget(covariant _ComboMaterialQuantitySection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_qty != _qtyController.text) {
      _qtyController.text = _qty;
      _qtyController.selection = TextSelection.collapsed(offset: _qty.length);
    }
  }

  @override
  void dispose() {
    _qtyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ComboDealMaterialDetailBloc>();

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Focus(
        child: CartItemQuantityInput(
          isEnabled: true,
          key: WidgetKeys.comboMaterialQuantityInput,
          quantityAddKey: WidgetKeys.increaseQuantityKey,
          quantityDeleteKey: WidgetKeys.decreaseQuantityKey,
          quantityTextKey: WidgetKeys.quantityInputTextKey,
          minimumQty: widget.comboDealMaterial.minQty,
          controller: _qtyController,
          onFieldChange: (quantity) {
            bloc.add(
              ComboDealMaterialDetailEvent.updateItemQuantity(
                item: widget.comboItem.getMaterialNumber,
                qty: quantity,
              ),
            );
          },
          minusPressed: (quantity) {
            bloc.add(
              ComboDealMaterialDetailEvent.updateItemQuantity(
                item: widget.comboItem.getMaterialNumber,
                qty: quantity,
              ),
            );
          },
          addPressed: (quantity) {
            bloc.add(
              ComboDealMaterialDetailEvent.updateItemQuantity(
                item: widget.comboItem.getMaterialNumber,
                qty: quantity,
              ),
            );
          },
          onSubmit: (quantity) {
            bloc.add(
              ComboDealMaterialDetailEvent.updateItemQuantity(
                item: widget.comboItem.getMaterialNumber,
                qty: quantity,
              ),
            );
          },
          isLoading: false,
        ),
      ),
    );
  }
}
