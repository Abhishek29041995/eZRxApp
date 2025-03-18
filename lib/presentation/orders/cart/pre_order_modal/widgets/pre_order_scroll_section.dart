part of 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';

class _PreOrderScrollSection extends StatelessWidget {
  const _PreOrderScrollSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.cartProducts.preOrderItems !=
          current.cartProducts.preOrderItems,
      builder: (context, state) {
        final preOrderItems = [
          ...state.cartProducts.zpMaterialOnly.preOrderItems.sortToDisplay,
          ...state.cartProducts.mpMaterialOnly.preOrderItems.sortToDisplay,
        ];

        return ListView.builder(
          shrinkWrap: true,
          padding: _horizontalPadding,
          key: WidgetKeys.preOrderModalItemList,
          itemCount: preOrderItems.length,
          itemBuilder: (_, index) {
            final item = preOrderItems[index];

            if (item.materialInfo.type.typeCombo) {
              return Column(
                children: [
                  if (index != 0) const SizedBox(height: _itemSpacing,),
                  _PreOrderComboTile(
                    cartItem: item,
                  ),
                ],
              );
            }

            if (item.materialInfo.type.typeBundle) {
              return Column(
                children: [
                  if (index != 0) const _Divider(),
                  _PreOrderBundleTile(cartProduct: item),
                ],
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (preOrderItems.showManufacturerName(index)) ...[
                  if (index != 0) const _Divider(),
                  _ManufacturerName(cartProduct: item.materialInfo),
                  const SizedBox(height: _itemSpacing),
                ],
                _PreOrderProductTile(cartProduct: item),
              ],
            );
          },
        );
      },
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: _itemSpacing),
      child: ColoredBox(
        color: ZPColors.lightGray2,
        child: SizedBox(
          height: 1,
          width: double.infinity,
        ),
      ),
    );
  }
}
