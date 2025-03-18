import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/download_e_credit/download_e_credit_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_title_with_logo.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/credit_details/section/credit_details_section.dart';
import 'package:ezrxmobile/presentation/payments/credit_details/section/credit_items_section.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
part 'package:ezrxmobile/presentation/payments/credit_details/widgets/download_e_credit_button.dart';

@RoutePage()
class CreditDetailsPage extends StatelessWidget {
  final bool isMarketPlace;

  const CreditDetailsPage({
    super.key,
    required this.isMarketPlace,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentModule(
      isMarketPlace: isMarketPlace,
      child: Scaffold(
        key: WidgetKeys.creditDetailsPage,
        appBar: CustomAppBar.commonAppBar(
          title: Text(
            context.tr('Credit Details'),
          ),
          customerBlockedOrSuspended:
              context.read<EligibilityBloc>().state.customerBlockOrSuspended,
        ),
        body: BlocBuilder<CreditAndInvoiceDetailsBloc,
            CreditAndInvoiceDetailsState>(
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            if (state.isLoading) {
              return LoadingShimmer.logo(
                key: WidgetKeys.loaderImage,
              );
            }

            return ListView(
              key: WidgetKeys.creditDetailsPageListView,
              children: [
                CreditDetailsSection(
                  creditItem: state.basicInfo,
                  creditItems: state.itemsInfo,
                ),
                if (state.itemsInfo.groupList.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16),
                    child: Text(
                      '${context.tr('Return items')} (${state.itemsInfo.length})',
                      key: WidgetKeys.creditDetailsReturnItemCount,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: ZPColors.black,
                          ),
                    ),
                  ),
                  if (context.isMPPayment)
                    const Padding(
                      padding: EdgeInsets.only(top: 24, left: 16),
                      child: MarketPlaceTitleWithLogo(),
                    ),
                ],
                CreditItemsSection(creditItems: state.itemsInfo.groupList),
              ],
            );
          },
        ),
        bottomNavigationBar: const _DownloadECreditButton(),
      ),
    );
  }
}
