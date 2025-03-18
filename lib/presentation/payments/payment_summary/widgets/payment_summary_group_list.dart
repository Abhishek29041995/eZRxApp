part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryGroupList extends StatelessWidget {
  final ScrollController scrollController;
  const _PaymentSummaryGroupList({
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentSummaryBloc, PaymentSummaryState>(
      bloc: context.paymentSummaryBloc(context.isMPPayment),
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) => ScrollList<PaymentSummaryGroup>(
        noRecordFoundWidget: const NoRecordFound(
          title: 'No Payment Summary Found',
        ),
        dismissOnDrag: true,
        controller: scrollController,
        onRefresh: () => context.paymentSummaryBloc(context.isMPPayment).add(
              PaymentSummaryEvent.fetch(
                appliedFilter: PaymentSummaryFilter.defaultFilter(),
              ),
            ),
        onLoadingMore: () =>
            context.paymentSummaryBloc(context.isMPPayment).add(
                  const PaymentSummaryEvent.loadMore(),
                ),
        isLoading: state.isFetching,
        itemBuilder: (context, index, itemInfo) => _PaymentSummaryGroupItem(
          key: WidgetKeys.paymentSummaryItem,
          paymentSummaryGroup: itemInfo,
          showDivider: index != 0,
        ),
        items: state.details.paymentSummaryGroupList,
      ),
    );
  }
}
