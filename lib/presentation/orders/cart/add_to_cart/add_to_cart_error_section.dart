import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddToCartErrorSection extends StatelessWidget {
  final String contentText;

  const AddToCartErrorSection({
    super.key,
    required this.contentText,
  });

  factory AddToCartErrorSection.forTenderContract({
    required String contentText,
  }) =>
      AddToCartErrorSection(
        contentText: contentText,
      );

  factory AddToCartErrorSection.forAnimalHealth({
    required BuildContext context,
  }) =>
      AddToCartErrorSection(
        contentText: context.tr(
          'Animal health materials cannot be ordered with regular materials. By proceeding, your existing cart will be cleared.',
        ),
      );

  factory AddToCartErrorSection.forCovid({
    required BuildContext context,
    required bool cartContainsFocProduct,
  }) =>
      AddToCartErrorSection(
        contentText: cartContainsFocProduct
            ? context.tr(
                'Commercial materials cannot be added to cart with Covid-19 vaccines. By proceeding, your current cart will be cleared.',
              )
            : context.tr(
                'Covid-19 vaccine cannot be added to cart with other commercial materials. By proceeding, your current cart will be cleared.',
              ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.isClearing != current.isClearing && !current.isClearing,
      listener: (context, cartState) {
        cartState.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
        if (cartState.cartProducts.isEmpty) {
          Navigator.pop(context, true);
        }
      },
      buildWhen: (previous, current) =>
          previous.isClearing != current.isClearing,
      builder: (context, state) {
        return SafeArea(
          key: WidgetKeys.addToCartErrorSection,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Center(
                    child: SvgPicture.asset(
                      SvgImage.alert,
                      height: 120,
                    ),
                  ),
                ),
                Text(
                  context.tr('Proceed to add to cart?'),
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: ZPColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: Text(
                    contentText,
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: ZPColors.extraLightGrey4),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: LoadingShimmer.withChild(
                        enabled: state.isClearing,
                        child: SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            key: WidgetKeys.cancelCovidMaterialAddToCart,
                            onPressed: () => state.isClearing
                                ? null
                                : context.router.maybePop(),
                            child: Text(
                              context.tr('Cancel'),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: ZPColors.primary),
                            ).tr(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: LoadingShimmer.withChild(
                        enabled: state.isClearing,
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            key: WidgetKeys.addToCartErrorSectionProceed,
                            onPressed: () => state.isClearing
                                ? null
                                : context.read<CartBloc>().add(
                                      const CartEvent.clearCart(),
                                    ),
                            child: Text(
                              context.tr('Proceed'),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: ZPColors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
