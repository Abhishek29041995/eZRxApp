import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/download_e_invoice/download_e_invoice_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_title_with_logo.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/invoice_details_section.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/invoice_items_section.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/summary.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/payments/invoice_details/widgets/order_item_count.dart';
part 'package:ezrxmobile/presentation/payments/invoice_details/widgets/download_e_invoice_button.dart';

@RoutePage()
class InvoiceDetailsPage extends StatelessWidget {
  final bool isMarketPlace;

  const InvoiceDetailsPage({
    super.key,
    required this.isMarketPlace,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentModule(
      isMarketPlace: isMarketPlace,
      child: BlocBuilder<CreditAndInvoiceDetailsBloc,
          CreditAndInvoiceDetailsState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar.commonAppBar(
              title: Text(
                context.tr('Invoice details'),
              ),
              customerBlockedOrSuspended: context
                  .read<EligibilityBloc>()
                  .state
                  .customerBlockOrSuspended,
            ),
            bottomNavigationBar: !state.isLoading
                ? _DownloadEInvoiceButton(
                    invoiceNumber:
                        state.basicInfo.searchKey.getOrDefaultValue(''),
                  )
                : const SizedBox.shrink(),
            body: AnnouncementBanner(
              currentPath: context.router.currentPath,
              child: state.isLoading
                  ? LoadingShimmer.logo(
                      key: WidgetKeys.loaderImage,
                    )
                  : ListView(
                      key: WidgetKeys.scrollList,
                      children: <Widget>[
                        InvoiceDetailsSection(
                          invoiceItem: state.basicInfo,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 16.0,
                          ),
                          child: AddressInfoSection.order(),
                        ),
                        const Divider(
                          endIndent: 0,
                          indent: 0,
                          color: ZPColors.lightGray2,
                          height: 16,
                        ),
                        InvoiceSummary(
                          invoiceItem: state.basicInfo,
                          customerDocumentDetail: state.itemsInfo,
                        ),
                        const Divider(
                          endIndent: 0,
                          indent: 0,
                          color: ZPColors.lightGray2,
                          height: 16,
                        ),
                        const _OrderItemCount(),
                        if (context.isMPPayment)
                          const Padding(
                            padding: EdgeInsets.only(top: 24, left: 16),
                            child: MarketPlaceTitleWithLogo(),
                          ),
                        InvoiceItemsSection(
                          customerDocumentDetail: state.itemsInfo,
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
