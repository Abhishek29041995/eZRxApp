import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/bank_in_accounts/bank_in_accounts_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_method_option.dart';
import 'package:ezrxmobile/presentation/core/color_container.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/details_info_section.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/rich_text_span.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/widgets/bank_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/payment_item_list_view.dart';
part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/payment_method_selector.dart';
part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/note_announcement.dart';
part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/warning_announcement.dart';
part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/payment_option_item.dart';
part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/apl_payment_method.dart';

@RoutePage()
class PaymentMethodTab extends StatefulWidget {
  const PaymentMethodTab({super.key});

  @override
  State<PaymentMethodTab> createState() => _PaymentMethodTabState();
}

class _PaymentMethodTabState extends State<PaymentMethodTab> {
  @override
  void initState() {
    context
        .read<NewPaymentBloc>()
        .add(const NewPaymentEvent.fetchAvailablePaymentMethods());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final salesOrg = context.read<EligibilityBloc>().state.salesOrg;

    return RefreshIndicator(
      onRefresh: () async => context
          .read<NewPaymentBloc>()
          .add(const NewPaymentEvent.fetchAvailablePaymentMethods()),
      child: ListView(
        key: WidgetKeys.scrollList,
        children: [
          if (!salesOrg.isID) const _NoteAnnouncement(),
          DetailsInfoSection(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            label: salesOrg.isID ? '' : 'Select payment method',
            labelStyle: Theme.of(context).textTheme.labelMedium,
            child: Column(
              children: [
                if (salesOrg.isPH) const _WarningAnnouncement(),
                const _PaymentMethodSelector(),
                BlocConsumer<NewPaymentBloc, NewPaymentState>(
                  listenWhen: (previous, current) =>
                      previous.selectedPaymentMethod !=
                          current.selectedPaymentMethod &&
                      current.selectedPaymentMethod.paymentMethod.isBankIn,
                  listener: (context, state) {
                    context.read<BankInAccountsBloc>().add(
                          BankInAccountsEvent.bankInFetch(
                            salesOrg: salesOrg,
                          ),
                        );
                  },
                  buildWhen: (previous, current) =>
                      previous.selectedPaymentMethod !=
                      current.selectedPaymentMethod,
                  builder: (context, state) {
                    return state.selectedPaymentMethod.paymentMethod.isBankIn
                        ? BlocBuilder<BankInAccountsBloc, BankInAccountsState>(
                            buildWhen: (previous, current) =>
                                previous.isFetching != current.isFetching ||
                                previous.bankInAccounts !=
                                    current.bankInAccounts,
                            builder: (context, state) {
                              return state.isFetching
                                  ? LoadingShimmer.logo(
                                      key: WidgetKeys.loaderImage,
                                    )
                                  : BankInfo(
                                      key: WidgetKeys.bankInAccountInfo,
                                      bankInAccounts: state.bankInAccounts,
                                    );
                            },
                          )
                        : const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
          DetailsInfoSection(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            label: 'Payment details',
            child: Column(
              children: [
                const SizedBox(height: 20),
                AddressInfoSection.noAction(),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const _PaymentItemListView(),
        ],
      ),
    );
  }
}
