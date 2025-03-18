import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/clevertap_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/payment_status_dto.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_icon.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/create_payment_invoice_pdf.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';
import 'package:ezrxmobile/presentation/payments/payment_webview/payment_webview_page.dart';
import 'package:ezrxmobile/presentation/payments/widgets/attention_section.dart';
import 'package:ezrxmobile/presentation/payments/widgets/bank_account_section.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:ezrxmobile/presentation/payments/widgets/price_text.dart';
import 'package:ezrxmobile/presentation/payments/widgets/transfer_methods_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:printing/printing.dart';

part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_advice_app_bar.dart';
part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_advice_body_apl_section.dart';
part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_advice_body_section.dart';
part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_advice_buttons.dart';
part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_advice_document.dart';
part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_advice_footer_section.dart';
part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_advice_next_step.dart';
part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_advice_please_note.dart';
part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_cancel_advice_button.dart';
part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_save_pdf_button.dart';
part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_summary_section.dart';
part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_va_failed.dart';
part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payments_advice_message.dart';

@RoutePage()
class PaymentAdviceCreatedPage extends StatelessWidget {
  final bool isMarketPlace;

  const PaymentAdviceCreatedPage({
    super.key,
    required this.isMarketPlace,
  });

  static const paymentErrorMessage =
      'Unable to generate payment advice as at least one of the selected invoices/credit notes have already been selected for another Payment Advice. Please check your payment summary or select other invoices/credit notes for this payment.';

