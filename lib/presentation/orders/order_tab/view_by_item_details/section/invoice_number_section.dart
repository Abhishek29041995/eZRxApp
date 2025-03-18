part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';

class InvoiceNumberSection extends StatelessWidget {
  final String invoiceNumber;
  final bool isMarketPlace;

  const InvoiceNumberSection({
    super.key,
    required this.invoiceNumber,
    required this.isMarketPlace,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Row(
      children: [
        Expanded(
          child: Text(
            '${context.tr('Invoice number')}: ',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          ),
        ),
        invoiceNumber.isNotEmpty
            ? isMarketPlace
                ? BlocProvider<MPAllInvoicesBloc>(
                    create: (context) => locator<MPAllInvoicesBloc>()
                      ..add(
                        AllInvoicesEvent.initialized(
                          salesOrganisation: eligibilityState.salesOrganisation,
                          customerCodeInfo: eligibilityState.customerCodeInfo,
                        ),
                      ),
                    child: _InvoiceNumber(
                      isMarketPlace: isMarketPlace,
                      invoiceNumber: invoiceNumber,
                    ),
                  )
                : BlocProvider<ZPAllInvoicesBloc>(
                    create: (context) => locator<ZPAllInvoicesBloc>()
                      ..add(
                        AllInvoicesEvent.initialized(
                          salesOrganisation: eligibilityState.salesOrganisation,
                          customerCodeInfo: eligibilityState.customerCodeInfo,
                        ),
                      ),
                    child: _InvoiceNumber(
                      isMarketPlace: isMarketPlace,
                      invoiceNumber: invoiceNumber,
                    ),
                  )
            : Expanded(
                child: Text(
                  'NA',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.white,
                      ),
                ),
              ),
      ],
    );
  }
}

class _InvoiceNumber extends StatelessWidget {
  const _InvoiceNumber({
    required this.isMarketPlace,
    required this.invoiceNumber,
  });

  final bool isMarketPlace;
  final String invoiceNumber;

  @override
  Widget build(BuildContext context) {
    final enablePayment =
        context.read<EligibilityBloc>().state.isPaymentEnabled;

    return BlocConsumer<AllInvoicesBloc, AllInvoicesState>(
      bloc: context.allInvoicesBloc(isMarketPlace),
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () => {},
          (option) => option.fold(
            (failure) => ErrorUtils.handleApiFailure(context, failure),
            (_) {
              if (state.items.isNotEmpty) {
                context.read<CreditAndInvoiceDetailsBloc>().add(
                      CreditAndInvoiceDetailsEvent.fetch(
                        creditAndInvoiceItem: state.items.first,
                        isMarketPlace: isMarketPlace,
                      ),
                    );
                context.router.push(
                  InvoiceDetailsPageRoute(isMarketPlace: isMarketPlace),
                );
              }
            },
          ),
        );
      },
      builder: (context, state) {
        return Expanded(
          flex: 1,
          child: Row(
            children: [
              Text(
                invoiceNumber,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              state.isLoading
                  ? Align(
                      alignment: Alignment.center,
                      child: LoadingAnimationWidget.horizontalRotatingDots(
                        key: WidgetKeys
                            .viewByItemsOrderDetailsInvoiceNumberLoading,
                        color: ZPColors.attachmentColor,
                        size: 20,
                      ),
                    )
                  : enablePayment
                      ? IconButton(
                          key: WidgetKeys
                              .viewByItemsOrderDetailsInvoiceNumberButton,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () =>
                              context.allInvoicesBloc(isMarketPlace).add(
                                    AllInvoicesEvent.fetch(
                                      appliedFilter:
                                          AllInvoicesFilter.defaultFilter()
                                              .copyWith(
                                        searchKey: SearchKey.search(
                                          invoiceNumber,
                                        ),
                                      ),
                                    ),
                                  ),
                          icon: const Icon(
                            Icons.open_in_new,
                            color: ZPColors.attachmentColor,
                            size: 20,
                          ),
                        )
                      : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
