import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_filter/soa_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/payments/entities/soa_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_month_picker.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/value_range_error.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/widgets/new_payment_button.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

part 'package:ezrxmobile/presentation/payments/statement_accounts/widgets/filter_bottom_sheet.dart';
part 'package:ezrxmobile/presentation/payments/statement_accounts/widgets/filter_button.dart';
part 'package:ezrxmobile/presentation/payments/statement_accounts/widgets/filter_result_count.dart';
part 'package:ezrxmobile/presentation/payments/statement_accounts/widgets/header.dart';
part 'package:ezrxmobile/presentation/payments/statement_accounts/widgets/soa_tile.dart';

@RoutePage()
class StatementAccountsPage extends StatefulWidget {
  final bool isMarketPlace;

  const StatementAccountsPage({
    super.key,
    required this.isMarketPlace,
  });

  @override
  State<StatementAccountsPage> createState() => _StatementAccountsPageState();
}

class _StatementAccountsPageState extends State<StatementAccountsPage> {
  final _scrollController = ScrollController();

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
        key: WidgetKeys.soaPage,
        appBar: CustomAppBar.commonAppBar(
          title: Text(
            context.tr(
              widget.isMarketPlace
                  ? 'MP Statement of accounts'
                  : 'Statement of accounts',
            ),
          ),
          customerBlockedOrSuspended:
              context.read<EligibilityBloc>().state.customerBlockOrSuspended,
        ),
        floatingActionButton: NewPaymentButton.scale(
          controller: _scrollController,
        ),
        body: BlocConsumer<SoaBloc, SoaState>(
          bloc: context.soaBloc(widget.isMarketPlace),
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
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
              previous.isFetching != current.isFetching ||
              previous.filterList != current.filterList,
          builder: (context, state) {
            final eligibilityState = context.read<EligibilityBloc>().state;

            return AnnouncementBanner(
              currentPath: context.router.currentPath,
              child: ScrollList<Soa>(
                header: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _Header(),
                    if (state.soaList.isNotEmpty) const _Filter(),
                    if (state.appliedFilter.appliedFilterCount > 0)
                      _FilterResultCount(state.filterList.length),
                  ],
                ),
                noRecordFoundWidget: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.06,
                  ),
                  child: const NoRecordFound(
                    key: WidgetKeys.soaNotFoundRecordKey,
                    title: 'No statements available',
                    subTitle: '',
                    svgImage: SvgImage.emptyBox,
                  ),
                ),
                controller: _scrollController,
                onRefresh: () => context.soaBloc(widget.isMarketPlace).add(
                      SoaEvent.fetch(
                        customerCodeInfo: eligibilityState.customerCodeInfo,
                        salesOrg: eligibilityState.salesOrg,
                      ),
                    ),
                isLoading: state.isFetching,
                itemBuilder: (context, index, itemInfo) {
                  return _SoaTile(
                    key: WidgetKeys.genericKey(key: 'SoaItem#$index'),
                    soa: itemInfo,
                  );
                },
                items: state.filterList,
              ),
            );
          },
        ),
      ),
    );
  }
}
