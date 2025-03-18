import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/expandable_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/full_summary_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/widgets/new_payment_button.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';

part 'package:ezrxmobile/presentation/payments/full_summary/widgets/invoice_credit_item.dart';

@RoutePage()
class FullSummaryPage extends StatefulWidget {
  final bool isMarketPlace;

  const FullSummaryPage({
    super.key,
    required this.isMarketPlace,
  });

  @override
  State<FullSummaryPage> createState() => _FullSummaryPageState();
}

class _FullSummaryPageState extends State<FullSummaryPage> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PaymentModule(
      isMarketPlace: widget.isMarketPlace,
      child: Scaffold(
        key: WidgetKeys.allSummaryPage,
        body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: BlocConsumer<FullSummaryBloc, FullSummaryState>(
              bloc: context.fullSummaryBloc(widget.isMarketPlace),
              listenWhen: (previous, current) =>
                  previous.failureOrSuccessOption !=
                  current.failureOrSuccessOption,
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
                return ScrollList<CreditAndInvoiceItem>(
                  dismissOnDrag: true,
                  noRecordFoundWidget: NoRecordFound.fullSummary(
                    isSearchAndFilterEmpty: state.appliedFilter.isEmpty,
                  ),
                  controller: _controller,
                  onRefresh: () =>
                      context.fullSummaryBloc(widget.isMarketPlace).add(
                            FullSummaryEvent.fetch(
                              appliedFilter: FullSummaryFilter.defaultFilter(),
                            ),
                          ),
                  onLoadingMore: () =>
                      context.fullSummaryBloc(widget.isMarketPlace).add(
                            const FullSummaryEvent.loadMore(),
                          ),
                  isLoading: state.isLoading,
                  itemBuilder: (context, index, item) => _InvoiceCreditItem(
                    data: item,
                  ),
                  items: state.items,
                );
              },
            ),
          ),
        ),
        floatingActionButton: NewPaymentButton.scale(
          controller: _controller,
        ),
      ),
    );
  }
}
