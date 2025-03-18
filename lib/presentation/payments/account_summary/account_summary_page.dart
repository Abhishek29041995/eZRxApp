import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/filter/full_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/full_summary_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/full_summary/widgets/filter_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/presentation/payments/all_credits/filter_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/filter_bottom_sheet.dart';
import 'package:ezrxmobile/application/payments/all_credits/filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';

part 'package:ezrxmobile/presentation/payments/account_summary/widgets/export.dart';
part 'package:ezrxmobile/presentation/payments/account_summary/widgets/account_summary_search_bar.dart';
part 'package:ezrxmobile/presentation/payments/account_summary/widgets/filter_tune_icon.dart';

@RoutePage()
class AccountSummary extends StatelessWidget {
  final bool isMarketPlace;

  const AccountSummary({
    super.key,
    required this.isMarketPlace,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentModule(
      isMarketPlace: isMarketPlace,
      child: Scaffold(
        key: WidgetKeys.accountSummaryPage,
        appBar: CustomAppBar.commonAppBar(
          title: Text(
            context
                .tr(isMarketPlace ? 'MP Account summary' : 'Account summary'),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          customerBlockedOrSuspended:
              context.read<EligibilityBloc>().state.customerBlockOrSuspended,
        ),
        body: Column(
          children: [
            AnnouncementWidget(
              currentPath: context.router.currentPath,
            ),
            Expanded(
              child: AutoTabsRouter.tabBar(
                routes: [
                  AllInvoicesPageRoute(isMarketPlace: isMarketPlace),
                  AllCreditsPageRoute(isMarketPlace: isMarketPlace),
                  FullSummaryPageRoute(isMarketPlace: isMarketPlace),
                ],
                builder: (context, child, tabController) => Column(
                  children: [
                    TabBar(
                      controller: tabController,
                      tabs: [
                        Tab(
                          key: WidgetKeys.invoiceTab,
                          text: context.tr('Invoices'),
                        ),
                        Tab(
                          key: WidgetKeys.creditsTab,
                          text: context.tr('Credits'),
                        ),
                        Tab(
                          key: WidgetKeys.summaryTab,
                          text: context.tr('Summary'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        12.0,
                        12.0,
                        12.0,
                        0.0,
                      ),
                      child: Row(
                        children: [
                          _AccountSummarySearchBar(
                            currentActiveTabName:
                                context.tabsRouter.current.name,
                            key: WidgetKeys.accountSummarySearchBar,
                          ),
                          _FilterTuneIcon(
                            currentActiveTabName:
                                context.tabsRouter.current.name,
                            key: WidgetKeys.accountSummaryFilterButton,
                          ),
                          _Export(
                            currentActiveTabName:
                                context.tabsRouter.current.name,
                            key: WidgetKeys.accountSummaryDownloadButton,
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: child),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
