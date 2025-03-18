import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/payments/widgets/amount_from_filter.dart';
import 'package:ezrxmobile/presentation/payments/widgets/amount_to_filter.dart';
import 'package:ezrxmobile/presentation/payments/widgets/from_document_date_filter.dart';
import 'package:ezrxmobile/presentation/payments/widgets/radio_filter_section.dart';
import 'package:ezrxmobile/presentation/payments/widgets/status_selector_filter.dart';
import 'package:ezrxmobile/presentation/payments/widgets/to_document_date_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/filter/payment_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_group.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/widgets/new_payment_button.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

part 'package:ezrxmobile/presentation/payments/payment_summary/widgets/payment_in_progress_label.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary/widgets/payment_summary_apply_button.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary/widgets/payment_summary_download_button.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary/widgets/payment_summary_filter_bottom_sheet.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary/widgets/payment_summary_filter_icon.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary/widgets/payment_summary_group_item.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary/widgets/payment_summary_group_list.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary/widgets/payment_summary_reset_button.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary/widgets/payment_summary_search_bar.dart';

@RoutePage()
class PaymentSummaryPage extends StatefulWidget {
  final bool isMarketPlace;

  const PaymentSummaryPage({
    super.key,
    required this.isMarketPlace,
  });

  @override
  State<PaymentSummaryPage> createState() => _PaymentSummaryPageState();
}

class _PaymentSummaryPageState extends State<PaymentSummaryPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    context.paymentSummaryBloc(widget.isMarketPlace).add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.defaultFilter(),
          ),
        );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PaymentModule(
      isMarketPlace: widget.isMarketPlace,
      child: Scaffold(
        key: WidgetKeys.paymentSummaryPage,
        appBar: CustomAppBar.commonAppBar(
          title: Text(
            context.tr(
              widget.isMarketPlace ? 'MP Payment summary' : 'Payment summary',
            ),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          customerBlockedOrSuspended:
              context.read<EligibilityBloc>().state.customerBlockOrSuspended,
          actionWidget: const [_PaymentSummaryDownloadButton()],
        ),
        floatingActionButton: NewPaymentButton.scale(
          controller: _scrollController,
        ),
        body: AnnouncementBanner(
          currentPath: context.router.currentPath,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: _PaymentSummarySearchBar(
                        key: WidgetKeys.paymentSummarySearchBar,
                      ),
                    ),
                    _PaymentSummaryFilterIcon(
                      key: WidgetKeys.paymentSummaryFilterButton,
                    ),
                  ],
                ),
              ),
              const _PaymentInProgressLabel(),
              Expanded(
                child: _PaymentSummaryGroupList(
                  scrollController: _scrollController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
