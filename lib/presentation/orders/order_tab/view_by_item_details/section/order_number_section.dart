part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';

class OrderNumberSection extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  const OrderNumberSection({super.key, required this.orderHistoryItem});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ViewByOrderBloc>()
        ..add(
          ViewByOrderEvent.initialized(
            salesOrganisation:
                context.read<EligibilityBloc>().state.salesOrganisation,
            customerCodeInfo:
                context.read<EligibilityBloc>().state.customerCodeInfo,
            salesOrgConfigs:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            user: context.read<EligibilityBloc>().state.user,
            sortDirection: 'desc',
            shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
          ),
        ),
      child: BlocConsumer<ViewByOrderBloc, ViewByOrderState>(
        listenWhen: (previous, current) =>
            previous.failureOrSuccessOption != current.failureOrSuccessOption &&
            current.searchKey.validateNotEmpty,
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching &&
            current.searchKey.validateNotEmpty,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () => {},
            (option) => option.fold(
              (failure) => ErrorUtils.handleApiFailure(context, failure),
              (_) {
                if (state.viewByOrderList.orderHeaders.isNotEmpty) {
                  context.read<ViewByOrderDetailsBloc>().add(
                        ViewByOrderDetailsEvent.setOrderDetails(
                          orderHistoryDetails:
                              state.viewByOrderList.orderHeaders.first,
                        ),
                      );
                  context.router.push(
                    const ViewByOrderDetailsPageRoute(),
                  );
                }
              },
            ),
          );
        },
        builder: (context, state) {
          return Row(
            children: [
              Flexible(
                child: RichText(
                  key: WidgetKeys.viewByItemsOrderDetailOrderCode,
                  text: TextSpan(
                    text:
                        '${context.tr(orderHistoryItem.status.prefix)} #${orderHistoryItem.orderNumber.getOrDefaultValue('')}',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: ZPColors.white,
                        ),
                    children: [
                      if (orderHistoryItem.status.isInQueue)
                        const WidgetSpan(
                          child: QueueNumberInfoIcon(
                            iconColor: ZPColors.attachmentColor,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              state.isFetching
                  ? Align(
                      alignment: Alignment.center,
                      child: LoadingAnimationWidget.horizontalRotatingDots(
                        key: WidgetKeys.viewByOrderOrderNumberLoading,
                        color: ZPColors.attachmentColor,
                        size: 20,
                      ),
                    )
                  : IconButton(
                      key: WidgetKeys.viewByOrderOrderNumberButton,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => context.read<ViewByOrderBloc>().add(
                            ViewByOrderEvent.fetch(
                              filter: ViewByOrdersFilter.empty(),
                              searchKey: SearchKey.search(
                                orderHistoryItem.orderNumber
                                    .getOrDefaultValue(''),
                              ),
                              isDetailsPage: true,
                            ),
                          ),
                      icon: const Icon(
                        Icons.open_in_new,
                        color: ZPColors.attachmentColor,
                        size: 20,
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
