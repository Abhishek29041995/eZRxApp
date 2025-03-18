import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/clevertap_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/mixin/bottomsheet_mixin.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/returns/new_request/widgets/attention_widget.dart';
part 'package:ezrxmobile/presentation/returns/new_request/widgets/next_button.dart';
part 'package:ezrxmobile/presentation/returns/new_request/widgets/previous_button.dart';
part 'package:ezrxmobile/presentation/returns/new_request/widgets/submit_button.dart';

@RoutePage()
class NewRequestPage extends StatelessWidget {
  const NewRequestPage({super.key});
  final _tabs = const [
    ReturnItemsTabRoute(),
    ReturnDetailsTabRoute(),
    ReturnReviewTabRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: _tabs,
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, child, tabController) {
        final step = tabController.index + 1;
        var title = '';
        switch (step) {
          case 1:
            title = 'Select item(s) to return'.tr();
            break;
          case 2:
            title = 'Fill in return details'.tr();
            break;
          default:
            title = 'Review return details'.tr();
        }

        return Scaffold(
          key: WidgetKeys.newRequestPage,
          appBar: CustomAppBar.commonAppBar(
            title: Text(
              context.tr('New return request'),
            ),
            customerBlockedOrSuspended:
                context.read<EligibilityBloc>().state.customerBlockOrSuspended,
            leadingWidget: _PreviousButton(
              tabController: tabController,
              step: step,
            ),
          ),
          body: AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: BlocBuilder<NewRequestBloc, NewRequestState>(
              buildWhen: (previous, current) =>
                  previous.selectedItems != current.selectedItems ||
                  previous.invoiceDetails != current.invoiceDetails ||
                  previous.showErrorMessages != current.showErrorMessages,
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              12.0,
                              12.0,
                              12.0,
                              0.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: Text(
                                    '${'Step'.tr()} $step ${'of'.tr()} ${_tabs.length}: $title',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: ZPColors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    key: WidgetKeys.newRequestStep2Title,
                                  ),
                                ),
                                LinearProgressIndicator(
                                  value: step / _tabs.length,
                                  backgroundColor: ZPColors.accentColor,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: child,
                          ),
                        ],
                      ),
                    ),
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        color: ZPColors.whiteBgCard,
                      ),
                      child: SafeArea(
                        top: false,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: ZPColors.lightGray2,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                onTap: () => _showSumaryInfo(context),
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  '${'Return for'.tr()} ${context.read<EligibilityBloc>().state.customerCodeInfo.customerName}',
                                  style: Theme.of(context).textTheme.labelSmall,
                                  key: WidgetKeys.newRequestReturnFor,
                                ),
                                trailing: const Icon(
                                  Icons.chevron_right,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${context.tr('Subtotal (excl.tax)')} :',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: ZPColors.neutralsBlack,
                                          ),
                                    ),
                                    PriceComponent(
                                      salesOrgConfig: context
                                          .read<SalesOrgBloc>()
                                          .state
                                          .configs,
                                      type: PriceStyle.summaryPrice,
                                      price: state.returnTotal.toString(),
                                    ),
                                  ],
                                ),
                              ),
                              _AttentionWidget(
                                key: WidgetKeys.cannotMoveToNextStep,
                                message:
                                    'Please select at least one material to proceed.'
                                        .tr(),
                                visible: step == 1 &&
                                    state.showErrorMessages &&
                                    state.selectedItems.isEmpty,
                              ),
                              _AttentionWidget(
                                key: WidgetKeys.invalidSelectedReturnItemError,
                                widgetKey: WidgetKeys
                                    .invalidSelectedReturnItemErrorMsg,
                                message: context.tr(
                                  state.invalidSelectedReturnItemMsg,
                                ),
                                visible: step == 1 &&
                                    state.showErrorMessages &&
                                    state.areSelectedReturnItemsInvalid,
                              ),
                              if (step == 1)
                                Text(
                                  '${state.selectedItems.length} ${'items selected'.tr()}'
                                      .tr(),
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              _AttentionWidget(
                                message:
                                    'Please ensure all required fields are filled.'
                                        .tr(),
                                visible: step == 2 && state.showErrorMessages,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        context.tr('Return Total: '),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: ZPColors.darkGray,
                                            ),
                                      ),
                                      PriceComponent(
                                        salesOrgConfig: context
                                            .read<SalesOrgBloc>()
                                            .state
                                            .configs,
                                        price: state.returnTotal.toString(),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  if (step == 1)
                                    _NextButton(
                                      validation: state.validateForStep1,
                                      tabController: tabController,
                                      nextAllowed: !state.showErrorMessages ||
                                          state.validateForStep1,
                                    ),
                                  if (step == 2)
                                    _NextButton(
                                      validation: state.validateForStep2,
                                      tabController: tabController,
                                      nextAllowed: !state.showErrorMessages ||
                                          state.validateForStep2,
                                    ),
                                  if (step == 3) const _SubmitButton(),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _showSumaryInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              AddressInfoSection.returnRequest(),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: WidgetKeys.closeSummaryInfoNewRequestPage,
                  onPressed: () {
                    context.router.maybePop();
                  },
                  child: Text(
                    context.tr('Close'),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: ZPColors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
