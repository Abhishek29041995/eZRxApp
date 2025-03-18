//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files

class CartBottomSheet {
  //Need to visit when deep linking is revised

  // static void showQuickAddToCartBottomSheet({
  //   required BuildContext context,
  //   required String materialNumber,
  // }) {
  //   final cartState = context.read<CartBloc>().state;
  //   final material = PriceAggregate.empty().copyWith(
  //     materialInfo: MaterialInfo.empty().copyWith(
  //       materialNumber: MaterialNumber(materialNumber),
  //     ),
  //   );
  //   final currentCartItem = cartState.getMaterialCartItem(material: material);
  //   final isPresentInCart = currentCartItem != PriceAggregate.empty();

  //   if (isPresentInCart) {
  //     showUpdateCartBottomSheet(
  //       context: context,
  //       cartItem: currentCartItem,
  //     );
  //   } else {
  //     context.router.push(
  //       AddToCartRoute(
  //         isCovid19Tab: false,
  //         material: material,
  //         isShortcutAccess: true,
  //       ),
  //     );
  //   }
  // }

  // static void showAddToCartBottomSheet({
  //   required BuildContext context,
  //   required PriceAggregate priceAggregate,
  // }) {
  //   final cartBloc = context.read<CartBloc>();
  //   final currentCartItem =
  //       cartBloc.state.getMaterialCartItem(material: priceAggregate);
  //   final isPresentInCart = currentCartItem != PriceAggregate.empty();
  //   if (isPresentInCart) {
  //     showUpdateCartBottomSheet(
  //       context: context,
  //       cartItem: currentCartItem,
  //     );
  //   } else {
  //     context.router.push(
  //       AddToCartRoute(
  //         isCovid19Tab: false,
  //         material: priceAggregate,
  //       ),
  //     );
  //   }
  // }

  // static void showUpdateCartBottomSheet({
  //   required BuildContext context,
  //   required PriceAggregate cartItem,
  // }) {
  //   context.router.push(
  //     UpdateCartRoute(
  //       material: cartItem,
  //     ),
  //   );
  // }

  // static void showUpdateCartBonusBottomSheet({
  //   required BuildContext context,
  //   required MaterialInfo item,
  //   required CartItem cartItem,
  //   required bool isUpdateFromCart,
  // }) {
  //   showModalBottomSheet(
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(15),
  //         topRight: Radius.circular(15),
  //       ),
  //     ),
  //     context: context,
  //     builder: (_) {
  //       return UpdateBonus(
  //         materialInfo: item,
  //         cartItem: cartItem,
  //         isUpdateFromCart: isUpdateFromCart,
  //       );
  //     },
  //   );
  // }
}
