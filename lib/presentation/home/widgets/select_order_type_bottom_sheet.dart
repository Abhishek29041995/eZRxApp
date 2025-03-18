import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/order_type.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SelectOrderTypeBottomSheet extends StatefulWidget {
  const SelectOrderTypeBottomSheet({super.key});

  @override
  State<SelectOrderTypeBottomSheet> createState() => _SelectOrderTypeBottomSheetState();
}

class _SelectOrderTypeBottomSheetState extends State<SelectOrderTypeBottomSheet> {
  late var selectedOrderType = context.read<EligibilityBloc>().state.selectedOrderTypeInfo;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.8,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(padding12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: padding12),
                child: Text(
                  context.tr('Change order type'),
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ZPColors.primary,
                      ),
                ),
              ),
              if (context.read<CartBloc>().state.cartProducts.isNotEmpty) const _CartNotEmptyWarningMessage(),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: padding12),
                  child: _OrderTypeList(
                    onSelectOrderType: (newOrderType) => setState(() {
                      selectedOrderType = newOrderType;
                    }),
                    selectedOrderType: selectedOrderType,
                  ),
                ),
              ),
              const SizedBox(height: padding24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      key: WidgetKeys.cancelButton,
                      onPressed: () => context.router.maybePop(),
                      child: Text(context.tr('Cancel')),
                    ),
                  ),
                  const SizedBox(width: padding12),
                  Expanded(
                    child: _ConfirmButton(selectedOrderType: selectedOrderType),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConfirmButton extends StatelessWidget {
  const _ConfirmButton({required this.selectedOrderType});

  final OrderType selectedOrderType;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) => previous.isClearing != current.isClearing && !current.isClearing,
      listener: (context, state) {
        _backToHomePage(
          context,
          context.tr(
            'Your cart is cleared, and the Order type has changed to {orderType}',
            namedArgs: {'orderType': selectedOrderType.displayText},
          ),
        );
      },
      buildWhen: (previous, current) => previous.isClearing != current.isClearing,
      builder: (context, cartState) => BlocConsumer<UserBloc, UserState>(
        listenWhen: (previous, current) =>
            previous.isSelectingOrderType != current.isSelectingOrderType && !current.isSelectingOrderType,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) => ErrorUtils.handleApiFailure(context, failure),
              (_) {
                final cartBloc = context.read<CartBloc>();
                if (cartBloc.state.cartProducts.isNotEmpty) {
                  cartBloc.add(const CartEvent.clearCart());
                } else {
                  _backToHomePage(
                    context,
                    context.tr(
                      'Order type has changed to {orderType}',
                      namedArgs: {'orderType': selectedOrderType.displayText},
                    ),
                  );
                }
              },
            ),
          );
        },
        buildWhen: (previous, current) => previous.isSelectingOrderType != current.isSelectingOrderType,
        builder: (context, userState) {
          final isLoading = userState.isSelectingOrderType || cartState.isClearing;

          return ElevatedButton(
            key: WidgetKeys.confirmButton,
            onPressed: isLoading
                ? null
                : () {
                    userState.user.selectedOrderType == selectedOrderType.categoryId
                        ? context.router.maybePop()
                        : context.read<UserBloc>().add(
                              UserEvent.selectOrderType(
                                orderType: selectedOrderType.categoryId,
                              ),
                            );
                  },
            child: LoadingShimmer.withChild(
              enabled: isLoading,
              center: false,
              child: Text(context.tr('Confirm')),
            ),
          );
        },
      ),
    );
  }

  void _backToHomePage(BuildContext context, String message) {
    context.router
      ..popUntilRouteWithName(HomeNavigationTabbarRoute.name)
      ..navigate(
        const HomeNavigationTabbarRoute(children: [ProductsTabRoute()]),
      );
    CustomSnackBar(messageText: message).show(context);
  }
}

class _CartNotEmptyWarningMessage extends StatelessWidget {
  const _CartNotEmptyWarningMessage();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: WidgetKeys.cartNotEmptyMessageWhenSelectOrderType,
      margin: const EdgeInsets.symmetric(vertical: padding12),
      padding: const EdgeInsets.symmetric(
        vertical: padding6,
        horizontal: padding12,
      ),
      decoration: BoxDecoration(
        color: ZPColors.warningBg,
        borderRadius: BorderRadius.circular(padding12),
      ),
      child: Row(
        children: [
          const Icon(Icons.info, color: ZPColors.warning),
          const SizedBox(width: padding12),
          Expanded(
            child: Text(
              context.tr(
                'You have material(s) of a different order type in your cart. The material(s) in your cart will be cleared once you confirm this change. Please note that this action cannot be undone.',
              ),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    height: 1.5,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderTypeList extends StatelessWidget {
  final OrderType selectedOrderType;
  final Function(OrderType newOrderType) onSelectOrderType;

  const _OrderTypeList({
    required this.selectedOrderType,
    required this.onSelectOrderType,
  });

  @override
  Widget build(BuildContext context) {
    final orderTypeList =
        context.read<EligibilityBloc>().state.salesOrgConfigs.orderTypes.where((e) => e.enabled).toList();

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final orderType = orderTypeList[index];

        return ListTileTheme(
          horizontalTitleGap: 4,
          child: RadioListTile<OrderType>(
            key: WidgetKeys.orderTypeTile(
              orderType.categoryId.getOrDefaultValue(''),
            ),
            contentPadding: EdgeInsets.zero,
            title: Text(
              orderType.displayText,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            visualDensity: VisualDensity.compact,
            onChanged: (value) {
              if (value != null) onSelectOrderType.call(value);
            },
            groupValue: selectedOrderType,
            value: orderType,
          ),
        );
      },
      itemCount: orderTypeList.length,
    );
  }
}
