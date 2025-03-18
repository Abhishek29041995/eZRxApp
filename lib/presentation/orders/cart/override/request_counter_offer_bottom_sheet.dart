import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_numeric_text_field.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/regexes.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'request_counter_offer_widgets/counter_offer_discount_text_field.dart';
part 'request_counter_offer_widgets/counter_offer_price_text_field.dart';
part 'request_counter_offer_widgets/counter_offer_buttons.dart';
part 'request_counter_offer_widgets/counter_offer_remarks_text_field.dart';
part 'request_counter_offer_widgets/counter_offer_discounted_price_field.dart';

class RequestCounterOfferBottomSheet extends StatelessWidget {
  final PriceAggregate cartItem;
  const RequestCounterOfferBottomSheet({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return BlocProvider<PriceOverrideBloc>(
      create: (context) => locator<PriceOverrideBloc>()
        ..add(PriceOverrideEvent.initialized(item: cartItem)),
      child: BlocListener<CartBloc, CartState>(
        listenWhen: (previous, current) =>
            previous.isUpserting != current.isUpserting && !current.isUpserting,
        listener: (context, state) {
          state.apiFailureOrSuccessOption.fold(
            () {
              context.read<PriceOverrideBloc>().add(
                    PriceOverrideEvent.fetch(
                      salesOrganisation: eligibilityState.salesOrganisation,
                      customerCodeInfo: eligibilityState.customerCodeInfo,
                    ),
                  );
            },
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        },
        child: BlocConsumer<PriceOverrideBloc, PriceOverrideState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption,
          listener: (context, state) {
            state.apiFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {
                  context.read<CartBloc>().add(
                        CartEvent.updateCartProductWithCounterOffer(
                          overriddenProductPrice: state.item.price,
                        ),
                      );
                  context.router.maybePop();
                },
              ),
            );
          },
          buildWhen: (previous, current) => previous.item != current.item,
          builder: (context, state) {
            final isDiscountOverrideEnable = eligibilityState.isZDP8Override;
            final isPriceOverrideEnable =
                eligibilityState.isPriceOverrideEnable;

            return Padding(
              key: WidgetKeys.counterOfferBottomSheet,
              padding: EdgeInsets.only(
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: padding24,
                      right: padding6,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            context.tr('Request counter offer'),
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: ZPColors.primary,
                                ),
                          ),
                        ),
                        IconButton(
                          key: WidgetKeys.counterOfferCancelButton,
                          onPressed: () => context.router.maybePop(),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: padding24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        if (cartItem.isListPriceNotAvailableForProduct ||
                            !state.hasDiscount)
                          PriceComponent(
                            key: WidgetKeys
                                .counterOfferListPriceWithoutStrikeWidget,
                            title: '${context.tr('List price')} : ',
                            salesOrgConfig: eligibilityState.salesOrgConfigs,
                            price: cartItem.display(PriceType.listPrice),
                            priceLabelStyle:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: ZPColors.neutralsGrey1,
                                    ),
                            type: PriceStyle.counterOfferListPrice,
                          )
                        else ...[
                          PriceComponent(
                            key: WidgetKeys.counterOfferListPriceWidget,
                            title: '${context.tr('List price')}: ',
                            salesOrgConfig: eligibilityState.salesOrgConfigs,
                            price: cartItem.display(PriceType.listPrice),
                            type: PriceStyle.returnOriginPriceStrikeThrough,
                            priceLabelStyle:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: ZPColors.neutralsGrey1,
                                    ),
                          ),
                          PriceComponent(
                            key: WidgetKeys.counterOfferPriceWidget,
                            title: '${context.tr('Discounted price')}: ',
                            salesOrgConfig: eligibilityState.salesOrgConfigs,
                            price: cartItem.display(PriceType.discountedPrice),
                            type: PriceStyle.cartMaterialUnitPrice,
                          ),
                        ],
                        if (isPriceOverrideEnable)
                          _CounterOfferPriceTextField(
                            isDiscountOverrideEnable: isDiscountOverrideEnable,
                            cartItem: state.item,
                          ),
                        if (isDiscountOverrideEnable) ...[
                          _CounterOfferDiscountTextField(
                            cartItem: state.item,
                            isPriceOverrideEnable: isPriceOverrideEnable,
                          ),
                          const _CounterOfferDiscountedPriceField(),
                        ],
                        _CounterOfferWarningMessage(
                          isDiscountOverrideEnable: isDiscountOverrideEnable,
                        ),
                        if (isDiscountOverrideEnable) ...[
                          const Divider(
                            height: 48,
                            indent: 0,
                            endIndent: 0,
                            color: ZPColors.extraLightGrey3,
                          ),
                        ] else
                          const SizedBox(height: padding24),
                        _CounterOfferRemarksTextField(
                          remarks: state
                              .item.materialInfo.counterOfferDetails.comment
                              .getOrDefaultValue(''),
                        ),
                        _CounterOfferEmptyFieldsErrorMessage(
                          isPriceOverrideEnable: isPriceOverrideEnable,
                          isDiscountOverrideEnable: isDiscountOverrideEnable,
                        ),
                        _CounterOfferButtons(
                          cartItem: cartItem,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CounterOfferEmptyFieldsErrorMessage extends StatelessWidget {
  final bool isPriceOverrideEnable;
  final bool isDiscountOverrideEnable;
  const _CounterOfferEmptyFieldsErrorMessage({
    required this.isPriceOverrideEnable,
    required this.isDiscountOverrideEnable,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceOverrideBloc, PriceOverrideState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        if (state.showErrorMessages &&
            isPriceOverrideEnable &&
            isDiscountOverrideEnable) {
          return InfoLabel(
            key: WidgetKeys.counterOfferEmptyFieldErrorMessage,
            margin: const EdgeInsets.symmetric(vertical: padding12),
            mainColor: ZPColors.lightRedStatusColor,
            textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.neutralsDarkBlack,
                ),
            textValue: context.tr(
              'Please input value for Counter offer price ({currency}) or Discount counter offer (%) to proceed.',
              namedArgs: {
                'currency': context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrgConfigs
                    .currency
                    .code,
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _CounterOfferWarningMessage extends StatelessWidget {
  final bool isDiscountOverrideEnable;
  const _CounterOfferWarningMessage({
    required this.isDiscountOverrideEnable,
  });

  String _warningMessage({required bool hasDiscount}) {
    if (hasDiscount) {
      if (isDiscountOverrideEnable) {
        return 'Final Counter offer price is higher than discounted price';
      }

      return 'Counter offer price is higher than discounted price';
    }
    if (isDiscountOverrideEnable) {
      return 'Final counter offer price is higher than list price';
    }

    return 'Counter offer price is higher than list price';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceOverrideBloc, PriceOverrideState>(
      buildWhen: (previous, current) =>
          previous.showWarningMessage != current.showWarningMessage,
      builder: (context, state) {
        if (state.showWarningMessage) {
          return InfoLabel(
            key: WidgetKeys.counterOfferWarningMessage,
            icon: const Icon(
              Icons.error,
              color: ZPColors.warning,
            ),
            margin: const EdgeInsets.only(top: padding12),
            mainColor: ZPColors.warningBg,
            textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.neutralsDarkBlack,
                  height: 2,
                ),
            textValue: context.tr(
              _warningMessage(
                hasDiscount: state.hasDiscount,
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
