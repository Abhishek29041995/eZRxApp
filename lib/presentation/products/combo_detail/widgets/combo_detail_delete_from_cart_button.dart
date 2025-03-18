part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _ComboDetailDeleteFromCartButton extends StatelessWidget {
  const _ComboDetailDeleteFromCartButton();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          (previous.isDeleteCombo != current.isDeleteCombo &&
              current.isDeleteCombo) &&
          (context.router.current.path == '/combo_detail'),
      listener: (_, state) {
        state.apiFailureOrSuccessOption.fold(
          () {
            const previousScreenIndex = 2;
            final isDeleteFromCart = context.router.stack.isNotEmpty &&
                    context.router.stack.length > previousScreenIndex
                ? (context
                        .router
                        .stack[
                            context.router.stack.length - previousScreenIndex]
                        .name ==
                    CartPageRoute.name)
                : false;

            final bloc = context.read<ComboDealMaterialDetailBloc>();

            bloc
              ..add(const ComboDealMaterialDetailEvent.clearSelectedItem())
              ..add(
                const ComboDealMaterialDetailEvent.cartContainsCurrentCombo(
                  contain: false,
                ),
              );

            if (isDeleteFromCart) {
              (context.router.maybePop());
            } else {
              CustomSnackBar(
                messageText: context.tr(
                  '{comboName} has been deleted from cart',
                  namedArgs: {
                    'comboName':
                        bloc.state.currentDeal.scheme.comboDealTitleAppbar,
                  },
                ),
              ).show(context);
            }
          },
          (_) {},
        );
      },
      child: IconButton(
        key: WidgetKeys.comboDeteleButton,
        icon: const Icon(
          Icons.delete_outlined,
          color: ZPColors.red,
        ),
        onPressed: () => showModalBottomSheet(
          context: context,
          enableDrag: false,
          isDismissible: false,
          isScrollControlled: true,
          builder: (_) {
            final cartItem =
                context.read<CartBloc>().state.getCurrentComboItemByComboDealId(
                      context
                          .read<ComboDealMaterialDetailBloc>()
                          .state
                          .allSelectedItems
                          .firstPriceComboDealEligible
                          .id,
                    );

            return DeleteComboDealBottomSheet(
              cartItem: cartItem,
            );
          },
        ),
      ),
    );
  }
}
