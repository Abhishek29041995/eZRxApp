import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/available_credits_tab/available_credit_payment_filter_page.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/widgets/credit_item_card.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/tabs/available_credits_tab/widgets/available_credits_search_bar.dart';

@RoutePage()
class AvailableCreditsTab extends StatelessWidget {
  const AvailableCreditsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.availableCreditsTabPage,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Row(
            children: [
              const Expanded(
                child: _AvailableCreditsSearchBar(),
              ),
              _FilterTune(),
            ],
          ),
        ),
        BlocConsumer<AvailableCreditsBloc, AvailableCreditsState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption !=
                  current.failureOrSuccessOption ||
              previous.isLoading != current.isLoading,
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
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            return Expanded(
              child: state.isLoading && state.items.isEmpty
                  ? LoadingShimmer.logo(
                      key: WidgetKeys.loaderImage,
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 24,
                      ),
                      child: ScrollList<CustomerOpenItem>(
                        noRecordFoundWidget: NoRecordFound.newPaymentCredits(
                          isSearchAndFilterEmpty: state.isSearchAndFilterEmpty,
                        ),
                        dismissOnDrag: true,
                        controller: ScrollController(),
                        onRefresh: () {
                          context.read<AvailableCreditsBloc>().add(
                                AvailableCreditsEvent.fetch(
                                  appliedFilter:
                                      AvailableCreditFilter.defaultFilter(),
                                  searchKey: SearchKey.empty(),
                                  isMarketPlace: context.isMPPayment,
                                ),
                              );
                        },
                        onLoadingMore: () {
                          context.read<AvailableCreditsBloc>().add(
                                AvailableCreditsEvent.loadMore(
                                  isMarketPlace: context.isMPPayment,
                                ),
                              );
                        },
                        isLoading: state.isLoading,
                        itemBuilder: (context, index, item) => _PaymentItem(
                          data: item,
                        ),
                        items: state.items,
                      ),
                    ),
            );
          },
        ),
      ],
    );
  }
}

class _PaymentItem extends StatelessWidget {
  const _PaymentItem({
    required this.data,
  });

  final CustomerOpenItem data;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.only(bottom: 24),
      key: WidgetKeys.creditPaymentItem,
      child: BlocBuilder<NewPaymentBloc, NewPaymentState>(
        builder: (context, state) {
          return EdgeCheckbox(
            onChanged: (bool value) => context.read<NewPaymentBloc>().add(
                  NewPaymentEvent.toggleCredit(selected: value, item: data),
                ),
            value: state.selectedCredits.contains(data),
            body: CreditItemCard(customerOpenItem: data),
          );
        },
      ),
    );
  }
}

class _FilterTune extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableCreditsBloc, AvailableCreditsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return CustomBadge(
          Icons.tune_outlined,
          count: state.appliedFilter.appliedFilterCount,
          badgeColor: ZPColors.orange,
          onPressed: () =>
              !state.isLoading ? _showFilterPage(context: context) : null,
        );
      },
    );
  }

  void _showFilterPage({required BuildContext context}) {
    context.read<AvailableCreditFilterBloc>().add(
          AvailableCreditFilterEvent.updateFilterToLastApplied(
            lastAppliedFilter:
                context.read<AvailableCreditsBloc>().state.appliedFilter,
          ),
        );
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (_) {
        return const AvailableCreditPaymentFilterPage(
          key: WidgetKeys.creditPaymentFilterPage,
        );
      },
    ).then(
      (value) {
        if (value == null) return;
        final newFilter = value as AvailableCreditFilter;
        final alreadyAppliedFilter =
            context.read<AvailableCreditsBloc>().state.appliedFilter;
        if (newFilter != alreadyAppliedFilter) {
          trackMixpanelEvent(
            TrackingEvents.newPaymentFilterUsed,
            props: {TrackingProps.filterUsed: newFilter.trackingInfo},
          );
          context.read<AvailableCreditsBloc>().add(
                AvailableCreditsEvent.fetch(
                  appliedFilter: newFilter,
                  searchKey:
                      context.read<AvailableCreditsBloc>().state.searchKey,
                  isMarketPlace: context.isMPPayment,
                ),
              );
        }
      },
    );
  }
}