  Future<bool?> _showConfirmBottomSheet(
    BuildContext context,
    ApiFailure failure,
  ) {
    final errorMessage = failure == const ApiFailure.missingzzHtmcs()
        ? failure.failureMessage.message
        : paymentErrorMessage;

    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      builder: (_) => ConfirmBottomSheet(
        key: WidgetKeys.confirmBottomSheet,
        title: 'Invoice/credit already in use',
        content: errorMessage,
        cancelButtonText: 'Back',
        confirmButtonText:
            context.isMPPayment ? 'MP Payment summary' : 'Payment summary',
        iconWidget: SvgPicture.asset(
          SvgImage.alert,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PaymentModule(
      isMarketPlace: isMarketPlace,
      child: BlocConsumer<NewPaymentBloc, NewPaymentState>(
        listenWhen: (previous, current) =>
            previous.isFetchingInvoiceInfoPdf !=
                current.isFetchingInvoiceInfoPdf ||
            (previous.isCreatingVirtualAccount !=
                    current.isCreatingVirtualAccount &&
                !current.isCreatingVirtualAccount),
        listener: (context, state) {
          if (state.canFetchPaymentDetails) {
            state.failureOrSuccessOption.fold(
              () {
                context.read<PaymentSummaryDetailsBloc>().add(
                      PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
                        details: PaymentSummaryDetails.fromCreateVirtualAccount(
                          state.createVirtualAccount,
                        ),
                        isMarketPlace: context.isMPPayment,
                      ),
                    );
                trackMixpanelEvent(
                  TrackingEvents.successfulPayment,
                  props: {
                    TrackingProps.paymentAmount: state.amountTotal,
                    TrackingProps.paymentMethod: state
                        .selectedPaymentMethod.paymentMethod
                        .getOrDefaultValue(''),
                    TrackingProps.paymentDocumentCount:
                        state.allSelectedItems.length,
                    TrackingProps.paymentAdviceId:
                        state.createVirtualAccount.id,
                  },
                );
                trackClevertapEvent(
                  TrackingEvents.successfulPayment,
                  props: {
                    TrackingProps.paymentMethod: state
                        .selectedPaymentMethod.paymentMethod
                        .getOrDefaultValue(''),
                  },
                );
              },
              (either) => either.fold(
                (failure) {
                  trackMixpanelEvent(
                    TrackingEvents.paymentFailure,
                    props: {
                      TrackingProps.errorMessage:
                          'Creating Virtual Account for payment advise failure with error message: ${context.tr(
                        failure.failureMessage.message,
                        namedArgs: failure.failureMessage.arguments,
                      )}',
                      TrackingProps.paymentMethod: state
                          .selectedPaymentMethod.paymentMethod
                          .getOrDefaultValue(''),
                      TrackingProps.paymentDocumentCount:
                          state.allSelectedItems.length,
                    },
                  );
                },
                (_) {},
              ),
            );
          }

          if (!state.isFetchingInvoiceInfoPdf) {
            state.failureOrSuccessOption.fold(
              () {
                trackMixpanelEvent(
                  TrackingEvents.generatePaymentAdviceSuccess,
                  props: {
                    TrackingProps.paymentMethod: state
                        .selectedPaymentMethod.paymentMethod
                        .getOrDefaultValue(''),
                  },
                );
              },
              (option) => option.fold(
                (failure) {
                  trackMixpanelEvent(
                    TrackingEvents.paymentFailure,
                    props: {
                      TrackingProps.errorMessage:
                          'Generating payment advise failure with error message: ${context.tr(
                        failure.failureMessage.message,
                        namedArgs: failure.failureMessage.arguments,
                      )}',
                      TrackingProps.paymentMethod: state
                          .selectedPaymentMethod.paymentMethod
                          .getOrDefaultValue(''),
                      TrackingProps.paymentDocumentCount:
                          state.allSelectedItems.length,
                    },
                  );
                  trackMixpanelEvent(
                    TrackingEvents.generatePaymentAdviceFailed,
                    props: {
                      TrackingProps.paymentMethod: state
                          .selectedPaymentMethod.paymentMethod
                          .getOrDefaultValue(''),
                      TrackingProps.errorMessage:
                          failure.failureMessage.message,
                    },
                  );

                  ErrorUtils.handleApiFailure(context, failure);
                },
                (r) {},
              ),
            );
          }
        },
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching ||
            previous.createVirtualAccountFailed !=
                current.createVirtualAccountFailed,
        builder: (context, state) {
          return BlocListener<NewPaymentBloc, NewPaymentState>(
            listenWhen: (previous, current) =>
                previous.isLoading != current.isLoading,
            listener: (context, state) {
              if (!state.isLoading) {
                state.failureOrSuccessOption.fold(
                  () {
                    context.read<NewPaymentBloc>().add(
                          const NewPaymentEvent.fetchInvoiceInfoPdf(),
                        );
                  },
                  (either) => either.fold(
                    (failure) async {
                      trackMixpanelEvent(
                        TrackingEvents.paymentFailure,
                        props: {
                          TrackingProps.errorMessage: paymentErrorMessage,
                          TrackingProps.paymentMethod: state
                              .selectedPaymentMethod.paymentMethod
                              .getOrDefaultValue(''),
                          TrackingProps.paymentDocumentCount:
                              state.allSelectedItems.length,
                        },
                      );
                      final confirmed =
                          await _showConfirmBottomSheet(context, failure);
                      if (context.mounted) {
                        if (confirmed ?? false) {
                          unawaited(
                            context.router.pushAndPopUntil(
                              PaymentSummaryPageRoute(
                                isMarketPlace: context.isMPPayment,
                              ),
                              predicate: (Route route) =>
                                  route.settings.name == PaymentPageRoute.name,
                            ),
                          );
                        } else {
                          unawaited(
                            context.router.pushAndPopUntil(
                              NewPaymentPageRoute(
                                isMarketPlace: context.isMPPayment,
                              ),
                              predicate: (Route route) =>
                                  route.settings.name == PaymentPageRoute.name,
                            ),
                          );
                        }
                      }
                    },
                    (_) {},
                  ),
                );
              }
            },
            child: Scaffold(
              appBar: CustomAppBar.commonAppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 20,
                title: _PaymentAdviceAppBar(state: state),
                customerBlockedOrSuspended: context
                    .read<EligibilityBloc>()
                    .state
                    .customerBlockOrSuspended,
              ),
              body: state.createVirtualAccountFailed
                  ? _PaymentVirtualAccountFailed()
                  : Column(
                      children: [
                        Expanded(
                          child: state.isFetching
                              ? _PaymentAdviceWaiting(
                                  isPaymentGateway: state.selectedPaymentMethod
                                      .paymentMethod.isPaymentGateway,
                                )
                              : const _PaymentAdviceBodySection(),
                        ),
                        if (state.selectedPaymentMethod.paymentMethod
                                .isPaymentGateway ||
                            !state.isFetching)
                          const _PaymentAdviceFooterSection(),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}

class _PaymentAdviceWaiting extends StatelessWidget {
  final bool isPaymentGateway;
  const _PaymentAdviceWaiting({required this.isPaymentGateway});

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.paymentAdviceScreenWaiting,
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 20.0,
      ),
      child: Column(
        children: [
          if (isPaymentGateway) ...[
            Text(
              '${context.tr('Please be patient while we connect to the bank gateway')}...',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.darkerGrey,
                  ),
            ),
            const SizedBox(height: 24.0),
            const Divider(
              indent: 0,
              thickness: 1,
              endIndent: 0,
              height: 1,
              color: ZPColors.extraLightGrey3,
            ),
          ],
          Expanded(
            child: LoadingShimmer.logo(
              key: WidgetKeys.paymentAdviceScreenLoader,
            ),
          ),
        ],
      ),
    );
  }
}
