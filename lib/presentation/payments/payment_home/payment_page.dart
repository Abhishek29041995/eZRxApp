import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/full_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/filter/payment_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/application/payments/claim_management/claim_management_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_filter/soa_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/banner_storage.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/widgets/new_payment_button.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/widgets/announcement_bottomsheet.dart';

part 'widgets/account_statement.dart';
part 'widgets/payment_option.dart';
part 'widgets/payment_summary.dart';
part 'widgets/payment_total_credit.dart';
part 'widgets/payment_total_invoice.dart';
part 'widgets/payment_item_card.dart';

@RoutePage()
class PaymentPage extends StatefulWidget {
  final bool isMarketPlace;

  const PaymentPage({
    super.key,
    required this.isMarketPlace,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    _initializePaymentModule();
    super.initState();
  }

  void _initializePaymentModule() {
    final state = context.read<EligibilityBloc>().state;

    if (widget.isMarketPlace) {
      //============================================================
      // MP Payment Home
      //
      //============================================================

      context.read<MPAccountSummaryBloc>().add(
            AccountSummaryEvent.fetchInvoiceSummary(
              custCode: state.customerCodeInfo.customerCodeSoldTo,
              salesOrg: state.salesOrganisation.salesOrg,
            ),
          );

      context.read<MPAccountSummaryBloc>().add(
            AccountSummaryEvent.fetchCreditSummary(
              custCode: state.customerCodeInfo.customerCodeSoldTo,
              salesOrg: state.salesOrganisation.salesOrg,
            ),
          );

      context.read<MPPaymentInProgressBloc>().add(
            PaymentInProgressEvent.fetch(
              salesOrganization: state.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
            ),
          );
      if (state.salesOrgConfigs.statementOfAccountEnabled) {
        context.read<MPSoaBloc>().add(
              SoaEvent.fetch(
                customerCodeInfo: state.customerCodeInfo,
                salesOrg: state.salesOrg,
              ),
            );
      }

      //============================================================
      // ZP Account Summary
      //
      //============================================================

      context.read<MPAllInvoicesBloc>()
        ..add(
          AllInvoicesEvent.initialized(
            salesOrganisation: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        )
        ..add(
          AllInvoicesEvent.fetch(
            appliedFilter: AllInvoicesFilter.defaultFilter(),
          ),
        );

      context.read<MPAllCreditsBloc>()
        ..add(
          AllCreditsEvent.initialized(
            salesOrganisation: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        )
        ..add(
          AllCreditsEvent.fetch(
            appliedFilter: AllCreditsFilter.defaultFilter(),
          ),
        );

      context.read<MPFullSummaryBloc>()
        ..add(
          FullSummaryEvent.initialized(
            salesOrganisation: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        )
        ..add(
          FullSummaryEvent.fetch(
            appliedFilter: FullSummaryFilter.defaultFilter(),
          ),
        );

      //============================================================
      // MP Payment Summary
      //
      //============================================================

      context.read<MPPaymentSummaryBloc>()
        ..add(
          PaymentSummaryEvent.initialized(
            salesOrganization: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        )
        ..add(
          PaymentSummaryEvent.fetch(
            appliedFilter:
                context.read<MPPaymentSummaryBloc>().state.appliedFilter,
          ),
        );
    } else {
      //============================================================
      // ZP Payment Home
      //
      //============================================================

      context.read<ZPAccountSummaryBloc>().add(
            AccountSummaryEvent.fetchInvoiceSummary(
              custCode: state.customerCodeInfo.customerCodeSoldTo,
              salesOrg: state.salesOrganisation.salesOrg,
            ),
          );

      context.read<ZPAccountSummaryBloc>().add(
            AccountSummaryEvent.fetchCreditSummary(
              custCode: state.customerCodeInfo.customerCodeSoldTo,
              salesOrg: state.salesOrganisation.salesOrg,
            ),
          );

      context.read<ZPPaymentInProgressBloc>().add(
            PaymentInProgressEvent.fetch(
              salesOrganization: state.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
            ),
          );
      if (state.salesOrgConfigs.statementOfAccountEnabled) {
        context.read<ZPSoaBloc>().add(
              SoaEvent.fetch(
                customerCodeInfo: state.customerCodeInfo,
                salesOrg: state.salesOrg,
              ),
            );
      }

      //============================================================
      // ZP Account Summary
      //
      //============================================================

      context.read<ZPAllInvoicesBloc>()
        ..add(
          AllInvoicesEvent.initialized(
            salesOrganisation: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        )
        ..add(
          AllInvoicesEvent.fetch(
            appliedFilter: AllInvoicesFilter.defaultFilter(),
          ),
        );

      context.read<ZPAllCreditsBloc>()
        ..add(
          AllCreditsEvent.initialized(
            salesOrganisation: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        )
        ..add(
          AllCreditsEvent.fetch(
            appliedFilter: AllCreditsFilter.defaultFilter(),
          ),
        );

      context.read<ZPFullSummaryBloc>()
        ..add(
          FullSummaryEvent.initialized(
            salesOrganisation: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        )
        ..add(
          FullSummaryEvent.fetch(
            appliedFilter: FullSummaryFilter.defaultFilter(),
          ),
        );

      //============================================================
      // ZP Payment Summary
      //
      //============================================================

      context.read<ZPPaymentSummaryBloc>()
        ..add(
          PaymentSummaryEvent.initialized(
            salesOrganization: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        )
        ..add(
          PaymentSummaryEvent.fetch(
            appliedFilter:
                context.read<ZPPaymentSummaryBloc>().state.appliedFilter,
          ),
        );
    }

    //============================================================
    // Payment Summary Filter
    //
    //============================================================

    context.read<PaymentSummaryFilterBloc>().add(
          PaymentSummaryFilterEvent.initialized(
            salesOrg: state.salesOrg,
          ),
        );

    //============================================================
    // New Payment
    //
    //============================================================

    context.read<AvailableCreditsBloc>().add(
          AvailableCreditsEvent.initialized(
            salesOrganization: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        );

    context.read<OutstandingInvoicesBloc>().add(
          OutstandingInvoicesEvent.initialized(
            salesOrganisation: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This code will run after the build is finished
      // You can perform any tasks here that require the build to be complete
      if (context.read<AnnouncementBloc>().state.canShowSheetPayment) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          enableDrag: false,
          isDismissible: false,
          builder: (_) => AnnouncementBottomSheet(
            maintenanceItem:
                context.read<AnnouncementBloc>().state.maintenanceItem,
            storageType: StorageType.payment,
          ),
        );
      }
    });

    final salesOrgConfig =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return PaymentModule(
      isMarketPlace: widget.isMarketPlace,
      child: Scaffold(
        key: WidgetKeys.paymentsTabPage,
        appBar: CustomAppBar.commonAppBar(
          key: WidgetKeys.paymentHomeAppBar,
          title: Text(
            context.tr(widget.isMarketPlace ? 'MP Payments' : 'Payments'),
          ),
          customerBlockedOrSuspended:
              context.read<EligibilityBloc>().state.customerBlockOrSuspended,
        ),
        bottomNavigationBar: const _NewPaymentButton(),
        body: RefreshIndicator(
          onRefresh: () async => _refreshPayment(context),
          child: ListView(
            key: WidgetKeys.scrollList,
            padding: const EdgeInsets.all(16.0),
            children: [
              AnnouncementWidget(currentPath: context.router.currentPath),
              const _PaymentOptionMenu(),
              const SizedBox(height: 20),
              const _PaymentTotalInvoice(),
              if (!salesOrgConfig.hideCredit) ...[
                const SizedBox(height: 20),
                const _PaymentTotalCredit(),
              ],
              const SizedBox(height: 20),
              const _PaymentSummary(),
              if (salesOrgConfig.statementOfAccountEnabled) ...[
                const SizedBox(height: 20),
                const _AccountStatement(),
              ],
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _refreshPayment(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    context.paymentInProgressBloc(widget.isMarketPlace).add(
          PaymentInProgressEvent.fetch(
            salesOrganization: eligibilityState.salesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
          ),
        );
    context.accountSummaryBloc(widget.isMarketPlace).add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: eligibilityState.customerCodeInfo.customerCodeSoldTo,
            salesOrg: eligibilityState.salesOrganisation.salesOrg,
          ),
        );

    context.accountSummaryBloc(widget.isMarketPlace).add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: eligibilityState.customerCodeInfo.customerCodeSoldTo,
            salesOrg: eligibilityState.salesOrganisation.salesOrg,
          ),
        );
    if (eligibilityState.salesOrgConfigs.statementOfAccountEnabled) {
      context.soaBloc(widget.isMarketPlace).add(
            SoaEvent.fetch(
              customerCodeInfo: eligibilityState.customerCodeInfo,
              salesOrg: eligibilityState.salesOrg,
            ),
          );
    }
  }
}

class _NewPaymentButton extends StatelessWidget {
  const _NewPaymentButton();

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewPaymentBloc, NewPaymentState>(
      listenWhen: (previous, current) =>
          previous.isFetchingPrincipalCutoffs !=
              current.isFetchingPrincipalCutoffs &&
          !current.isFetchingPrincipalCutoffs,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (option) => option.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );

        if (!state.salesOrganisation.salesOrg.isID ||
            state.principalCutoffs.canMakePayment) {
          context.read<OutstandingInvoicesBloc>().add(
                OutstandingInvoicesEvent.fetch(
                  appliedFilter: OutstandingInvoiceFilter.defaultFilter(),
                  searchKey: SearchKey.empty(),
                  isMarketPlace: context.isMPPayment,
                ),
              );
          context.read<AvailableCreditsBloc>().add(
                AvailableCreditsEvent.fetch(
                  appliedFilter: AvailableCreditFilter.defaultFilter(),
                  searchKey: SearchKey.empty(),
                  isMarketPlace: context.isMPPayment,
                ),
              );
          context.read<AvailableCreditFilterBloc>().add(
                const AvailableCreditFilterEvent.initialize(),
              );
          context.router.push(
            NewPaymentPageRoute(
              isMarketPlace: context.isMPPayment,
            ),
          );
        } else {
          showModalBottomSheet<bool>(
            context: context,
            enableDrag: false,
            builder: (_) => ConfirmBottomSheet(
              key: WidgetKeys.confirmBottomSheet,
              title: 'We are closed for payment',
              content:
                  "We are unable to proceed with the payment during the month's end. Please try again the following month. Thank you",
              confirmButtonText: 'Close',
              displayCancelButton: false,
            ),
          );
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 2,
              color: ZPColors.boxShadowGray,
            ),
          ],
          color: ZPColors.white,
        ),
        padding:
            const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 30),
        child: SafeArea(
          child: NewPaymentButton.elevated(),
        ),
      ),
    );
  }
}
