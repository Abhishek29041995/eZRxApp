import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OrderNumberSection extends StatelessWidget {
  final String orderNumber;
  const OrderNumberSection({super.key, required this.orderNumber});

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Row(
      key: WidgetKeys.invoiceOrderNumber(orderNumber),
      children: [
        Expanded(
          flex: 2,
          child: Text(
            '${context.tr('Order number')}: ',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          ),
        ),
        orderNumber.isNotEmpty
            ? BlocProvider(
                create: (context) => locator<ViewByOrderBloc>()
                  ..add(
                    ViewByOrderEvent.initialized(
                      salesOrganisation: eligibilityState.salesOrganisation,
                      customerCodeInfo: eligibilityState.customerCodeInfo,
                      salesOrgConfigs: eligibilityState.salesOrgConfigs,
                      shipToInfo: eligibilityState.shipToInfo,
                      user: eligibilityState.user,
                      sortDirection: 'desc',
                    ),
                  ),
                child: BlocConsumer<ViewByOrderBloc, ViewByOrderState>(
                  listenWhen: (previous, current) =>
                      previous.failureOrSuccessOption !=
                          current.failureOrSuccessOption &&
                      current.searchKey.validateNotEmpty,
                  buildWhen: (previous, current) =>
                      previous.isFetching != current.isFetching &&
                      current.searchKey.validateNotEmpty,
                  listener: (context, state) {
                    state.failureOrSuccessOption.fold(
                      () => {},
                      (option) => option.fold(
                        (failure) =>
                            ErrorUtils.handleApiFailure(context, failure),
                        (_) {
                          if (state.viewByOrderList.orderHeaders.isNotEmpty) {
                            context.read<ViewByOrderDetailsBloc>().add(
                                  ViewByOrderDetailsEvent.setOrderDetails(
                                    orderHistoryDetails: state
                                        .viewByOrderList.orderHeaders.first,
                                  ),
                                );
                            context.router.push(
                              const ViewByOrderDetailsPageRoute(),
                            );
                          } else {
                            CustomSnackBar(
                              icon: const Icon(
                                Icons.info,
                                color: ZPColors.error,
                              ),
                              backgroundColor: ZPColors.errorSnackBarColor,
                              messageText: context.tr(
                                'You do not have access to view this order',
                              ),
                            ).show(context);
                          }
                        },
                      ),
                    );
                  },
                  builder: (context, state) {
                    return Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Text(
                            orderNumber,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: ZPColors.white,
                                ),
                          ),
                          state.isFetching
                              ? Align(
                                  alignment: Alignment.center,
                                  child: LoadingAnimationWidget
                                      .horizontalRotatingDots(
                                    key: WidgetKeys
                                        .invoiceDetailsOrderNumberLoading,
                                    color: ZPColors.attachmentColor,
                                    size: 20,
                                  ),
                                )
                              : IconButton(
                                  key: WidgetKeys
                                      .invoiceDetailsOrderNumberButton,
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () =>
                                      _navigateToDetailsPage(context),
                                  icon: const Icon(
                                    Icons.open_in_new,
                                    color: ZPColors.attachmentColor,
                                    size: 20,
                                  ),
                                ),
                        ],
                      ),
                    );
                  },
                ),
              )
            : Expanded(
                flex: 3,
                child: Text(
                  '-',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.white,
                      ),
                ),
              ),
      ],
    );
  }

  void _navigateToDetailsPage(BuildContext context) {
    if (context.read<EligibilityBloc>().state.user.userCanAccessOrderHistory) {
      context.read<ViewByOrderBloc>().add(
            ViewByOrderEvent.fetch(
              filter: ViewByOrdersFilter.empty(),
              searchKey: SearchKey.search(
                orderNumber,
              ),
              isDetailsPage: true,
            ),
          );
    } else {
      CustomSnackBar(
        icon: const Icon(
          Icons.info,
          color: ZPColors.error,
        ),
        backgroundColor: ZPColors.errorSnackBarColor,
        messageText: context.tr(
          'You do not have access to view this order',
        ),
      ).show(context);
    }
  }
}
