import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/download_e_credit/download_e_credit_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_group.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
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
import 'package:ezrxmobile/presentation/theme/colors.dart';

part 'package:ezrxmobile/presentation/payments/all_credits/widgets/credit_group.dart';
part 'package:ezrxmobile/presentation/payments/all_credits/widgets/credit_item.dart';

@RoutePage()
class AllCreditsPage extends StatefulWidget {
  final bool isMarketPlace;

  const AllCreditsPage({
    super.key,
    required this.isMarketPlace,
  });

  @override
  State<AllCreditsPage> createState() => _AllCreditsPageState();
}

class _AllCreditsPageState extends State<AllCreditsPage> {
  final _controller = ScrollController();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PaymentModule(
      isMarketPlace: widget.isMarketPlace,
      child: Scaffold(
        body: AnnouncementBanner(
          key: WidgetKeys.allCreditsPage,
          currentPath: context.router.currentPath,
          child: BlocConsumer<AllCreditsBloc, AllCreditsState>(
            bloc: context.allCreditsBloc(widget.isMarketPlace),
            listenWhen: (previous, current) =>
                previous.failureOrSuccessOption !=
                current.failureOrSuccessOption,
            listener: (BuildContext context, state) {
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
              return ScrollList<CreditAndInvoiceGroup>(
                noRecordFoundWidget: NoRecordFound.allCredits(
                  isSearching: !state.appliedFilter.searchKey.isValueEmpty,
                ),
                dismissOnDrag: true,
                controller: _controller,
                onRefresh: () =>
                    context.allCreditsBloc(widget.isMarketPlace).add(
                          AllCreditsEvent.fetch(
                            appliedFilter: AllCreditsFilter.defaultFilter(),
                          ),
                        ),
                onLoadingMore: () =>
                    context.allCreditsBloc(widget.isMarketPlace).add(
                          const AllCreditsEvent.loadMore(),
                        ),
                isLoading: state.isLoading,
                itemBuilder: (context, index, item) => _CreditGroup(
                  data: item,
                  showDivider: index != 0,
                ),
                items: state.items.groupList,
              );
            },
          ),
        ),
        floatingActionButton: NewPaymentButton.scale(
          controller: _controller,
        ),
      ),
    );
  }
}
